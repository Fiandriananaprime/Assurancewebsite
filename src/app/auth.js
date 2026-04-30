const AUTH_STORAGE_KEY = "assurance-auth-user";
export const AUTH_USER_UPDATED_EVENT = "assurance-auth-user-updated";
// Prefer an explicit VITE_API_URL in production. During local dev we default to an empty
// string so that '/uploads/...' remains a relative path and is proxied by the dev server
// (avoids cross-origin resource policy blocking when the backend sets strict response headers).
const API_URL = import.meta.env.VITE_API_URL || "";

function isBrowser() {
  return typeof window !== "undefined";
}

export function getUserRoleFromEmail(email = "") {
  return email.trim().toLowerCase().endsWith("@assurance.com") ? "employee" : "client";
}

export function resolveProfileImage(src = "") {
  if (!src) {
    return "";
  }

  if (
    src.startsWith("http://") ||
    src.startsWith("https://") ||
    src.startsWith("data:") ||
    src.startsWith("blob:")
  ) {
    // If the absolute URL points to the configured API host (or localhost:5000 during dev),
    // return the pathname so the request becomes relative and will be proxied by the dev server.
    try {
      const viteApi = import.meta && import.meta.env && import.meta.env.VITE_API_URL;
      const url = new URL(src);
      if (viteApi) {
        try {
          const base = new URL(String(viteApi)).origin;
          if (url.origin === base) return url.pathname + (url.search || '');
        } catch (e) {
          // fallback to returning src
        }
      }

      // common dev default
      if (url.hostname === 'localhost' && (url.port === '5000' || url.port === '3000')) {
        return url.pathname + (url.search || '');
      }
    } catch (e) {
      // ignore and return src
    }

    return src;
  }

  if (src.startsWith("/uploads")) {
    return `${API_URL.replace(/\/$/, "")}${src}`;
  }

  return src;
}

export function getDisplayName(data = {}) {
  if (data.name && data.name.trim()) {
    return data.name.trim();
  }

  const firstName = data.first_name || data.firstName || "";
  const lastName = data.last_name || data.lastName || "";
  const fullName = `${firstName} ${lastName}`.trim();

  if (fullName) {
    return fullName;
  }

  const email = data.email || "";
  const localPart = email.split("@")[0] || "";

  if (localPart) {
    return localPart
      .split(/[._-]+/)
      .filter(Boolean)
      .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
      .join(" ");
  }

  return "";
}

export function getAvatarLabel(data = {}) {
  if (data.avatarLabel && String(data.avatarLabel).trim()) {
    return String(data.avatarLabel).trim().slice(0, 2).toUpperCase();
  }

  const firstName = data.first_name || data.firstName || "";
  const lastName = data.last_name || data.lastName || "";
  const initials = `${firstName.charAt(0)}${lastName.charAt(0)}`.toUpperCase();

  if (initials.trim()) {
    return initials;
  }

  const name = getDisplayName(data);
  const fallback = name
    .split(" ")
    .filter(Boolean)
    .slice(0, 2)
    .map((part) => part.charAt(0).toUpperCase())
    .join("");

  return fallback || "US";
}

export function normalizeAuthUser(user = {}) {
  const normalized = { ...user };
  const firstName = normalized.first_name || normalized.firstName || "";
  const lastName = normalized.last_name || normalized.lastName || "";
  const profileImage = normalized.profileImage || normalized.profile_image_url || "";
  const name = getDisplayName(normalized);

  normalized.first_name = firstName || normalized.first_name || "";
  normalized.last_name = lastName || normalized.last_name || "";
  normalized.firstName = firstName;
  normalized.lastName = lastName;
  normalized.name = name;
  normalized.phone = normalized.phone || "";
  normalized.address = normalized.address || "";
  normalized.birthDate = normalized.birthDate || normalized.birth_date || null;
  normalized.birth_date = normalized.birth_date || normalized.birthDate || null;
  normalized.profile_image_url = normalized.profile_image_url || profileImage || "";
  normalized.profileImage = resolveProfileImage(profileImage);
  normalized.avatarLabel = getAvatarLabel(normalized);

  return normalized;
}

export function normalizeUserWithProfile(record = {}, fallback = {}) {
  const actualUser = record.user || record || {};
  const profile = record.profile || actualUser.profile || {};

  return {
    ...fallback,
    ...actualUser,
    ...profile,
    id: actualUser.id || fallback.id,
    role: actualUser.role || fallback.role,
    email: actualUser.email || fallback.email || "",
    firstName: profile.first_name || actualUser.first_name || actualUser.firstName || fallback.firstName || "",
    lastName: profile.last_name || actualUser.last_name || actualUser.lastName || fallback.lastName || "",
    phone: profile.phone || actualUser.phone || fallback.phone || "",
    address: profile.address || actualUser.address || fallback.address || "",
    birthDate: profile.birth_date || actualUser.birth_date || fallback.birthDate || null,
    isActive: profile.is_active ?? actualUser.is_active ?? fallback.isActive ?? true,
    joinDate: actualUser.created_at || fallback.joinDate || null,
    lastContact: profile.last_contact || fallback.lastContact || actualUser.created_at || null,
    profileImage: resolveProfileImage(
      profile.profile_image_url ||
        actualUser.profile_image_url ||
        actualUser.profileImage ||
        fallback.profileImage ||
        ""
    ),
    isNew:
      fallback.isNew ??
      ((new Date() - new Date(actualUser.created_at || Date.now())) < 7 * 24 * 60 * 60 * 1000),
    loyaltyScore: profile.loyalty_score || fallback.loyaltyScore || 80,
    riskLevel: profile.risk_level || fallback.riskLevel || "low",
    notes: profile.notes || fallback.notes || "",
    name: getDisplayName({
      ...actualUser,
      ...profile,
      ...fallback,
    }),
    avatarLabel: getAvatarLabel({
      ...actualUser,
      ...profile,
      ...fallback,
    }),
  };
}

export function createAuthUser(email, overrides = {}) {
  const normalizedEmail = email.trim().toLowerCase();
  const role = getUserRoleFromEmail(normalizedEmail);
  return normalizeAuthUser({
    email: normalizedEmail,
    role,
    name: overrides.name || (role === "employee" ? "Employe Assurance" : "Client Assurance"),
    ...overrides,
  });
}

export function saveAuthUser(user) {
  if (!isBrowser()) {
    return;
  }

  const normalizedUser = normalizeAuthUser(user);
  window.localStorage.setItem(AUTH_STORAGE_KEY, JSON.stringify(normalizedUser));
  window.dispatchEvent(new CustomEvent(AUTH_USER_UPDATED_EVENT, { detail: normalizedUser }));
}

export function getAuthUser() {
  if (!isBrowser()) {
    return null;
  }

  const storedUser = window.localStorage.getItem(AUTH_STORAGE_KEY);
  if (!storedUser) {
    return null;
  }

  try {
    return normalizeAuthUser(JSON.parse(storedUser));
  } catch {
    window.localStorage.removeItem(AUTH_STORAGE_KEY);
    return null;
  }
}

export function clearAuthUser() {
  if (!isBrowser()) {
    return;
  }

  window.localStorage.removeItem(AUTH_STORAGE_KEY);
  window.dispatchEvent(new CustomEvent(AUTH_USER_UPDATED_EVENT, { detail: null }));
}

export function getDefaultRouteForRole(role) {
  return role === "employee" ? "/employee/dashboard" : "/dashboard";
}

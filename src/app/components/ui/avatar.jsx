"use client";

import * as React from "react";
import * as AvatarPrimitive from "@radix-ui/react-avatar";
import { cn } from "./utils";

function resolveAvatarSrc(src) {
  if (!src || typeof src !== "string") {
    return src;
  }

  if (
    src.startsWith("http://") ||
    src.startsWith("https://") ||
    src.startsWith("data:") ||
    src.startsWith("blob:")
  ) {
    try {
      const viteApi = import.meta && import.meta.env && import.meta.env.VITE_API_URL;
      const url = new URL(src);
      if (viteApi) {
        try {
          const base = new URL(String(viteApi)).origin;
          if (url.origin === base) return url.pathname + (url.search || '');
        } catch (e) {}
      }

      if (url.hostname === 'localhost' && (url.port === '5000' || url.port === '3000')) {
        return url.pathname + (url.search || '');
      }
    } catch (e) {}

    return src;
  }

  if (src.startsWith("/uploads")) {
    // Prefer an explicit VITE_API_URL in production. During local dev we default to an
    // empty string so that '/uploads/...' remains a relative path and is proxied by Vite dev server
    // (avoids cross-origin resource policy blocking when the backend sets strict response headers).
    const apiUrl = (import.meta.env.VITE_API_URL || "").replace(/\/$/, "");
    return `${apiUrl}${src}`;
  }

  return src;
}

function Avatar({
  className,
  ...props
}) {
  return <AvatarPrimitive.Root data-slot="avatar" className={cn("relative flex size-10 shrink-0 overflow-hidden rounded-full", className)} {...props} />;
}
function AvatarImage({
  className,
  src,
  ...props
}) {
  const resolvedSrc = resolveAvatarSrc(src);
  return <AvatarPrimitive.Image key={resolvedSrc || "avatar-empty"} data-slot="avatar-image" className={cn("aspect-square size-full object-cover", className)} src={resolvedSrc} {...props} />;
}
function AvatarFallback({
  className,
  ...props
}) {
  return <AvatarPrimitive.Fallback data-slot="avatar-fallback" className={cn("bg-muted flex size-full items-center justify-center rounded-full", className)} {...props} />;
}
export { Avatar, AvatarImage, AvatarFallback };

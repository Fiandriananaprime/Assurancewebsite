const BLOG_STORAGE_KEY = "assurance-blog-content";

export const initialBlogEntries = [
  {
    id: "entry-001",
    type: "event",
    title: "Celebrons MAMA sur 55 ans",
    excerpt: "Retour sur notre celebration anniversaire avec nos collaborateurs, partenaires et assures partout a Madagascar.",
    content:
      "Une journee de celebration, de partages et d'engagement autour de la confiance construite avec nos assures depuis plus de 55 ans.",
    author: "Equipe Communication",
    date: "2026-04-18",
    readTime: "4 min",
    category: "Evenement",
    image:
      "https://images.unsplash.com/photo-1511578314322-379afb476865?auto=format&fit=crop&w=1200&q=80",
    views: 2280,
    tags: ["MAMA", "Anniversaire", "Entreprise"],
    status: "published",
    location: "Antananarivo",
    ctaLabel: "Lire l'article",
  },
  {
    id: "entry-002",
    type: "event",
    title: "Rencontre sur l'ile Sainte-Marie",
    excerpt: "Une rencontre terrain avec nos assures et partenaires pour presenter nos offres et renforcer notre proximite.",
    content:
      "Nos equipes se sont deplacees a Sainte-Marie pour echanger avec les assures locaux et partager les nouveautes MAMA.",
    author: "Direction Regionale",
    date: "2026-03-09",
    readTime: "3 min",
    category: "Evenement",
    image:
      "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1200&q=80",
    views: 1640,
    tags: ["Terrain", "Ile", "Clients"],
    status: "published",
    location: "Sainte-Marie",
    ctaLabel: "Lire l'article",
  },
  {
    id: "entry-003",
    type: "blog",
    title: "Ouverture d'une agence a Fenerive-Est",
    excerpt: "MAMA poursuit son developpement avec une nouvelle presence locale pour mieux accompagner ses assures.",
    content:
      "Cette nouvelle agence vise a rapprocher les services de souscription, de suivi et d'assistance de nos clients de la region.",
    author: "Service Reseau",
    date: "2026-02-14",
    readTime: "5 min",
    category: "Actualites",
    image:
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1200&q=80",
    views: 1390,
    tags: ["Agence", "Expansion", "Region"],
    status: "published",
    location: "Fenerive-Est",
    ctaLabel: "Contacter-nous",
  },
  {
    id: "entry-004",
    type: "blog",
    title: "Comment bien preparer un dossier de sinistre",
    excerpt: "Les bons reflexes pour accelerer le traitement de votre dossier et eviter les oublis frequents.",
    content:
      "Photos, pieces justificatives, references de contrat et delais de declaration: voici la checklist essentielle a conserver.",
    author: "Support Assurance",
    date: "2026-01-25",
    readTime: "6 min",
    category: "Conseils",
    image:
      "https://images.unsplash.com/photo-1450101499163-c8848c66ca85?auto=format&fit=crop&w=1200&q=80",
    views: 980,
    tags: ["Sinistre", "Guide", "Documents"],
    status: "published",
    location: "En ligne",
    ctaLabel: "Lire l'article",
  },
  {
    id: "entry-005",
    type: "event",
    title: "Journee portes ouvertes assurance habitation",
    excerpt: "Une session d'echange pour comprendre les garanties essentielles et poser toutes vos questions a nos conseillers.",
    content:
      "Nos conseillers presenteront les couvertures habitation, les exclusions frequentes et les bonnes pratiques pour proteger votre domicile.",
    author: "Equipe Conseil",
    date: "2026-05-10",
    readTime: "2 min",
    category: "Evenement",
    image:
      "https://images.unsplash.com/photo-1460317442991-0ec209397118?auto=format&fit=crop&w=1200&q=80",
    views: 0,
    tags: ["Habitation", "Portes ouvertes", "Conseil"],
    status: "draft",
    location: "Siege MAMA",
    ctaLabel: "Participer",
  },
];

function isBrowser() {
  return typeof window !== "undefined";
}

export function loadBlogEntries() {
  if (!isBrowser()) {
    return initialBlogEntries;
  }

  const stored = window.localStorage.getItem(BLOG_STORAGE_KEY);
  if (!stored) {
    return initialBlogEntries;
  }

  try {
    const parsed = JSON.parse(stored);
    return Array.isArray(parsed) && parsed.length > 0 ? parsed : initialBlogEntries;
  } catch {
    return initialBlogEntries;
  }
}

export function saveBlogEntries(entries) {
  if (!isBrowser()) {
    return;
  }

  window.localStorage.setItem(BLOG_STORAGE_KEY, JSON.stringify(entries));
}

export function getPublishedBlogEntries(entries) {
  return entries
    .filter((entry) => entry.status === "published")
    .sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime());
}

export function createBlogEntry(values) {
  const now = new Date();
  const id = `entry-${now.getTime()}`;

  return {
    id,
    type: values.type || "blog",
    title: values.title || "Nouveau contenu",
    excerpt: values.excerpt || "",
    content: values.content || values.excerpt || "",
    author: values.author || "Equipe MAMA",
    date: values.date || now.toISOString().slice(0, 10),
    readTime: values.readTime || "4 min",
    category: values.category || (values.type === "event" ? "Evenement" : "Actualites"),
    image: values.image || "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1200&q=80",
    views: Number(values.views || 0),
    tags: values.tags || [],
    status: values.status || "published",
    location: values.location || "Antananarivo",
    ctaLabel: values.ctaLabel || (values.type === "event" ? "Participer" : "Lire l'article"),
  };
}

export function getBlogMonthLabel(dateString) {
  return new Date(dateString).toLocaleDateString("fr-FR", {
    month: "long",
    year: "numeric",
  });
}

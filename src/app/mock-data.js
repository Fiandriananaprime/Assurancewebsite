export const mockClients = [
  {
    id: "CLT-001",
    firstName: "Jean",
    lastName: "Martin",
    email: "jean.martin@example.com",
    phone: "+33 6 12 34 56 78",
    address: "15 Rue de la Paix, 75001 Paris",
    birthDate: "1985-03-15",
    isActive: true,
    joinDate: "2024-01-15",
    totalContracts: 3,
    activeContracts: 2,
    totalSpent: 1250,
    lastContact: "2024-01-10",
    profileImage: "/assets/client-1.svg",
    isNew: false,
    loyaltyScore: 85,
    riskLevel: "low",
    notes: "Client fidele depuis 2020. Prefere le contact telephonique.",
  },
  {
    id: "CLT-002",
    firstName: "Marie",
    lastName: "Dupont",
    email: "marie.dupont@example.com",
    phone: "+33 6 98 76 54 32",
    address: "25 Avenue de la Republique, 69002 Lyon",
    birthDate: "1990-07-22",
    isActive: true,
    joinDate: "2024-01-12",
    totalContracts: 2,
    activeContracts: 2,
    totalSpent: 890,
    lastContact: "2024-01-08",
    profileImage: "/assets/client-2.svg",
    isNew: false,
    loyaltyScore: 92,
    riskLevel: "low",
    notes: "Cliente tres satisfaite. A recommande plusieurs proches.",
  },
  {
    id: "CLT-003",
    firstName: "Pierre",
    lastName: "Bernard",
    email: "pierre.bernard@example.com",
    phone: "+33 6 55 66 77 88",
    address: "8 Cours Victor Hugo, 33000 Bordeaux",
    birthDate: "1978-11-05",
    isActive: false,
    joinDate: "2024-01-05",
    totalContracts: 4,
    activeContracts: 1,
    totalSpent: 2100,
    lastContact: "2023-12-15",
    profileImage: "/assets/client-3.svg",
    isNew: false,
    loyaltyScore: 45,
    riskLevel: "high",
    notes: "Client a risque. Plusieurs sinistres declares.",
  },
  {
    id: "CLT-004",
    firstName: "Sophie",
    lastName: "Laurent",
    email: "sophie.laurent@example.com",
    phone: "+33 6 33 44 55 66",
    address: "12 Place de la Comedie, 34000 Montpellier",
    birthDate: "1995-02-18",
    isActive: true,
    joinDate: "2024-01-15",
    totalContracts: 1,
    activeContracts: 1,
    totalSpent: 450,
    lastContact: "2024-01-15",
    profileImage: "/assets/client-4.svg",
    isNew: true,
    loyaltyScore: 95,
    riskLevel: "low",
    notes: "Nouvelle cliente. Tres enthousiaste.",
  },
  {
    id: "CLT-005",
    firstName: "Thomas",
    lastName: "Petit",
    email: "thomas.petit@example.com",
    phone: "+33 6 77 88 99 00",
    address: "45 Rue d'Alsace-Lorraine, 31000 Toulouse",
    birthDate: "1988-09-30",
    isActive: true,
    joinDate: "2024-01-14",
    totalContracts: 2,
    activeContracts: 2,
    totalSpent: 720,
    lastContact: "2024-01-12",
    profileImage: "/assets/client-5.svg",
    isNew: true,
    loyaltyScore: 88,
    riskLevel: "medium",
    notes: "Client prudent. Pose beaucoup de questions.",
  },
];

export const mockFeedbacks = [
  {
    id: "FB-001",
    clientId: "CLT-001",
    subject: "Excellent service client",
    message: "Excellent service, tres reactif suite a mon sinistre. L'equipe a ete tres professionnelle.",
    date: "2024-01-15",
    time: "14:32",
    rating: 5,
    category: "service_client",
    source: "contact",
    status: "nouveau",
    replied: false,
    isResponded: false,
    type: "service",
    publicRole: "Client depuis 2 ans",
    publicQuote: true,
  },
  {
    id: "FB-002",
    clientId: "CLT-002",
    subject: "Parcours de souscription",
    message: "Processus de souscription un peu long, mais le conseiller a ete tres patient et a l'ecoute.",
    date: "2024-01-14",
    time: "09:15",
    rating: 4,
    category: "site_web",
    source: "site",
    status: "en_cours",
    replied: true,
    isResponded: true,
    type: "site",
    publicRole: "Cliente depuis 1 an",
    publicQuote: true,
  },
  {
    id: "FB-003",
    clientId: "CLT-003",
    subject: "Delai de traitement",
    message: "Insatisfait du delai de traitement de mon sinistre. J'attends toujours une reponse claire.",
    date: "2024-01-12",
    time: "16:45",
    rating: 2,
    category: "sinistre",
    source: "contact",
    status: "urgent",
    replied: false,
    isResponded: false,
    type: "service",
    publicRole: "Client depuis 3 ans",
    publicQuote: false,
  },
  {
    id: "FB-004",
    clientId: "CLT-004",
    subject: "Interface intuitive",
    message: "Interface tres intuitive, j'ai pu gerer mon contrat en quelques clics.",
    date: "2024-01-11",
    time: "11:22",
    rating: 5,
    category: "application",
    source: "app",
    status: "traite",
    replied: true,
    isResponded: true,
    type: "site",
    publicRole: "Cliente recente",
    publicQuote: true,
  },
  {
    id: "FB-005",
    clientId: "CLT-005",
    subject: "Bon rapport qualite-prix",
    message: "Bon rapport qualite prix, mais les options de personnalisation pourraient etre plus nombreuses.",
    date: "2024-01-08",
    time: "08:30",
    rating: 4,
    category: "general",
    source: "site",
    status: "traite",
    replied: true,
    isResponded: false,
    type: "produit",
    publicRole: "Client depuis 18 mois",
    publicQuote: true,
  },
];

export function getClientById(clientId) {
  return mockClients.find((client) => client.id === clientId) || null;
}

export function getClientByEmail(email = "") {
  return mockClients.find((client) => client.email.toLowerCase() === email.trim().toLowerCase()) || null;
}

export function getClientFullName(client) {
  return client ? `${client.firstName} ${client.lastName}` : "";
}

export function getEnrichedFeedbacks() {
  return mockFeedbacks.map((feedback) => {
    const client = getClientById(feedback.clientId);

    return {
      ...feedback,
      name: getClientFullName(client),
      email: client?.email || "",
      phone: client?.phone || "",
      client,
    };
  });
}

export function getFeedbacksByClientId(clientId) {
  return getEnrichedFeedbacks().filter((feedback) => feedback.clientId === clientId);
}

export function getPublicTestimonials() {
  return getEnrichedFeedbacks()
    .filter((feedback) => feedback.publicQuote && feedback.rating >= 4)
    .slice(0, 3)
    .map((feedback) => ({
      id: feedback.id,
      name: feedback.name,
      role: feedback.publicRole,
      image: feedback.client?.profileImage,
      comment: feedback.message,
      rating: feedback.rating,
    }));
}

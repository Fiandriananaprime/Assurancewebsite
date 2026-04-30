import { useEffect, useMemo, useState } from "react";
import { Link, useLocation, useNavigate, useSearchParams } from "react-router";
import { format } from "date-fns";
import { motion } from "motion/react";
import {
    AlertTriangle, Bell, BellRing, Calendar, ChevronDown, ChevronUp, DollarSign, Edit, Eye,
    EyeOff, FilePlus, FileText, Mail, MapPin, MessageCircle, MessageSquare, Phone, RefreshCw,
    Search, Star, UserCheck, UserPlus, UserX, Users, MessageSquareQuote
} from "lucide-react";
import { EmployeeHeader } from "../components/employee-header";
import { Footer } from "../components/footer";
import { EmployeeMessenger } from "../components/employee-messenger";
import { Avatar, AvatarFallback, AvatarImage } from "../components/ui/avatar";
import { Badge } from "../components/ui/badge";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from "../components/ui/dialog";
import { Input } from "../components/ui/input";
import { Label } from "../components/ui/label";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "../components/ui/tabs";
import { Textarea } from "../components/ui/textarea"; // Keep Textarea
import { normalizeUserWithProfile } from "../auth";

const initialContracts = [
    { id: "CNT-001", clientId: "CLT-001", type: "auto", startDate: "2024-01-15", endDate: "2025-01-15", amount: 350, status: "actif", coverage: "Tous risques", vehicle: "Renault Clio", policyNumber: "POL-AUTO-001" },
    { id: "CNT-002", clientId: "CLT-001", type: "habitation", startDate: "2024-01-10", endDate: "2025-01-10", amount: 280, status: "actif", coverage: "Multirisques", property: "Appartement 2 pieces", policyNumber: "POL-HAB-001" },
    { id: "CNT-003", clientId: "CLT-001", type: "sante", startDate: "2023-06-01", endDate: "2024-06-01", amount: 220, status: "expire", coverage: "Base", policyNumber: "POL-SANTE-001" },
    { id: "CNT-004", clientId: "CLT-002", type: "auto", startDate: "2024-01-12", endDate: "2025-01-12", amount: 420, status: "actif", coverage: "Tous risques", vehicle: "Peugeot 308", policyNumber: "POL-AUTO-002" },
    { id: "CNT-005", clientId: "CLT-002", type: "sante", startDate: "2024-01-12", endDate: "2025-01-12", amount: 250, status: "actif", coverage: "Complete", policyNumber: "POL-SANTE-002" },
    { id: "CNT-006", clientId: "CLT-003", type: "auto", startDate: "2024-01-05", endDate: "2025-01-05", amount: 380, status: "actif", coverage: "Tiers collision", vehicle: "Citroen C3", policyNumber: "POL-AUTO-003" },
    { id: "CNT-007", clientId: "CLT-003", type: "habitation", startDate: "2023-03-01", endDate: "2024-03-01", amount: 320, status: "expire", coverage: "Base", property: "Maison 4 pieces", policyNumber: "POL-HAB-002" },
    { id: "CNT-008", clientId: "CLT-004", type: "auto", startDate: "2024-01-15", endDate: "2025-01-15", amount: 450, status: "actif", coverage: "Tous risques", vehicle: "Volkswagen Golf", policyNumber: "POL-AUTO-004" },
    { id: "CNT-009", clientId: "CLT-005", type: "auto", startDate: "2024-01-14", endDate: "2025-01-14", amount: 390, status: "actif", coverage: "Tiers", vehicle: "Ford Fiesta", policyNumber: "POL-AUTO-005" },
    { id: "CNT-010", clientId: "CLT-005", type: "sante", startDate: "2024-01-14", endDate: "2025-01-14", amount: 270, status: "actif", coverage: "Base", policyNumber: "POL-SANTE-003" }
];

const initialIncidents = [ // This will be replaced
    { id: "INC-001", clientId: "CLT-001", clientName: "Jean Martin", title: "Accident sur l'autoroute A6", date: "2024-01-15", status: "en_cours", type: "auto", description: "Accident avec dommages materiels mineurs", amount: 1200, assignee: "Sophie Dubois", reference: "INC-2024-001234" },
    { id: "INC-002", clientId: "CLT-002", clientName: "Marie Dupont", title: "Degats des eaux", date: "2024-01-14", status: "traite", type: "habitation", description: "Fuite d'eau dans la cuisine", amount: 850, assignee: "Jean Martin" },
    { id: "INC-003", clientId: "CLT-003", clientName: "Pierre Bernard", title: "Vol de vehicule", date: "2024-01-12", status: "en_cours", type: "auto", description: "Vol de vehicule dans un parking souterrain", amount: 15000, assignee: "Marie Dupont" }
];

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

function emptyActionState() {
    return {
        open: false,
        type: "",
        title: "",
        description: "",
        values: {}
    };
}

export function EmployeeClientsPage() {
    const navigate = useNavigate();
    const [searchParams] = useSearchParams();
    const location = useLocation();

    const [clients, setClients] = useState([]); // Initialize as empty, will fetch from API
    const [contracts, setContracts] = useState([]); // Will fetch from API
    const [feedbacks, setFeedbacks] = useState([]); // Will fetch from API
    const [incidents, setIncidents] = useState([]); // Will fetch from API

    const [searchTerm, setSearchTerm] = useState("");
    const [filterStatus, setFilterStatus] = useState("tous");
    const [sortBy, setSortBy] = useState("date");
    const [sortOrder, setSortOrder] = useState("desc");
    const [activeTab, setActiveTab] = useState("list");
    const [showNewClients, setShowNewClients] = useState(true);
    const [detailDialogOpen, setDetailDialogOpen] = useState(false);
    const [selectedDetail, setSelectedDetail] = useState(null);
    const [actionDialog, setActionDialog] = useState(emptyActionState());
    const [deleteDialog, setDeleteDialog] = useState({ open: false, id: null, title: "", type: "" });
    const [refreshTick, setRefreshTick] = useState(0);
    const [isLoadingData, setIsLoadingData] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const requestedTab = searchParams.get("tab");
        if (requestedTab && requestedTab !== activeTab) {
            setActiveTab(requestedTab);
        }
    }, [searchParams, activeTab]);

    useEffect(() => {
        fetchClientsData();
    }, [refreshTick]);

    // Function to fetch data from the backend
    const fetchClientsData = async () => {
        setIsLoadingData(true);
        setError(null);
        const token = localStorage.getItem("assurance-auth-token");
        if (!token) {
            setError("Authentication token not found.");
            setIsLoadingData(false);
            return;
        }

        try {
            const headers = { 'Authorization': `Bearer ${token}` };

            // Fetch users
            const usersResp = await fetch(`${API_URL}/api/users?role=client&limit=100`, { headers });
            if (!usersResp.ok) throw new Error(`Failed to fetch users: ${usersResp.statusText}`);
            const usersBody = await usersResp.json();
            const usersList = (usersBody && usersBody.data && (usersBody.data.users || usersBody.data)) || usersBody.users || usersBody || [];

            // Fetch contracts
            const contractsResp = await fetch(`${API_URL}/api/contracts`, { headers });
            if (!contractsResp.ok) throw new Error(`Failed to fetch contracts: ${contractsResp.statusText}`);
            const contractsBody = await contractsResp.json();
            const contractsList = (contractsBody && contractsBody.data && (contractsBody.data.contracts || contractsBody.data)) || contractsBody.contracts || contractsBody || [];

            const formattedContracts = (contractsList || []).map(contract => ({
                id: contract.id,
                clientId: contract.client_id,
                type: contract.type,
                startDate: contract.start_date ? format(new Date(contract.start_date), 'yyyy-MM-dd') : null,
                endDate: contract.end_date ? format(new Date(contract.end_date), 'yyyy-MM-dd') : null,
                amount: contract.annual_amount || contract.amount || 0,
                status: contract.status,
                coverage: contract.coverage,
                vehicle: contract.vehicle_info || contract.vehicle_details || null,
                property: contract.property_info || contract.property_details || null,
                policyNumber: contract.policy_number,
                deductible: contract.deductible
            }));
            setContracts(formattedContracts);

            // Map users to clients
            const formattedClients = (usersList || []).map(item => {
                const actualUser = item.user || item;
                const clientContracts = formattedContracts.filter(c => c.clientId === actualUser.id);
                const normalizedClient = normalizeUserWithProfile(item);

                return {
                    ...normalizedClient,
                    totalContracts: clientContracts.length,
                    activeContracts: clientContracts.filter(c => c.status === 'actif').length,
                    totalSpent: clientContracts.reduce((sum, c) => sum + Number(c.amount || c.annual_amount || 0), 0),
                    profileImage: normalizedClient.profileImage || "/assets/avatar-placeholder-1.png",
                    isNew: (new Date() - new Date(actualUser.created_at || Date.now())) < (7 * 24 * 60 * 60 * 1000),
                };
            });
            setClients(formattedClients);

            // Fetch incidents
            const incidentsResp = await fetch(`${API_URL}/api/incidents`, { headers });
            if (incidentsResp.ok) {
                const incidentsBody = await incidentsResp.json();
                const incidentsList = (incidentsBody && incidentsBody.data && (incidentsBody.data.incidents || incidentsBody.data)) || incidentsBody.incidents || incidentsBody || [];
                setIncidents((incidentsList || []).map(inc => ({
                    id: inc.id,
                    clientId: inc.client_id,
                    clientName: inc.client_name || inc.client_name || 'Client',
                    title: inc.title,
                    date: inc.date ? format(new Date(inc.date), 'yyyy-MM-dd') : (inc.created_at ? format(new Date(inc.created_at), 'yyyy-MM-dd') : null),
                    status: inc.status,
                    type: inc.type,
                    description: inc.description,
                    amount: inc.estimated_cost || inc.amount || 0,
                    assignee: inc.assigned_employee_name || inc.assigned_to_name || 'Non assigné'
                })));
            }

            // Fetch feedbacks
            const feedbacksResp = await fetch(`${API_URL}/api/feedbacks`, { headers });
            if (feedbacksResp.ok) {
                const feedbacksBody = await feedbacksResp.json();
                const feedbacksList = (feedbacksBody && feedbacksBody.data && (feedbacksBody.data.feedbacks || feedbacksBody.data)) || feedbacksBody.feedbacks || feedbacksBody || [];
                setFeedbacks((feedbacksList || []).map(fb => ({
                    id: fb.id,
                    clientId: fb.client_id,
                    subject: fb.subject,
                    message: fb.message,
                    date: fb.created_at ? format(new Date(fb.created_at), 'yyyy-MM-dd') : null,
                    rating: fb.rating,
                    isResponded: fb.is_responded,
                    name: fb.client_name || fb.client_name || 'Client',
                    email: fb.client_email || '',
                    type: fb.category
                })));
            }
        } catch (err) {
            console.error("Error fetching employee data:", err);
            setError(err.message || String(err));
        } finally {
            setIsLoadingData(false);
        }
    };

    const filteredClients = useMemo(() => {
        return [...clients]
            .filter((client) => {
                const query = searchTerm.toLowerCase();
                const matchesSearch =
                    (client.firstName || '').toLowerCase().includes(query) ||
                    (client.lastName || '').toLowerCase().includes(query) ||
                    (client.email || '').toLowerCase().includes(query) ||
                    (client.address || '').toLowerCase().includes(query);

                const matchesStatus =
                    filterStatus === "tous" ||
                    (filterStatus === "actif" && client.isActive) ||
                    (filterStatus === "inactif" && !client.isActive);

                return matchesSearch && matchesStatus;
            })
            .sort((a, b) => {
                let aValue;
                let bValue;

                switch (sortBy) {
                    case "prix":
                        aValue = a.totalSpent;
                        bValue = b.totalSpent;
                        break;
                    case "fidelite":
                        aValue = a.creditScore ?? a.loyaltyScore;
                        bValue = b.creditScore ?? b.loyaltyScore;
                        break;
                    case "nom":
                        aValue = (a.lastName || '').toLowerCase();
                        bValue = (b.lastName || '').toLowerCase();
                        break;
                    default:
                        aValue = new Date(a.joinDate).getTime();
                        bValue = new Date(b.joinDate).getTime();
                }

                return sortOrder === "desc" ? (bValue > aValue ? 1 : -1) : (aValue > bValue ? 1 : -1);
            });
    }, [clients, filterStatus, searchTerm, sortBy, sortOrder]);

    const stats = {
        total: clients.length,
        active: clients.filter((client) => client.isActive).length,
        inactive: clients.filter((client) => !client.isActive).length,
        new: clients.filter((client) => client.isNew).length,
        totalRevenue: clients.reduce((sum, client) => sum + client.totalSpent, 0),
        totalFeedbacks: feedbacks.length,
        totalIncidents: incidents.filter(i => i.status === 'en_cours').length
    };

    const getClientDetails = (clientId) => clients.find((client) => client.id === clientId);

    const updateSearchTab = (value) => {
        setActiveTab(value);
        const params = new URLSearchParams(searchParams);
        params.set("tab", value);
        navigate(`${location.pathname}?${params.toString()}`);
    };

    const openDetailDialog = (type, item) => {
        setSelectedDetail({ type, item });
        setDetailDialogOpen(true);
    };

    const openAction = (type, config) => {
        setActionDialog({
            open: true,
            type,
            title: config.title,
            description: config.description,
            values: config.values ?? {}
        });
    };

    const closeAction = () => setActionDialog(emptyActionState());

    const updateActionValue = (key, value) => {
        setActionDialog((current) => ({
            ...current,
            values: {
                ...current.values,
                [key]: value
            }
        }));
    };

    const confirmDelete = async () => {
        try {
            const token = localStorage.getItem("assurance-auth-token");
            const endpoint = deleteDialog.type === 'blog' ? `/api/content/${deleteDialog.id}` : `/api/users/${deleteDialog.id}`;
            // If deleting content, ensure id looks like a UUID to avoid DB errors
            if (deleteDialog.type === 'blog') {
                const id = deleteDialog.id;
                const isUuid = id && String(id).match(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/);
                if (!isUuid) {
                    console.warn(`Attempted to delete content with invalid id: "${id}"`);
                    setDeleteDialog({ open: true, id, title: deleteDialog.title, type: deleteDialog.type, error: `Invalid content id format: "${id}"` });
                    return;
                }
            }

            const resp = await fetch(`${API_URL}${endpoint}`, {
                method: 'DELETE',
                headers: { 'Authorization': `Bearer ${token}` }
            });

            if (resp.ok) {
                fetchClientsData(); // Rafraîchir les données
            }
        } catch (err) {
            console.error("Delete failed", err);
        }
        setDeleteDialog({ open: false, id: null, title: "", type: "" });
    };

    const handleActionSubmit = async () => {
        const values = actionDialog.values;

        if (actionDialog.type === "new-client") {
            // Create client via backend registration endpoint so it persists and has a real ID
            try {
                const payload = {
                    email: values.email,
                    password: values.password || `tmp-${Math.random().toString(36).slice(2,10)}`,
                    first_name: values.firstName || 'Nouveau',
                    last_name: values.lastName || 'Client',
                    phone: values.phone || null,
                    address: values.address || null,
                    birth_date: values.birthDate || null
                };

                const resp = await fetch(`${API_URL}/api/auth/register`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });

                const body = await resp.json();
                if (!resp.ok) {
                    // show API error
                    console.error('Failed to create client:', body);
                    setError(body.message || 'Erreur lors de la creation du client');
                } else {
                    // Map backend returned user/profile into clients shape
                    const created = body.data || body;
                    const userObj = created.user || created;
                    const profileObj = created.profile || {};
                    const mapped = {
                        ...normalizeUserWithProfile(created, {
                            firstName: values.firstName || 'Nouveau',
                            lastName: values.lastName || 'Client',
                            email: values.email || userObj.email,
                            phone: values.phone || '',
                            address: values.address || '',
                            birthDate: values.birthDate || null,
                            profileImage: "/assets/client-placeholder.svg",
                        }),
                        totalContracts: 0,
                        activeContracts: 0,
                        totalSpent: 0,
                        isNew: true,
                        loyaltyScore: profileObj.loyalty_score || 50,
                        riskLevel: profileObj.risk_level || 'medium',
                        notes: profileObj.notes || ''
                    };

                    // Prepend to local list for immediate UX and trigger a full refresh
                    setClients((current) => [mapped, ...current]);
                    setRefreshTick((t) => t + 1);
                }
            } catch (err) {
                console.error('Error creating new client:', err);
                setError(String(err));
            }
        }

        if (actionDialog.type === "edit-client") {
            setClients((current) =>
                current.map((client) =>
                    client.id === values.id
                        ? {
                            ...client,
                            firstName: values.firstName,
                            lastName: values.lastName,
                            email: values.email,
                            phone: values.phone,
                            address: values.address
                        }
                        : client
                )
            );
        }

        if (actionDialog.type === "contact-client") {
            setClients((current) =>
                current.map((client) =>
                    client.id === values.clientId
                        ? { ...client, lastContact: format(new Date(), "yyyy-MM-dd") }
                        : client
                )
            );
        }

        if (actionDialog.type === "edit-contract") {
            setContracts((current) =>
                current.map((contract) =>
                    contract.id === values.id
                        ? {
                            ...contract,
                            coverage: values.coverage,
                            amount: Number(values.amount),
                            status: values.status
                        }
                        : contract
                )
            );
        }

        if (actionDialog.type === "renew-contract") {
            setContracts((current) =>
                current.map((contract) =>
                    contract.id === values.id
                        ? {
                            ...contract,
                            status: "actif",
                            endDate: values.newEndDate
                        }
                        : contract
                )
            );
        }

        if (actionDialog.type === "new-contract") {
            const id = `CNT-${String(contracts.length + 1).padStart(3, "0")}`;
            setContracts((current) => [
                {
                    id,
                    clientId: values.clientId,
                    type: values.type,
                    startDate: values.startDate,
                    endDate: values.endDate,
                    amount: Number(values.amount),
                    status: "actif",
                    coverage: values.coverage,
                    vehicle: values.type === "auto" ? values.subject : undefined,
                    property: values.type === "habitation" ? values.subject : undefined,
                    policyNumber: `POL-${values.type.toUpperCase()}-${String(current.length + 1).padStart(3, "0")}`
                },
                ...current
            ]);
        }

        if (actionDialog.type === "reply-feedback") {
            setFeedbacks((current) =>
                current.map((feedback) =>
                    feedback.id === values.id
                        ? { ...feedback, isResponded: true }
                        : feedback
                )
            );
        }

        if (actionDialog.type === "notifications") {
            setFeedbacks((current) => [...current]);
        }

        if (actionDialog.type === "new-incident") {
            const client = getClientDetails(values.clientId);
            const id = `INC-${String(incidents.length + 1).padStart(3, "0")}`;
            setIncidents((current) => [
                {
                    id,
                    clientId: values.clientId,
                    clientName: client ? `${client.firstName} ${client.lastName}` : "Client",
                    title: values.title,
                    date: values.date,
                    status: "en_cours",
                    type: values.type,
                    description: values.description,
                    amount: Number(values.amount),
                    assignee: values.assignee
                },
                ...current
            ]);
        }

        if (actionDialog.type === "edit-incident") {
            setIncidents((current) =>
                current.map((incident) =>
                    incident.id === values.id
                        ? {
                            ...incident,
                            title: values.title,
                            assignee: values.assignee,
                            amount: Number(values.amount),
                            description: values.description
                        }
                        : incident
                )
            );
        }

        if (actionDialog.type === "export-feedbacks" || actionDialog.type === "refresh-data") {
            setRefreshTick((current) => current + 1);
        }

        closeAction();
    };

    const renderActionForm = () => {
        const values = actionDialog.values;

        if (actionDialog.type === "new-client" || actionDialog.type === "edit-client") {
            return (
                <div className="grid gap-4">
                    <div className="grid grid-cols-2 gap-4">
                        <div>
                            <Label>Prenom</Label>
                            <Input value={values.firstName || ""} onChange={(e) => updateActionValue("firstName", e.target.value)} />
                        </div>
                        <div>
                            <Label>Nom</Label>
                            <Input value={values.lastName || ""} onChange={(e) => updateActionValue("lastName", e.target.value)} />
                        </div>
                    </div>
                    <div>
                        <Label>Email</Label>
                        <Input value={values.email || ""} onChange={(e) => updateActionValue("email", e.target.value)} />
                    </div>
                    <div>
                        <Label>Telephone</Label>
                        <Input value={values.phone || ""} onChange={(e) => updateActionValue("phone", e.target.value)} />
                    </div>
                    <div>
                        <Label>Adresse</Label>
                        <Input value={values.address || ""} onChange={(e) => updateActionValue("address", e.target.value)} />
                    </div>
                </div>
            );
        }

        if (actionDialog.type === "contact-client" || actionDialog.type === "reply-feedback") {
            return (
                <div className="grid gap-4">
                    <div>
                        <Label>Sujet</Label>
                        <Input value={values.subject || ""} onChange={(e) => updateActionValue("subject", e.target.value)} />
                    </div>
                    <div>
                        <Label>Message</Label>
                        <Textarea rows={5} value={values.message || ""} onChange={(e) => updateActionValue("message", e.target.value)} />
                    </div>
                </div>
            );
        }

        if (actionDialog.type === "edit-contract") {
            return (
                <div className="grid gap-4">
                    <div>
                        <Label>Couverture</Label>
                        <Input value={values.coverage || ""} onChange={(e) => updateActionValue("coverage", e.target.value)} />
                    </div>
                    <div>
                        <Label>Montant annuel</Label>
                        <Input type="number" value={values.amount || ""} onChange={(e) => updateActionValue("amount", e.target.value)} />
                    </div>
                    <div>
                        <Label>Statut</Label>
                        <select
                            value={values.status || "actif"}
                            onChange={(e) => updateActionValue("status", e.target.value)}
                            className="w-full rounded-md border border-gray-300 px-3 py-2"
                        >
                            <option value="actif">Actif</option>
                            <option value="expire">Expire</option>
                            <option value="en_attente">En attente</option>
                        </select>
                    </div>
                </div>
            );
        }

        if (actionDialog.type === "renew-contract") {
            return (
                <div className="grid gap-4">
                    <div>
                        <Label>Nouvelle date de fin</Label>
                        <Input type="date" value={values.newEndDate || ""} onChange={(e) => updateActionValue("newEndDate", e.target.value)} />
                    </div>
                    <div>
                        <Label>Message client</Label>
                        <Textarea rows={4} value={values.message || ""} onChange={(e) => updateActionValue("message", e.target.value)} />
                    </div>
                </div>
            );
        }

        if (actionDialog.type === "new-contract") {
            return (
                <div className="grid gap-4">
                    <div>
                        <Label>Client</Label>
                        <select
                            value={values.clientId || clients[0]?.id}
                            onChange={(e) => updateActionValue("clientId", e.target.value)}
                            className="w-full rounded-md border border-gray-300 px-3 py-2"
                        >
                            {clients.map((client) => (
                                <option key={client.id} value={client.id}>{client.firstName} {client.lastName}</option>
                            ))}
                        </select>
                    </div>
                    <div className="grid grid-cols-2 gap-4">
                        <div>
                            <Label>Type</Label>
                            <select
                                value={values.type || "auto"}
                                onChange={(e) => updateActionValue("type", e.target.value)}
                                className="w-full rounded-md border border-gray-300 px-3 py-2"
                            >
                                <option value="auto">Auto</option>
                                <option value="habitation">Habitation</option>
                                <option value="sante">Sante</option>
                            </select>
                        </div>
                        <div>
                            <Label>Objet</Label>
                            <Input value={values.subject || ""} onChange={(e) => updateActionValue("subject", e.target.value)} />
                        </div>
                    </div>
                    <div className="grid grid-cols-2 gap-4">
                        <div>
                            <Label>Debut</Label>
                            <Input type="date" value={values.startDate || ""} onChange={(e) => updateActionValue("startDate", e.target.value)} />
                        </div>
                        <div>
                            <Label>Fin</Label>
                            <Input type="date" value={values.endDate || ""} onChange={(e) => updateActionValue("endDate", e.target.value)} />
                        </div>
                    </div>
                    <div>
                        <Label>Montant annuel</Label>
                        <Input type="number" value={values.amount || ""} onChange={(e) => updateActionValue("amount", e.target.value)} />
                    </div>
                    <div>
                        <Label>Couverture</Label>
                        <Input value={values.coverage || ""} onChange={(e) => updateActionValue("coverage", e.target.value)} />
                    </div>
                </div>
            );
        }

        if (actionDialog.type === "new-incident" || actionDialog.type === "edit-incident") {
            return (
                <div className="grid gap-4">
                    {actionDialog.type === "new-incident" && (
                        <div>
                            <Label>Client</Label>
                            <select
                                value={values.clientId || clients[0]?.id}
                                onChange={(e) => updateActionValue("clientId", e.target.value)}
                                className="w-full rounded-md border border-gray-300 px-3 py-2"
                            >
                                {clients.map((client) => (
                                    <option key={client.id} value={client.id}>{client.firstName} {client.lastName}</option>
                                ))}
                            </select>
                        </div>
                    )}
                    <div>
                        <Label>Titre</Label>
                        <Input value={values.title || ""} onChange={(e) => updateActionValue("title", e.target.value)} />
                    </div>
                    <div className="grid grid-cols-2 gap-4">
                        <div>
                            <Label>Type</Label>
                            <select
                                value={values.type || "auto"}
                                onChange={(e) => updateActionValue("type", e.target.value)}
                                className="w-full rounded-md border border-gray-300 px-3 py-2"
                            >
                                <option value="auto">Auto</option>
                                <option value="habitation">Habitation</option>
                            </select>
                        </div>
                        <div>
                            <Label>Date</Label>
                            <Input type="date" value={values.date || ""} onChange={(e) => updateActionValue("date", e.target.value)} />
                        </div>
                    </div>
                    <div className="grid grid-cols-2 gap-4">
                        <div>
                            <Label>Montant</Label>
                            <Input type="number" value={values.amount || ""} onChange={(e) => updateActionValue("amount", e.target.value)} />
                        </div>
                        <div>
                            <Label>Assigne a</Label>
                            <Input value={values.assignee || ""} onChange={(e) => updateActionValue("assignee", e.target.value)} />
                        </div>
                    </div>
                    <div>
                        <Label>Description</Label>
                        <Textarea rows={4} value={values.description || ""} onChange={(e) => updateActionValue("description", e.target.value)} />
                    </div>
                </div>
            );
        }

        return (
            <div className="grid gap-4">
                <div>
                    <Label>Resume</Label>
                    <Textarea rows={4} value={values.message || ""} onChange={(e) => updateActionValue("message", e.target.value)} />
                </div>
            </div>
        );
    };

    const renderDetailDialogContent = () => {
        if (!selectedDetail) {
            return null;
        }

        if (selectedDetail.type === "feedback") {
            const feedback = selectedDetail.item;
            const client = getClientDetails(feedback.clientId);
            return (
                <>
                    <DialogHeader>
                        <DialogTitle>Feedback {feedback.id}</DialogTitle>
                        <DialogDescription>Details du retour client et statut de traitement.</DialogDescription>
                    </DialogHeader>
                    <div className="grid gap-4 text-sm">
                        <Card className="p-4">
                            <p className="font-semibold">{feedback.name}</p>
                            <p className="text-gray-600">{feedback.email}</p>
                            <p className="text-gray-600">Client: {client?.firstName} {client?.lastName}</p>
                        </Card>
                        <Card className="p-4">
                            <p className="mb-2 text-gray-600">Message</p>
                            <p>{feedback.message}</p>
                        </Card>
                    </div>
                </>
            );
        }

        return null;
    };

    return (
        <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
            <EmployeeHeader />

            <div className="pt-24 pb-16">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <motion.div initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }} className="mb-8">
                        <div className="flex items-center justify-between">
                            <div>
                                <h1 className="text-3xl sm:text-4xl font-bold text-gray-900 mb-2">Gestion des Clients</h1>
                                <p className="text-gray-600">Suivi complet des clients, contrats, feedbacks et incidents</p>
                                <p className="text-xs text-gray-500 mt-2">Actualise {refreshTick} fois dans cette session</p>
                            </div>
                            <div className="hidden sm:flex gap-3">
                                <Button
                                    variant="outline"
                                    className="gap-2"
                                    onClick={() => openAction("new-client", {
                                        title: "Nouveau client",
                                        description: "Cree une fiche client directement depuis cette page.",
                                        values: { firstName: "", lastName: "", email: "", phone: "", address: "", birthDate: "1990-01-01" }
                                    })}
                                >
                                    <UserPlus className="w-4 h-4" />
                                    Nouveau Client
                                </Button>
                                <Button
                                    className="bg-primary hover:bg-primary/90 gap-2"
                                    onClick={() => openAction("refresh-data", {
                                        title: "Actualiser les donnees",
                                        description: "Confirme l'actualisation locale des donnees visibles.",
                                        values: { message: "Les donnees seront rechargees localement." }
                                    })}
                                >
                                    <RefreshCw className="w-4 h-4" />
                                    Actualiser
                                </Button>
                            </div>
                        </div> 
                    </motion.div>

                    <div className="grid grid-cols-2 lg:grid-cols-4 xl:grid-cols-6 gap-6 mb-8">
                        <Card className="p-6"><div className="flex items-center justify-between"><div><p className="text-sm text-gray-600 mb-1">Total Clients</p><p className="text-2xl font-bold">{stats.total}</p></div><div className="bg-blue-100 rounded-xl p-3"><Users className="w-8 h-8 text-blue-600" /></div></div></Card>
                        <Card className="p-6"><div className="flex items-center justify-between"><div><p className="text-sm text-gray-600 mb-1">Actifs</p><p className="text-2xl font-bold text-green-600">{stats.active}</p></div><div className="bg-green-100 rounded-xl p-3"><UserCheck className="w-8 h-8 text-green-600" /></div></div></Card>
                        <Card className="p-6"><div className="flex items-center justify-between"><div><p className="text-sm text-gray-600 mb-1">Nouveaux</p><p className="text-2xl font-bold text-yellow-600">{stats.new}</p></div><div className="bg-yellow-100 rounded-xl p-3"><UserPlus className="w-8 h-8 text-yellow-600" /></div></div></Card>
                        <Card className="p-6">
                            <div className="flex items-center justify-between">
                                <div><p className="text-sm text-gray-600 mb-1">Avis reçus</p><p className="text-2xl font-bold text-purple-600">{stats.totalFeedbacks}</p></div>
                                <div className="bg-purple-100 rounded-xl p-3"><MessageSquareQuote className="w-8 h-8 text-purple-600" /></div>
                            </div>
                        </Card>
                        <Card className="p-6">
                            <div className="flex items-center justify-between">
                                <div><p className="text-sm text-gray-600 mb-1">Sinistres</p><p className="text-2xl font-bold text-red-600">{stats.totalIncidents}</p></div>
                                <div className="bg-red-100 rounded-xl p-3"><AlertTriangle className="w-8 h-8 text-red-600" /></div>
                            </div>
                        </Card>
                        <Card className="p-6 border-primary/20 bg-primary/5 hidden xl:block"><div className="flex items-center justify-between"><div><p className="text-sm text-gray-600 mb-1">CA Total</p><p className="text-xl font-bold text-primary">{stats.totalRevenue} €</p></div><div className="bg-primary/10 rounded-xl p-3"><DollarSign className="w-8 h-8 text-primary" /></div></div></Card>
                    </div>

                    <Tabs value={activeTab} onValueChange={updateSearchTab} className="space-y-6">
                        <TabsList className="grid grid-cols-4 lg:w-auto">
                            <TabsTrigger value="list">Liste Clients</TabsTrigger>
                            <TabsTrigger value="contracts">Contrats</TabsTrigger>
                            <TabsTrigger value="feedbacks">Feedbacks</TabsTrigger>
                            <TabsTrigger value="incidents">Incidents</TabsTrigger>
                        </TabsList>

                        <TabsContent value="list" className="space-y-6">
                            <Card className="p-6 border-border">
                                <div className="grid grid-cols-1 lg:grid-cols-4 gap-4 mb-4">
                                    <div className="lg:col-span-2">
                                        <Label htmlFor="search" className="sr-only">Rechercher</Label>
                                        <div className="relative">
                                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
                                            <Input id="search" placeholder="Rechercher un client..." value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} className="pl-10" />
                                        </div>
                                    </div>
                                    <div>
                                        <Label htmlFor="status">Statut</Label>
                                        <select id="status" value={filterStatus} onChange={(e) => setFilterStatus(e.target.value)} className="w-full p-2 border border-gray-300 rounded-md">
                                            <option value="tous">Tous les clients</option>
                                            <option value="actif">Actifs</option>
                                            <option value="inactif">Inactifs</option>
                                        </select>
                                    </div>
                                    <div>
                                        <Label htmlFor="sort">Trier par</Label>
                                        <div className="flex gap-2">
                                            <select id="sort" value={sortBy} onChange={(e) => setSortBy(e.target.value)} className="flex-1 p-2 border border-gray-300 rounded-md">
                                                <option value="date">Date d'inscription</option>
                                                <option value="prix">Montant total</option>
                                                <option value="fidelite">Score de crédit</option>
                                                <option value="nom">Nom</option>
                                            </select>
                                            <Button variant="outline" size="sm" onClick={() => setSortOrder(sortOrder === "desc" ? "asc" : "desc")} className="gap-2">
                                                {sortOrder === "desc" ? <ChevronDown className="w-4 h-4" /> : <ChevronUp className="w-4 h-4" />}
                                            </Button>
                                        </div>
                                    </div>
                                </div>

                                {showNewClients && clients.some((client) => client.isNew) && (
                                    <div className="border-t border-gray-200 pt-4 mb-4">
                                        <div className="flex items-center justify-between mb-3">
                                            <h3 className="text-lg font-semibold text-gray-900 flex items-center gap-2">
                                                <BellRing className="w-5 h-5 text-yellow-600" />
                                                Nouveaux clients inscrits
                                            </h3>
                                            <Button variant="ghost" size="sm" onClick={() => setShowNewClients(false)} className="text-gray-500">
                                                <EyeOff className="w-4 h-4 mr-2" />
                                                Masquer
                                            </Button>
                                        </div>
                                        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                                            {clients.filter((client) => client.isNew).map((client) => (
                                                <Card key={client.id} className="p-4 border-border hover:shadow-md transition-all">
                                                    <div className="flex items-center gap-3">
                                                        <Link to={`/employee/clients/${client.id}`} className="contents">
                                                            <Avatar className="w-12 h-12">
                                                                <AvatarImage src={client.profileImage} alt={client.firstName} />
                                                                <AvatarFallback className="bg-primary/10 text-primary">{client.firstName[0]}{client.lastName[0]}</AvatarFallback>
                                                            </Avatar>
                                                            <div className="flex-1">
                                                                <div className="flex items-center gap-2">
                                                                    <h4 className="font-semibold hover:underline">{client.firstName} {client.lastName}</h4>
                                                                    <Badge variant="secondary">Nouveau</Badge>
                                                                </div>
                                                                <p className="text-sm text-gray-600">{client.email}</p>
                                                                <p className="text-xs text-gray-500">Inscrit le {format(new Date(client.joinDate), "dd/MM/yyyy")}</p>
                                                            </div>
                                                        </Link>
                                                        <div className="text-right">
                                                            <p className="text-lg font-bold text-primary">{client.totalSpent} EUR</p>
                                                            <p className="text-xs text-gray-500">{client.totalContracts} contrats</p>
                                                        </div>
                                                    </div>
                                                </Card>
                                            ))}
                                        </div>
                                    </div>
                                )}
                            </Card>

                            <div className="grid gap-6">
                                {filteredClients.map((client) => (
                                    <Card key={client.id} className="p-6 border-border hover:shadow-lg transition-all">
                                        <div className="flex items-center justify-between">
                                            <div className="flex items-center gap-4">
                                                <Link to={`/employee/clients/${client.id}`} className="contents">
                                                    <Avatar className="w-16 h-16">
                                                        <AvatarImage src={client.profileImage} alt={client.firstName} />
                                                        <AvatarFallback className="bg-primary/10 text-primary text-xl">{client.firstName[0]}{client.lastName[0]}</AvatarFallback>
                                                    </Avatar>
                                                    <div className="flex-1">
                                                        <div className="flex items-center gap-3 mb-2">
                                                            <h3 className="text-xl font-semibold hover:underline">{client.firstName} {client.lastName}</h3>
                                                            <Badge variant={client.isActive ? "default" : "secondary"}>{client.isActive ? "Actif" : "Inactif"}</Badge>
                                                            <Badge variant="outline" className={client.role === 'employee' ? 'bg-blue-50 text-blue-700 border-blue-200' : ''}>
                                                                {client.role === 'employee' ? 'Employé' : 'Client'}
                                                            </Badge>
                                                            {client.isNew && <Badge variant="outline" className="bg-yellow-50 text-yellow-700 border-yellow-200">Nouveau</Badge>}
                                                        </div>
                                                        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm text-gray-600">
                                                            <div className="flex items-center gap-2"><Mail className="w-4 h-4" /><span>{client.email}</span></div>
                                                            <div className="flex items-center gap-2"><Phone className="w-4 h-4" /><span>{client.phone}</span></div>
                                                            <div className="flex items-center gap-2"><MapPin className="w-4 h-4" /><span>{client.address}</span></div>
                                                        </div>
                                                    </div>
                                                </Link>
                                            </div>

                                            <div className="flex flex-col items-end gap-3">
                                                <div className="text-right">
                                                    <p className="text-sm text-gray-600">Dernier contact</p>
                                                    <p className="font-medium">{format(new Date(client.lastContact), "dd/MM/yyyy")}</p>
                                                </div>
                                                <div className="flex gap-2">
                                                    <Link to={`/employee/clients/${client.id}`}><Button variant="outline" size="sm" className="gap-2"><Eye className="w-4 h-4" />Voir tout</Button></Link>
                                                    <Button
                                                        variant="outline"
                                                        size="sm"
                                                        className="gap-2"
                                                        onClick={() => openAction("contact-client", {
                                                            title: `Contacter ${client.firstName} ${client.lastName}`,
                                                            description: "Enregistre un echange client depuis cette page.",
                                                            values: { clientId: client.id, subject: "Suivi client", message: "" }
                                                        })}
                                                    >
                                                        <MessageCircle className="w-4 h-4" />
                                                        Contacter
                                                    </Button>
                                                    <Button
                                                        variant="outline"
                                                        size="sm"
                                                        className="gap-2"
                                                        onClick={() => openAction("edit-client", {
                                                            title: `Modifier ${client.firstName} ${client.lastName}`,
                                                            description: "Mets a jour les informations principales du client.",
                                                            values: { id: client.id, firstName: client.firstName, lastName: client.lastName, email: client.email, phone: client.phone, address: client.address }
                                                        })}
                                                    >
                                                        <Edit className="w-4 h-4" />
                                                        Modifier
                                                    </Button>
                                                </div>
                                            </div>
                                        </div>
                                    </Card>
                                ))}
                            </div>
                        </TabsContent>

                        <TabsContent value="contracts" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-2xl font-semibold">Gestion des Contrats</h2>
                                <Button
                                    variant="outline"
                                    className="gap-2"
                                    onClick={() => openAction("new-contract", {
                                        title: "Nouveau contrat",
                                        description: "Ajoute un contrat local a partir de la page speciale client.",
                                        values: { clientId: clients[0]?.id, type: "auto", startDate: "2024-02-01", endDate: "2025-02-01", amount: 300, coverage: "Tous risques", subject: "" }
                                    })}
                                >
                                    <FilePlus className="w-4 h-4" />
                                    Nouveau Contrat
                                </Button>
                            </div>

                            <div className="grid gap-6">
                                {contracts.map((contract) => {
                                    const client = getClientDetails(contract.clientId);
                                    const statusColor = contract.status === "actif" ? "bg-green-100 text-green-800" : contract.status === "expire" ? "bg-red-100 text-red-800" : "bg-yellow-100 text-yellow-800";
                                    return (
                                        <Card key={contract.id} className="p-6 border-border">
                                            <div className="flex items-center justify-between mb-4">
                                                <div className="flex items-center gap-4">
                                                    <div className="w-16 h-16 bg-primary/10 rounded-full flex items-center justify-center">
                                                        <FileText className="w-8 h-8 text-primary" />
                                                    </div>
                                                    <div>
                                                        <Link to={`/employee/clients/${contract.clientId}`} className="text-lg font-semibold hover:underline">{client?.firstName} {client?.lastName}</Link>
                                                        <p className="text-sm text-gray-600">Client depuis {format(new Date(client?.joinDate || "2024-01-01"), "dd/MM/yyyy")}</p>
                                                    </div>
                                                </div>
                                                <div className="text-right">
                                                    <Badge className={statusColor}>{contract.status}</Badge>
                                                    <p className="text-sm text-gray-600 mt-1">No {contract.policyNumber}</p>
                                                </div>
                                            </div>
                                            <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-4">
                                                <div><span className="text-sm text-gray-600">Type</span><p className="font-medium capitalize">{contract.type}</p></div>
                                                <div><span className="text-sm text-gray-600">Periode</span><p className="font-medium">{format(new Date(contract.startDate), "dd/MM/yyyy")} - {format(new Date(contract.endDate), "dd/MM/yyyy")}</p></div>
                                                <div><span className="text-sm text-gray-600">Montant</span><p className="font-bold text-lg text-primary">{contract.amount} EUR/an</p></div>
                                                <div><span className="text-sm text-gray-600">Couverture</span><p className="font-medium">{contract.coverage}</p></div>
                                            </div>
                                            <div className="flex gap-3">
                                                <Link to={`/employee/contracts/${contract.id}`}><Button variant="outline" size="sm" className="gap-2"><Eye className="w-4 h-4" />Details</Button></Link>
                                                <Button
                                                    variant="outline"
                                                    size="sm"
                                                    className="gap-2"
                                                    onClick={() => openAction("edit-contract", {
                                                        title: `Modifier ${contract.policyNumber}`,
                                                        description: "Mets a jour la couverture, le montant et le statut du contrat.",
                                                        values: { id: contract.id, coverage: contract.coverage, amount: contract.amount, status: contract.status }
                                                    })}
                                                >
                                                    <Edit className="w-4 h-4" />
                                                    Modifier
                                                </Button>
                                                <Button
                                                    variant="outline"
                                                    size="sm"
                                                    className="gap-2"
                                                    onClick={() => openAction("renew-contract", {
                                                        title: `Renouveler ${contract.policyNumber}`,
                                                        description: "Prepare le renouvellement de ce contrat.",
                                                        values: { id: contract.id, newEndDate: contract.endDate, message: "" }
                                                    })}
                                                >
                                                    <Mail className="w-4 h-4" />
                                                    Renouveler
                                                </Button>
                                            </div>
                                        </Card>
                                    );
                                })}
                            </div>
                        </TabsContent>

                        <TabsContent value="feedbacks" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-2xl font-semibold">Feedback Clients</h2>
                                <div className="flex gap-2">
                                    <Button
                                        variant="outline"
                                        className="gap-2"
                                        onClick={() => openAction("notifications", {
                                            title: "Notifications feedbacks",
                                            description: "Definis les regles locales de notification pour les nouveaux retours clients.",
                                            values: { message: "Notifier l'equipe pour les notes inferieures a 3." }
                                        })}
                                    >
                                        <Bell className="w-4 h-4" />
                                        Notifications
                                    </Button>
                                    <Button
                                        variant="outline"
                                        className="gap-2"
                                        onClick={() => openAction("export-feedbacks", {
                                            title: "Exporter les feedbacks",
                                            description: "Confirme l'export des retours visibles.",
                                            values: { message: "Export CSV pret pour les feedbacks du mois." }
                                        })}
                                    >
                                        <MessageSquare className="w-4 h-4" />
                                        Exporter
                                    </Button>
                                </div>
                            </div>

                            <div className="grid gap-6">
                                {feedbacks.map((feedback) => {
                                    const client = getClientDetails(feedback.clientId);
                                    return (
                                        <Card key={feedback.id} className="p-6 border-border">
                                            <div className="flex items-start justify-between">
                                                <div className="flex-1">
                                                    <div className="flex items-center gap-3 mb-3">
                                                        <Avatar className="w-10 h-10">
                                                            <AvatarImage src={client?.profileImage} alt={feedback.name} />
                                                            <AvatarFallback className="bg-primary/10 text-primary">{feedback.name.split(" ").map((part) => part[0]).join("")}</AvatarFallback>
                                                        </Avatar>
                                                        <div>
                                                            <Link to={`/employee/clients/${feedback.clientId}`} className="font-semibold hover:underline">{feedback.name}</Link>
                                                            <p className="text-sm text-gray-600">{feedback.email}</p>
                                                            <div className="flex items-center gap-2 mt-1">
                                                                <Badge variant="secondary">{feedback.type}</Badge>
                                                                <span className="text-sm text-gray-500">{format(new Date(feedback.date), "dd/MM/yyyy")}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div className="flex items-center gap-2 mb-3">
                                                        {[...Array(5)].map((_, index) => <Star key={index} className={`w-5 h-5 ${index < feedback.rating ? "text-yellow-400 fill-yellow-400" : "text-gray-300"}`} />)}
                                                        <span className="font-medium">{feedback.rating}/5</span>
                                                    </div>
                                                    <p className="text-gray-700 mb-4">{feedback.message}</p>
                                                    <div className="flex items-center gap-3">
                                                        <Badge variant={feedback.isResponded ? "default" : "destructive"}>{feedback.isResponded ? "Repondu" : "Non lu"}</Badge>
                                                        <span className="text-sm text-gray-500">Client: {client?.firstName} {client?.lastName}</span>
                                                    </div>
                                                </div>
                                                <div className="flex gap-2">
                                                    <Button
                                                        variant="outline"
                                                        size="sm"
                                                        className="gap-2"
                                                        onClick={() => openAction("reply-feedback", {
                                                            title: `Repondre a ${feedback.name}`,
                                                            description: "Enregistre une reponse au feedback client.",
                                                            values: { id: feedback.id, subject: "Reponse a votre retour", message: "" }
                                                        })}
                                                    >
                                                        <MessageCircle className="w-4 h-4" />
                                                        Repondre
                                                    </Button>
                                                    <Button variant="outline" size="sm" className="gap-2" onClick={() => openDetailDialog("feedback", feedback)}>
                                                        <Eye className="w-4 h-4" />
                                                        Details
                                                    </Button>
                                                </div>
                                            </div>
                                        </Card>
                                    );
                                })}
                            </div>
                        </TabsContent>

                        <TabsContent value="incidents" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-2xl font-semibold">Gestion des Incidents</h2>
                                <Button
                                    variant="outline"
                                    className="gap-2"
                                    onClick={() => openAction("new-incident", {
                                        title: "Nouvel incident",
                                        description: "Ajoute un dossier incident depuis la page speciale client.",
                                        values: { clientId: clients[0]?.id, title: "", type: "auto", date: "2024-02-01", amount: 0, assignee: "", description: "" }
                                    })}
                                >
                                    <AlertTriangle className="w-4 h-4" />
                                    Nouvel Incident
                                </Button>
                            </div>

                            <div className="grid gap-6">
                                {incidents.map((incident) => {
                                    const statusColor = incident.status === "en_cours" ? "bg-red-100 text-red-800" : "bg-green-100 text-green-800";
                                    return (
                                        <Card key={incident.id} className="p-6 border-border">
                                            <div className="flex items-center justify-between mb-4">
                                                <div className="flex items-center gap-4">
                                                    <div className={`w-4 h-4 rounded-full ${incident.status === "en_cours" ? "bg-red-500" : "bg-green-500"}`}></div>
                                                    <div>
                                                        <h3 className="text-lg font-semibold">{incident.title}</h3>
                                                        <p className="text-sm text-gray-600">Client: <Link to={`/employee/clients/${incident.clientId}`} className="hover:underline">{incident.clientName}</Link></p>
                                                    </div>
                                                </div>
                                                <div className="text-right">
                                                    <Badge className={statusColor}>{incident.status}</Badge>
                                                    <p className="text-sm text-gray-600 mt-1">Assigne a: {incident.assignee}</p>
                                                </div>
                                            </div>
                                            <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-4">
                                                <div><span className="text-sm text-gray-600">Type</span><p className="font-medium capitalize">{incident.type}</p></div>
                                                <div><span className="text-sm text-gray-600">Date</span><p className="font-medium">{format(new Date(incident.date), "dd/MM/yyyy")}</p></div>
                                                <div><span className="text-sm text-gray-600">Montant</span><p className="font-bold text-lg text-primary">{incident.amount} EUR</p></div>
                                                <div><span className="text-sm text-gray-600">Description</span><p className="font-medium text-sm">{incident.description}</p></div>
                                            </div>
                                            <div className="flex gap-3">
                                                <Link to={`/employee/incidents/${incident.id}`}><Button variant="outline" size="sm" className="gap-2"><Eye className="w-4 h-4" />Details</Button></Link>
                                                <Button
                                                    variant="outline"
                                                    size="sm"
                                                    className="gap-2"
                                                    onClick={() => openAction("edit-incident", {
                                                        title: `Modifier ${incident.id}`,
                                                        description: "Met a jour le dossier incident visible.",
                                                        values: { id: incident.id, title: incident.title, type: incident.type, date: incident.date, amount: incident.amount, assignee: incident.assignee, description: incident.description }
                                                    })}
                                                >
                                                    <Edit className="w-4 h-4" />
                                                    Modifier
                                                </Button>
                                                <Button
                                                    variant="outline"
                                                    size="sm"
                                                    className="gap-2"
                                                    onClick={() => openAction("contact-client", {
                                                        title: `Contacter ${incident.clientName}`,
                                                        description: "Prepare un message de suivi pour cet incident.",
                                                        values: { clientId: incident.clientId, subject: `Suivi incident ${incident.id}`, message: "" }
                                                    })}
                                                >
                                                    <Mail className="w-4 h-4" />
                                                    Contacter
                                                </Button>
                                            </div>
                                        </Card>
                                    );
                                })}
                            </div>
                        </TabsContent>
                    </Tabs>

                    <Dialog open={detailDialogOpen} onOpenChange={setDetailDialogOpen}>
                        <DialogContent className="max-w-3xl max-h-[85vh] overflow-y-auto">
                            {renderDetailDialogContent()}
                        </DialogContent>
                    </Dialog>

                    {/* Dialogue de Confirmation de Suppression */}
                    <Dialog open={deleteDialog.open} onOpenChange={(open) => !open && setDeleteDialog({ ...deleteDialog, open: false })}>
                        <DialogContent>
                            <DialogHeader>
                                <DialogTitle>Confirmer la suppression</DialogTitle>
                                <DialogDescription>
                                    Êtes-vous sûr de vouloir supprimer <strong>{deleteDialog.title}</strong> ? 
                                    Cette action est irréversible.
                                </DialogDescription>
                            </DialogHeader>
                            <div className="flex justify-end gap-3 mt-4">
                                <Button variant="outline" onClick={() => setDeleteDialog({ open: false, id: null, title: "", type: "" })}>Annuler</Button>
                                <Button variant="destructive" onClick={confirmDelete}>Supprimer définitivement</Button>
                            </div>
                        </DialogContent>
                    </Dialog>

                    <Dialog open={actionDialog.open} onOpenChange={(open) => !open && closeAction()}>
                        <DialogContent className="max-w-2xl max-h-[85vh] overflow-y-auto">
                            <DialogHeader>
                                <DialogTitle>{actionDialog.title}</DialogTitle>
                                <DialogDescription>{actionDialog.description}</DialogDescription>
                            </DialogHeader>
                            <div className="grid gap-6">
                                {renderActionForm()}
                                <div className="flex justify-end gap-3">
                                    <Button variant="outline" onClick={closeAction}>Annuler</Button>
                                    <Button onClick={handleActionSubmit}>Enregistrer</Button>
                                </div>
                            </div>
                        </DialogContent>
                    </Dialog>
                </div>
            </div>

            <EmployeeMessenger />
            <Footer />
        </div>
    );
}

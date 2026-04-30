import { useState, useEffect } from "react";
import { useParams, Link, useNavigate } from "react-router";
import { EmployeeHeader } from "../components/employee-header";
import { Footer } from "../components/footer";
import { EmployeeMessenger } from "../components/employee-messenger";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Badge } from "../components/ui/badge";
import ScoreBadge from "../components/score-badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "../components/ui/tabs";
import { Avatar, AvatarFallback, AvatarImage } from "../components/ui/avatar";
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle } from "../components/ui/dialog";
import { Input } from "../components/ui/input";
import { Label } from "../components/ui/label";
import { Textarea } from "../components/ui/textarea";
import {
    ArrowLeft, User, Mail, Phone, MapPin, Calendar, DollarSign,
    FileText, Shield, AlertTriangle, MessageSquare, Star, Edit,
    Trash2, Plus, Download, Send, CheckCircle, Clock, Eye, RefreshCw,
    Car, Home, Heart, TrendingUp, TrendingDown, Bell
} from "lucide-react"; // Keep all lucide-react imports
import { motion } from "motion/react"; // Keep motion import
import { format } from "date-fns";
// data is loaded from API calls; mock-data import removed
import { employeeClientContracts, employeeClientIncidents } from "../employee-client-detail-data";
import { normalizeUserWithProfile } from "../auth";
import { computeCreditScore } from "../utils/creditScore";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

function emptyActionDialog() {
    return {
        open: false,
        type: "",
        title: "",
        description: "",
        values: {}
    };
}

export function EmployeeClientDetailPage() {
    const { clientId } = useParams();
    const navigate = useNavigate();

// Find the client based on URL parameter
    const [client, setClient] = useState(null);
    const [contracts, setContracts] = useState([]);
    const [incidents, setIncidents] = useState([]);
    const [feedbacks, setFeedbacks] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [actionDialog, setActionDialog] = useState(emptyActionDialog());

    const fetchClientDetails = async () => {
        setLoading(true);
        setError(null);
        const token = localStorage.getItem("assurance-auth-token");
        if (!token) {
            setError("Authentication token not found.");
            setLoading(false);
            return;
        }

        try {
            const headers = { 'Authorization': `Bearer ${token}` };

            // Fetch client user and profile
            const clientResp = await fetch(`${API_URL}/api/users/${clientId}`, { headers });
            if (!clientResp.ok) throw new Error(`Failed to fetch client: ${clientResp.statusText}`);
            const clientBody = await clientResp.json();
            const clientData = (clientBody && clientBody.data) || clientBody || {};
            const fetchedClient = {
                ...normalizeUserWithProfile(clientData, {
                    profileImage: "/assets/client-placeholder.svg",
                }),
                totalContracts: 0,
                activeContracts: 0,
                totalSpent: 0,
            };
            setClient(fetchedClient);

            // Fetch contracts for this client
            const contractsResp = await fetch(`${API_URL}/api/users/${clientId}/contracts`, { headers });
            if (!contractsResp.ok) throw new Error(`Failed to fetch contracts: ${contractsResp.statusText}`);
            const contractsBody = await contractsResp.json();
            const contractsList = (contractsBody && contractsBody.data && (contractsBody.data.contracts || contractsBody.data)) || contractsBody.contracts || contractsBody || [];
                const formattedContracts = (contractsList || []).map(contract => ({
                id: contract.id,
                clientId: contract.client_id,
                type: contract.type,
                startDate: format(new Date(contract.start_date), 'yyyy-MM-dd'),
                endDate: format(new Date(contract.end_date), 'yyyy-MM-dd'),
                amount: contract.annual_amount,
                status: contract.status,
                coverage: contract.coverage,
                    // Normalize vehicle/property to strings for rendering
                    vehicle: contract.vehicle_details ? `${contract.vehicle_details.brand || ''} ${contract.vehicle_details.model || ''} ${contract.vehicle_details.year || ''}`.trim() : (contract.vehicle_info ? `${contract.vehicle_info.brand || ''} ${contract.vehicle_info.model || ''} ${contract.vehicle_info.year || ''}`.trim() : ''),
                    property: contract.property_details ? (contract.property_details.address || JSON.stringify(contract.property_details)) : (contract.property_info ? (contract.property_info.address || JSON.stringify(contract.property_info)) : ''),
                policyNumber: contract.policy_number,
                deductible: contract.deductible
            }));
            // Merge simulated contracts for this client and set contracts
            let mergedContracts = Array.isArray(formattedContracts) ? formattedContracts.slice() : [];
            try {
                const rawSim = localStorage.getItem('assurance-simulated-contracts');
                const simList = rawSim ? JSON.parse(rawSim) : [];
                if (Array.isArray(simList) && simList.length) {
                    const relevant = simList.filter(s => String(s.client_id) === String(clientId));
                    const mapped = relevant.map(s => ({
                        id: s.id,
                        clientId: s.client_id,
                        type: s.type,
                        startDate: s.start_date,
                        endDate: s.end_date,
                        amount: s.annual_amount,
                        status: s.status,
                        coverage: s.coverage,
                        vehicle: s.vehicle,
                        property: s.property,
                        policyNumber: s.policy_number,
                        deductible: s.deductible
                    }));
                    // prepend simulated
                    mergedContracts = [...mapped, ...mergedContracts];
                }
            } catch (e) {
                // ignore
            }

            setContracts(mergedContracts);

            // Update client stats based on merged contracts (ensure numeric sums)
            setClient(prevClient => {
                const clientContracts = mergedContracts.filter(c => c.clientId === prevClient.id);
                const activeClientContracts = clientContracts.filter(c => c.status === 'actif');
                const totalSpent = clientContracts.reduce((sum, c) => sum + Number(c.amount || c.annual_amount || 0), 0);
                return {
                    ...prevClient,
                    totalContracts: clientContracts.length,
                    activeContracts: activeClientContracts.length,
                    totalSpent: totalSpent
                };
            });

            // Fetch incidents for this client
            const incidentsResp = await fetch(`${API_URL}/api/users/${clientId}/incidents`, { headers });
            if (!incidentsResp.ok) throw new Error(`Failed to fetch incidents: ${incidentsResp.statusText}`);
            const incidentsBody = await incidentsResp.json();
            const incidentsList = (incidentsBody && incidentsBody.data && (incidentsBody.data.incidents || incidentsBody.data)) || incidentsBody.incidents || incidentsBody || [];
            const formattedIncidents = (incidentsList || []).map(incident => ({
                id: incident.id,
                clientId: incident.client_id,
                title: incident.title,
                date: format(new Date(incident.date), 'yyyy-MM-dd'),
                status: incident.status,
                type: incident.type,
                description: incident.description,
                amount: incident.estimated_cost,
                assignee: incident.assigned_employee_id || "Unassigned",
                reference: incident.reference
            }));
            setIncidents(formattedIncidents);

            // Fetch feedbacks for this client
            const feedbacksResp = await fetch(`${API_URL}/api/feedbacks?clientId=${clientId}`, { headers });
            if (!feedbacksResp.ok) throw new Error(`Failed to fetch feedbacks: ${feedbacksResp.statusText}`);
            const feedbacksBody = await feedbacksResp.json();
            const feedbacksList = (feedbacksBody && feedbacksBody.data && (feedbacksBody.data.feedbacks || feedbacksBody.data)) || feedbacksBody.feedbacks || feedbacksBody || [];
            const formattedFeedbacks = (feedbacksList || []).map(feedback => ({
                id: feedback.id,
                clientId: feedback.client_id,
                subject: feedback.subject,
                message: feedback.message,
                date: format(new Date(feedback.created_at), 'yyyy-MM-dd'),
                time: format(new Date(feedback.created_at), 'HH:mm'),
                rating: feedback.rating,
                category: feedback.category,
                source: feedback.source,
                status: feedback.status,
                replied: feedback.is_responded,
                isResponded: feedback.is_responded,
                type: "general", // Mock for now
                publicRole: "Client", // Mock for now
                publicQuote: false, // Mock for now
                name: fetchedClient.firstName + " " + fetchedClient.lastName,
                email: fetchedClient.email,
                phone: fetchedClient.phone,
                client: fetchedClient
            }));
            setFeedbacks(formattedFeedbacks);

            // compute credit score (replaces previous loyaltyScore)
            try {
                const creditScore = computeCreditScore({
                    joinedAt: fetchedClient.joinDate || fetchedClient.created_at || fetchedClient.user_created_at,
                    contracts: mergedContracts,
                    incidents: formattedIncidents,
                    feedbacks: formattedFeedbacks,
                    followsOnSocial: fetchedClient.follows_on_social || false
                });
                setClient((cur) => ({ ...cur, loyaltyScore: creditScore, creditScore }));
            } catch (e) {
                // ignore
            }

        } catch (err) {
            console.error("Error fetching client details:", err);
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchClientDetails();
    }, [clientId]);

    useEffect(() => {
        function onContractsRefresh(e) {
            const detail = e?.detail || {};
            const createdContract = detail.contract || detail;
            if (!createdContract) return;
            // If the created contract is for this client, refresh details
            const createdClientId = createdContract.client_id || createdContract.clientId || createdContract.client;
            if (createdClientId && String(createdClientId) === String(clientId)) {
                fetchClientDetails();
            }
        }
        window.addEventListener('contracts:refresh', onContractsRefresh);
        return () => window.removeEventListener('contracts:refresh', onContractsRefresh);
    }, [clientId]);

    const getTypeIcon = (type) => {
        switch (type) {
            case 'auto': return Car;
            case 'habitation': return Home;
            case 'sante': return Heart;
            default: return FileText;
        }
    };

    const getStatusColor = (status) => {
        switch (status) {
            case 'actif': return 'bg-green-100 text-green-800 border-green-200';
            case 'en_cours': return 'bg-blue-100 text-blue-800 border-blue-200';
            case 'expire': return 'bg-red-100 text-red-800 border-red-200';
            case 'traite': return 'bg-green-100 text-green-800 border-green-200';
            default: return 'bg-gray-100 text-gray-800 border-gray-200';
        }
    };

    const getStatusLabel = (status) => {
        switch (status) {
            case 'actif': return 'Actif';
            case 'en_cours': return 'En cours';
            case 'expire': return 'Expire';
            case 'traite': return 'Traite';
            default: return status;
        }
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

    const closeAction = () => setActionDialog(emptyActionDialog());

    const updateActionValue = (key, value) => {
        setActionDialog((current) => ({
            ...current,
            values: {
                ...current.values,
                [key]: value
            }
        }));
    };

    const handleActionSubmit = () => {
        const values = actionDialog.values;
        const today = format(new Date(), "yyyy-MM-dd");
        const time = format(new Date(), "HH:mm");

        if (actionDialog.type === "edit-client") {
            setClient((current) => current ? {
                ...current,
                firstName: values.firstName,
                lastName: values.lastName,
                email: values.email,
                phone: values.phone,
                address: values.address
            } : current);
        }

        if (actionDialog.type === "contact-client") {
            setClient((current) => current ? {
                ...current,
                lastContact: today,
                notes: `${current.notes}\n\n[${format(new Date(), "dd/MM/yyyy HH:mm")}] Contact: ${values.subject}`
            } : current);
        }

        if (actionDialog.type === "new-contract") {
            const nextIndex = contracts.length + 1;
            const contractType = values.type || "auto";
            const amount = Number(values.amount || 0);
            const newContract = {
                id: `CNT-${String(nextIndex).padStart(3, "0")}`,
                clientId,
                type: contractType,
                startDate: values.startDate || today,
                endDate: values.endDate || today,
                amount,
                status: "actif",
                coverage: values.coverage || "Standard",
                vehicle: contractType === "auto" ? values.label : undefined,
                property: contractType === "habitation" ? values.label : undefined,
                policyNumber: `POL-${contractType.toUpperCase()}-${String(nextIndex).padStart(3, "0")}`,
                deductible: Number(values.deductible || 100)
            };

            setContracts((current) => [newContract, ...current]);
            setClient((current) => current ? {
                ...current,
                totalContracts: current.totalContracts + 1,
                activeContracts: current.activeContracts + 1,
                totalSpent: current.totalSpent + amount
            } : current);
        }

        if (actionDialog.type === "edit-contract") {
            setContracts((current) =>
                current.map((contract) =>
                    contract.id === values.id
                        ? {
                            ...contract,
                            coverage: values.coverage,
                            amount: Number(values.amount),
                            deductible: Number(values.deductible),
                            status: values.status
                        }
                        : contract
                )
            );
        }

        if (actionDialog.type === "new-incident") {
            const nextIndex = incidents.length + 1;
            setIncidents((current) => [{
                id: `INC-${String(nextIndex).padStart(3, "0")}`,
                clientId,
                title: values.title,
                date: values.date || today,
                status: "en_cours",
                type: values.type || "auto",
                description: values.description,
                amount: Number(values.amount || 0),
                assignee: values.assignee,
                reference: `INC-${new Date().getFullYear()}-${String(nextIndex).padStart(6, "0")}`
            }, ...current]);
        }

        if (actionDialog.type === "edit-incident") {
            setIncidents((current) =>
                current.map((incident) =>
                    incident.id === values.id
                        ? {
                            ...incident,
                            title: values.title,
                            type: values.type,
                            amount: Number(values.amount),
                            assignee: values.assignee,
                            description: values.description,
                            status: values.status
                        }
                        : incident
                )
            );
        }

        if (actionDialog.type === "request-feedback") {
            const nextIndex = feedbacks.length + 1;
            setFeedbacks((current) => [{
                id: `FB-${String(nextIndex).padStart(3, "0")}`,
                clientId,
                subject: values.subject || "Demande de feedback envoyee",
                message: values.message || `Demande de feedback envoyee a ${client?.email}.`,
                date: today,
                time,
                rating: 0,
                type: "demande",
                category: "general",
                source: "employee",
                status: "nouveau",
                replied: false,
                isResponded: false,
                name: client ? `${client.firstName} ${client.lastName}` : "",
                email: client?.email || "",
                phone: client?.phone || ""
            }, ...current]);
            setClient((current) => current ? { ...current, lastContact: today } : current);
        }

        if (actionDialog.type === "reply-feedback") {
            setFeedbacks((current) =>
                current.map((feedback) =>
                    feedback.id === values.id
                        ? {
                            ...feedback,
                            isResponded: true,
                            replied: true,
                            message: `${feedback.message}\n\nReponse employee: ${values.response}`
                        }
                        : feedback
                )
            );
        }

        if (actionDialog.type === "add-note") {
            setClient((current) => current ? {
                ...current,
                notes: `${current.notes}\n\n[${format(new Date(), "dd/MM/yyyy HH:mm")}] ${values.note}`
            } : current);
        }

        closeAction();
    };

    const renderActionForm = () => {
        const values = actionDialog.values;

        if (actionDialog.type === "edit-client") {
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

        if (actionDialog.type === "contact-client") {
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

        if (actionDialog.type === "new-contract" || actionDialog.type === "edit-contract") {
            return (
                <div className="grid gap-4">
                    {actionDialog.type === "new-contract" && (
                        <>
                            <div>
                                <Label>Type</Label>
                                <select value={values.type || "auto"} onChange={(e) => updateActionValue("type", e.target.value)} className="w-full rounded-md border border-gray-300 px-3 py-2">
                                    <option value="auto">Auto</option>
                                    <option value="habitation">Habitation</option>
                                    <option value="sante">Sante</option>
                                </select>
                            </div>
                            <div>
                                <Label>Libelle</Label>
                                <Input value={values.label || ""} onChange={(e) => updateActionValue("label", e.target.value)} />
                            </div>
                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <Label>Date de debut</Label>
                                    <Input type="date" value={values.startDate || ""} onChange={(e) => updateActionValue("startDate", e.target.value)} />
                                </div>
                                <div>
                                    <Label>Date de fin</Label>
                                    <Input type="date" value={values.endDate || ""} onChange={(e) => updateActionValue("endDate", e.target.value)} />
                                </div>
                            </div>
                        </>
                    )}
                    <div>
                        <Label>Couverture</Label>
                        <Input value={values.coverage || ""} onChange={(e) => updateActionValue("coverage", e.target.value)} />
                    </div>
                    <div className="grid grid-cols-2 gap-4">
                        <div>
                            <Label>Montant annuel</Label>
                            <Input type="number" value={values.amount || ""} onChange={(e) => updateActionValue("amount", e.target.value)} />
                        </div>
                        <div>
                            <Label>Franchise</Label>
                            <Input type="number" value={values.deductible || ""} onChange={(e) => updateActionValue("deductible", e.target.value)} />
                        </div>
                    </div>
                    {actionDialog.type === "edit-contract" && (
                        <div>
                            <Label>Statut</Label>
                            <select value={values.status || "actif"} onChange={(e) => updateActionValue("status", e.target.value)} className="w-full rounded-md border border-gray-300 px-3 py-2">
                                <option value="actif">Actif</option>
                                <option value="en_cours">En cours</option>
                                <option value="expire">Expire</option>
                            </select>
                        </div>
                    )}
                </div>
            );
        }

        if (actionDialog.type === "new-incident" || actionDialog.type === "edit-incident") {
            return (
                <div className="grid gap-4">
                    <div>
                        <Label>Titre</Label>
                        <Input value={values.title || ""} onChange={(e) => updateActionValue("title", e.target.value)} />
                    </div>
                    <div className="grid grid-cols-2 gap-4">
                        <div>
                            <Label>Type</Label>
                            <select value={values.type || "auto"} onChange={(e) => updateActionValue("type", e.target.value)} className="w-full rounded-md border border-gray-300 px-3 py-2">
                                <option value="auto">Auto</option>
                                <option value="habitation">Habitation</option>
                                <option value="sante">Sante</option>
                            </select>
                        </div>
                        {actionDialog.type === "new-incident" ? (
                            <div>
                                <Label>Date</Label>
                                <Input type="date" value={values.date || ""} onChange={(e) => updateActionValue("date", e.target.value)} />
                            </div>
                        ) : (
                            <div>
                                <Label>Statut</Label>
                                <select value={values.status || "en_cours"} onChange={(e) => updateActionValue("status", e.target.value)} className="w-full rounded-md border border-gray-300 px-3 py-2">
                                    <option value="en_cours">En cours</option>
                                    <option value="traite">Traite</option>
                                </select>
                            </div>
                        )}
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
                        <Textarea rows={5} value={values.description || ""} onChange={(e) => updateActionValue("description", e.target.value)} />
                    </div>
                </div>
            );
        }

        if (actionDialog.type === "request-feedback") {
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

        if (actionDialog.type === "reply-feedback") {
            return (
                <div className="grid gap-4">
                    <div>
                        <Label>Reponse</Label>
                        <Textarea rows={5} value={values.response || ""} onChange={(e) => updateActionValue("response", e.target.value)} />
                    </div>
                </div>
            );
        }

        if (actionDialog.type === "add-note") {
            return (
                <div className="grid gap-4">
                    <div>
                        <Label>Nouvelle note</Label>
                        <Textarea rows={6} value={values.note || ""} onChange={(e) => updateActionValue("note", e.target.value)} />
                    </div>
                </div>
            );
        }

        return null;
    };

    if (loading) {
        return (
            <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center">
                <div className="text-center">
                    <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
                    <p className="text-gray-600">Chargement...</p>
                </div>
            </div>
        );
    }

    if (error) {
        return (
            <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center">
                <div className="text-center p-4">
                    <AlertTriangle className="w-12 h-12 text-red-500 mx-auto mb-4" />
                    <h1 className="text-2xl font-bold text-gray-900 mb-2">Erreur de chargement</h1>
                    <p className="text-red-600 mb-4">{error}</p>
                    <Button onClick={fetchClientDetails} className="gap-2">
                        <RefreshCw className="w-4 h-4" />
                        Réessayer
                    </Button>
                </div>
            </div>
        );
    }

    if (!client) {
        return (
            <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center">
                <div className="text-center">
                    <h1 className="text-2xl font-bold text-gray-900 mb-2">Client non trouve</h1>
                    <p className="text-gray-600 mb-4">Le client avec l'ID {clientId} n'existe pas.</p>
                    <Button onClick={() => navigate(-1)} className="gap-2">
                        <ArrowLeft className="w-4 h-4" />
                        Retour
                    </Button>
                </div>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
            <EmployeeHeader />

            <div className="pt-24 pb-16">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    {/* Back Button */}
                    <motion.div
                        initial={{ opacity: 0, x: -20 }}
                        animate={{ opacity: 1, x: 0 }}
                        className="mb-6"
                    >
                        <Button
                            variant="outline"
                            onClick={() => navigate(-1)}
                            className="gap-2"
                        >
                            <ArrowLeft className="w-4 h-4" />
                            Retour
                        </Button>
                    </motion.div>

                    {/* Client Header */}
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="mb-8"
                    >
                        <Card className="p-6 border-border">
                            <div className="flex items-center gap-6">
                                <Avatar className="w-24 h-24">
                                    <AvatarImage src={client.profileImage} alt={client.firstName} />
                                    <AvatarFallback className="bg-primary/10 text-primary text-3xl">
                                        {client.firstName[0]}{client.lastName[0]}
                                    </AvatarFallback>
                                </Avatar>

                                <div className="flex-1">
                                    <div className="flex items-center gap-3 mb-2">
                                        <h1 className="text-3xl font-bold text-gray-900">
                                            {client.firstName} {client.lastName}
                                        </h1>
                                        <Badge variant={client.isActive ? "default" : "secondary"}>
                                            {client.isActive ? "Actif" : "Inactif"}
                                        </Badge>
                                        {client.isNew && (
                                            <Badge variant="outline" className="bg-yellow-50 text-yellow-700 border-yellow-200">
                                                Nouveau
                                            </Badge>
                                        )}
                                    </div>

                                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm text-gray-600">
                                        <div className="flex items-center gap-2">
                                            <Mail className="w-4 h-4" />
                                            <span>{client.email}</span>
                                        </div>
                                        <div className="flex items-center gap-2">
                                            <Phone className="w-4 h-4" />
                                            <span>{client.phone}</span>
                                        </div>
                                        <div className="flex items-center gap-2">
                                            <MapPin className="w-4 h-4" />
                                            <span>{client.address}</span>
                                        </div>
                                        <div className="flex items-center gap-2">
                                            <Calendar className="w-4 h-4" />
                                            <span>Ne(e) le {format(new Date(client.birthDate), 'dd/MM/yyyy')}</span>
                                        </div>
                                    </div>
                                </div>

                                <div className="flex flex-col items-end gap-3">
                                    <div className="text-right">
                                            <p className="text-sm text-gray-600">Score de crédit</p>
                                            <div className="flex items-center gap-2">
                                                <Star className="w-5 h-5 text-yellow-500 fill-yellow-500" />
                                                <ScoreBadge score={client.creditScore ?? client.loyaltyScore} />
                                        </div>
                                    </div>
                                    <div className="flex gap-2">
                                        <Button
                                            variant="outline"
                                            size="sm"
                                            className="gap-2"
                                            onClick={() => openAction("edit-client", {
                                                title: "Modifier le client",
                                                description: "Mettez a jour rapidement les informations visibles de ce client.",
                                                values: {
                                                    firstName: client.firstName,
                                                    lastName: client.lastName,
                                                    email: client.email,
                                                    phone: client.phone,
                                                    address: client.address
                                                }
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
                                                title: "Contacter le client",
                                                description: "Enregistre un nouveau contact et un message de suivi.",
                                                values: {
                                                    subject: `Suivi dossier ${client.firstName} ${client.lastName}`,
                                                    message: ""
                                                }
                                            })}
                                        >
                                            <Mail className="w-4 h-4" />
                                            Contacter
                                        </Button>
                                    </div>
                                </div>
                            </div>
                        </Card>
                    </motion.div>

                    {/* Quick Stats */}
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.1 }}
                        className="grid grid-cols-2 lg:grid-cols-4 gap-6 mb-8"
                    >
                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Total Contrats</p>
                                    <p className="text-2xl font-bold">{client.totalContracts}</p>
                                    <p className="text-sm text-green-600">{client.activeContracts} actifs</p>
                                </div>
                                <div className="bg-blue-100 rounded-xl p-3">
                                    <FileText className="w-8 h-8 text-blue-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Montant Total</p>
                                    <p className="text-2xl font-bold text-primary">{client.totalSpent} EUR</p>
                                    <p className="text-sm text-gray-500">Tous contrats confondus</p>
                                </div>
                                <div className="bg-green-100 rounded-xl p-3">
                                    <DollarSign className="w-8 h-8 text-green-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Incidents</p>
                                    <p className="text-2xl font-bold">{incidents.length}</p>
                                    <p className="text-sm text-red-600">
                                        {incidents.filter(i => i.status === 'en_cours').length} en cours
                                    </p>
                                </div>
                                <div className="bg-red-100 rounded-xl p-3">
                                    <AlertTriangle className="w-8 h-8 text-red-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Dernier Contact</p>
                                    <p className="text-2xl font-bold">{format(new Date(client.lastContact), 'dd/MM')}</p>
                                    <p className="text-sm text-gray-500">Il y a {Math.floor((Date.now() - new Date(client.lastContact)) / (1000 * 60 * 60 * 24))} jours</p>
                                </div>
                                <div className="bg-purple-100 rounded-xl p-3">
                                    <Bell className="w-8 h-8 text-purple-600" />
                                </div>
                            </div>
                        </Card>
                    </motion.div>

                    {/* Main Content Tabs */}
                    <Tabs defaultValue="contracts" className="space-y-6">
                        <TabsList className="grid grid-cols-4 lg:w-auto">
                            <TabsTrigger value="contracts">Contrats ({contracts.length})</TabsTrigger>
                            <TabsTrigger value="incidents">Incidents ({incidents.length})</TabsTrigger>
                            <TabsTrigger value="feedbacks">Feedbacks ({feedbacks.length})</TabsTrigger>
                            <TabsTrigger value="notes">Notes</TabsTrigger>
                        </TabsList>

                        {/* Contracts Tab */}
                        <TabsContent value="contracts" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Contrats du client</h2>
                                <Button
                                    className="gap-2"
                                    onClick={() => openAction("new-contract", {
                                        title: "Nouveau contrat",
                                        description: "Ajoute un nouveau contrat directement depuis la fiche client.",
                                        values: {
                                            type: "auto",
                                            label: "",
                                            startDate: format(new Date(), "yyyy-MM-dd"),
                                            endDate: format(new Date(new Date().setFullYear(new Date().getFullYear() + 1)), "yyyy-MM-dd"),
                                            amount: 0,
                                            deductible: 100,
                                            coverage: "Standard"
                                        }
                                    })}
                                >
                                    <Plus className="w-4 h-4" />
                                    Nouveau Contrat
                                </Button>
                            </div>

                            <div className="grid gap-6">
                                {contracts.map((contract) => {
                                    const TypeIcon = getTypeIcon(contract.type);
                                    return (
                                        <Card key={contract.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                                            <div className="flex items-start justify-between">
                                                <div className="flex items-start gap-4">
                                                    <div className="w-12 h-12 bg-primary/10 rounded-xl flex items-center justify-center">
                                                        <TypeIcon className="w-6 h-6 text-primary" />
                                                    </div>
                                                    <div>
                                                        <div className="flex items-center gap-3 mb-2">
                                                            <h3 className="text-lg font-semibold">
                                                                {contract.type === 'auto' ? contract.vehicle : contract.property || 'Contrat ' + contract.type}
                                                            </h3>
                                                            <Badge className={getStatusColor(contract.status)}>
                                                                {getStatusLabel(contract.status)}
                                                            </Badge>
                                                        </div>
                                                        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm text-gray-600">
                                                            <div>
                                                                <span className="text-gray-500">Reference: </span>
                                                                <span className="font-mono">{contract.policyNumber}</span>
                                                            </div>
                                                            <div>
                                                                <span className="text-gray-500">Periode: </span>
                                                                <span>{format(new Date(contract.startDate), 'dd/MM/yyyy')} - {format(new Date(contract.endDate), 'dd/MM/yyyy')}</span>
                                                            </div>
                                                            <div>
                                                                <span className="text-gray-500">Montant: </span>
                                                                <span className="font-bold text-primary">{contract.amount} EUR/an</span>
                                                            </div>
                                                            <div>
                                                                <span className="text-gray-500">Franchise: </span>
                                                                <span>{contract.deductible} EUR</span>
                                                            </div>
                                                        </div>
                                                        <div className="mt-3">
                                                            <Badge variant="outline">{contract.coverage}</Badge>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="flex gap-2">
                                                    <Link to={`/employee/contracts/${contract.id}`}>
                                                        <Button variant="outline" size="sm" className="gap-2">
                                                            <Eye className="w-4 h-4" />
                                                            Details
                                                        </Button>
                                                    </Link>
                                                    <Button
                                                        variant="outline"
                                                        size="sm"
                                                        className="gap-2"
                                                        onClick={() => openAction("edit-contract", {
                                                            title: `Modifier ${contract.policyNumber}`,
                                                            description: "Ajuste les informations principales du contrat.",
                                                            values: {
                                                                id: contract.id,
                                                                coverage: contract.coverage,
                                                                amount: contract.amount,
                                                                deductible: contract.deductible,
                                                                status: contract.status
                                                            }
                                                        })}
                                                    >
                                                        <Edit className="w-4 h-4" />
                                                    </Button>
                                                </div>
                                            </div>
                                        </Card>
                                    );
                                })}
                                {contracts.length === 0 && (
                                    <Card className="p-6 border-border">
                                        <p className="text-gray-500 text-center">Aucun contrat trouve pour ce client.</p>
                                    </Card>
                                )}
                            </div>
                        </TabsContent>

                        {/* Incidents Tab */}
                        <TabsContent value="incidents" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Incidents du client</h2>
                                <Button
                                    className="gap-2"
                                    onClick={() => openAction("new-incident", {
                                        title: "Nouvel incident",
                                        description: "Cree un nouvel incident lie a ce client.",
                                        values: {
                                            title: "",
                                            type: "auto",
                                            date: format(new Date(), "yyyy-MM-dd"),
                                            amount: 0,
                                            assignee: "",
                                            description: ""
                                        }
                                    })}
                                >
                                    <Plus className="w-4 h-4" />
                                    Nouveau Incident
                                </Button>
                            </div>

                            <div className="grid gap-6">
                                {incidents.map((incident) => (
                                    <Card key={incident.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                                        <div className="flex items-start justify-between">
                                            <div className="flex items-start gap-4">
                                                <div className={`w-12 h-12 rounded-xl flex items-center justify-center ${incident.status === 'en_cours' ? 'bg-red-100' : 'bg-green-100'}`}>
                                                    <AlertTriangle className={`w-6 h-6 ${incident.status === 'en_cours' ? 'text-red-600' : 'text-green-600'}`} />
                                                </div>
                                                <div>
                                                    <div className="flex items-center gap-3 mb-2">
                                                        <h3 className="text-lg font-semibold">{incident.title}</h3>
                                                        <Badge className={getStatusColor(incident.status)}>
                                                            {getStatusLabel(incident.status)}
                                                        </Badge>
                                                    </div>
                                                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm text-gray-600">
                                                        <div>
                                                            <span className="text-gray-500">Reference: </span>
                                                            <span className="font-mono">{incident.reference}</span>
                                                        </div>
                                                        <div>
                                                            <span className="text-gray-500">Date: </span>
                                                            <span>{format(new Date(incident.date), 'dd/MM/yyyy')}</span>
                                                        </div>
                                                        <div>
                                                            <span className="text-gray-500">Type: </span>
                                                            <span className="capitalize">{incident.type}</span>
                                                        </div>
                                                        <div>
                                                            <span className="text-gray-500">Montant: </span>
                                                            <span className="font-bold text-primary">{incident.amount} EUR</span>
                                                        </div>
                                                    </div>
                                                    <p className="mt-3 text-sm text-gray-600">{incident.description}</p>
                                                    <div className="mt-2">
                                                        <span className="text-sm text-gray-500">Assigne a: </span>
                                                        <span className="text-sm font-medium">{incident.assignee}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="flex gap-2">
                                                <Link to={`/employee/incidents/${incident.id}`}>
                                                    <Button variant="outline" size="sm" className="gap-2">
                                                        <Eye className="w-4 h-4" />
                                                        Details
                                                    </Button>
                                                </Link>
                                                <Button
                                                    variant="outline"
                                                    size="sm"
                                                    className="gap-2"
                                                    onClick={() => openAction("edit-incident", {
                                                        title: `Modifier ${incident.reference}`,
                                                        description: "Met a jour le dossier incident courant.",
                                                        values: {
                                                            id: incident.id,
                                                            title: incident.title,
                                                            type: incident.type,
                                                            amount: incident.amount,
                                                            assignee: incident.assignee,
                                                            description: incident.description,
                                                            status: incident.status
                                                        }
                                                    })}
                                                >
                                                    <Edit className="w-4 h-4" />
                                                </Button>
                                            </div>
                                        </div>
                                    </Card>
                                ))}
                                {incidents.length === 0 && (
                                    <Card className="p-6 border-border">
                                        <p className="text-gray-500 text-center">Aucun incident trouve pour ce client.</p>
                                    </Card>
                                )}
                            </div>
                        </TabsContent>

                        {/* Feedbacks Tab */}
                        <TabsContent value="feedbacks" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Feedbacks du client</h2>
                                <Button
                                    variant="outline"
                                    className="gap-2"
                                    onClick={() => openAction("request-feedback", {
                                        title: "Demander un feedback",
                                        description: "Cree une trace visible d'une demande de feedback envoyee au client.",
                                        values: {
                                            subject: "Demande de feedback envoyee",
                                            message: `Bonjour ${client.firstName}, pouvez-vous partager votre avis sur votre experience recente ?`
                                        }
                                    })}
                                >
                                    <Send className="w-4 h-4" />
                                    Demander un feedback
                                </Button>
                            </div>

                            <div className="grid gap-6">
                                {feedbacks.map((fb) => (
                                    <Card key={fb.id} className="p-6 border-border">
                                        <div className="flex items-start gap-4">
                                            <div className="flex items-center gap-1">
                                                {[...Array(5)].map((_, i) => (
                                                    <Star key={i} className={`w-5 h-5 ${i < fb.rating ? 'text-yellow-400 fill-yellow-400' : 'text-gray-300'}`} />
                                                ))}
                                            </div>
                                            <div className="flex-1">
                                                <div className="flex items-center gap-3 mb-2">
                                                    <Badge variant="secondary">{fb.type}</Badge>
                                                    <span className="text-sm text-gray-500">{format(new Date(fb.date), 'dd/MM/yyyy')}</span>
                                                    <Badge variant={fb.isResponded ? "default" : "destructive"}>
                                                        {fb.isResponded ? "Repondu" : "Non lu"}
                                                    </Badge>
                                                </div>
                                                <p className="text-gray-700">{fb.message}</p>
                                                {!fb.isResponded && (
                                                    <Button variant="outline" size="sm" className="mt-3 gap-2">
                                                        <Send className="w-4 h-4" />
                                                        Repondre
                                                    </Button>
                                                )}
                                            </div>
                                        </div>
                                    </Card>
                                ))}
                                {feedbacks.length === 0 && (
                                    <Card className="p-6 border-border">
                                        <p className="text-gray-500 text-center">Aucun feedback trouve pour ce client.</p>
                                    </Card>
                                )}
                            </div>
                        </TabsContent>

                        {/* Notes Tab */}
                        <TabsContent value="notes" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Notes et informations</h2>
                                <Button
                                    className="gap-2"
                                    onClick={() => openAction("add-note", {
                                        title: "Ajouter une note",
                                        description: "Ajoute une nouvelle note horodatee au dossier client.",
                                        values: { note: "" }
                                    })}
                                >
                                    <Plus className="w-4 h-4" />
                                    Ajouter une note
                                </Button>
                            </div>

                            <Card className="p-6 border-border">
                                <h3 className="font-semibold mb-3">Notes du conseiller</h3>
                                <p className="text-gray-600">{client.notes}</p>
                            </Card>

                            <Card className="p-6 border-border">
                                <h3 className="font-semibold mb-3">Informations complementaires</h3>
                                <div className="grid grid-cols-2 gap-4">
                                    <div>
                                        <span className="text-sm text-gray-500">Niveau de risque</span>
                                        <p className="font-medium capitalize">{client.riskLevel}</p>
                                    </div>
                                    <div>
                                        <span className="text-sm text-gray-500">Date d'inscription</span>
                                        <p className="font-medium">{format(new Date(client.joinDate), 'dd/MM/yyyy')}</p>
                                    </div>
                                    <div>
                                        <span className="text-sm text-gray-500">Anciennete</span>
                                        <p className="font-medium">
                                            {Math.floor((Date.now() - new Date(client.joinDate)) / (1000 * 60 * 60 * 24 * 30))} mois
                                        </p>
                                    </div>
                                    <div>
                                        <span className="text-sm text-gray-500">Statut</span>
                                        <p className="font-medium">{client.isActive ? "Client actif" : "Client inactif"}</p>
                                    </div>
                                </div>
                            </Card>
                        </TabsContent>
                    </Tabs>

                    <Dialog open={actionDialog.open} onOpenChange={(open) => !open && closeAction()}>
                        <DialogContent className="max-w-2xl max-h-[85vh] overflow-y-auto">
                            <DialogHeader>
                                <DialogTitle>{actionDialog.title}</DialogTitle>
                                <DialogDescription>{actionDialog.description}</DialogDescription>
                            </DialogHeader>
                            {renderActionForm()}
                            <DialogFooter>
                                <Button variant="outline" onClick={closeAction}>Annuler</Button>
                                <Button onClick={handleActionSubmit}>Enregistrer</Button>
                            </DialogFooter>
                        </DialogContent>
                    </Dialog>
                </div>
            </div>

            <EmployeeMessenger />
            <Footer />
        </div>
    );
}

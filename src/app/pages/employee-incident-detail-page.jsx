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
import {
    ArrowLeft, AlertTriangle, User, Calendar, DollarSign, MapPin, Phone, Mail,
    FileText, Edit, Trash2, Download, Eye, CheckCircle, Clock, MessageSquare,
    Camera, FileCheck, RefreshCw, Send, Plus, Users, Shield, Car, Home
} from "lucide-react";
import { motion } from "motion/react";
import { format } from "date-fns";
import { normalizeUserWithProfile } from "../auth";

const API_URL = import.meta.env.VITE_API_URL || "http://localhost:5000";

export function EmployeeIncidentDetailPage() {
    const { incidentId } = useParams();
    const navigate = useNavigate();

    const [incident, setIncident] = useState({
        id: "INC-001",
        reference: "INC-2024-001234",
        title: "Accident sur l'autoroute A6",
        description: "Collision frontale entre deux véhicules sur l'autoroute A6 direction Lyon. Dégâts matériels importants sur l'avant du véhicule. Pas de blessés graves à déplorer.",
        clientId: "CLT-001",
        clientName: "Jean Martin",
        clientEmail: "jean.martin@example.com",
        clientPhone: "+33 6 12 34 56 78",
        date: "2024-01-15",
        time: "14:30",
        location: "A6, km 125, 71100 Chalon-sur-Saône",
        type: "auto",
        severity: "moyen",
        status: "en_cours",
        assignedTo: "Sophie Dubois",
        estimatedCost: 2500,
        documents: 3,
        priority: "normal",
        vehicle: "Renault Clio 2022",
        policyNumber: "POL-AUTO-001",
        createdAt: "2024-01-15",
        updatedAt: "2024-01-16"
    });

    // Mock client data
    const [client, setClient] = useState({
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
        profileImage: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
        isNew: false,
        loyaltyScore: 85,
        riskLevel: "low"
    });

    // Mock timeline
    const [timeline] = useState([
        {
            id: 1,
            date: "2024-01-15",
            time: "14:30",
            action: "Incident déclaré",
            description: "Déclaration de sinistre par le client",
            user: "Jean Martin"
        },
        {
            id: 2,
            date: "2024-01-15",
            time: "15:45",
            action: "Dossier assigné",
            description: "Dossier assigné à Sophie Dubois",
            user: "Système"
        },
        {
            id: 3,
            date: "2024-01-16",
            time: "09:00",
            action: "Expertise programmée",
            description: "Expertise prévue le 20/01/2024",
            user: "Sophie Dubois"
        }
    ]);

    // Mock documents
    const [documents] = useState([
        {
            id: "DOC-001",
            name: "Constat amiable",
            type: "PDF",
            size: "2.5 MB",
            uploaded: "2024-01-15",
            uploadedBy: "Jean Martin"
        },
        {
            id: "DOC-002",
            name: "Photos du véhicule",
            type: "Images",
            size: "8.2 MB",
            uploaded: "2024-01-15",
            uploadedBy: "Jean Martin"
        },
        {
            id: "DOC-003",
            name: "Rapport de police",
            type: "PDF",
            size: "1.1 MB",
            uploaded: "2024-01-16",
            uploadedBy: "Sophie Dubois"
        }
    ]);

    // Mock messages
    const [messages] = useState([
        {
            id: 1,
            sender: "Jean Martin",
            content: "Bonjour, j'ai eu un accident sur l'autoroute A6. Que dois-je faire ?",
            date: "2024-01-15",
            time: "14:30",
            isMe: false,
            clientId: "CLT-001"
        },
        {
            id: 2,
            sender: "Sophie Dubois",
            content: "Bonjour Monsieur Martin, je suis désolée d'apprendre cet accident. Pouvez-vous remplir le constat amiable et nous l'envoyer ?",
            date: "2024-01-15",
            time: "14:45",
            isMe: true
        },
        {
            id: 3,
            sender: "Jean Martin",
            content: "Oui, je viens de le faire. Je vous l'envoie par email.",
            date: "2024-01-15",
            time: "15:00",
            isMe: false,
            clientId: "CLT-001"
        }
    ]);

    const getStatusColor = (status) => {
        switch (status) {
            case 'en_cours': return 'bg-blue-100 text-blue-800 border-blue-200';
            case 'traité': return 'bg-green-100 text-green-800 border-green-200';
            case 'en_attente': return 'bg-yellow-100 text-yellow-800 border-yellow-200';
            default: return 'bg-gray-100 text-gray-800 border-gray-200';
        }
    };

    const getStatusLabel = (status) => {
        switch (status) {
            case 'en_cours': return 'En cours';
            case 'traité': return 'Traité';
            case 'en_attente': return 'En attente';
            default: return status;
        }
    };

    const getSeverityColor = (severity) => {
        switch (severity) {
            case 'élevé': return 'text-red-600';
            case 'moyen': return 'text-yellow-600';
            case 'léger': return 'text-green-600';
            default: return 'text-gray-600';
        }
    };

    useEffect(() => {
        let mounted = true;

        async function loadIncidentDetail() {
            try {
                const token = window.localStorage.getItem("assurance-auth-token");
                if (!token || !incidentId) {
                    return;
                }

                const headers = { Authorization: `Bearer ${token}` };

                const incidentResp = await fetch(`${API_URL}/api/incidents/${incidentId}`, { headers });
                if (!incidentResp.ok) {
                    return;
                }

                const incidentBody = await incidentResp.json().catch(() => ({}));
                const incidentData = (incidentBody && incidentBody.data) || incidentBody || {};

                if (!mounted || !incidentData?.id) {
                    return;
                }

                setIncident((current) => ({
                    ...current,
                    id: incidentData.id,
                    reference: incidentData.reference || current.reference,
                    title: incidentData.title || current.title,
                    description: incidentData.description || current.description,
                    clientId: incidentData.client_id || current.clientId,
                    clientName: incidentData.client_name || current.clientName,
                    clientEmail: incidentData.client_email || current.clientEmail,
                    date: incidentData.date || current.date,
                    time: incidentData.time || current.time,
                    location: incidentData.location || current.location,
                    type: incidentData.type || current.type,
                    severity: incidentData.severity || current.severity,
                    status: incidentData.status || current.status,
                    assignedTo: incidentData.assigned_employee_name || current.assignedTo,
                    estimatedCost: incidentData.estimated_cost || current.estimatedCost,
                    policyNumber: incidentData.policy_number || current.policyNumber,
                    updatedAt: incidentData.updated_at || current.updatedAt,
                    createdAt: incidentData.created_at || current.createdAt,
                }));

                if (!incidentData.client_id) {
                    return;
                }

                const clientResp = await fetch(`${API_URL}/api/users/${incidentData.client_id}`, { headers });
                if (!clientResp.ok) {
                    return;
                }

                const clientBody = await clientResp.json().catch(() => ({}));
                const clientData = (clientBody && clientBody.data) || clientBody || {};
                const normalizedClient = normalizeUserWithProfile(clientData, {
                    profileImage: "/assets/client-placeholder.svg",
                });

                if (!mounted) {
                    return;
                }

                setClient((current) => ({
                    ...current,
                    ...normalizedClient,
                }));
            } catch (error) {
                console.error("Failed to load incident/client detail", error);
            }
        }

        loadIncidentDetail();
        return () => {
            mounted = false;
        };
    }, [incidentId]);

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

                    {/* Incident Header */}
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="mb-8"
                    >
                        <Card className="p-6 border-border">
                            <div className="flex items-start justify-between">
                                <div className="flex items-start gap-4">
                                    <div className="w-16 h-16 bg-red-100 rounded-xl flex items-center justify-center">
                                        <AlertTriangle className="w-8 h-8 text-red-600" />
                                    </div>
                                    <div>
                                        <div className="flex items-center gap-3 mb-2">
                                            <h1 className="text-2xl font-bold text-gray-900">{incident.title}</h1>
                                            <Badge className={getStatusColor(incident.status)}>
                                                {getStatusLabel(incident.status)}
                                            </Badge>
                                            <Badge variant="outline">{incident.type}</Badge>
                                        </div>
                                        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm text-gray-600">
                                            <div>
                                                <span className="text-gray-500">Référence: </span>
                                                <span className="font-mono">{incident.reference}</span>
                                            </div>
                                            <div>
                                                <span className="text-gray-500">Date: </span>
                                                <span>{format(new Date(incident.date), 'dd/MM/yyyy')} à {incident.time}</span>
                                            </div>
                                            <div>
                                                <span className="text-gray-500">Sévérité: </span>
                                                <span className={`font-medium ${getSeverityColor(incident.severity)}`}>
                                                    {incident.severity}
                                                </span>
                                            </div>
                                            <div>
                                                <span className="text-gray-500">Coût estimé: </span>
                                                <span className="font-bold text-primary">{incident.estimatedCost}€</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div className="flex flex-col items-end gap-3">
                                    <div className="text-right">
                                        <p className="text-sm text-gray-600">Assigné à</p>
                                        <p className="font-semibold">{incident.assignedTo}</p>
                                    </div>
                                    <div className="flex gap-2">
                                        <Button variant="outline" size="sm" className="gap-2">
                                            <Edit className="w-4 h-4" />
                                            Modifier
                                        </Button>
                                        <Button variant="outline" size="sm" className="gap-2">
                                            <Download className="w-4 h-4" />
                                            Exporter
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
                                    <p className="text-sm text-gray-600 mb-1">Client</p>
                                    <p className="text-lg font-bold">{incident.clientName}</p>
                                    <Link to={`/employee/clients/${incident.clientId}`}>
                                        <Button variant="link" size="sm" className="p-0 h-auto">
                                            Voir le profil
                                        </Button>
                                    </Link>
                                </div>
                                <div className="bg-blue-100 rounded-xl p-3">
                                    <User className="w-8 h-8 text-blue-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Contrat</p>
                                    <p className="text-lg font-bold">{incident.policyNumber}</p>
                                    <p className="text-sm text-gray-500">{incident.vehicle}</p>
                                </div>
                                <div className="bg-green-100 rounded-xl p-3">
                                    <FileText className="w-8 h-8 text-green-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Documents</p>
                                    <p className="text-lg font-bold">{incident.documents}</p>
                                    <p className="text-sm text-gray-500">pièces jointes</p>
                                </div>
                                <div className="bg-purple-100 rounded-xl p-3">
                                    <FileCheck className="w-8 h-8 text-purple-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Dernière mise à jour</p>
                                    <p className="text-lg font-bold">{format(new Date(incident.updatedAt), 'dd/MM')}</p>
                                    <p className="text-sm text-gray-500">Il y a {Math.floor((Date.now() - new Date(incident.updatedAt)) / (1000 * 60 * 60 * 24))} jours</p>
                                </div>
                                <div className="bg-yellow-100 rounded-xl p-3">
                                    <Clock className="w-8 h-8 text-yellow-600" />
                                </div>
                            </div>
                        </Card>
                    </motion.div>

                    {/* Main Content Tabs */}
                    <Tabs defaultValue="overview" className="space-y-6">
                        <TabsList className="grid grid-cols-5 lg:w-auto">
                            <TabsTrigger value="overview">Aperçu</TabsTrigger>
                            <TabsTrigger value="client">Client</TabsTrigger>
                            <TabsTrigger value="timeline">Chronologie</TabsTrigger>
                            <TabsTrigger value="documents">Documents</TabsTrigger>
                            <TabsTrigger value="messages">Messages</TabsTrigger>
                        </TabsList>

                        {/* Overview Tab */}
                        <TabsContent value="overview" className="space-y-6">
                            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                                <Card className="p-6 border-border">
                                    <h3 className="text-lg font-semibold mb-4">Détails de l'incident</h3>
                                    <p className="text-gray-600 mb-4">{incident.description}</p>
                                    <div className="space-y-3">
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Lieu</span>
                                            <span className="font-medium">{incident.location}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Type</span>
                                            <span className="font-medium capitalize">{incident.type}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Sévérité</span>
                                            <span className={`font-medium ${getSeverityColor(incident.severity)}`}>
                                                {incident.severity}
                                            </span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Priorité</span>
                                            <span className="font-medium capitalize">{incident.priority}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Statut</span>
                                            <Badge className={getStatusColor(incident.status)}>
                                                {getStatusLabel(incident.status)}
                                            </Badge>
                                        </div>
                                    </div>
                                </Card>

                                <Card className="p-6 border-border">
                                    <h3 className="text-lg font-semibold mb-4">Informations véhicule</h3>
                                    <div className="space-y-3">
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Véhicule</span>
                                            <span className="font-medium">{incident.vehicle}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Police d'assurance</span>
                                            <span className="font-mono">{incident.policyNumber}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Coût estimé</span>
                                            <span className="font-bold text-primary">{incident.estimatedCost}€</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Date de déclaration</span>
                                            <span className="font-medium">{format(new Date(incident.createdAt), 'dd/MM/yyyy')}</span>
                                        </div>
                                    </div>
                                </Card>
                            </div>

                            <div className="flex gap-3">
                                <Button className="gap-2">
                                    <CheckCircle className="w-4 h-4" />
                                    Marquer comme traité
                                </Button>
                                <Button variant="outline" className="gap-2">
                                    <MessageSquare className="w-4 h-4" />
                                    Contacter le client
                                </Button>
                                <Button variant="outline" className="gap-2">
                                    <RefreshCw className="w-4 h-4" />
                                    Programmer expertise
                                </Button>
                            </div>
                        </TabsContent>

                        {/* Client Tab */}
                        <TabsContent value="client" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Informations client</h2>
                                <Link to={`/employee/clients/${client.id}`}>
                                    <Button variant="outline" className="gap-2">
                                        <Eye className="w-4 h-4" />
                                        Voir le client
                                    </Button>
                                </Link>
                            </div>

                            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                                <Card className="p-6 border-border">
                                    <div className="flex items-center gap-4">
                                        <Link to={`/employee/clients/${client.id}`} className="flex items-center gap-4">
                                            <Avatar className="w-16 h-16">
                                                <AvatarImage src={client.profileImage} alt={client.firstName} />
                                                <AvatarFallback className="bg-primary/10 text-primary text-xl">
                                                    {client.firstName[0]}{client.lastName[0]}
                                                </AvatarFallback>
                                            </Avatar>
                                            <div>
                                                <h3 className="text-lg font-semibold hover:underline">{client.firstName} {client.lastName}</h3>
                                                <p className="text-sm text-gray-600">{client.email}</p>
                                                <p className="text-sm text-gray-600">{client.phone}</p>
                                            </div>
                                        </Link>
                                    </div>
                                </Card>

                                <Card className="p-6 border-border">
                                    <h4 className="font-semibold mb-3">Coordonnées</h4>
                                    <div className="space-y-2 text-sm text-gray-600">
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
                                    </div>
                                </Card>

                                <Card className="p-6 border-border">
                                    <h4 className="font-semibold mb-3">Statistiques client</h4>
                                    <div className="space-y-2 text-sm text-gray-600">
                                        <div className="flex justify-between">
                                            <span>Total contrats</span>
                                            <span>{client.totalContracts}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span>Montant total</span>
                                            <span>{client.totalSpent}€</span>
                                        </div>
                                        <div className="flex justify-between items-center">
                                            <span>Score de crédit</span>
                                            <div className="flex items-center gap-2">
                                                <ScoreBadge score={client.creditScore ?? client.loyaltyScore} />
                                            </div>
                                        </div>
                                    </div>
                                </Card>
                            </div>
                        </TabsContent>

                        {/* Timeline Tab */}
                        <TabsContent value="timeline" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Chronologie de l'incident</h2>
                                <Button className="gap-2">
                                    <Plus className="w-4 h-4" />
                                    Ajouter une note
                                </Button>
                            </div>

                            <div className="relative">
                                <div className="absolute left-8 top-0 bottom-0 w-0.5 bg-gray-200"></div>
                                <div className="space-y-6">
                                    {timeline.map((event) => (
                                        <div key={event.id} className="relative flex items-start gap-4 pl-20">
                                            <div className="absolute left-4 w-8 h-8 bg-primary rounded-full flex items-center justify-center">
                                                <CheckCircle className="w-4 h-4 text-white" />
                                            </div>
                                            <Card className="flex-1 p-4 border-border">
                                                <div className="flex items-center justify-between mb-2">
                                                    <h4 className="font-semibold">{event.action}</h4>
                                                    <span className="text-sm text-gray-500">
                                                        {format(new Date(event.date), 'dd/MM/yyyy')} à {event.time}
                                                    </span>
                                                </div>
                                                <p className="text-sm text-gray-600">{event.description}</p>
                                                <p className="text-xs text-gray-500 mt-2">Par: {event.user}</p>
                                            </Card>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        </TabsContent>

                        {/* Documents Tab */}
                        <TabsContent value="documents" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Documents de l'incident</h2>
                                <Button className="gap-2">
                                    <Plus className="w-4 h-4" />
                                    Ajouter un document
                                </Button>
                            </div>

                            <div className="grid gap-6">
                                {documents.map((doc) => (
                                    <Card key={doc.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                                        <div className="flex items-center justify-between">
                                            <div className="flex items-center gap-4">
                                                <div className="w-12 h-12 bg-primary/10 rounded-xl flex items-center justify-center">
                                                    <FileText className="w-6 h-6 text-primary" />
                                                </div>
                                                <div>
                                                    <h3 className="text-lg font-semibold">{doc.name}</h3>
                                                    <div className="flex items-center gap-4 text-sm text-gray-600">
                                                        <span>{doc.type}</span>
                                                        <span>{doc.size}</span>
                                                        <span>Téléversé le {format(new Date(doc.uploaded), 'dd/MM/yyyy')}</span>
                                                        <span>Par: {doc.uploadedBy}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="flex gap-2">
                                                <Button variant="outline" size="sm" className="gap-2">
                                                    <Download className="w-4 h-4" />
                                                    Télécharger
                                                </Button>
                                                <Button variant="outline" size="sm" className="gap-2">
                                                    <Eye className="w-4 h-4" />
                                                    Voir
                                                </Button>
                                            </div>
                                        </div>
                                    </Card>
                                ))}
                            </div>
                        </TabsContent>

                        {/* Messages Tab */}
                        <TabsContent value="messages" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Messages échangés</h2>
                                <Button variant="outline" className="gap-2">
                                    <Send className="w-4 h-4" />
                                    Envoyer un message
                                </Button>
                            </div>

                            <div className="space-y-4">
                                {messages.map((msg) => (
                                    <Card key={msg.id} className={`p-4 border-border ${msg.isMe ? 'ml-12 bg-primary/5' : 'mr-12'}`}>
                                        <div className="flex items-start justify-between mb-2">
                                            <div className="flex items-center gap-2">
                                                {msg.clientId ? (
                                                    <Link to={`/employee/clients/${msg.clientId}`} className="flex items-center gap-2">
                                                        <Avatar className="w-8 h-8">
                                                            <AvatarImage src={client.profileImage} alt={msg.sender} />
                                                            <AvatarFallback className="bg-primary/10 text-primary text-xs">
                                                                {msg.sender[0]}
                                                            </AvatarFallback>
                                                        </Avatar>
                                                        <span className="font-semibold text-sm">{msg.sender}</span>
                                                    </Link>
                                                ) : (
                                                    <>
                                                        <Avatar className="w-8 h-8">
                                                            <AvatarFallback className="bg-primary/10 text-primary text-xs">
                                                                {msg.sender[0]}
                                                            </AvatarFallback>
                                                        </Avatar>
                                                        <span className="font-semibold text-sm">{msg.sender}</span>
                                                    </>
                                                )}
                                            </div>
                                            <span className="text-xs text-gray-500">
                                                {format(new Date(msg.date), 'dd/MM')} à {msg.time}
                                            </span>
                                        </div>
                                        <p className="text-gray-700">{msg.content}</p>
                                    </Card>
                                ))}
                            </div>
                        </TabsContent>
                    </Tabs>
                </div>
            </div>

            <EmployeeMessenger />
            <Footer />
        </div>
    );
}

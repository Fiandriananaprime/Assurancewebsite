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
    ArrowLeft, FileText, User, Calendar, DollarSign, Shield, Car, Home, Heart,
    Edit, Trash2, Download, Eye, CheckCircle, Clock, AlertTriangle, Users,
    MessageSquare, TrendingUp, TrendingDown, Plus, FileCheck, FileClock
} from "lucide-react";
import { motion } from "motion/react";
import { format } from "date-fns";
import { normalizeUserWithProfile } from "../auth";

const API_URL = import.meta.env.VITE_API_URL || "http://localhost:5000";

export function EmployeeContractDetailPage() {
    const { contractId } = useParams();
    const navigate = useNavigate();

    const [contract, setContract] = useState({
        id: "CNT-001",
        clientId: "CLT-001",
        clientName: "Jean Martin",
        clientEmail: "jean.martin@example.com",
        clientPhone: "+33 6 12 34 56 78",
        type: "auto",
        startDate: "2024-01-15",
        endDate: "2025-01-15",
        amount: 350,
        status: "actif",
        coverage: "Tous risques",
        vehicle: "Renault Clio 2022",
        policyNumber: "POL-AUTO-001",
        deductible: 200,
        paymentFrequency: "mensuel",
        paymentMethod: "prélèvement automatique",
        documents: 3,
        lastPayment: "2024-01-15",
        nextPayment: "2024-02-15",
        totalPaid: 350,
        remainingPayments: 11,
        isActive: true,
        riskLevel: "low",
        notes: "Contrat sans sinistre depuis 2020. Bon conducteur."
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

    // Mock incidents related to this contract
    const [incidents] = useState([
        {
            id: "INC-001",
            title: "Accident sur l'autoroute A6",
            date: "2024-01-15",
            status: "en_cours",
            type: "auto",
            description: "Accident avec dommages matériels mineurs. Véhicule touché à l'arrière.",
            amount: 1200,
            assignee: "Sophie Dubois",
            reference: "INC-2024-001234"
        }
    ]);

    // Mock payment history
    const [payments] = useState([
        {
            id: "PAY-001",
            date: "2024-01-15",
            amount: 350,
            method: "Prélèvement automatique",
            status: "payé",
            reference: "PAY-2024-001"
        },
        {
            id: "PAY-002",
            date: "2024-02-15",
            amount: 350,
            method: "Prélèvement automatique",
            status: "programmé",
            reference: "PAY-2024-002"
        }
    ]);

    // Mock documents
    const [documents] = useState([
        {
            id: "DOC-001",
            name: "Conditions générales",
            type: "PDF",
            size: "2.5 MB",
            uploaded: "2024-01-15",
            status: "signé"
        },
        {
            id: "DOC-002",
            name: "Attestation d'assurance",
            type: "PDF",
            size: "500 KB",
            uploaded: "2024-01-15",
            status: "actif"
        },
        {
            id: "DOC-003",
            name: "Devis initial",
            type: "PDF",
            size: "1.2 MB",
            uploaded: "2024-01-10",
            status: "archivé"
        }
    ]);

    const getTypeIcon = (type) => {
        switch (type) {
            case 'auto': return Car;
            case 'habitation': return Home;
            case 'santé': return Heart;
            default: return FileText;
        }
    };

    const getStatusColor = (status) => {
        switch (status) {
            case 'actif': return 'bg-green-100 text-green-800 border-green-200';
            case 'en_cours': return 'bg-blue-100 text-blue-800 border-blue-200';
            case 'expiré': return 'bg-red-100 text-red-800 border-red-200';
            case 'traité': return 'bg-green-100 text-green-800 border-green-200';
            case 'payé': return 'bg-green-100 text-green-800 border-green-200';
            case 'programmé': return 'bg-blue-100 text-blue-800 border-blue-200';
            default: return 'bg-gray-100 text-gray-800 border-gray-200';
        }
    };

    const getStatusLabel = (status) => {
        switch (status) {
            case 'actif': return 'Actif';
            case 'en_cours': return 'En cours';
            case 'expiré': return 'Expiré';
            case 'traité': return 'Traité';
            case 'payé': return 'Payé';
            case 'programmé': return 'Programmé';
            default: return status;
        }
    };

    useEffect(() => {
        let mounted = true;

        async function loadContractDetail() {
            try {
                const token = window.localStorage.getItem("assurance-auth-token");
                if (!token || !contractId) {
                    return;
                }

                const headers = { Authorization: `Bearer ${token}` };

                const contractResp = await fetch(`${API_URL}/api/contracts/${contractId}`, { headers });
                if (!contractResp.ok) {
                    return;
                }

                const contractBody = await contractResp.json().catch(() => ({}));
                const contractData = (contractBody && contractBody.data) || contractBody || {};

                if (!mounted || !contractData?.id) {
                    return;
                }

                setContract((current) => ({
                    ...current,
                    id: contractData.id,
                    clientId: contractData.client_id || current.clientId,
                    clientName: contractData.client_name || current.clientName,
                    clientEmail: contractData.client_email || current.clientEmail,
                    type: contractData.type || current.type,
                    startDate: contractData.start_date || current.startDate,
                    endDate: contractData.end_date || current.endDate,
                    amount: contractData.annual_amount || contractData.amount || current.amount,
                    status: contractData.status || current.status,
                    coverage: contractData.coverage || current.coverage,
                    vehicle: (contractData.vehicle_details && (typeof contractData.vehicle_details === 'string' ? contractData.vehicle_details : `${contractData.vehicle_details.brand || ''} ${contractData.vehicle_details.model || ''} ${contractData.vehicle_details.year || ''}`.trim())) || (contractData.vehicle_info && (typeof contractData.vehicle_info === 'string' ? contractData.vehicle_info : `${contractData.vehicle_info.brand || ''} ${contractData.vehicle_info.model || ''} ${contractData.vehicle_info.year || ''}`.trim())) || current.vehicle,
                    property: contractData.property_details || contractData.property_info || current.property,
                    policyNumber: contractData.policy_number || current.policyNumber,
                    deductible: contractData.deductible || current.deductible,
                    paymentFrequency: contractData.payment_method || current.paymentFrequency,
                }));

                if (!contractData.client_id) {
                    return;
                }

                const clientResp = await fetch(`${API_URL}/api/users/${contractData.client_id}`, { headers });
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
                    totalContracts: current.totalContracts,
                    activeContracts: current.activeContracts,
                    totalSpent: current.totalSpent,
                    loyaltyScore: current.loyaltyScore,
                    riskLevel: normalizedClient.riskLevel || current.riskLevel,
                }));
            } catch (error) {
                console.error("Failed to load contract/client detail", error);
            }
        }

        loadContractDetail();
        return () => {
            mounted = false;
        };
    }, [contractId]);

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

                    {/* Contract Header */}
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="mb-8"
                    >
                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div className="flex items-center gap-4">
                                    <div className="w-16 h-16 bg-primary/10 rounded-xl flex items-center justify-center">
                                        <Car className="w-8 h-8 text-primary" />
                                    </div>
                                    <div>
                                        <div className="flex items-center gap-3 mb-2">
                                            <h1 className="text-2xl font-bold text-gray-900">
                                                {contract.type === 'auto' ? contract.vehicle : contract.property || 'Contrat ' + contract.type}
                                            </h1>
                                            <Badge className={getStatusColor(contract.status)}>
                                                {getStatusLabel(contract.status)}
                                            </Badge>
                                        </div>
                                        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm text-gray-600">
                                            <div>
                                                <span className="text-gray-500">Référence: </span>
                                                <span className="font-mono">{contract.policyNumber}</span>
                                            </div>
                                            <div>
                                                <span className="text-gray-500">Type: </span>
                                                <span className="capitalize">{contract.type}</span>
                                            </div>
                                            <div>
                                                <span className="text-gray-500">Période: </span>
                                                <span>{format(new Date(contract.startDate), 'dd/MM/yyyy')} - {format(new Date(contract.endDate), 'dd/MM/yyyy')}</span>
                                            </div>
                                            <div>
                                                <span className="text-gray-500">Montant: </span>
                                                <span className="font-bold text-primary">{contract.amount}€/an</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div className="flex flex-col items-end gap-3">
                                    <div className="text-right">
                                        <p className="text-sm text-gray-600">Client</p>
                                        <p className="font-semibold">{client.firstName} {client.lastName}</p>
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
                                    <p className="text-sm text-gray-600 mb-1">Prochain paiement</p>
                                    <p className="text-lg font-bold">{format(new Date(contract.nextPayment), 'dd/MM')}</p>
                                    <p className="text-sm text-green-600">Dans {Math.ceil((new Date(contract.nextPayment) - new Date()) / (1000 * 60 * 60 * 24))} jours</p>
                                </div>
                                <div className="bg-blue-100 rounded-xl p-3">
                                    <Calendar className="w-8 h-8 text-blue-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Total payé</p>
                                    <p className="text-lg font-bold text-primary">{contract.totalPaid}€</p>
                                    <p className="text-sm text-gray-500">sur {contract.amount}€</p>
                                </div>
                                <div className="bg-green-100 rounded-xl p-3">
                                    <DollarSign className="w-8 h-8 text-green-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Paiements restants</p>
                                    <p className="text-lg font-bold">{contract.remainingPayments}</p>
                                    <p className="text-sm text-gray-500">mensuels</p>
                                </div>
                                <div className="bg-purple-100 rounded-xl p-3">
                                    <Clock className="w-8 h-8 text-purple-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Franchise</p>
                                    <p className="text-lg font-bold">{contract.deductible}€</p>
                                    <p className="text-sm text-gray-500">en cas de sinistre</p>
                                </div>
                                <div className="bg-yellow-100 rounded-xl p-3">
                                    <Shield className="w-8 h-8 text-yellow-600" />
                                </div>
                            </div>
                        </Card>
                    </motion.div>

                    {/* Main Content Tabs */}
                    <Tabs defaultValue="overview" className="space-y-6">
                        <TabsList className="grid grid-cols-5 lg:w-auto">
                            <TabsTrigger value="overview">Aperçu</TabsTrigger>
                            <TabsTrigger value="client">Client</TabsTrigger>
                            <TabsTrigger value="payments">Paiements</TabsTrigger>
                            <TabsTrigger value="incidents">Incidents</TabsTrigger>
                            <TabsTrigger value="documents">Documents</TabsTrigger>
                        </TabsList>

                        {/* Overview Tab */}
                        <TabsContent value="overview" className="space-y-6">
                            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                                <Card className="p-6 border-border">
                                    <h3 className="text-lg font-semibold mb-4">Informations du contrat</h3>
                                    <div className="space-y-3">
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Type de couverture</span>
                                            <span className="font-medium">{contract.coverage}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Fréquence de paiement</span>
                                            <span className="font-medium capitalize">{contract.paymentFrequency}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Moyen de paiement</span>
                                            <span className="font-medium capitalize">{contract.paymentMethod}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Niveau de risque</span>
                                            <span className="font-medium capitalize">{contract.riskLevel}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Documents</span>
                                            <span className="font-medium">{contract.documents}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Dernier paiement</span>
                                            <span className="font-medium">{format(new Date(contract.lastPayment), 'dd/MM/yyyy')}</span>
                                        </div>
                                    </div>
                                </Card>

                                <Card className="p-6 border-border">
                                    <h3 className="text-lg font-semibold mb-4">Détails du véhicule</h3>
                                    <div className="space-y-3">
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Marque/Modèle</span>
                                            <span className="font-medium">{contract.vehicle}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Immatriculation</span>
                                            <span className="font-medium">AB-123-CD</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Année</span>
                                            <span className="font-medium">2022</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Puissance</span>
                                            <span className="font-medium">110 CV</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-gray-600">Bonus/Malus</span>
                                            <span className="font-medium">Bonus 0.5</span>
                                        </div>
                                    </div>
                                </Card>
                            </div>

                            <Card className="p-6 border-border">
                                <h3 className="text-lg font-semibold mb-4">Notes et observations</h3>
                                <p className="text-gray-600">{contract.notes}</p>
                            </Card>
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
                                    <h4 className="font-semibold mb-3">Informations personnelles</h4>
                                    <div className="space-y-2 text-sm text-gray-600">
                                        <div className="flex justify-between">
                                            <span>Date de naissance</span>
                                            <span>{format(new Date(client.birthDate), 'dd/MM/yyyy')}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span>Adresse</span>
                                            <span>{client.address}</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span>Date d'inscription</span>
                                            <span>{format(new Date(client.joinDate), 'dd/MM/yyyy')}</span>
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
                                            <span>Contrats actifs</span>
                                            <span>{client.activeContracts}</span>
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

                        {/* Payments Tab */}
                        <TabsContent value="payments" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Historique des paiements</h2>
                                <Button className="gap-2">
                                    <Plus className="w-4 h-4" />
                                    Nouveau paiement
                                </Button>
                            </div>

                            <div className="grid gap-6">
                                {payments.map((payment) => (
                                    <Card key={payment.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                                        <div className="flex items-center justify-between">
                                            <div className="flex items-center gap-4">
                                                <div className={`w-12 h-12 rounded-xl flex items-center justify-center ${payment.status === 'payé' ? 'bg-green-100' : 'bg-blue-100'}`}>
                                                    <FileCheck className={`w-6 h-6 ${payment.status === 'payé' ? 'text-green-600' : 'text-blue-600'}`} />
                                                </div>
                                                <div>
                                                    <div className="flex items-center gap-3 mb-2">
                                                        <h3 className="text-lg font-semibold">Paiement {payment.reference}</h3>
                                                        <Badge className={getStatusColor(payment.status)}>
                                                            {getStatusLabel(payment.status)}
                                                        </Badge>
                                                    </div>
                                                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm text-gray-600">
                                                        <div>
                                                            <span className="text-gray-500">Date: </span>
                                                            <span>{format(new Date(payment.date), 'dd/MM/yyyy')}</span>
                                                        </div>
                                                        <div>
                                                            <span className="text-gray-500">Montant: </span>
                                                            <span className="font-bold text-primary">{payment.amount}€</span>
                                                        </div>
                                                        <div>
                                                            <span className="text-gray-500">Moyen: </span>
                                                            <span className="capitalize">{payment.method}</span>
                                                        </div>
                                                        <div>
                                                            <span className="text-gray-500">Référence: </span>
                                                            <span className="font-mono">{payment.reference}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="flex gap-2">
                                                <Button variant="outline" size="sm" className="gap-2">
                                                    <Download className="w-4 h-4" />
                                                    Reçu
                                                </Button>
                                                <Button variant="outline" size="sm" className="gap-2">
                                                    <Edit className="w-4 h-4" />
                                                    Modifier
                                                </Button>
                                            </div>
                                        </div>
                                    </Card>
                                ))}
                            </div>
                        </TabsContent>

                        {/* Incidents Tab */}
                        <TabsContent value="incidents" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Incidents liés à ce contrat</h2>
                                <Button className="gap-2">
                                    <Plus className="w-4 h-4" />
                                    Nouvel incident
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
                                                            <span className="text-gray-500">Référence: </span>
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
                                                            <span className="font-bold text-primary">{incident.amount}€</span>
                                                        </div>
                                                    </div>
                                                    <p className="mt-3 text-sm text-gray-600">{incident.description}</p>
                                                    <div className="mt-2">
                                                        <span className="text-sm text-gray-500">Assigné à: </span>
                                                        <span className="text-sm font-medium">{incident.assignee}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="flex gap-2">
                                                <Button variant="outline" size="sm" className="gap-2">
                                                    <Eye className="w-4 h-4" />
                                                    Détails
                                                </Button>
                                                <Button variant="outline" size="sm" className="gap-2">
                                                    <Edit className="w-4 h-4" />
                                                </Button>
                                            </div>
                                        </div>
                                    </Card>
                                ))}
                            </div>
                        </TabsContent>

                        {/* Documents Tab */}
                        <TabsContent value="documents" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-xl font-semibold">Documents du contrat</h2>
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
                                                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm text-gray-600">
                                                        <div>
                                                            <span className="text-gray-500">Type: </span>
                                                            <span>{doc.type}</span>
                                                        </div>
                                                        <div>
                                                            <span className="text-gray-500">Taille: </span>
                                                            <span>{doc.size}</span>
                                                        </div>
                                                        <div>
                                                            <span className="text-gray-500">Téléversé: </span>
                                                            <span>{format(new Date(doc.uploaded), 'dd/MM/yyyy')}</span>
                                                        </div>
                                                        <div>
                                                            <span className="text-gray-500">Statut: </span>
                                                            <Badge variant={doc.status === 'signé' ? 'default' : doc.status === 'actif' ? 'secondary' : 'outline'}>
                                                                {doc.status}
                                                            </Badge>
                                                        </div>
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
                    </Tabs>
                </div>
            </div>

            <EmployeeMessenger />
            <Footer />
        </div>
    );
}

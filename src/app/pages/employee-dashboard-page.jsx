import { useState } from "react";
import { Link } from "react-router";
import { EmployeeHeader } from "../components/employee-header";
import { Footer } from "../components/footer";
import { EmployeeMessenger } from "../components/employee-messenger";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Badge } from "../components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "../components/ui/tabs";
import {
    Shield, FileText, Users, Bell, Plus, Edit, Eye, UserPlus,
    FilePlus, MessageSquare, User, Download
} from "lucide-react";
import { motion } from "motion/react";
import { useFeedbacks } from "../hooks/useFeedbacks";
import { useEffect } from "react";

const API_URL = import.meta.env.VITE_API_URL || '';

export function EmployeeDashboardPage() {
    const [recentIncidents, setRecentIncidents] = useState([]);
    const [recentSignups, setRecentSignups] = useState([]);
    const [newContracts, setNewContracts] = useState([]);
    const [quickStats, setQuickStats] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const { feedbacks } = useFeedbacks({ limit: 2 });

    useEffect(() => {
        let mounted = true;
        async function load() {
            setLoading(true);
            setError(null);
            try {
                const token = localStorage.getItem('assurance-auth-token');
                const headers = { 'Content-Type': 'application/json' };
                if (token) headers['Authorization'] = `Bearer ${token}`;

                // Fetch recent incidents
                const incResp = await fetch(`${API_URL}/api/incidents?page=1&limit=5`, { headers });
                const incBody = await incResp.json().catch(() => ({}));
                const incItems = (incBody && incBody.data && (incBody.data.incidents || incBody.data)) || incBody.incidents || incBody || [];
                const totalIncidents = incBody.pagination?.total || incBody.total || (Array.isArray(incItems) ? incItems.length : 0);
                const resolvedIncidentsCount = (incBody.data?.incidents || incBody.data || []).filter(i => i.status === 'traite' || i.status === 'traité').length;

                // Fetch recent signups (users)
                const usersResp = await fetch(`${API_URL}/api/users?page=1&limit=5`, { headers });
                const usersBody = await usersResp.json().catch(() => ({}));
                const usersItems = (usersBody && usersBody.data && (usersBody.data.users || usersBody.data)) || usersBody.users || usersBody || [];
                const totalUsersCount = usersBody.pagination?.total || usersBody.total || (Array.isArray(usersItems) ? usersItems.length : 0);

                // Fetch new contracts (recent)
                const contractsResp = await fetch(`${API_URL}/api/contracts?page=1&limit=5`, { headers });
                const contractsBody = await contractsResp.json().catch(() => ({}));
                const contractsItems = (contractsBody && contractsBody.data && (contractsBody.data.contracts || contractsBody.data)) || contractsBody.contracts || contractsBody || [];
                const totalContractsCount = contractsBody.pagination?.total || contractsBody.total || (Array.isArray(contractsItems) ? contractsItems.length : 0);

                // Merge simulated contracts (local) into the recent contracts list
                try {
                    const rawSim = localStorage.getItem('assurance-simulated-contracts');
                    const simList = rawSim ? JSON.parse(rawSim) : [];
                    if (Array.isArray(simList) && simList.length) {
                        // simulated entries are recent by default — prepend
                        const mappedSim = simList.map(s => ({
                            ...s,
                            client_id: s.client_id,
                            client_name: s.client_name || s.client || 'Client',
                            start_date: s.start_date,
                            annual_amount: s.annual_amount || s.amount || 0,
                            status: s.status || 'actif'
                        }));
                        // Only add simulated entries that aren't already present
                        const existingIds = new Set((contractsItems || []).map(c => String(c.id)));
                        const toAdd = mappedSim.filter(s => !existingIds.has(String(s.id)));
                        contractsItems.unshift(...toAdd);
                    }
                } catch (e) {
                    // ignore
                }

                // Fetch feedbacks to calculate positive ratio (4+ stars)
                let positiveFeedbackPercent = '—';
                try {
                    const fbResp = await fetch(`${API_URL}/api/feedbacks?limit=100`, { headers });
                    const fbBody = await fbResp.json().catch(() => ({}));
                    const allFbs = fbBody.data?.feedbacks || fbBody.data || fbBody.feedbacks || (Array.isArray(fbBody) ? fbBody : []);
                    if (Array.isArray(allFbs) && allFbs.length > 0) {
                        const positiveCount = allFbs.filter(f => (Number(f.rating) || 0) >= 4).length;
                        positiveFeedbackPercent = Math.round((positiveCount / allFbs.length) * 100) + '%';
                    }
                } catch (e) {
                    console.warn('Failed to calculate feedback stats', e);
                }

                // Fetch some stats (try aggregated endpoints)
                let statsItems = [];
                try {
                    const statsResp = await fetch(`${API_URL}/api/contracts/stats/overview`, { headers });
                    const statsBody = await statsResp.json().catch(() => ({}));
                    const stats = (statsBody && statsBody.data) || statsBody || {};

                    // basic mapping
                    statsItems = [
                        { label: 'Nouveaux clients', value: stats.new_clients_count ?? totalUsersCount, change: stats.new_clients_change ?? '' , icon: UserPlus, color: 'text-green-600', bg: 'bg-green-100' },
                        { label: 'Sinistres traites', value: stats.incidents_resolved_count ?? resolvedIncidentsCount, change: '', icon: Shield, color: 'text-blue-600', bg: 'bg-blue-100' },
                        { label: 'Nouveaux contrats', value: stats.new_contracts_count ?? totalContractsCount, change: '', icon: FilePlus, color: 'text-purple-600', bg: 'bg-purple-100' },
                        { label: 'Feedback positif', value: stats.positive_feedback_percent ? stats.positive_feedback_percent + '%' : positiveFeedbackPercent, change: '', icon: MessageSquare, color: 'text-yellow-600', bg: 'bg-yellow-100' }
                    ];
                } catch (_) {
                    // fallback to defaults
                    statsItems = [
                        { label: "Nouveaux clients", value: totalUsersCount, change: "", icon: UserPlus, color: "text-green-600", bg: "bg-green-100" },
                        { label: "Sinistres traites", value: resolvedIncidentsCount || "—", change: "", icon: Shield, color: "text-blue-600", bg: "bg-blue-100" },
                        { label: "Nouveaux contrats", value: totalContractsCount, change: "", icon: FilePlus, color: "text-purple-600", bg: "bg-purple-100" },
                        { label: "Feedback positif", value: positiveFeedbackPercent, change: "", icon: MessageSquare, color: "text-yellow-600", bg: "bg-yellow-100" }
                    ];
                }

                if (!mounted) return;
                setRecentIncidents(Array.isArray(incItems) ? incItems.map((incident) => ({
                    ...incident,
                    clientId: incident.client_id,
                    client: incident.client_name || incident.client || "Client",
                    date: incident.date,
                    type: incident.type,
                    status: incident.status
                })) : []);
                setRecentSignups(Array.isArray(usersItems) ? usersItems.map((user) => ({
                    ...user,
                    name: user.name || `${user.first_name || ""} ${user.last_name || ""}`.trim() || user.email,
                    type: user.role,
                    date: user.created_at ? new Date(user.created_at).toLocaleDateString("fr-FR") : ""
                })) : []);
                setNewContracts(Array.isArray(contractsItems) ? contractsItems.map((contract) => ({
                    ...contract,
                    clientId: contract.client_id,
                    client: contract.client_name || contract.client || "Client",
                    type: contract.type,
                    date: contract.start_date,
                    amount: Number(contract.annual_amount || 0),
                    status: contract.status
                })) : []);
                setQuickStats(statsItems);
            } catch (err) {
                console.error('Employee dashboard load error', err);
                if (mounted) setError(String(err));
            } finally {
                if (mounted) setLoading(false);
            }
        }

        load();
        // listen for contract creations to refresh employee contracts/stats
        function onContractsRefresh() {
            // simply reload the page data
            load();
        }
        window.addEventListener('contracts:refresh', onContractsRefresh);
        return () => { mounted = false; window.removeEventListener('contracts:refresh', onContractsRefresh); };
    }, []);

    return (
        <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
            <EmployeeHeader />

            <div className="pt-24 pb-16">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="mb-8"
                    >
                        <div className="flex items-center justify-between">
                            <div>
                                <h1 className="text-3xl sm:text-4xl font-bold text-gray-900 mb-2">
                                    Tableau de bord Employe
                                </h1>
                                <p className="text-gray-600">
                                    Gere les operations, les clients et les contrats
                                </p>
                            </div>
                            <div className="hidden sm:flex gap-3">
                                <Link to="/employee/quotes/new">
                                    <Button className="bg-primary hover:bg-primary/90 gap-2">
                                        <Plus className="w-4 h-4" />
                                        Nouveau Devis
                                    </Button>
                                </Link>
                                <Link to="/employee/blogs/new">
                                    <Button variant="outline" className="gap-2">
                                        <Plus className="w-4 h-4" />
                                        Nouveau Blog
                                    </Button>
                                </Link>
                            </div>
                        </div>
                    </motion.div>

                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.1 }}
                        className="grid grid-cols-2 lg:grid-cols-4 gap-6 mb-8"
                    >
                        {quickStats.map((stat, index) => (
                            <Card key={index} className="p-6 border-border hover:shadow-lg transition-all">
                                <div className="flex items-center justify-between">
                                    <div>
                                        <p className="text-sm text-gray-600 mb-1">{stat.label}</p>
                                        <p className="text-2xl font-bold">{stat.value}</p>
                                        <p className="text-sm text-green-600 font-medium">{stat.change}</p>
                                    </div>
                                    <div className={`${stat.bg} rounded-xl p-3`}>
                                        <stat.icon className={`w-8 h-8 ${stat.color}`} />
                                    </div>
                                </div>
                            </Card>
                        ))}
                    </motion.div>

                    <Tabs defaultValue="overview" className="space-y-6">
                        <TabsList className="grid grid-cols-4 lg:w-auto">
                            <TabsTrigger value="overview">Vue d'ensemble</TabsTrigger>
                            <TabsTrigger value="incidents">Incidents</TabsTrigger>
                            <TabsTrigger value="signups">Inscriptions</TabsTrigger>
                            <TabsTrigger value="contracts">Contrats</TabsTrigger>
                        </TabsList>

                        <TabsContent value="overview" className="space-y-6">
                            <div className="grid lg:grid-cols-2 gap-6">
                                <Card className="p-6 border-border">
                                    <div className="flex items-center justify-between mb-4">
                                        <h3 className="text-lg font-semibold">Incidents recents</h3>
                                        <Link to="/employee/incidents">
                                            <Button variant="outline" size="sm">Voir tout</Button>
                                        </Link>
                                    </div>
                                    <div className="space-y-4">
                                        {recentIncidents.map((incident) => (
                                            <div key={incident.id} className="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
                                                <div className="flex items-center gap-3">
                                                    <div className={`w-3 h-3 rounded-full ${incident.status === "en_cours" ? "bg-red-500" : "bg-green-500"}`}></div>
                                                    <div>
                                                        <p className="font-medium">{incident.title}</p>
                                                        <p className="text-sm text-gray-600">
                                                            <Link to={`/employee/clients/${incident.clientId}`} className="hover:underline">
                                                                {incident.client}
                                                            </Link>
                                                            {" "}• {incident.type}
                                                        </p>
                                                    </div>
                                                </div>
                                                <Badge variant={incident.status === "en_cours" ? "destructive" : "default"}>
                                                    {incident.status === "en_cours" ? "En cours" : "Traite"}
                                                </Badge>
                                            </div>
                                        ))}
                                    </div>
                                </Card>

                                <Card className="p-6 border-border">
                                    <div className="flex items-center justify-between mb-4">
                                        <h3 className="text-lg font-semibold">Nouvelles inscriptions</h3>
                                        <Link to="/employee/signups">
                                            <Button variant="outline" size="sm">Voir tout</Button>
                                        </Link>
                                    </div>
                                    <div className="space-y-4">
                                        {recentSignups.map((signup) => (
                                            <div key={signup.id} className="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
                                                <div>
                                                    <p className="font-medium">{signup.name}</p>
                                                    <p className="text-sm text-gray-600">{signup.email}</p>
                                                </div>
                                                <Badge variant="secondary">{signup.type}</Badge>
                                            </div>
                                        ))}
                                    </div>
                                </Card>
                            </div>

                            <div className="grid lg:grid-cols-3 gap-6">
                                <Card className="p-6 border-border lg:col-span-2">
                                    <div className="flex items-center justify-between mb-4">
                                        <h3 className="text-lg font-semibold">Nouveaux contrats</h3>
                                        <Link to="/employee/new-contracts">
                                            <Button variant="outline" size="sm">Voir tout</Button>
                                        </Link>
                                    </div>
                                    <div className="space-y-4">
                                        {newContracts.map((contract) => (
                                            <div key={contract.id} className="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
                                                <div className="flex items-center gap-3">
                                                    <div className="w-10 h-10 bg-primary/10 rounded-full flex items-center justify-center">
                                                        <FileText className="w-5 h-5 text-primary" />
                                                    </div>
                                                    <div>
                                                        <Link to={`/employee/clients/${contract.clientId}`} className="font-medium hover:underline">
                                                            {contract.client}
                                                        </Link>
                                                        <p className="text-sm text-gray-600">{contract.type} • {contract.date}</p>
                                                    </div>
                                                </div>
                                                <div className="text-right">
                                                    <p className="font-bold text-lg">{contract.amount} EUR</p>
                                                    <Badge variant={contract.status === "actif" ? "default" : "secondary"}>
                                                        {contract.status === "actif" ? "Actif" : "En attente"}
                                                    </Badge>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                </Card>

                                <Card className="p-6 border-border">
                                    <div className="flex items-center justify-between mb-4">
                                        <h3 className="text-lg font-semibold">Feedback recent</h3>
                                        <Link to="/employee/feedback">
                                            <Button variant="outline" size="sm">Voir tout</Button>
                                        </Link>
                                    </div>
                                    <div className="space-y-4">
                                        {feedbacks.map((fb) => (
                                            <div key={fb.id} className="p-4 bg-gray-50 rounded-lg">
                                                <div className="flex items-center justify-between mb-2">
                                                    <p className="font-medium">{fb.name}</p>
                                                    <div className="flex gap-1">
                                                        {[...Array(5)].map((_, i) => (
                                                            <StarIcon key={i} className={`w-4 h-4 ${i < fb.rating ? "text-yellow-400" : "text-gray-300"}`} />
                                                        ))}
                                                    </div>
                                                </div>
                                                <p className="text-sm text-gray-600 line-clamp-2">{fb.message}</p>
                                                <p className="text-xs text-gray-500 mt-2">{fb.date}</p>
                                            </div>
                                        ))}
                                    </div>
                                </Card>
                            </div>
                        </TabsContent>

                        <TabsContent value="incidents" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-2xl font-semibold">Gestion des incidents</h2>
                                <Button variant="outline" className="gap-2">
                                    <Bell className="w-4 h-4" />
                                    Nouveau incident
                                </Button>
                            </div>

                            <div className="grid gap-4">
                                {recentIncidents.map((incident) => (
                                    <Card key={incident.id} className="p-6 border-border">
                                        <div className="flex items-center justify-between mb-4">
                                            <div className="flex items-center gap-4">
                                                <div className={`w-4 h-4 rounded-full ${incident.status === "en_cours" ? "bg-red-500" : "bg-green-500"}`}></div>
                                                <div>
                                                    <h3 className="font-semibold">{incident.title}</h3>
                                                    <p className="text-sm text-gray-600">
                                                        Client: <Link to={`/employee/clients/${incident.clientId}`} className="hover:underline">{incident.client}</Link>
                                                    </p>
                                                </div>
                                            </div>
                                            <div className="flex gap-2">
                                                <Link to={`/employee/incidents/${incident.id}`}>
                                                    <Button variant="outline" size="sm" className="gap-2">
                                                        <Eye className="w-4 h-4" />
                                                        Details
                                                    </Button>
                                                </Link>
                                                <Button variant="outline" size="sm" className="gap-2">
                                                    <Edit className="w-4 h-4" />
                                                    Modifier
                                                </Button>
                                            </div>
                                        </div>
                                        <div className="flex items-center justify-between text-sm text-gray-600">
                                            <span>Type: {incident.type}</span>
                                            <span>Date: {incident.date}</span>
                                            <Badge variant={incident.status === "en_cours" ? "destructive" : "default"}>
                                                {incident.status === "en_cours" ? "En cours" : "Traite"}
                                            </Badge>
                                        </div>
                                    </Card>
                                ))}
                            </div>
                        </TabsContent>

                        <TabsContent value="signups" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-2xl font-semibold">Nouvelles inscriptions</h2>
                                <Button variant="outline" className="gap-2">
                                    <Users className="w-4 h-4" />
                                    Exporter la liste
                                </Button>
                            </div>

                            <Card className="border-border">
                                <div className="overflow-x-auto">
                                    <table className="w-full">
                                        <thead className="bg-gray-50">
                                            <tr>
                                                <th className="text-left p-4 text-sm font-medium text-gray-900">Nom</th>
                                                <th className="text-left p-4 text-sm font-medium text-gray-900">Email</th>
                                                <th className="text-left p-4 text-sm font-medium text-gray-900">Type</th>
                                                <th className="text-left p-4 text-sm font-medium text-gray-900">Date</th>
                                                <th className="text-right p-4 text-sm font-medium text-gray-900">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody className="divide-y divide-gray-200">
                                            {recentSignups.map((signup) => (
                                                <tr key={signup.id} className="hover:bg-gray-50">
                                                    <td className="p-4">
                                                        <div className="flex items-center gap-3">
                                                            <div className="w-8 h-8 bg-primary/10 rounded-full flex items-center justify-center">
                                                                <User className="w-4 h-4 text-primary" />
                                                            </div>
                                                            <div>
                                                                <p className="font-medium">{signup.name}</p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td className="p-4 text-sm">{signup.email}</td>
                                                    <td className="p-4">
                                                        <Badge variant="secondary">{signup.type}</Badge>
                                                    </td>
                                                    <td className="p-4 text-sm">{signup.date}</td>
                                                    <td className="p-4 text-right">
                                                        <div className="flex justify-end gap-2">
                                                            <Button variant="outline" size="sm">Contact</Button>
                                                            <Button variant="outline" size="sm">Profil</Button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                </div>
                            </Card>
                        </TabsContent>

                        <TabsContent value="contracts" className="space-y-6">
                            <div className="flex items-center justify-between">
                                <h2 className="text-2xl font-semibold">Nouveaux contrats</h2>
                                <div className="flex gap-2">
                                    <Button variant="outline" className="gap-2">
                                        <FilePlus className="w-4 h-4" />
                                        Nouveau contrat
                                    </Button>
                                    <Button variant="outline" className="gap-2">
                                        <Download className="w-4 h-4" />
                                        Exporter
                                    </Button>
                                </div>
                            </div>

                            <div className="grid gap-4">
                                {newContracts.map((contract) => (
                                    <Card key={contract.id} className="p-6 border-border">
                                        <div className="flex items-center justify-between mb-4">
                                            <div className="flex items-center gap-4">
                                                <div className="w-12 h-12 bg-primary/10 rounded-xl flex items-center justify-center">
                                                    <FileText className="w-6 h-6 text-primary" />
                                                </div>
                                                <div>
                                                    <Link to={`/employee/clients/${contract.clientId}`} className="text-lg font-semibold hover:underline">
                                                        {contract.client}
                                                    </Link>
                                                    <p className="text-sm text-gray-600">Type: {contract.type}</p>
                                                    <p className="text-sm text-gray-600">Date: {contract.date}</p>
                                                </div>
                                            </div>
                                            <div className="text-right">
                                                <p className="text-2xl font-bold text-primary">{contract.amount} EUR</p>
                                                <Badge variant={contract.status === "actif" ? "default" : "secondary"}>
                                                    {contract.status === "actif" ? "Actif" : "En attente"}
                                                </Badge>
                                            </div>
                                        </div>
                                        <div className="flex gap-3">
                                            <Link to={`/employee/contracts/${contract.id}`}>
                                                <Button variant="outline" className="gap-2">
                                                    <Eye className="w-4 h-4" />
                                                    Details
                                                </Button>
                                            </Link>
                                            <Button variant="outline" className="gap-2">
                                                <Edit className="w-4 h-4" />
                                                Modifier
                                            </Button>
                                            <Button variant="outline" className="gap-2">
                                                <Eye className="w-4 h-4" />
                                                Contacter
                                            </Button>
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

function StarIcon({ className }) {
    return (
        <svg className={className} fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
        </svg>
    );
}

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
    UserPlus, Eye, Edit, Trash2, Search, Filter, Download, User,
    Calendar, Mail, Phone, Shield, FileText, CheckCircle, Clock,
    AlertCircle, Activity, TrendingUp
} from "lucide-react";
import { motion } from "motion/react";

export function EmployeeSignupLogsPage() {
    const [signups] = useState([
        {
            id: "USR-001",
            name: "Sophie Laurent",
            email: "sophie.laurent@example.com",
            phone: "+33 6 12 34 56 78",
            date: "2024-01-15",
            time: "14:32:21",
            type: "auto",
            status: "actif",
            ip: "192.168.1.100",
            source: "site_web",
            completed: true
        },
        {
            id: "USR-002",
            name: "Thomas Petit",
            email: "thomas.petit@example.com",
            phone: "+33 6 98 76 54 32",
            date: "2024-01-14",
            time: "09:15:43",
            type: "habitation",
            status: "actif",
            ip: "192.168.1.101",
            source: "mobile",
            completed: true
        },
        {
            id: "USR-003",
            name: "Camille Roux",
            email: "camille.roux@example.com",
            phone: "+33 6 55 66 77 88",
            date: "2024-01-13",
            time: "16:45:12",
            type: "moto",
            status: "en_attente",
            ip: "192.168.1.102",
            source: "site_web",
            completed: false
        },
        {
            id: "USR-004",
            name: "Julien Moreau",
            email: "julien.moreau@example.com",
            phone: "+33 6 33 44 55 66",
            date: "2024-01-12",
            time: "11:22:56",
            type: "auto",
            status: "actif",
            ip: "192.168.1.103",
            source: "recommandation",
            completed: true
        },
        {
            id: "USR-005",
            name: "Marie Dubois",
            email: "marie.dubois@example.com",
            phone: "+33 6 77 88 99 00",
            date: "2024-01-11",
            time: "08:30:15",
            type: "habitation",
            status: "refusé",
            ip: "192.168.1.104",
            source: "site_web",
            completed: false
        }
    ]);

    const [searchTerm, setSearchTerm] = useState("");
    const [filterStatus, setFilterStatus] = useState("tous");
    const [filterType, setFilterType] = useState("tous");
    const [filterSource, setFilterSource] = useState("tous");

    const statuses = ["Tous", "Actif", "En attente", "Refusé"];
    const types = ["Tous", "Auto", "Habitation", "Moto"];
    const sources = ["Tous", "Site Web", "Mobile", "Recommandation"];

    const filteredSignups = signups.filter(signup => {
        const matchesSearch = signup.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
            signup.email.toLowerCase().includes(searchTerm.toLowerCase()) ||
            signup.id.toLowerCase().includes(searchTerm.toLowerCase());
        const matchesStatus = filterStatus === "tous" || signup.status === filterStatus.toLowerCase().replace('é', 'e').replace(' ', '_');
        const matchesType = filterType === "tous" || signup.type === filterType.toLowerCase();
        const matchesSource = filterSource === "tous" || signup.source === filterSource.toLowerCase().replace(' ', '_');

        return matchesSearch && matchesStatus && matchesType && matchesSource;
    });

    const getStatusColor = (status) => {
        switch (status) {
            case 'actif': return 'bg-green-100 text-green-800 border-green-200';
            case 'en_attente': return 'bg-yellow-100 text-yellow-800 border-yellow-200';
            case 'refusé': return 'bg-red-100 text-red-800 border-red-200';
            default: return 'bg-gray-100 text-gray-800 border-gray-200';
        }
    };

    const getSourceLabel = (source) => {
        switch (source) {
            case 'site_web': return 'Site Web';
            case 'mobile': return 'Mobile';
            case 'recommandation': return 'Recommandation';
            default: return source;
        }
    };

    return (
        <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
            <EmployeeHeader />

            <div className="pt-24 pb-16">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    {/* Header */}
                    <motion.div
                        initial={{ opacity: 0, y: -20 }}
                        animate={{ opacity: 1, y: 0 }}
                        className="mb-8"
                    >
                        <div className="flex items-center justify-between">
                            <div>
                                <h1 className="text-3xl sm:text-4xl font-bold text-gray-900 mb-2">
                                    Logs d'Inscription
                                </h1>
                                <p className="text-gray-600">
                                    Suivi des nouvelles inscriptions et créations de comptes
                                </p>
                            </div>
                            <div className="flex gap-3">
                                <Button className="bg-green-600 hover:bg-green-700 gap-2">
                                    <UserPlus className="w-4 h-4" />
                                    Nouvelle Inscription
                                </Button>
                                <Button variant="outline" className="gap-2">
                                    <Download className="w-4 h-4" />
                                    Exporter
                                </Button>
                            </div>
                        </div>
                    </motion.div>

                    {/* Stats Cards */}
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ delay: 0.1 }}
                        className="grid grid-cols-2 lg:grid-cols-4 gap-6 mb-8"
                    >
                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Total Inscriptions</p>
                                    <p className="text-2xl font-bold">{signups.length}</p>
                                    <p className="text-sm text-green-600 font-medium">+5 ce mois</p>
                                </div>
                                <div className="bg-blue-100 rounded-xl p-3">
                                    <UserPlus className="w-8 h-8 text-blue-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Actifs</p>
                                    <p className="text-2xl font-bold">{signups.filter(s => s.status === 'actif').length}</p>
                                    <p className="text-sm text-green-600 font-medium">80% du total</p>
                                </div>
                                <div className="bg-green-100 rounded-xl p-3">
                                    <CheckCircle className="w-8 h-8 text-green-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">En attente</p>
                                    <p className="text-2xl font-bold">{signups.filter(s => s.status === 'en_attente').length}</p>
                                    <p className="text-sm text-yellow-600 font-medium">À valider</p>
                                </div>
                                <div className="bg-yellow-100 rounded-xl p-3">
                                    <Clock className="w-8 h-8 text-yellow-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Taux de conversion</p>
                                    <p className="text-2xl font-bold">75%</p>
                                    <p className="text-sm text-blue-600 font-medium">+12% vs mois dernier</p>
                                </div>
                                <div className="bg-purple-100 rounded-xl p-3">
                                    <TrendingUp className="w-8 h-8 text-purple-600" />
                                </div>
                            </div>
                        </Card>
                    </motion.div>

                    {/* Main Content */}
                    <Tabs defaultValue="logs" className="space-y-6">
                        <TabsList className="grid grid-cols-2 lg:w-auto">
                            <TabsTrigger value="logs">Logs détaillés</TabsTrigger>
                            <TabsTrigger value="analytics">Analytique</TabsTrigger>
                        </TabsList>

                        {/* Logs Tab */}
                        <TabsContent value="logs" className="space-y-6">
                            {/* Filters */}
                            <Card className="p-6 border-border">
                                <div className="flex flex-col lg:flex-row gap-4">
                                    <div className="flex-1 relative">
                                        <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                                        <input
                                            type="text"
                                            placeholder="Rechercher un utilisateur..."
                                            value={searchTerm}
                                            onChange={(e) => setSearchTerm(e.target.value)}
                                            className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"
                                        />
                                    </div>
                                    <select
                                        value={filterStatus}
                                        onChange={(e) => setFilterStatus(e.target.value)}
                                        className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"
                                    >
                                        {statuses.map(status => (
                                            <option key={status} value={status}>{status}</option>
                                        ))}
                                    </select>
                                    <select
                                        value={filterType}
                                        onChange={(e) => setFilterType(e.target.value)}
                                        className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"
                                    >
                                        {types.map(type => (
                                            <option key={type} value={type}>{type}</option>
                                        ))}
                                    </select>
                                    <select
                                        value={filterSource}
                                        onChange={(e) => setFilterSource(e.target.value)}
                                        className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"
                                    >
                                        {sources.map(source => (
                                            <option key={source} value={source}>{source}</option>
                                        ))}
                                    </select>
                                    <Button variant="outline" className="gap-2">
                                        <Filter className="w-4 h-4" />
                                        Filtrer
                                    </Button>
                                </div>
                            </Card>

                            {/* Logs Table */}
                            <Card className="border-border overflow-hidden">
                                <div className="overflow-x-auto">
                                    <table className="w-full">
                                        <thead className="bg-gray-50">
                                            <tr>
                                                <th className="text-left p-4 text-sm font-medium text-gray-900">ID</th>
                                                <th className="text-left p-4 text-sm font-medium text-gray-900">Utilisateur</th>
                                                <th className="text-left p-4 text-sm font-medium text-gray-900">Type</th>
                                                <th className="text-left p-4 text-sm font-medium text-gray-900">Date & Heure</th>
                                                <th className="text-left p-4 text-sm font-medium text-gray-900">Source</th>
                                                <th className="text-left p-4 text-sm font-medium text-gray-900">Statut</th>
                                                <th className="text-right p-4 text-sm font-medium text-gray-900">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody className="divide-y divide-gray-200">
                                            {filteredSignups.map((signup) => (
                                                <tr key={signup.id} className="hover:bg-gray-50 transition-colors">
                                                    <td className="p-4">
                                                        <span className="font-mono text-sm font-medium">{signup.id}</span>
                                                    </td>
                                                    <td className="p-4">
                                                        <div className="flex items-center gap-3">
                                                            <div className="w-8 h-8 bg-primary/10 rounded-full flex items-center justify-center">
                                                                <User className="w-4 h-4 text-primary" />
                                                            </div>
                                                            <div>
                                                                <p className="font-medium">{signup.name}</p>
                                                                <p className="text-sm text-gray-500">{signup.email}</p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td className="p-4">
                                                        <Badge variant="outline">{signup.type}</Badge>
                                                    </td>
                                                    <td className="p-4">
                                                        <div className="flex items-center gap-2 text-sm text-gray-500">
                                                            <Calendar className="w-4 h-4" />
                                                            <span>{signup.date}</span>
                                                        </div>
                                                        <div className="flex items-center gap-2 text-sm text-gray-500">
                                                            <Clock className="w-4 h-4" />
                                                            <span>{signup.time}</span>
                                                        </div>
                                                    </td>
                                                    <td className="p-4">
                                                        <div className="flex items-center gap-2">
                                                            <Activity className="w-4 h-4 text-gray-400" />
                                                            <span className="text-sm">{getSourceLabel(signup.source)}</span>
                                                        </div>
                                                    </td>
                                                    <td className="p-4">
                                                        <Badge className={getStatusColor(signup.status)}>
                                                            {signup.status === 'actif' ? 'Actif' : signup.status === 'en_attente' ? 'En attente' : 'Refusé'}
                                                        </Badge>
                                                    </td>
                                                    <td className="p-4 text-right">
                                                        <div className="flex justify-end gap-2">
                                                            <Link to={`/employee/users/${signup.id}`}>
                                                                <Button variant="outline" size="sm">
                                                                    <Eye className="w-4 h-4" />
                                                                </Button>
                                                            </Link>
                                                            <Button variant="outline" size="sm">
                                                                <Mail className="w-4 h-4" />
                                                            </Button>
                                                            <Button variant="outline" size="sm" className="text-green-600 border-green-200">
                                                                <CheckCircle className="w-4 h-4" />
                                                            </Button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                </div>
                            </Card>
                        </TabsContent>

                        {/* Analytics Tab */}
                        <TabsContent value="analytics" className="space-y-6">
                            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                                <Card className="p-6 border-border">
                                    <h3 className="text-lg font-semibold mb-4">Répartition par type d'assurance</h3>
                                    <div className="space-y-3">
                                        {[
                                            { type: 'Auto', count: signups.filter(s => s.type === 'auto').length, percentage: Math.round((signups.filter(s => s.type === 'auto').length / signups.length) * 100), color: 'bg-blue-500' },
                                            { type: 'Habitation', count: signups.filter(s => s.type === 'habitation').length, percentage: Math.round((signups.filter(s => s.type === 'habitation').length / signups.length) * 100), color: 'bg-green-500' },
                                            { type: 'Moto', count: signups.filter(s => s.type === 'moto').length, percentage: Math.round((signups.filter(s => s.type === 'moto').length / signups.length) * 100), color: 'bg-yellow-500' }
                                        ].map((item) => (
                                            <div key={item.type} className="space-y-2">
                                                <div className="flex items-center justify-between">
                                                    <div className="flex items-center gap-3">
                                                        <div className={`w-3 h-3 rounded-full ${item.color}`}></div>
                                                        <span>{item.type}</span>
                                                    </div>
                                                    <span className="font-semibold">{item.count} ({item.percentage}%)</span>
                                                </div>
                                                <div className="w-full bg-gray-200 rounded-full h-2">
                                                    <div className={`h-2 rounded-full ${item.color}`} style={{ width: `${item.percentage}%` }}></div>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                </Card>

                                <Card className="p-6 border-border">
                                    <h3 className="text-lg font-semibold mb-4">Répartition par source</h3>
                                    <div className="space-y-3">
                                        {[
                                            { source: 'Site Web', count: signups.filter(s => s.source === 'site_web').length, color: 'bg-blue-500' },
                                            { source: 'Mobile', count: signups.filter(s => s.source === 'mobile').length, color: 'bg-purple-500' },
                                            { source: 'Recommandation', count: signups.filter(s => s.source === 'recommandation').length, color: 'bg-green-500' }
                                        ].map((item) => (
                                            <div key={item.source} className="space-y-2">
                                                <div className="flex items-center justify-between">
                                                    <div className="flex items-center gap-3">
                                                        <div className={`w-3 h-3 rounded-full ${item.color}`}></div>
                                                        <span>{item.source}</span>
                                                    </div>
                                                    <span className="font-semibold">{item.count}</span>
                                                </div>
                                                <div className="w-full bg-gray-200 rounded-full h-2">
                                                    <div className={`h-2 rounded-full ${item.color}`} style={{ width: `${Math.round((item.count / signups.length) * 100)}%` }}></div>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                </Card>
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

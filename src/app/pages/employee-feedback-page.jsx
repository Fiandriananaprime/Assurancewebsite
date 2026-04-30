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
    MessageSquare, Star, Eye, Reply, Trash2, Search, Filter, Download,
    User, Calendar, Mail, Phone, ThumbsUp, ThumbsDown, AlertCircle,
    CheckCircle, Clock, TrendingUp, Smile, Frown, Meh
} from "lucide-react";
import { Avatar, AvatarFallback, AvatarImage } from "../components/ui/avatar";
import { motion } from "motion/react";
import { useFeedbacks } from "../hooks/useFeedbacks";

export function EmployeeFeedbackPage() {
    const { feedbacks: feedback = [], loading } = useFeedbacks({ limit: 200 });

    const [searchTerm, setSearchTerm] = useState("");
    const [filterRating, setFilterRating] = useState("tous");
    const [filterCategory, setFilterCategory] = useState("tous");
    const [filterStatus, setFilterStatus] = useState("tous");

    const ratings = ["Tous", "5 étoiles", "4 étoiles", "3 étoiles", "2 étoiles", "1 étoile"];
    const categories = ["Tous", "Service Client", "Site Web", "Application", "Sinistre", "Général"];
    const statuses = ["Tous", "Nouveau", "En cours", "Traité", "Urgent"];

    const filteredFeedback = feedback.filter(fb => {
        const matchesSearch = fb.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
            fb.email.toLowerCase().includes(searchTerm.toLowerCase()) ||
            fb.subject.toLowerCase().includes(searchTerm.toLowerCase());
        const matchesRating = filterRating === "tous" || fb.rating === parseInt(filterRating);
        const matchesCategory = filterCategory === "tous" || fb.category === filterCategory.toLowerCase().replace(' ', '_');
        const matchesStatus = filterStatus === "tous" || fb.status === filterStatus.toLowerCase().replace('é', 'e').replace(' ', '_');

        return matchesSearch && matchesRating && matchesCategory && matchesStatus;
    });

    const getRatingLabel = (rating) => {
        if (rating >= 4) return { label: "Positif", color: "bg-green-100 text-green-800" };
        if (rating === 3) return { label: "Neutre", color: "bg-yellow-100 text-yellow-800" };
        return { label: "Négatif", color: "bg-red-100 text-red-800" };
    };

    const getStatusColor = (status) => {
        switch (status) {
            case 'nouveau': return 'bg-blue-100 text-blue-800 border-blue-200';
            case 'en_cours': return 'bg-yellow-100 text-yellow-800 border-yellow-200';
            case 'traité': return 'bg-green-100 text-green-800 border-green-200';
            case 'urgent': return 'bg-red-100 text-red-800 border-red-200';
            default: return 'bg-gray-100 text-gray-800 border-gray-200';
        }
    };

    const getCategoryLabel = (category) => {
        switch (category) {
            case 'service_client': return 'Service Client';
            case 'site_web': return 'Site Web';
            case 'application': return 'Application';
            case 'sinistre': return 'Sinistre';
            case 'general': return 'Général';
            default: return category;
        }
    };

    const averageRating = feedback.length ? (feedback.reduce((sum, fb) => sum + (fb.rating || 0), 0) / feedback.length).toFixed(1) : '0.0';

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
                                    Retours Clients
                                </h1>
                                <p className="text-gray-600">
                                    Gérez les feedbacks et réclamations de vos clients
                                </p>
                            </div>
                            <div className="flex gap-3">
                                <Button className="bg-purple-600 hover:bg-purple-700 gap-2">
                                    <MessageSquare className="w-4 h-4" />
                                    Nouveau Feedback
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
                                    <p className="text-sm text-gray-600 mb-1">Total Feedbacks</p>
                                    <p className="text-2xl font-bold">{feedback.length}</p>
                                    <p className="text-sm text-blue-600 font-medium">+5 ce mois</p>
                                </div>
                                <div className="bg-blue-100 rounded-xl p-3">
                                    <MessageSquare className="w-8 h-8 text-blue-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Note Moyenne</p>
                                    <p className="text-2xl font-bold">{averageRating}/5</p>
                                    <div className="flex gap-1 mt-1">
                                        {[...Array(5)].map((_, i) => (
                                            <Star key={i} className={`w-4 h-4 ${i < Math.round(parseFloat(averageRating)) ? 'text-yellow-400 fill-yellow-400' : 'text-gray-300'}`} />
                                        ))}
                                    </div>
                                </div>
                                <div className="bg-yellow-100 rounded-xl p-3">
                                    <Star className="w-8 h-8 text-yellow-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Feedbacks Positifs</p>
                                    <p className="text-2xl font-bold">{feedback.filter(fb => fb.rating >= 4).length}</p>
                                    <p className="text-sm text-green-600 font-medium">{Math.round((feedback.filter(fb => fb.rating >= 4).length / feedback.length) * 100)}%</p>
                                </div>
                                <div className="bg-green-100 rounded-xl p-3">
                                    <ThumbsUp className="w-8 h-8 text-green-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">À traiter</p>
                                    <p className="text-2xl font-bold">{feedback.filter(fb => fb.status === 'nouveau' || fb.status === 'urgent').length}</p>
                                    <p className="text-sm text-red-600 font-medium">{feedback.filter(fb => fb.status === 'urgent').length} urgents</p>
                                </div>
                                <div className="bg-red-100 rounded-xl p-3">
                                    <Clock className="w-8 h-8 text-red-600" />
                                </div>
                            </div>
                        </Card>
                    </motion.div>

                    {/* Main Content */}
                    <Tabs defaultValue="feedback" className="space-y-6">
                        <TabsList className="grid grid-cols-2 lg:w-auto">
                            <TabsTrigger value="feedback">Liste des Feedbacks</TabsTrigger>
                            <TabsTrigger value="urgent">Urgents</TabsTrigger>
                            <TabsTrigger value="analytics">Statistiques</TabsTrigger>
                        </TabsList>

                        {/* Feedback Tab */}
                        <TabsContent value="feedback" className="space-y-6">
                            {/* Filters */}
                            <Card className="p-6 border-border">
                                <div className="flex flex-col lg:flex-row gap-4">
                                    <div className="flex-1 relative">
                                        <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                                        <input
                                            type="text"
                                            placeholder="Rechercher un feedback..."
                                            value={searchTerm}
                                            onChange={(e) => setSearchTerm(e.target.value)}
                                            className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"
                                        />
                                    </div>
                                    <select
                                        value={filterRating}
                                        onChange={(e) => setFilterRating(e.target.value)}
                                        className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"
                                    >
                                        {ratings.map(rating => (
                                            <option key={rating} value={rating}>{rating}</option>
                                        ))}
                                    </select>
                                    <select
                                        value={filterCategory}
                                        onChange={(e) => setFilterCategory(e.target.value)}
                                        className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"
                                    >
                                        {categories.map(category => (
                                            <option key={category} value={category}>{category}</option>
                                        ))}
                                    </select>
                                    <select
                                        value={filterStatus}
                                        onChange={(e) => setFilterStatus(e.target.value)}
                                        className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"
                                    >
                                        {statuses.map(status => (
                                            <option key={status} value={status}>{status}</option>
                                        ))}
                                    </select>
                                    <Button variant="outline" className="gap-2">
                                        <Filter className="w-4 h-4" />
                                        Filtrer
                                    </Button>
                                </div>
                            </Card>

                            {/* Feedback List */}
                            <div className="grid gap-6">
                                {filteredFeedback.map((fb) => {
                                    const ratingInfo = getRatingLabel(fb.rating);
                                    return (
                                        <Card key={fb.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                                            <div className="grid lg:grid-cols-4 gap-6">
                                                <div className="lg:col-span-2">
                                                    <div className="flex items-center gap-3 mb-3">
                                                        <div className="flex items-center gap-1">
                                                            {[...Array(5)].map((_, i) => (
                                                                <Star key={i} className={`w-4 h-4 ${i < fb.rating ? 'text-yellow-400 fill-yellow-400' : 'text-gray-300'}`} />
                                                            ))}
                                                        </div>
                                                        <Badge className={ratingInfo.color}>
                                                            {ratingInfo.label}
                                                        </Badge>
                                                        <Badge className={getStatusColor(fb.status)}>
                                                            {fb.status === 'nouveau' ? 'Nouveau' : fb.status === 'en_cours' ? 'En cours' : fb.status === 'traité' ? 'Traité' : 'Urgent'}
                                                        </Badge>
                                                    </div>

                                                    <h3 className="text-lg font-semibold mb-2">{fb.subject}</h3>
                                                    <p className="text-gray-600 mb-4 line-clamp-2">{fb.message}</p>

                                                    <div className="grid grid-cols-2 gap-4 text-sm text-gray-500">
                                                            <div className="flex items-center gap-3">
                                                                <Link to={`/employee/clients/${fb.clientId}`} className="flex items-center gap-3">
                                                                    <Avatar className="w-8 h-8">
                                                                        <AvatarImage src={fb.client?.profileImage} alt={fb.name} />
                                                                        <AvatarFallback className="bg-primary/10 text-primary text-xs">{fb.client?.firstName?.[0] || fb.name?.[0]}</AvatarFallback>
                                                                    </Avatar>
                                                                    <span className="font-medium hover:underline">{fb.name}</span>
                                                                </Link>
                                                            </div>
                                                        <div className="flex items-center gap-2">
                                                            <Calendar className="w-4 h-4" />
                                                            <span>{fb.date} à {fb.time}</span>
                                                        </div>
                                                        <div className="flex items-center gap-2">
                                                            <Mail className="w-4 h-4" />
                                                            <span className="truncate">{fb.email}</span>
                                                        </div>
                                                        <div className="flex items-center gap-2">
                                                            <MessageSquare className="w-4 h-4" />
                                                            <span>{getCategoryLabel(fb.category)}</span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div className="lg:col-span-1">
                                                    <div className="space-y-3">
                                                        <div className="p-3 bg-gray-50 rounded-lg">
                                                            <p className="text-sm text-gray-600">Source</p>
                                                            <p className="font-medium capitalize">{fb.source}</p>
                                                        </div>
                                                        <div className="p-3 bg-gray-50 rounded-lg">
                                                            <p className="text-sm text-gray-600">Répondu</p>
                                                            <p className={`font-medium ${fb.replied ? 'text-green-600' : 'text-red-600'}`}>
                                                                {fb.replied ? 'Oui' : 'Non'}
                                                            </p>
                                                        </div>
                                                        <div className="p-3 bg-gray-50 rounded-lg">
                                                            <p className="text-sm text-gray-600">Téléphone</p>
                                                            <p className="font-medium">{fb.phone}</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div className="lg:col-span-1 flex flex-col gap-3">
                                                    <Link to={`/employee/feedback/${fb.id}`}>
                                                        <Button variant="outline" className="w-full gap-2">
                                                            <Eye className="w-4 h-4" />
                                                            Voir détails
                                                        </Button>
                                                    </Link>
                                                    <Button variant="outline" className="w-full gap-2">
                                                        <Reply className="w-4 h-4" />
                                                        Répondre
                                                    </Button>
                                                    <Button
                                                        variant="outline"
                                                        className={`w-full gap-2 ${fb.status === 'urgent' ? 'text-red-600 border-red-200' : 'text-green-600 border-green-200'}`}
                                                    >
                                                        <CheckCircle className="w-4 h-4" />
                                                        {fb.status === 'urgent' ? 'Marquer urgent' : 'Marquer traité'}
                                                    </Button>
                                                </div>
                                            </div>
                                        </Card>
                                    );
                                })}
                            </div>
                        </TabsContent>

                        {/* Urgent Tab */}
                        <TabsContent value="urgent" className="space-y-6">
                            <div className="grid gap-6">
                                {feedback.filter(fb => fb.status === 'urgent' || fb.status === 'nouveau').map((fb) => (
                                    <Card key={fb.id} className="p-6 border-border border-l-4 border-l-red-500">
                                        <div className="flex items-start justify-between mb-4">
                                            <div className="flex items-center gap-4">
                                                <div className="w-12 h-12 bg-red-100 rounded-xl flex items-center justify-center">
                                                    <AlertCircle className="w-6 h-6 text-red-600" />
                                                </div>
                                                <div>
                                                    <h3 className="text-lg font-semibold">{fb.subject}</h3>
                                                    <Link to={`/employee/clients/${fb.clientId}`} className="text-sm text-gray-500 hover:underline">{fb.name}</Link>
                                                    <p className="text-sm text-gray-500">{fb.email}</p>
                                                </div>
                                            </div>
                                            <Badge className="bg-red-100 text-red-800 border-red-200">
                                                {fb.status === 'urgent' ? 'Urgent' : 'Nouveau'}
                                            </Badge>
                                        </div>

                                        <p className="text-gray-600 mb-4">{fb.message}</p>

                                        <div className="flex items-center gap-6 text-sm text-gray-500 mb-4">
                                            <div className="flex items-center gap-2">
                                                <Star className="w-4 h-4 text-yellow-400 fill-yellow-400" />
                                                <span>{fb.rating}/5</span>
                                            </div>
                                            <div className="flex items-center gap-2">
                                                <Calendar className="w-4 h-4" />
                                                <span>{fb.date} à {fb.time}</span>
                                            </div>
                                            <div className="flex items-center gap-2">
                                                <MessageSquare className="w-4 h-4" />
                                                <span>{getCategoryLabel(fb.category)}</span>
                                            </div>
                                        </div>

                                        <div className="flex gap-3">
                                            <Button className="bg-red-600 hover:bg-red-700 gap-2">
                                                <Reply className="w-4 h-4" />
                                                Répondre immédiatement
                                            </Button>
                                            <Button variant="outline" className="gap-2">
                                                <Phone className="w-4 h-4" />
                                                Appeler
                                            </Button>
                                            <Button variant="outline" className="gap-2">
                                                <CheckCircle className="w-4 h-4" />
                                                Marquer traité
                                            </Button>
                                        </div>
                                    </Card>
                                ))}
                            </div>
                        </TabsContent>

                        {/* Analytics Tab */}
                        <TabsContent value="analytics" className="space-y-6">
                            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                                <Card className="p-6 border-border">
                                    <h3 className="text-lg font-semibold mb-4">Répartition par note</h3>
                                    <div className="space-y-3">
                                        {[5, 4, 3, 2, 1].map((rating) => {
                                            const count = feedback.filter(fb => fb.rating === rating).length;
                                            const percentage = Math.round((count / feedback.length) * 100);
                                            return (
                                                <div key={rating} className="space-y-2">
                                                    <div className="flex items-center justify-between">
                                                        <div className="flex items-center gap-3">
                                                            <div className="flex gap-1">
                                                                {[...Array(5)].map((_, i) => (
                                                                    <Star key={i} className={`w-4 h-4 ${i < rating ? 'text-yellow-400 fill-yellow-400' : 'text-gray-300'}`} />
                                                                ))}
                                                            </div>
                                                        </div>
                                                        <span className="font-semibold">{count} ({percentage}%)</span>
                                                    </div>
                                                    <div className="w-full bg-gray-200 rounded-full h-2">
                                                        <div className="bg-yellow-500 h-2 rounded-full" style={{ width: `${percentage}%` }}></div>
                                                    </div>
                                                </div>
                                            );
                                        })}
                                    </div>
                                </Card>

                                <Card className="p-6 border-border">
                                    <h3 className="text-lg font-semibold mb-4">Répartition par catégorie</h3>
                                    <div className="space-y-3">
                                        {[
                                            { category: 'Service Client', count: feedback.filter(fb => fb.category === 'service_client').length, color: 'bg-blue-500' },
                                            { category: 'Site Web', count: feedback.filter(fb => fb.category === 'site_web').length, color: 'bg-green-500' },
                                            { category: 'Application', count: feedback.filter(fb => fb.category === 'application').length, color: 'bg-purple-500' },
                                            { category: 'Sinistre', count: feedback.filter(fb => fb.category === 'sinistre').length, color: 'bg-red-500' },
                                            { category: 'Général', count: feedback.filter(fb => fb.category === 'general').length, color: 'bg-yellow-500' }
                                        ].map((item) => (
                                            <div key={item.category} className="space-y-2">
                                                <div className="flex items-center justify-between">
                                                    <div className="flex items-center gap-3">
                                                        <div className={`w-3 h-3 rounded-full ${item.color}`}></div>
                                                        <span>{item.category}</span>
                                                    </div>
                                                    <span className="font-semibold">{item.count}</span>
                                                </div>
                                                <div className="w-full bg-gray-200 rounded-full h-2">
                                                    <div className={`h-2 rounded-full ${item.color}`} style={{ width: `${Math.round((item.count / feedback.length) * 100)}%` }}></div>
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



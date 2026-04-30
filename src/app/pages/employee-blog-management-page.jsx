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
    Plus, Edit, Trash2, Eye, Calendar, User, Tag, FileText, Image as ImageIcon,
    Search, Filter, Download, ExternalLink, Clock, CheckCircle, X, MessageCircle, Users
} from "lucide-react";
import {
    Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle,
} from "../components/ui/dialog";
import { motion } from "motion/react";
import { useContent } from "../hooks/useContent";

export function EmployeeBlogManagementPage() {
    const { blogs, events, loading, error, refresh } = useContent();

    // Normalize shapes
    const normalizedBlogs = (blogs && blogs.posts) ? blogs.posts : (Array.isArray(blogs) ? blogs : (blogs && blogs.data && Array.isArray(blogs.data.posts) ? blogs.data.posts : []));
    const normalizedEvents = (events && events.events) ? events.events : (Array.isArray(events) ? events : (events && events.data && Array.isArray(events.data.events) ? events.data.events : []));

    const [searchTerm, setSearchTerm] = useState("");
    const [filterCategory, setFilterCategory] = useState("tous");
    const [filterStatus, setFilterStatus] = useState("tous");
    const [isDeleting, setIsDeleting] = useState(false);

    // État pour la boîte de dialogue de suppression
    const [deleteDialog, setDeleteDialog] = useState({ 
        open: false, 
        id: null, 
        title: "", 
        type: "",
        error: null
    });

    const categories = ["Tous", "Conseils", "Actualités", "Technologie", "Événements"];
    const statuses = ["Tous", "Publié", "Brouillon", "Programmé"];

    const filteredBlogs = normalizedBlogs.filter(blog => {
        const title = (blog.title || '').toString().toLowerCase();
        const excerpt = (blog.excerpt || '').toString().toLowerCase();
        const author = (blog.author || '').toString().toLowerCase();
        const matchesSearch = title.includes(searchTerm.toLowerCase()) ||
            excerpt.includes(searchTerm.toLowerCase()) ||
            author.includes(searchTerm.toLowerCase());
        const matchesCategory = filterCategory === "tous" || (blog.category || '').toString() === filterCategory;
        const matchesStatus = filterStatus === "tous" || (blog.status || '').toString() === filterStatus.toLowerCase();

        return matchesSearch && matchesCategory && matchesStatus;
    });

    const handleDeleteConfirm = async () => {
        setIsDeleting(true);
        setDeleteDialog(prev => ({ ...prev, error: null }));

        // Simple UUID regex check for debugging
        const isUUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(deleteDialog.id);
        if (!isUUID) {
            console.error(`Attempting to delete item with invalid UUID format: "${deleteDialog.id}"`);
        }

        try {
            // Validate id is a UUID before calling backend to avoid DB errors
            const id = deleteDialog.id;
            const isUuid = id && String(id).match(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/);
            if (!isUuid) {
                const errMsg = `Invalid content id format: "${id}"`;
                console.warn(errMsg);
                setDeleteDialog(prev => ({ ...prev, error: errMsg }));
                setIsDeleting(false);
                return;
            }

            const token = localStorage.getItem('assurance-auth-token');
            const res = await fetch(`/api/content/${deleteDialog.id}`, { 
                method: 'DELETE', 
                headers: { Authorization: token ? `Bearer ${token}` : '' } 
            });
            
            if (!res.ok) {
                const data = await res.json();
                throw new Error(data?.message || 'La suppression a échoué');
            }

            refresh();
            setDeleteDialog({ open: false, id: null, title: "", type: "", error: null });
        } catch (err) {
            console.error('Failed to delete content', err);
            setDeleteDialog(prev => ({ ...prev, error: err.message }));
        } finally {
            setIsDeleting(false);
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
                                    Gestion Blog & Événements
                                </h1>
                                <p className="text-gray-600">Créez, gérez et publiez du contenu pour vos clients</p>
                                <p className="text-sm text-slate-500">Blogs fetched: { (blogs && blogs.posts ? blogs.posts.length : (Array.isArray(blogs) ? blogs.length : 0)) || 0 } — Events fetched: { (events && events.events ? events.events.length : (Array.isArray(events) ? events.length : 0)) || 0 }</p>
                                {error && <p className="text-sm text-red-600">Error loading content: {String(error.message || error)}</p>}
                            </div>
                            <div className="flex gap-3">
                                <Link to="/employee/blogs/new">
                                    <Button className="bg-primary hover:bg-primary/90 gap-2">
                                        <Plus className="w-4 h-4" />
                                        Nouveau Blog
                                    </Button>
                                </Link>
                                <Link to="/employee/events/new">
                                    <Button variant="outline" className="gap-2">
                                        <Plus className="w-4 h-4" />
                                        Nouvel Événement
                                    </Button>
                                </Link>
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
                                    <p className="text-sm text-gray-600 mb-1">Total Blogs</p>
                                    <p className="text-2xl font-bold">{normalizedBlogs.length}</p>
                                    <p className="text-sm text-green-600 font-medium">+3 ce mois</p>
                                </div>
                                <div className="bg-blue-100 rounded-xl p-3">
                                    <FileText className="w-8 h-8 text-blue-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Blogs Publiés</p>
                                    <p className="text-2xl font-bold">{normalizedBlogs.filter(b => (b.status || '').toString() === 'publié').length}</p>
                                    <p className="text-sm text-green-600 font-medium">+2 cette semaine</p>
                                </div>
                                <div className="bg-green-100 rounded-xl p-3">
                                    <CheckCircle className="w-8 h-8 text-green-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Événements</p>
                                    <p className="text-2xl font-bold">{normalizedEvents.length}</p>
                                    <p className="text-sm text-blue-600 font-medium">2 à venir</p>
                                </div>
                                <div className="bg-purple-100 rounded-xl p-3">
                                    <Calendar className="w-8 h-8 text-purple-600" />
                                </div>
                            </div>
                        </Card>

                        <Card className="p-6 border-border">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm text-gray-600 mb-1">Total Vues</p>
                                    <p className="text-2xl font-bold">{normalizedBlogs.reduce((sum, b) => sum + (b.views || 0), 0)}</p>
                                    <p className="text-sm text-yellow-600 font-medium">+15% vs mois dernier</p>
                                </div>
                                <div className="bg-yellow-100 rounded-xl p-3">
                                    <Eye className="w-8 h-8 text-yellow-600" />
                                </div>
                            </div>
                        </Card>
                    </motion.div>

                    {/* Main Content */}
                    <Tabs defaultValue="blogs" className="space-y-6">
                        <TabsList className="grid grid-cols-2 lg:w-auto">
                            <TabsTrigger value="blogs">Blogs</TabsTrigger>
                            <TabsTrigger value="events">Événements</TabsTrigger>
                        </TabsList>

                        {/* Blogs Tab */}
                        <TabsContent value="blogs" className="space-y-6">
                            {/* Filters */}
                            <Card className="p-6 border-border">
                                <div className="flex flex-col lg:flex-row gap-4">
                                    <div className="flex-1 relative">
                                        <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                                        <input
                                            type="text"
                                            placeholder="Rechercher un blog..."
                                            value={searchTerm}
                                            onChange={(e) => setSearchTerm(e.target.value)}
                                            className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"
                                        />
                                    </div>
                                    <select
                                        value={filterCategory}
                                        onChange={(e) => setFilterCategory(e.target.value)}
                                        className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent"
                                    >
                                        {categories.map(cat => (
                                            <option key={cat} value={cat}>{cat}</option>
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

                            {/* Blog List */}
                            <div className="grid gap-6">
                                {filteredBlogs.map((blog) => (
                                    <Card key={blog.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                                        <div className="grid lg:grid-cols-4 gap-6">
                                            <div className="lg:col-span-1">
                                                <img
                                                    src={blog.image}
                                                    alt={blog.title}
                                                    className="w-full h-48 object-cover rounded-lg"
                                                />
                                            </div>
                                            <div className="lg:col-span-2">
                                                <div className="flex items-center gap-3 mb-2">
                                                    <Badge variant={blog.status === 'publié' ? 'default' : blog.status === 'brouillon' ? 'secondary' : 'outline'}>
                                                        {blog.status}
                                                    </Badge>
                                                    <Badge variant="outline">{blog.category}</Badge>
                                                </div>
                                                <h3 className="text-xl font-semibold mb-2">{blog.title}</h3>
                                                <p className="text-gray-600 mb-4">{blog.excerpt}</p>
                                                <div className="flex items-center gap-6 text-sm text-gray-500">
                                                    <div className="flex items-center gap-2">
                                                        <User className="w-4 h-4" />
                                                        <span>{blog.author}</span>
                                                    </div>
                                                    <div className="flex items-center gap-2">
                                                        <Calendar className="w-4 h-4" />
                                                        <span>{blog.date}</span>
                                                    </div>
                                                    <div className="flex items-center gap-2">
                                                        <Eye className="w-4 h-4" />
                                                        <span>{blog.views} vues</span>
                                                    </div>
                                                    <div className="flex items-center gap-2">
                                                        <MessageCircle className="w-4 h-4" />
                                                        <span>{blog.comments} commentaires</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="lg:col-span-1 flex flex-col gap-3">
                                                <Link to={`/employee/blogs/${blog.id}`}>
                                                    <Button variant="outline" className="w-full gap-2">
                                                        <Eye className="w-4 h-4" />
                                                        Voir
                                                    </Button>
                                                </Link>
                                                <Link to={`/employee/blogs/${blog.id}/edit`}>
                                                    <Button variant="outline" className="w-full gap-2">
                                                        <Edit className="w-4 h-4" />
                                                        Modifier
                                                    </Button>
                                                </Link>
                                                <Button variant="outline" className="w-full gap-2 text-red-600 border-red-200 hover:bg-red-50" onClick={async () => {
                                                    setDeleteDialog({
                                                        open: true,
                                                        id: blog.id,
                                                        title: blog.title,
                                                        type: "cet article de blog"
                                                    });
                                                }}>
                                                    <Trash2 className="w-4 h-4" />
                                                    Supprimer
                                                </Button>
                                            </div>
                                        </div>
                                    </Card>
                                ))}
                                {loading && <div>Chargement...</div>}
                            </div>
                        </TabsContent>

                        {/* Events Tab */}
                        <TabsContent value="events" className="space-y-6">
                            <div className="flex items-center justify-between mb-6">
                                <h2 className="text-2xl font-semibold">Gestion des Événements</h2>
                                <Link to="/employee/events/new">
                                    <Button className="bg-purple-600 hover:bg-purple-700 gap-2">
                                        <Plus className="w-4 h-4" />
                                        Nouvel Événement
                                    </Button>
                                </Link>
                            </div>

                            <div className="grid gap-6">
                                {normalizedEvents.map((event) => (
                                    <Card key={event.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                                        <div className="grid lg:grid-cols-3 gap-6">
                                            <div className="lg:col-span-2">
                                                <div className="flex items-center gap-3 mb-3">
                                                    <Badge variant={event.status === 'ouvert' ? 'default' : 'secondary'}>
                                                        {event.status}
                                                    </Badge>
                                                    <Badge variant="outline">Événement</Badge>
                                                </div>
                                                <h3 className="text-xl font-semibold mb-2">{event.title}</h3>
                                                <p className="text-gray-600 mb-4">{event.description}</p>
                                                <div className="grid grid-cols-2 gap-4 text-sm text-gray-500">
                                                    <div className="flex items-center gap-2">
                                                        <Calendar className="w-4 h-4" />
                                                        <span>{event.date} à {event.time}</span>
                                                    </div>
                                                    <div className="flex items-center gap-2">
                                                        <ImageIcon className="w-4 h-4" />
                                                        <span>{event.location}</span>
                                                    </div>
                                                    <div className="flex items-center gap-2">
                                                        <User className="w-4 h-4" />
                                                        <span>{event.organizer}</span>
                                                    </div>
                                                    <div className="flex items-center gap-2">
                                                        <Users className="w-4 h-4" />
                                                        <span>{event.attendees} participants</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="lg:col-span-1 flex flex-col gap-3">
                                                <Button variant="outline" className="w-full gap-2">
                                                    <Eye className="w-4 h-4" />
                                                    Détails
                                                </Button>
                                                <Link to={`/employee/events/${event.id}/edit`}>
                                                    <Button variant="outline" className="w-full gap-2">
                                                        <Edit className="w-4 h-4" />
                                                        Modifier
                                                    </Button>
                                                </Link>
                                                <Button variant="outline" className="w-full gap-2 text-red-600 border-red-200 hover:bg-red-50" onClick={async () => {
                                                    setDeleteDialog({
                                                        open: true,
                                                        id: event.id,
                                                        title: event.title,
                                                        type: "cet événement"
                                                    });
                                                }}>
                                                    <Trash2 className="w-4 h-4" />
                                                    Supprimer
                                                </Button>
                                                <Button variant="outline" className="w-full gap-2">
                                                    <ExternalLink className="w-4 h-4" />
                                                    Partager
                                                </Button>
                                            </div>
                                        </div>
                                    </Card>
                                ))}
                            </div>
                        </TabsContent>
                    </Tabs>

                    {/* Dialogue de Confirmation de Suppression */}
                    <Dialog open={deleteDialog.open} onOpenChange={(open) => !open && !isDeleting && setDeleteDialog({ ...deleteDialog, open: false })}>
                        <DialogContent>
                            <DialogHeader>
                                <DialogTitle>Confirmer la suppression</DialogTitle>
                                <DialogDescription>
                                    Êtes-vous sûr de vouloir supprimer <strong>{deleteDialog.title}</strong> ({deleteDialog.type}) ? 
                                    Cette action est irréversible.
                                </DialogDescription>
                            </DialogHeader>

                            {deleteDialog.error && (
                                <div className="p-3 text-sm bg-red-50 border border-red-200 text-red-600 rounded-md flex items-center gap-2 animate-in fade-in zoom-in-95">
                                    <X className="w-4 h-4" />
                                    {deleteDialog.error}
                                </div>
                            )}

                            <DialogFooter className="gap-2 sm:gap-0">
                                <Button variant="outline" disabled={isDeleting} onClick={() => setDeleteDialog({ open: false, id: null, title: "", type: "", error: null })}>Annuler</Button>
                                <Button variant="destructive" disabled={isDeleting} onClick={handleDeleteConfirm}>
                                    {isDeleting ? "Suppression..." : "Supprimer définitivement"}
                                </Button>
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

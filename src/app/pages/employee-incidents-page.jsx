import { useEffect, useMemo, useState } from "react";
import { Link } from "react-router";
import { EmployeeHeader } from "../components/employee-header";
import { Footer } from "../components/footer";
import { EmployeeMessenger } from "../components/employee-messenger";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Badge } from "../components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "../components/ui/tabs";
import { AlertTriangle, Clock, Search, Download, User, Calendar, MapPin, Plus } from "lucide-react";
import { motion } from "motion/react";

const API_URL = import.meta.env.VITE_API_URL || "";

export function EmployeeIncidentsPage() {
  const [incidents, setIncidents] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [filterStatus, setFilterStatus] = useState("tous");
  const [filterType, setFilterType] = useState("tous");

  useEffect(() => {
    let mounted = true;

    async function loadIncidents() {
      try {
        const token = localStorage.getItem("assurance-auth-token");
        const headers = token ? { Authorization: `Bearer ${token}` } : {};
        const res = await fetch(`${API_URL}/api/incidents?page=1&limit=200`, { headers });
        const body = await res.json().catch(() => ({}));
        const items = (body && body.data && (body.data.incidents || body.data)) || body.incidents || body || [];

        if (!mounted) return;

        setIncidents(Array.isArray(items) ? items.map((incident) => ({
          id: incident.id,
          reference: incident.reference,
          title: incident.title,
          description: incident.description,
          clientId: incident.client_id,
          clientName: incident.client_name || "Client",
          clientEmail: incident.client_email || "",
          date: incident.date,
          time: incident.time,
          location: incident.location,
          type: incident.type,
          severity: incident.severity,
          status: incident.status,
          amount: Number(incident.estimated_cost || 0)
        })) : []);
      } catch (error) {
        console.error("Failed to load incidents", error);
      }
    }

    loadIncidents();
    return () => { mounted = false; };
  }, []);

  const filteredIncidents = useMemo(() => incidents.filter((incident) => {
    const haystack = `${incident.title} ${incident.clientName} ${incident.reference}`.toLowerCase();
    const matchesSearch = haystack.includes(searchTerm.toLowerCase());
    const matchesStatus = filterStatus === "tous" || incident.status === filterStatus;
    const matchesType = filterType === "tous" || incident.type === filterType;
    return matchesSearch && matchesStatus && matchesType;
  }), [incidents, searchTerm, filterStatus, filterType]);

  return <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
      <EmployeeHeader />

      <div className="pt-24 pb-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }} className="mb-8">
            <div className="flex items-center justify-between">
              <div>
                <h1 className="text-3xl sm:text-4xl font-bold text-gray-900 mb-2">
                  Gestion des Sinistres
                </h1>
                <p className="text-gray-600">
                  Sinistres synchronises avec les declarations clients
                </p>
              </div>
              <div className="flex gap-3">
                <Link to="/sinistre">
                  <Button className="bg-red-600 hover:bg-red-700 gap-2">
                    <Plus className="w-4 h-4" />
                    Nouveau Sinistre
                  </Button>
                </Link>
                <Button variant="outline" className="gap-2">
                  <Download className="w-4 h-4" />
                  Exporter
                </Button>
              </div>
            </div>
          </motion.div>

          <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }} className="grid grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">Total Sinistres</p><p className="text-2xl font-bold">{incidents.length}</p></Card>
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">En cours</p><p className="text-2xl font-bold">{incidents.filter((incident) => incident.status === "en_cours").length}</p></Card>
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">Traites</p><p className="text-2xl font-bold">{incidents.filter((incident) => incident.status === "traite").length}</p></Card>
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">Cout estime</p><p className="text-2xl font-bold">{incidents.reduce((sum, incident) => sum + incident.amount, 0)} EUR</p></Card>
          </motion.div>

          <Tabs defaultValue="list" className="space-y-6">
            <TabsList className="grid grid-cols-2 lg:w-auto">
              <TabsTrigger value="list">Liste des Sinistres</TabsTrigger>
              <TabsTrigger value="stats">Statistiques</TabsTrigger>
            </TabsList>

            <TabsContent value="list" className="space-y-6">
              <Card className="p-6 border-border">
                <div className="flex flex-col lg:flex-row gap-4">
                  <div className="flex-1 relative">
                    <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <input type="text" placeholder="Rechercher un sinistre..." value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg" />
                  </div>
                  <select value={filterStatus} onChange={(e) => setFilterStatus(e.target.value)} className="px-4 py-2 border border-gray-300 rounded-lg">
                    <option value="tous">Tous</option>
                    <option value="en_cours">En cours</option>
                    <option value="traite">Traite</option>
                    <option value="en_attente">En attente</option>
                  </select>
                  <select value={filterType} onChange={(e) => setFilterType(e.target.value)} className="px-4 py-2 border border-gray-300 rounded-lg">
                    <option value="tous">Tous</option>
                    <option value="auto">Auto</option>
                    <option value="habitation">Habitation</option>
                    <option value="moto">Moto</option>
                  </select>
                </div>
              </Card>

              <div className="grid gap-6">
                {filteredIncidents.map((incident) => <Card key={incident.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                    <div className="grid lg:grid-cols-4 gap-6">
                      <div className="lg:col-span-2">
                        <div className="flex items-center gap-3 mb-3">
                          <Badge variant="outline">{incident.status}</Badge>
                          <Badge variant="outline">{incident.type}</Badge>
                        </div>
                        <h3 className="text-xl font-semibold mb-2">{incident.title}</h3>
                        <p className="text-gray-600 mb-4">{incident.description}</p>

                        <div className="grid grid-cols-2 gap-4 text-sm text-gray-500">
                          <div className="flex items-center gap-2">
                            <User className="w-4 h-4" />
                            <Link to={`/employee/clients/${incident.clientId}`} className="hover:underline">{incident.clientName}</Link>
                          </div>
                          <div className="flex items-center gap-2">
                            <Calendar className="w-4 h-4" />
                            <span>{incident.date}{incident.time ? ` a ${incident.time}` : ""}</span>
                          </div>
                          <div className="flex items-center gap-2">
                            <MapPin className="w-4 h-4" />
                            <span className="line-clamp-1">{incident.location}</span>
                          </div>
                          <div className="flex items-center gap-2">
                            <Clock className="w-4 h-4" />
                            <span>{incident.reference}</span>
                          </div>
                        </div>
                      </div>

                      <div className="lg:col-span-1">
                        <div className="space-y-3">
                          <div className="flex items-center justify-between p-3 bg-gray-50 rounded-lg"><span className="text-sm text-gray-600">Reference</span><span className="font-mono text-sm font-medium">{incident.reference}</span></div>
                          <div className="flex items-center justify-between p-3 bg-gray-50 rounded-lg"><span className="text-sm text-gray-600">Cout estime</span><span className="font-semibold text-lg">{incident.amount} EUR</span></div>
                        </div>
                      </div>

                      <div className="lg:col-span-1 flex flex-col gap-3">
                        <Link to={`/employee/incidents/${incident.id}`}>
                          <Button variant="outline" className="w-full gap-2">
                            <AlertTriangle className="w-4 h-4" />
                            Details
                          </Button>
                        </Link>
                        <Link to={`/employee/clients/${incident.clientId}`}>
                          <Button variant="outline" className="w-full gap-2">Voir le client</Button>
                        </Link>
                      </div>
                    </div>
                  </Card>)}
              </div>
            </TabsContent>

            <TabsContent value="stats" className="space-y-6">
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-2">En cours</p><p className="text-3xl font-bold">{incidents.filter((incident) => incident.status === "en_cours").length}</p></Card>
                <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-2">Cout total</p><p className="text-3xl font-bold">{incidents.reduce((sum, incident) => sum + incident.amount, 0)} EUR</p></Card>
              </div>
            </TabsContent>
          </Tabs>
        </div>
      </div>

      <EmployeeMessenger />
      <Footer />
    </div>;
}

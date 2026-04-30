import { useEffect, useMemo, useState } from "react";
import { Link } from "react-router";
import { EmployeeHeader } from "../components/employee-header";
import { Footer } from "../components/footer";
import { EmployeeMessenger } from "../components/employee-messenger";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Badge } from "../components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "../components/ui/tabs";
import { FileText, Plus, Search, Download, Calendar, Mail, Phone, DollarSign, Clock, Car, Home, Shield } from "lucide-react";
import { motion } from "motion/react";

const API_URL = import.meta.env.VITE_API_URL || "";

export function EmployeeQuotesPage() {
  const [quotes, setQuotes] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [filterStatus, setFilterStatus] = useState("tous");
  const [filterType, setFilterType] = useState("tous");

  useEffect(() => {
    let mounted = true;

    async function loadQuotes() {
      try {
        const token = localStorage.getItem("assurance-auth-token");
        const headers = token ? { Authorization: `Bearer ${token}` } : {};
        const res = await fetch(`${API_URL}/api/quotes?page=1&limit=200`, { headers });
        const body = await res.json().catch(() => ({}));
        const items = (body && body.data && (body.data.quotes || body.data)) || body.quotes || body || [];

        if (!mounted) return;

        setQuotes(Array.isArray(items) ? items.map((quote) => ({
          id: quote.id,
          reference: quote.reference,
          clientId: quote.client_id,
          clientName: quote.client_name || "Client",
          clientEmail: quote.client_email || "",
          clientPhone: quote.phone || "",
          type: quote.type,
          amount: Number(quote.amount || 0),
          status: quote.status,
          coverage: typeof quote.coverage_details === "object" ? quote.coverage_details?.coverage : quote.coverage_details,
          deductible: Number(quote.deductible || 0),
          createdAt: quote.created_at,
          expiryDate: quote.created_at,
          vehicleLabel: quote.vehicle_details?.brand ? `${quote.vehicle_details.brand} ${quote.vehicle_details.model || ""}`.trim() : "",
          propertyLabel: quote.property_details?.superficie ? `Surface ${quote.property_details.superficie}` : ""
        })) : []);
      } catch (error) {
        console.error("Failed to load quotes", error);
      }
    }

    loadQuotes();
    return () => { mounted = false; };
  }, []);

  const filteredQuotes = useMemo(() => quotes.filter((quote) => {
    const haystack = `${quote.clientName} ${quote.clientEmail} ${quote.reference}`.toLowerCase();
    const matchesSearch = haystack.includes(searchTerm.toLowerCase());
    const matchesStatus = filterStatus === "tous" || quote.status === filterStatus;
    const matchesType = filterType === "tous" || quote.type === filterType;
    return matchesSearch && matchesStatus && matchesType;
  }), [quotes, searchTerm, filterStatus, filterType]);

  const getTypeIcon = (type) => {
    switch (type) {
      case "auto": return Car;
      case "habitation": return Home;
      case "moto": return Shield;
      default: return FileText;
    }
  };

  return <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
      <EmployeeHeader />

      <div className="pt-24 pb-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }} className="mb-8">
            <div className="flex items-center justify-between">
              <div>
                <h1 className="text-3xl sm:text-4xl font-bold text-gray-900 mb-2">
                  Gestion des Devis
                </h1>
                <p className="text-gray-600">
                  Devis clients synchronises avec les parcours du dashboard
                </p>
              </div>
              <div className="flex gap-3">
                <Link to="/employee/quotes/new">
                  <Button className="bg-green-600 hover:bg-green-700 gap-2">
                    <Plus className="w-4 h-4" />
                    Nouveau Devis
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
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">Total Devis</p><p className="text-2xl font-bold">{quotes.length}</p></Card>
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">Acceptes</p><p className="text-2xl font-bold">{quotes.filter((quote) => quote.status === "accepte").length}</p></Card>
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">En attente</p><p className="text-2xl font-bold">{quotes.filter((quote) => quote.status === "envoye" || quote.status === "en_attente").length}</p></Card>
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">Montant moyen</p><p className="text-2xl font-bold">{quotes.length ? Math.round(quotes.reduce((sum, quote) => sum + quote.amount, 0) / quotes.length) : 0} EUR</p></Card>
          </motion.div>

          <Tabs defaultValue="quotes" className="space-y-6">
            <TabsList className="grid grid-cols-3 lg:w-auto">
              <TabsTrigger value="quotes">Liste des Devis</TabsTrigger>
              <TabsTrigger value="pending">A relancer</TabsTrigger>
              <TabsTrigger value="analytics">Statistiques</TabsTrigger>
            </TabsList>

            <TabsContent value="quotes" className="space-y-6">
              <Card className="p-6 border-border">
                <div className="flex flex-col lg:flex-row gap-4">
                  <div className="flex-1 relative">
                    <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                    <input type="text" placeholder="Rechercher un devis..." value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg" />
                  </div>
                  <select value={filterStatus} onChange={(e) => setFilterStatus(e.target.value)} className="px-4 py-2 border border-gray-300 rounded-lg">
                    <option value="tous">Tous</option>
                    <option value="envoye">Envoye</option>
                    <option value="en_attente">En attente</option>
                    <option value="accepte">Accepte</option>
                    <option value="refuse">Refuse</option>
                    <option value="expire">Expire</option>
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
                {filteredQuotes.map((quote) => {
                  const TypeIcon = getTypeIcon(quote.type);
                  return <Card key={quote.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                      <div className="grid lg:grid-cols-4 gap-6">
                        <div className="lg:col-span-2">
                          <div className="flex items-center gap-3 mb-3">
                            <div className="w-10 h-10 bg-primary/10 rounded-xl flex items-center justify-center">
                              <TypeIcon className="w-5 h-5 text-primary" />
                            </div>
                            <Link to={`/employee/clients/${quote.clientId}`} className="flex-1 hover:underline">
                              <div>
                                <h3 className="text-lg font-semibold">{quote.clientName}</h3>
                                <p className="text-sm text-gray-500">{quote.vehicleLabel || quote.propertyLabel || quote.type}</p>
                              </div>
                            </Link>
                          </div>

                          <div className="flex items-center gap-3 mb-3">
                            <Badge variant="outline">{quote.status}</Badge>
                            <Badge variant="outline">{quote.coverage || "Couverture"}</Badge>
                          </div>

                          <div className="grid grid-cols-2 gap-4 text-sm text-gray-500">
                            <div className="flex items-center gap-2"><Calendar className="w-4 h-4" /><span>{new Date(quote.createdAt).toLocaleDateString("fr-FR")}</span></div>
                            <div className="flex items-center gap-2"><Clock className="w-4 h-4" /><span>{quote.reference}</span></div>
                            <Link to={`/employee/clients/${quote.clientId}`} className="flex items-center gap-2 hover:underline"><Mail className="w-4 h-4" /><span className="truncate">{quote.clientEmail}</span></Link>
                            <Link to={`/employee/clients/${quote.clientId}`} className="flex items-center gap-2 hover:underline"><Phone className="w-4 h-4" /><span>{quote.clientPhone || "Non renseigne"}</span></Link>
                          </div>
                        </div>

                        <div className="lg:col-span-1">
                          <div className="space-y-3">
                            <div className="p-3 bg-gray-50 rounded-lg"><p className="text-sm text-gray-600">Montant</p><p className="font-semibold text-xl text-green-600">{quote.amount} EUR</p></div>
                            <div className="p-3 bg-gray-50 rounded-lg"><p className="text-sm text-gray-600">Franchise</p><p className="font-medium">{quote.deductible} EUR</p></div>
                          </div>
                        </div>

                        <div className="lg:col-span-1 flex flex-col gap-3">
                          <Link to={`/employee/clients/${quote.clientId}`}>
                            <Button variant="outline" className="w-full gap-2">Voir le client</Button>
                          </Link>
                        </div>
                      </div>
                    </Card>;
                })}
              </div>
            </TabsContent>

            <TabsContent value="pending" className="space-y-6">
              <div className="grid gap-6">
                {quotes.filter((quote) => quote.status === "envoye" || quote.status === "en_attente").map((quote) => <Card key={quote.id} className="p-6 border-border">
                    <div className="flex items-center justify-between">
                      <div>
                        <Link to={`/employee/clients/${quote.clientId}`} className="text-lg font-semibold hover:underline">{quote.clientName}</Link>
                        <p className="text-sm text-gray-500">{quote.reference}</p>
                      </div>
                      <p className="font-bold">{quote.amount} EUR</p>
                    </div>
                  </Card>)}
              </div>
            </TabsContent>

            <TabsContent value="analytics" className="space-y-6">
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-2">Acceptes</p><p className="text-3xl font-bold">{quotes.filter((quote) => quote.status === "accepte").length}</p></Card>
                <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-2">Revenus potentiels</p><p className="text-3xl font-bold">{quotes.reduce((sum, quote) => sum + quote.amount, 0)} EUR</p></Card>
              </div>
            </TabsContent>
          </Tabs>
        </div>
      </div>

      <EmployeeMessenger />
      <Footer />
    </div>;
}

import { useEffect, useMemo, useState } from "react";
import { Link } from "react-router";
import { EmployeeHeader } from "../components/employee-header";
import { Footer } from "../components/footer";
import { EmployeeMessenger } from "../components/employee-messenger";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Badge } from "../components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "../components/ui/tabs";
import { FileText, CheckCircle, Clock, Search, Download, Plus, Car, Home, Shield } from "lucide-react";
import { motion } from "motion/react";

const API_URL = import.meta.env.VITE_API_URL || "";

export function EmployeeNewContractsPage() {
  const [contracts, setContracts] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [filterStatus, setFilterStatus] = useState("tous");
  const [filterType, setFilterType] = useState("tous");

  useEffect(() => {
    let mounted = true;

    async function loadContracts() {
      try {
        const token = localStorage.getItem("assurance-auth-token");
        const headers = token ? { Authorization: `Bearer ${token}` } : {};
        const res = await fetch(`${API_URL}/api/contracts?page=1&limit=200`, { headers });
        const body = await res.json().catch(() => ({}));
        const items = (body && body.data && (body.data.contracts || body.data)) || body.contracts || body || [];

        if (!mounted) return;

        setContracts(Array.isArray(items) ? items.map((contract) => ({
          id: contract.id,
          clientId: contract.client_id,
          clientName: contract.client_name || "Client",
          clientEmail: contract.client_email || "",
          type: contract.type,
          amount: Number(contract.annual_amount || 0),
          status: contract.status,
          paymentMethod: contract.payment_method,
          reference: contract.policy_number,
          startDate: contract.start_date,
          endDate: contract.end_date,
          vehicleLabel: contract.vehicle_info?.brand ? `${contract.vehicle_info.brand} ${contract.vehicle_info.model || ""}`.trim() : "",
          propertyLabel: contract.property_info?.address || ""
        })) : []);
      } catch (error) {
        console.error("Failed to load contracts", error);
      }
    }

    loadContracts();
    return () => { mounted = false; };
  }, []);

  const filteredContracts = useMemo(() => contracts.filter((contract) => {
    const haystack = `${contract.clientName} ${contract.clientEmail} ${contract.reference}`.toLowerCase();
    const matchesSearch = haystack.includes(searchTerm.toLowerCase());
    const matchesStatus = filterStatus === "tous" || contract.status === filterStatus;
    const matchesType = filterType === "tous" || contract.type === filterType;
    return matchesSearch && matchesStatus && matchesType;
  }), [contracts, searchTerm, filterStatus, filterType]);

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
                  Nouveaux Contrats
                </h1>
                <p className="text-gray-600">
                  Contrats issus des devis et paiements clients
                </p>
              </div>
              <div className="flex gap-3">
                <Link to="/employee/quotes/new">
                  <Button className="bg-blue-600 hover:bg-blue-700 gap-2">
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
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">Total Contrats</p><p className="text-2xl font-bold">{contracts.length}</p></Card>
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">Actifs</p><p className="text-2xl font-bold">{contracts.filter((contract) => contract.status === "actif").length}</p></Card>
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">En attente</p><p className="text-2xl font-bold">{contracts.filter((contract) => contract.status === "en_attente").length}</p></Card>
            <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-1">Montant annuel</p><p className="text-2xl font-bold">{contracts.reduce((sum, contract) => sum + contract.amount, 0)} EUR</p></Card>
          </motion.div>

          <Tabs defaultValue="contracts" className="space-y-6">
            <TabsList className="grid grid-cols-3 lg:w-auto">
              <TabsTrigger value="contracts">Liste des Contrats</TabsTrigger>
              <TabsTrigger value="pending">En attente</TabsTrigger>
              <TabsTrigger value="analytics">Statistiques</TabsTrigger>
            </TabsList>

            <TabsContent value="contracts" className="space-y-6">
              <Card className="p-6 border-border">
                <div className="flex flex-col lg:flex-row gap-4">
                  <input type="text" placeholder="Rechercher un contrat..." value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} className="flex-1 px-4 py-2 border border-gray-300 rounded-lg" />
                  <select value={filterStatus} onChange={(e) => setFilterStatus(e.target.value)} className="px-4 py-2 border border-gray-300 rounded-lg">
                    <option value="tous">Tous</option>
                    <option value="actif">Actif</option>
                    <option value="en_attente">En attente</option>
                    <option value="annule">Annule</option>
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
                {filteredContracts.map((contract) => {
                  const TypeIcon = getTypeIcon(contract.type);
                  return <Card key={contract.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                      <div className="grid lg:grid-cols-4 gap-6">
                        <div className="lg:col-span-2">
                          <div className="flex items-center gap-3 mb-3">
                            <div className="w-10 h-10 bg-primary/10 rounded-xl flex items-center justify-center">
                              <TypeIcon className="w-5 h-5 text-primary" />
                            </div>
                            <div>
                              <Link to={`/employee/clients/${contract.clientId}`} className="text-lg font-semibold hover:underline">{contract.clientName}</Link>
                              <p className="text-sm text-gray-500">{contract.vehicleLabel || contract.propertyLabel || contract.type}</p>
                            </div>
                          </div>
                          <div className="flex items-center gap-3 mb-3">
                            <Badge variant="outline">{contract.status}</Badge>
                            <Badge variant="outline">{contract.paymentMethod || "mensuel"}</Badge>
                          </div>
                          <p className="text-sm text-gray-500">{contract.reference}</p>
                        </div>

                        <div className="lg:col-span-1">
                          <div className="space-y-3">
                            <div className="flex items-center justify-between p-3 bg-gray-50 rounded-lg"><span className="text-sm text-gray-600">Montant</span><span className="font-semibold">{contract.amount} EUR</span></div>
                            <div className="flex items-center justify-between p-3 bg-gray-50 rounded-lg"><span className="text-sm text-gray-600">Debut</span><span className="font-medium">{contract.startDate}</span></div>
                            <div className="flex items-center justify-between p-3 bg-gray-50 rounded-lg"><span className="text-sm text-gray-600">Fin</span><span className="font-medium">{contract.endDate}</span></div>
                          </div>
                        </div>

                        <div className="lg:col-span-1 flex flex-col gap-3">
                          <Link to={`/employee/contracts/${contract.id}`}>
                            <Button variant="outline" className="w-full gap-2">Voir details</Button>
                          </Link>
                          <Link to={`/employee/clients/${contract.clientId}`}>
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
                {contracts.filter((contract) => contract.status === "en_attente").map((contract) => <Card key={contract.id} className="p-6 border-border">
                    <div className="flex items-center justify-between">
                      <div>
                        <Link to={`/employee/clients/${contract.clientId}`} className="text-lg font-semibold hover:underline">{contract.clientName}</Link>
                        <p className="text-sm text-gray-500">{contract.reference}</p>
                      </div>
                      <Badge className="bg-yellow-100 text-yellow-800 border-yellow-200">
                        <Clock className="w-3 h-3 mr-1" />
                        En attente
                      </Badge>
                    </div>
                  </Card>)}
              </div>
            </TabsContent>

            <TabsContent value="analytics" className="space-y-6">
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-2">Actifs</p><p className="text-3xl font-bold">{contracts.filter((contract) => contract.status === "actif").length}</p></Card>
                <Card className="p-6 border-border"><p className="text-sm text-gray-600 mb-2">Montant annuel</p><p className="text-3xl font-bold">{contracts.reduce((sum, contract) => sum + contract.amount, 0)} EUR</p></Card>
              </div>
            </TabsContent>
          </Tabs>
        </div>
      </div>

      <EmployeeMessenger />
      <Footer />
    </div>;
}

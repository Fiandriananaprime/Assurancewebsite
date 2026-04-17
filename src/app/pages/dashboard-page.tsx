import { useState } from "react";
import { Link } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "../components/ui/tabs";
import { Badge } from "../components/ui/badge";
import {
  Shield,
  FileText,
  Download,
  AlertTriangle,
  CreditCard,
  User,
  Calendar,
  CheckCircle2,
  Car,
  Home,
  Plus,
} from "lucide-react";
import { motion } from "motion/react";

interface Contract {
  id: string;
  type: "auto" | "moto" | "habitation";
  title: string;
  status: "active" | "pending";
  price: number;
  startDate: string;
  nextPayment: string;
}

interface Payment {
  id: string;
  date: string;
  amount: number;
  status: "paid" | "pending";
  method: string;
}

export function DashboardPage() {
  const [contracts] = useState<Contract[]>([
    {
      id: "CNT-001",
      type: "auto",
      title: "Renault Clio - Formule Premium",
      status: "active",
      price: 35,
      startDate: "01/01/2026",
      nextPayment: "01/05/2026",
    },
    {
      id: "CNT-002",
      type: "habitation",
      title: "Appartement Paris 15ème",
      status: "active",
      price: 12,
      startDate: "15/02/2026",
      nextPayment: "15/05/2026",
    },
  ]);

  const [payments] = useState<Payment[]>([
    {
      id: "PAY-001",
      date: "01/04/2026",
      amount: 35,
      status: "paid",
      method: "Carte bancaire",
    },
    {
      id: "PAY-002",
      date: "15/04/2026",
      amount: 12,
      status: "paid",
      method: "Carte bancaire",
    },
    {
      id: "PAY-003",
      date: "01/03/2026",
      amount: 35,
      status: "paid",
      method: "Carte bancaire",
    },
  ]);

  return (
    <div className="min-h-screen bg-secondary/30">
      <Header />

      <div className="pt-24 sm:pt-32 pb-16 sm:pb-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          {/* Header */}
          <motion.div
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            className="mb-8 sm:mb-12"
          >
            <h1 className="text-3xl sm:text-4xl font-bold mb-2">
              Tableau de bord
            </h1>
            <p className="text-lg text-muted-foreground">
              Gérez vos contrats et suivez vos paiements
            </p>
          </motion.div>

          {/* Quick Stats */}
          <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-6 mb-8">
            {[
              {
                icon: Shield,
                label: "Contrats actifs",
                value: contracts.filter((c) => c.status === "active").length.toString(),
                color: "text-primary",
                bg: "bg-primary/10",
              },
              {
                icon: CreditCard,
                label: "Paiement mensuel",
                value: `${contracts.reduce((sum, c) => sum + c.price, 0)}€`,
                color: "text-blue-600",
                bg: "bg-blue-100",
              },
              {
                icon: FileText,
                label: "Documents",
                value: "8",
                color: "text-purple-600",
                bg: "bg-purple-100",
              },
              {
                icon: AlertTriangle,
                label: "Sinistres",
                value: "0",
                color: "text-green-600",
                bg: "bg-green-100",
              },
            ].map((stat, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: index * 0.1 }}
              >
                <Card className="p-6 border-border hover:shadow-lg transition-shadow">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-muted-foreground mb-1">{stat.label}</p>
                      <p className="text-3xl font-bold">{stat.value}</p>
                    </div>
                    <div className={`w-12 h-12 ${stat.bg} rounded-xl flex items-center justify-center`}>
                      <stat.icon className={`w-6 h-6 ${stat.color}`} />
                    </div>
                  </div>
                </Card>
              </motion.div>
            ))}
          </div>

          {/* Main Content Tabs */}
          <Tabs defaultValue="contracts" className="space-y-6">
            <TabsList className="grid w-full grid-cols-3 lg:w-auto">
              <TabsTrigger value="contracts">Mes contrats</TabsTrigger>
              <TabsTrigger value="payments">Paiements</TabsTrigger>
              <TabsTrigger value="profile">Mon profil</TabsTrigger>
            </TabsList>

            {/* Contracts Tab */}
            <TabsContent value="contracts" className="space-y-6">
              <div className="flex items-center justify-between">
                <h2 className="text-2xl font-semibold">Mes contrats</h2>
                <Link to="/devis">
                  <Button className="bg-primary hover:bg-primary/90 gap-2">
                    <Plus className="w-4 h-4" />
                    Nouveau contrat
                  </Button>
                </Link>
              </div>

              <div className="grid lg:grid-cols-2 gap-6">
                {contracts.map((contract) => (
                  <Card
                    key={contract.id}
                    className="p-6 border-border hover:shadow-lg transition-shadow"
                  >
                    <div className="flex items-start justify-between mb-4">
                      <div className="flex items-center gap-3">
                        <div className="w-12 h-12 bg-accent rounded-xl flex items-center justify-center">
                          {contract.type === "auto" && <Car className="w-6 h-6 text-primary" />}
                          {contract.type === "habitation" && <Home className="w-6 h-6 text-primary" />}
                        </div>
                        <div>
                          <h3 className="font-semibold">{contract.title}</h3>
                          <p className="text-sm text-muted-foreground">N° {contract.id}</p>
                        </div>
                      </div>
                      <Badge
                        variant={contract.status === "active" ? "default" : "secondary"}
                        className={contract.status === "active" ? "bg-primary" : ""}
                      >
                        {contract.status === "active" ? "Actif" : "En attente"}
                      </Badge>
                    </div>

                    <div className="space-y-3 mb-6">
                      <div className="flex items-center justify-between text-sm">
                        <span className="text-muted-foreground">Cotisation mensuelle</span>
                        <span className="font-semibold">{contract.price}€/mois</span>
                      </div>
                      <div className="flex items-center justify-between text-sm">
                        <span className="text-muted-foreground">Date de début</span>
                        <span className="font-medium">{contract.startDate}</span>
                      </div>
                      <div className="flex items-center justify-between text-sm">
                        <span className="text-muted-foreground">Prochain prélèvement</span>
                        <span className="font-medium">{contract.nextPayment}</span>
                      </div>
                    </div>

                    <div className="flex gap-2">
                      <Button variant="outline" size="sm" className="flex-1 gap-2">
                        <FileText className="w-4 h-4" />
                        Détails
                      </Button>
                      <Button variant="outline" size="sm" className="flex-1 gap-2">
                        <Download className="w-4 h-4" />
                        Télécharger
                      </Button>
                    </div>
                  </Card>
                ))}
              </div>

              <Card className="p-6 sm:p-8 border-2 border-dashed border-border hover:border-primary/50 transition-colors cursor-pointer">
                <div className="text-center">
                  <div className="w-16 h-16 bg-accent rounded-full flex items-center justify-center mx-auto mb-4">
                    <Plus className="w-8 h-8 text-primary" />
                  </div>
                  <h3 className="font-semibold mb-2">Ajouter un nouveau contrat</h3>
                  <p className="text-sm text-muted-foreground mb-4">
                    Assurez un nouveau véhicule ou votre habitation
                  </p>
                  <Link to="/devis">
                    <Button variant="outline">Obtenir un devis</Button>
                  </Link>
                </div>
              </Card>
            </TabsContent>

            {/* Payments Tab */}
            <TabsContent value="payments" className="space-y-6">
              <div className="flex items-center justify-between">
                <h2 className="text-2xl font-semibold">Historique des paiements</h2>
                <Button variant="outline" className="gap-2">
                  <Download className="w-4 h-4" />
                  Exporter
                </Button>
              </div>

              <Card className="border-border">
                <div className="overflow-x-auto">
                  <table className="w-full">
                    <thead>
                      <tr className="border-b border-border">
                        <th className="text-left p-4 text-sm font-medium text-muted-foreground">
                          Date
                        </th>
                        <th className="text-left p-4 text-sm font-medium text-muted-foreground">
                          Référence
                        </th>
                        <th className="text-left p-4 text-sm font-medium text-muted-foreground">
                          Montant
                        </th>
                        <th className="text-left p-4 text-sm font-medium text-muted-foreground">
                          Méthode
                        </th>
                        <th className="text-left p-4 text-sm font-medium text-muted-foreground">
                          Statut
                        </th>
                        <th className="text-right p-4 text-sm font-medium text-muted-foreground">
                          Actions
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      {payments.map((payment) => (
                        <tr key={payment.id} className="border-b border-border hover:bg-accent/50 transition-colors">
                          <td className="p-4">
                            <div className="flex items-center gap-2">
                              <Calendar className="w-4 h-4 text-muted-foreground" />
                              <span className="text-sm">{payment.date}</span>
                            </div>
                          </td>
                          <td className="p-4 text-sm font-medium">{payment.id}</td>
                          <td className="p-4 text-sm font-semibold">{payment.amount}€</td>
                          <td className="p-4 text-sm text-muted-foreground">{payment.method}</td>
                          <td className="p-4">
                            <Badge
                              variant={payment.status === "paid" ? "default" : "secondary"}
                              className={`${
                                payment.status === "paid"
                                  ? "bg-green-100 text-green-700 hover:bg-green-100"
                                  : ""
                              }`}
                            >
                              <CheckCircle2 className="w-3 h-3 mr-1" />
                              {payment.status === "paid" ? "Payé" : "En attente"}
                            </Badge>
                          </td>
                          <td className="p-4 text-right">
                            <Button variant="ghost" size="sm" className="gap-2">
                              <Download className="w-4 h-4" />
                              Reçu
                            </Button>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </Card>
            </TabsContent>

            {/* Profile Tab */}
            <TabsContent value="profile" className="space-y-6">
              <h2 className="text-2xl font-semibold">Mon profil</h2>

              <div className="grid lg:grid-cols-2 gap-6">
                <Card className="p-6 sm:p-8 border-border">
                  <div className="flex items-center gap-4 mb-6">
                    <div className="w-20 h-20 bg-primary/10 rounded-full flex items-center justify-center">
                      <User className="w-10 h-10 text-primary" />
                    </div>
                    <div>
                      <h3 className="text-xl font-semibold">Jean Dupont</h3>
                      <p className="text-muted-foreground">jean.dupont@example.com</p>
                    </div>
                  </div>

                  <div className="space-y-4">
                    <div>
                      <p className="text-sm text-muted-foreground mb-1">Téléphone</p>
                      <p className="font-medium">+33 6 12 34 56 78</p>
                    </div>
                    <div>
                      <p className="text-sm text-muted-foreground mb-1">Adresse</p>
                      <p className="font-medium">123 Rue de la Paix</p>
                      <p className="font-medium">75001 Paris, France</p>
                    </div>
                    <div>
                      <p className="text-sm text-muted-foreground mb-1">Membre depuis</p>
                      <p className="font-medium">Janvier 2026</p>
                    </div>
                  </div>

                  <Button className="w-full mt-6" variant="outline">
                    Modifier mes informations
                  </Button>
                </Card>

                <div className="space-y-6">
                  <Card className="p-6 sm:p-8 border-border">
                    <h3 className="font-semibold mb-4">Actions rapides</h3>
                    <div className="space-y-3">
                      <Link to="/sinistre" className="block">
                        <Button variant="outline" className="w-full justify-start gap-3">
                          <AlertTriangle className="w-5 h-5 text-destructive" />
                          Déclarer un sinistre
                        </Button>
                      </Link>
                      <Button variant="outline" className="w-full justify-start gap-3">
                        <FileText className="w-5 h-5 text-primary" />
                        Télécharger mes attestations
                      </Button>
                      <Button variant="outline" className="w-full justify-start gap-3">
                        <CreditCard className="w-5 h-5 text-primary" />
                        Gérer mes moyens de paiement
                      </Button>
                    </div>
                  </Card>

                  <Card className="p-6 sm:p-8 border-border bg-accent/50">
                    <h3 className="font-semibold mb-2">Besoin d'aide ?</h3>
                    <p className="text-sm text-muted-foreground mb-4">
                      Notre équipe est disponible 24/7 pour vous assister
                    </p>
                    <Button className="w-full bg-primary hover:bg-primary/90">
                      Contacter le support
                    </Button>
                  </Card>
                </div>
              </div>
            </TabsContent>
          </Tabs>
        </div>
      </div>

      <Footer />
    </div>
  );
}

import React, { useMemo, useState, useEffect } from "react";
import { useNavigate } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Label } from "../components/ui/label";
import { Input } from "../components/ui/input";
import { Separator } from "../components/ui/separator";
import { CreditCard, Lock, CheckCircle2, Smartphone, FileText } from "lucide-react";
import { motion } from "motion/react";
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription, DialogFooter } from "../components/ui/dialog";

const API_URL = import.meta.env.VITE_API_URL || "";

function readPendingQuote() {
  try {
    const raw = localStorage.getItem("assurance-pending-quote");
    return raw ? JSON.parse(raw) : null;
  } catch (error) {
    console.warn("Failed to read pending quote", error);
    return null;
  }
}

export function PaymentPage() {
  const navigate = useNavigate();
  const [paymentMethod, setPaymentMethod] = useState("card");
  const [isProcessing, setIsProcessing] = useState(false);
  const [billing, setBilling] = useState({
    firstName: "",
    lastName: "",
    email: "",
    address: "",
    city: "",
    postalCode: ""
  });

  // Load billing from localStorage if present

  // Properly load billing once on mount
  useEffect(() => {
    try {
      const raw = localStorage.getItem('assurance-billing');
      if (raw) {
        const parsed = JSON.parse(raw);
        setBilling((prev) => ({ ...prev, ...parsed }));
      }
    } catch (e) {
      // ignore
    }
  }, []);

  // Persist billing whenever it changes
  const saveBillingToLocal = (b) => {
    try {
      localStorage.setItem('assurance-billing', JSON.stringify(b || {}));
    } catch (e) {
      console.warn('Failed to persist billing', e);
    }
  };

  useEffect(() => {
    saveBillingToLocal(billing);
  }, [billing]);


  const pendingQuote = useMemo(() => readPendingQuote(), []);
  const contractPrice = Number(pendingQuote?.amount || 0);
  const coverageLabel = pendingQuote?.coverage_details?.coverage || "standard";
  const typeLabel = pendingQuote?.type === "habitation" ? "Assurance Habitation" : pendingQuote?.type === "moto" ? "Assurance Moto" : "Assurance Auto";
  const contractDescription = pendingQuote?.vehicle_details
    ? [pendingQuote.vehicle_details.brand, pendingQuote.vehicle_details.model, pendingQuote.vehicle_details.year].filter(Boolean).join(" ")
    : pendingQuote?.property_details
      ? "Contrat habitation"
      : "Contrat a finaliser";

  const handlePayment = async () => {
    if (!pendingQuote?.id) {
      // Use dialog for user-friendly message
      window.dispatchEvent(new CustomEvent('show_dialog', {
        detail: {
          title: 'Aucun devis',
          description: "Aucun devis enregistré n'est prêt pour le paiement.",
          actions: [{ label: 'Retour au devis', action: () => navigate('/devis') }]
        }
      }));
      navigate("/devis");
      return;
    }

    setIsProcessing(true);
    try {
      const token = localStorage.getItem("assurance-auth-token");
      const startDate = new Date().toISOString().slice(0, 10);
      const res = await fetch(`${API_URL}/api/contracts/from-quote`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          ...(token ? { Authorization: `Bearer ${token}` } : {})
        },
        body: JSON.stringify({
          quote_id: pendingQuote.id,
          start_date: startDate,
          payment_method: paymentMethod === "mobile" ? "mobile_money" : "mensuel",
          billing
        })
      });

      const data = await res.json().catch(() => ({}));
      if (!res.ok) {
        if (res.status === 401) {
          window.dispatchEvent(new CustomEvent('show_dialog', {
            detail: {
              title: 'Connexion requise',
              description: 'Vous devez vous connecter pour finaliser ce contrat.',
              actions: [{ label: 'Se connecter', action: () => navigate('/login') }]
            }
          }));
          navigate("/login");
          return;
        }
        throw new Error(data?.message || "Erreur lors de la creation du contrat");
      }

      // Contract created successfully — clear pending quote and notify UI
      localStorage.removeItem("assurance-pending-quote");

      const created = data.data || data || {};
      // Save a simulated copy locally so dashboards can show it immediately
      try {
        const raw = localStorage.getItem('assurance-simulated-contracts');
        const list = raw ? JSON.parse(raw) : [];
        // normalize: ensure client_id and id exist
        const sim = {
          id: created.id || `SIM-${Date.now()}`,
          client_id: created.client_id || created.clientId || (created.client && created.client.id) || null,
          start_date: created.start_date || created.startDate || new Date().toISOString().slice(0,10),
          end_date: created.end_date || created.endDate || null,
          annual_amount: created.annual_amount || created.price || created.amount || contractPrice,
          type: created.type || pendingQuote?.type || 'auto',
          status: created.status || 'actif',
          policy_number: created.policy_number || created.policyNumber || null,
          createdAt: created.createdAt || new Date().toISOString()
        };
        list.push(sim);
        localStorage.setItem('assurance-simulated-contracts', JSON.stringify(list));
      } catch (e) {
        console.warn('Failed to save simulated contract', e);
      }

      // dispatch a global event so dashboard components can refresh immediately
      window.dispatchEvent(new CustomEvent('contract_created', { detail: { contract: created } }));
      // Show success dialog
      window.dispatchEvent(new CustomEvent('show_dialog', {
        detail: {
          title: 'Contrat créé',
          description: 'Votre contrat a été créé avec succès. Il est maintenant visible dans votre tableau de bord.',
          actions: [{ label: 'Aller au tableau de bord', action: () => navigate('/dashboard') }]
        }
      }));
    } catch (error) {
      console.error("Payment finalization failed", error);
      window.dispatchEvent(new CustomEvent('show_dialog', {
        detail: {
          title: 'Paiement échoué',
          description: "Le paiement n'a pas pu être finalisé. Veuillez réessayer plus tard.",
          actions: [{ label: 'Fermer', action: () => {} }]
        }
      }));
    } finally {
      setIsProcessing(false);
    }
  };

  return <div className="min-h-screen bg-secondary/30">
      <Header />

      <div className="pt-24 sm:pt-32 pb-16 sm:pb-24">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }} className="text-center mb-8 sm:mb-12">
            <h1 className="text-3xl sm:text-4xl font-bold mb-4">
              Finalisation du paiement
            </h1>
            <p className="text-lg text-muted-foreground">
              Finalisez votre devis pour activer le contrat et le synchroniser cote employe
            </p>
          </motion.div>

          <div className="grid lg:grid-cols-3 gap-8">
            <div className="lg:col-span-2 space-y-6">
              <Card className="p-6 sm:p-8 border-border shadow-lg">
                <h2 className="text-xl font-semibold mb-6">Mode de paiement</h2>

                <div className="grid sm:grid-cols-2 gap-4 mb-6">
                  <button onClick={() => setPaymentMethod("card")} className={`p-4 rounded-xl border-2 transition-all ${paymentMethod === "card" ? "border-primary bg-accent" : "border-border bg-white hover:border-primary/50"}`}>
                    <div className="flex items-center gap-3">
                      <CreditCard className="w-6 h-6 text-primary" />
                      <div className="text-left">
                        <p className="font-medium">Carte bancaire</p>
                        <p className="text-xs text-muted-foreground">Paiement mensuel</p>
                      </div>
                    </div>
                  </button>

                  <button onClick={() => setPaymentMethod("mobile")} className={`p-4 rounded-xl border-2 transition-all ${paymentMethod === "mobile" ? "border-primary bg-accent" : "border-border bg-white hover:border-primary/50"}`}>
                    <div className="flex items-center gap-3">
                      <Smartphone className="w-6 h-6 text-primary" />
                      <div className="text-left">
                        <p className="font-medium">Mobile Money</p>
                        <p className="text-xs text-muted-foreground">Activation immediate</p>
                      </div>
                    </div>
                  </button>
                </div>

                <div className="mt-6 p-4 bg-accent/50 rounded-xl border border-primary/20">
                  <div className="flex gap-3">
                    <Lock className="w-5 h-5 text-primary flex-shrink-0" />
                    <div className="text-sm">
                      <p className="font-medium text-primary mb-1">Paiement securise</p>
                      <p className="text-muted-foreground">
                        Une fois valide, le contrat sera cree depuis votre devis et visible dans les vues employe.
                      </p>
                    </div>
                  </div>
                </div>
              </Card>

              <Card className="p-6 sm:p-8 border-border shadow-lg">
                <h2 className="text-xl font-semibold mb-6">Adresse de facturation</h2>

                <div className="space-y-4">
                  <div className="grid sm:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="firstName">Prenom</Label>
                      <Input id="firstName" value={billing.firstName} onChange={(e) => setBilling((prev) => ({ ...prev, firstName: e.target.value }))} placeholder="Jean" />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="lastName">Nom</Label>
                      <Input id="lastName" value={billing.lastName} onChange={(e) => setBilling((prev) => ({ ...prev, lastName: e.target.value }))} placeholder="Dupont" />
                    </div>
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="email">Email</Label>
                    <Input id="email" type="email" value={billing.email} onChange={(e) => setBilling((prev) => ({ ...prev, email: e.target.value }))} placeholder="jean.dupont@example.com" />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="address">Adresse</Label>
                    <Input id="address" value={billing.address} onChange={(e) => setBilling((prev) => ({ ...prev, address: e.target.value }))} placeholder="123 Rue de la Paix" />
                  </div>

                  <div className="grid sm:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="city">Ville</Label>
                      <Input id="city" value={billing.city} onChange={(e) => setBilling((prev) => ({ ...prev, city: e.target.value }))} placeholder="Paris" />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="postalCode">Code postal</Label>
                      <Input id="postalCode" value={billing.postalCode} onChange={(e) => setBilling((prev) => ({ ...prev, postalCode: e.target.value }))} placeholder="75001" maxLength={5} />
                    </div>
                  </div>
                </div>
              </Card>
            </div>

            <div className="lg:col-span-1">
              <Card className="p-6 sm:p-8 border-border shadow-lg sticky top-24">
                <h2 className="text-xl font-semibold mb-6">Recapitulatif</h2>

                {pendingQuote ? <>
                    <div className="space-y-4 mb-6">
                      <div className="flex items-start gap-3">
                        <div className="w-10 h-10 bg-accent rounded-lg flex items-center justify-center flex-shrink-0">
                          <FileText className="w-5 h-5 text-primary" />
                        </div>
                        <div className="flex-1">
                          <p className="font-medium">{typeLabel}</p>
                          <p className="text-sm text-muted-foreground">{contractDescription || "Devis prepare"}</p>
                          <p className="text-xs text-muted-foreground mt-1">{pendingQuote.reference}</p>
                        </div>
                      </div>

                      <Separator />

                      <div className="space-y-2 text-sm">
                        <div className="flex justify-between">
                          <span className="text-muted-foreground">Cotisation</span>
                          <span className="font-medium">{contractPrice} EUR</span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-muted-foreground">Couverture</span>
                          <span className="font-medium capitalize">{coverageLabel}</span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-muted-foreground">Franchise</span>
                          <span className="font-medium">{pendingQuote.deductible || 0} EUR</span>
                        </div>
                      </div>

                      <Separator />

                      <div className="flex justify-between items-center">
                        <span className="font-semibold">Total aujourd'hui</span>
                        <span className="text-2xl font-bold text-primary">{contractPrice} EUR</span>
                      </div>
                    </div>

                    <div className="space-y-3 mb-6">
                      <div className="flex items-center gap-2 text-sm">
                        <CheckCircle2 className="w-4 h-4 text-primary" />
                        <span className="text-muted-foreground">Contrat cree depuis le devis</span>
                      </div>
                      <div className="flex items-center gap-2 text-sm">
                        <CheckCircle2 className="w-4 h-4 text-primary" />
                        <span className="text-muted-foreground">Synchronisation dashboard client et employe</span>
                      </div>
                    </div>

                    <Button onClick={handlePayment} disabled={isProcessing} className="w-full h-12 bg-primary hover:bg-primary/90 gap-2">
                      {isProcessing ? <>
                          <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                          Traitement...
                        </> : <>
                          <Lock className="w-4 h-4" />
                          Payer {contractPrice} EUR
                        </>}
                    </Button>
                  </> : <>
                    <p className="text-sm text-muted-foreground mb-4">
                      Aucun devis enregistre n'est pret pour la finalisation.
                    </p>
                    <Button variant="outline" className="w-full" onClick={() => navigate("/devis")}>
                      Retour au devis
                    </Button>
                  </>}
              </Card>
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </div>;
}

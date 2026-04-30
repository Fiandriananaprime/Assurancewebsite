import { useMemo, useState, useEffect } from "react";
import { Link } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "../components/ui/tabs";
import { Badge } from "../components/ui/badge";
import { Avatar, AvatarFallback, AvatarImage } from "../components/ui/avatar";
import { Input } from "../components/ui/input";
import { Textarea } from "../components/ui/textarea";
import { Label } from "../components/ui/label";
import { Shield, FileText, Download, AlertTriangle, CreditCard, User, Calendar, CheckCircle2, Car, Home, Plus, Star, MessageSquare } from "lucide-react";
import { motion } from "motion/react";
import { useAuthUser } from "../hooks/use-auth-user";

const API_URL = import.meta.env.VITE_API_URL || '';

export function DashboardPage() {
  const [contracts, setContracts] = useState([]);
  const [incidents, setIncidents] = useState([]);
  const [payments, setPayments] = useState([]);
  const [clientFeedbacks, setClientFeedbacks] = useState([]);
  const [profile, setProfile] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [reviewForm, setReviewForm] = useState({
    subject: "",
    message: "",
    rating: 5,
    category: "general"
  });
  const [submittingReview, setSubmittingReview] = useState(false);

  const authUser = useAuthUser();

  async function fetchContractsOnly() {
    try {
      const token = localStorage.getItem('assurance-auth-token');
      const headers = { 'Content-Type': 'application/json' };
      if (token) headers['Authorization'] = `Bearer ${token}`;
      const cResp = await fetch(`${API_URL}/api/contracts/my-contracts`, { headers });
      const cBody = await cResp.json().catch(() => ({}));
      const cItems = (cBody && cBody.data) || cBody || [];
      let merged = Array.isArray(cItems) ? cItems : [];
      try {
        const raw = localStorage.getItem('assurance-simulated-contracts');
        const sim = raw ? JSON.parse(raw) : [];
        // Only include simulated contracts for current user
        const userId = authUser?.id;
        if (userId && Array.isArray(sim) && sim.length) {
          const relevant = sim.filter(s => String(s.client_id) === String(userId));
          merged = [...relevant, ...merged];
        }
      } catch (e) {
        // ignore
      }
      setContracts(merged);
    } catch (err) {
      console.warn('Failed to fetch contracts', err);
    }
  }

  useEffect(() => {
    let mounted = true;
    async function load() {
      setLoading(true);
      setError(null);
      try {
        const token = localStorage.getItem('assurance-auth-token');
        const headers = { 'Content-Type': 'application/json' };
        if (token) headers['Authorization'] = `Bearer ${token}`;

        let currentUserId = authUser?.id || "";

        // Profile
        try {
          const profileResp = await fetch(`${API_URL}/api/auth/me`, { headers });
          const profileBody = await profileResp.json().catch(() => ({}));
          const profileData = (profileBody && profileBody.data) || profileBody || null;
          currentUserId = profileData?.user?.id || profileData?.id || currentUserId;
          if (mounted) setProfile(profileData);
        } catch (err) {
          console.warn('Failed to fetch profile', err);
        }

        // Contracts (client)
        try {
          const cResp = await fetch(`${API_URL}/api/contracts/my-contracts`, { headers });
          const cBody = await cResp.json().catch(() => ({}));
          const cItems = (cBody && cBody.data) || cBody || [];
          if (mounted) setContracts(Array.isArray(cItems) ? cItems : []);
        } catch (err) {
          console.warn('Failed to fetch contracts', err);
        }

        // Incidents
        try {
          const iResp = await fetch(`${API_URL}/api/incidents/my-incidents`, { headers });
          const iBody = await iResp.json().catch(() => ({}));
          const iItems = (iBody && iBody.data) || iBody || [];
          if (mounted) setIncidents(Array.isArray(iItems) ? iItems : []);
        } catch (err) {
          console.warn('Failed to fetch incidents', err);
          if (mounted) setIncidents([]);
        }

        // Payments (best-effort; endpoint may not exist)
        try {
          const pResp = await fetch(`${API_URL}/api/payments/my-payments`, { headers });
          if (pResp.ok) {
            const pBody = await pResp.json().catch(() => ({}));
            const pItems = (pBody && pBody.data) || pBody || [];
            if (mounted) setPayments(Array.isArray(pItems) ? pItems : []);
          } else {
            // no payments endpoint — keep empty
            if (mounted) setPayments([]);
          }
        } catch (err) {
          console.warn('Payments endpoint not available', err);
          if (mounted) setPayments([]);
        }

        // Feedbacks
        try {
          const fbResp = await fetch(`${API_URL}/api/feedbacks?clientId=${currentUserId}`, { headers });
          const fbBody = await fbResp.json().catch(() => ({}));
          const fbItems = (fbBody && fbBody.data && (fbBody.data.feedbacks || fbBody.data)) || fbBody.feedbacks || fbBody || [];
          if (mounted) setClientFeedbacks(Array.isArray(fbItems) ? fbItems : []);
        } catch (err) {
          console.warn('Failed to fetch client feedbacks', err);
          if (mounted) setClientFeedbacks([]);
        }

      } catch (err) {
        console.error('Dashboard load error', err);
        if (mounted) setError(String(err));
      } finally {
        if (mounted) setLoading(false);
      }
    }

    load();
    // listen for contract creation events to refresh contracts list
    function onContractsRefresh() {
      fetchContractsOnly();
    }
    window.addEventListener('contracts:refresh', onContractsRefresh);
    return () => { mounted = false; };
  }, [authUser?.id]);

  const mergedProfile = useMemo(() => ({
    ...authUser,
    ...(profile?.user || {}),
    ...(profile?.profile || {}),
  }), [authUser, profile]);
  const profileName = mergedProfile?.name || authUser?.name || "Utilisateur";
  const profileEmail = mergedProfile?.email || authUser?.email || "";
  const profilePhone = mergedProfile?.phone || "";
  const profileAddress = mergedProfile?.address || "";
  const memberSince = mergedProfile?.user_created_at || mergedProfile?.created_at
    ? new Date(mergedProfile.user_created_at || mergedProfile.created_at).toLocaleDateString("fr-FR", { month: "long", year: "numeric" })
    : "";

  const submitReview = async () => {
    setSubmittingReview(true);
    try {
      const token = localStorage.getItem("assurance-auth-token");
      const res = await fetch(`${API_URL}/api/feedbacks`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          ...(token ? { Authorization: `Bearer ${token}` } : {})
        },
        body: JSON.stringify(reviewForm)
      });
      const body = await res.json().catch(() => ({}));
      if (!res.ok) {
        if (res.status === 401) {
          alert("Vous devez vous connecter pour publier un avis.");
          return;
        }
        throw new Error(body?.message || "Erreur lors de l'envoi de l'avis");
      }

      const created = body.data || body;
      setClientFeedbacks((prev) => [created, ...prev]);
      setReviewForm({
        subject: "",
        message: "",
        rating: 5,
        category: "general"
      });
      // Save a normalized pending testimonial to localStorage so the landing page shows it immediately
      try {
        const pendingRaw = localStorage.getItem('assurance-pending-feedbacks');
        const pending = pendingRaw ? JSON.parse(pendingRaw) : [];
        const name = (profile && ((profile.user && ((profile.user.firstName ? profile.user.firstName + (profile.user.lastName ? ' ' + profile.user.lastName : '') : profile.user.name))) || profile.name)) || authUser?.name || 'Client';
        const image = (profile && (profile.profile?.profileImage || profile.profileImage)) || authUser?.profileImage || '';
        const testimonial = {
          id: created.id || `local-${Date.now()}`,
          name,
          role: 'Client',
          image,
          comment: created.message || created.subject || reviewForm.message,
          rating: created.rating || reviewForm.rating || 5,
          // include client metadata for potential score computation
          client: {
            id: authUser?.id || (profile && (profile.user && profile.user.id)) || null,
            joinDate: profile && (profile.user && (profile.user.created_at || profile.user.joinDate)) || null
          }
        };
        pending.unshift(testimonial);
        // keep only last 10
        localStorage.setItem('assurance-pending-feedbacks', JSON.stringify(pending.slice(0, 10)));
        // dispatch an event so other tabs/components can react if they listen
        try { window.dispatchEvent(new CustomEvent('pending_feedbacks:updated', { detail: { testimonial } })); } catch (e) {}
      } catch (e) {
        // ignore localStorage errors
      }
    } catch (err) {
      console.error("Submit review error", err);
      alert("Impossible d'enregistrer votre avis.");
    } finally {
      setSubmittingReview(false);
    }
  };

  return <div className="min-h-screen bg-secondary/30">
      <Header />

      <div className="pt-24 sm:pt-32 pb-16 sm:pb-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }} className="mb-8 sm:mb-12">
            <h1 className="text-3xl sm:text-4xl font-bold mb-2">Tableau de bord</h1>
            <p className="text-lg text-muted-foreground">Gerez vos contrats, paiements et avis depuis un seul espace</p>
          </motion.div>

          <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-6 mb-8">
            {[
              {
                icon: Shield,
                label: "Contrats actifs",
                value: contracts.filter(c => c.status === "active").length.toString(),
                color: "text-primary",
                bg: "bg-primary/10"
              },
              {
                icon: CreditCard,
                label: "Paiement mensuel",
                value: `${contracts.reduce((sum, c) => sum + Number(c.price || c.annual_amount || 0), 0)} EUR`,
                color: "text-blue-600",
                bg: "bg-blue-100"
              },
              {
                icon: MessageSquare,
                label: "Mes avis",
                value: clientFeedbacks.length.toString(),
                color: "text-amber-600",
                bg: "bg-amber-100"
              },
              {
                icon: AlertTriangle,
                label: "Sinistres",
                value: incidents.length.toString(),
                color: "text-green-600",
                bg: "bg-green-100"
              }
            ].map((stat, index) => <motion.div key={index} initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: index * 0.1 }}>
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
              </motion.div>)}
          </div>

          <Tabs defaultValue="contracts" className="space-y-6">
            <TabsList className="grid w-full grid-cols-4 lg:w-auto">
              <TabsTrigger value="contracts">Mes contrats</TabsTrigger>
              <TabsTrigger value="payments">Paiements</TabsTrigger>
              <TabsTrigger value="reviews">Mes avis</TabsTrigger>
              <TabsTrigger value="profile">Mon profil</TabsTrigger>
            </TabsList>

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
                {contracts.map(contract => <Card key={contract.id} className="p-6 border-border hover:shadow-lg transition-shadow">
                    <div className="flex items-start justify-between mb-4">
                      <div className="flex items-center gap-3">
                        <div className="w-12 h-12 bg-accent rounded-xl flex items-center justify-center">
                          {contract.type === "auto" && <Car className="w-6 h-6 text-primary" />}
                          {contract.type === "habitation" && <Home className="w-6 h-6 text-primary" />}
                        </div>
                        <div>
                          <h3 className="font-semibold">{contract.title}</h3>
                          <p className="text-sm text-muted-foreground">No {contract.id}</p>
                        </div>
                      </div>
                      <Badge variant={contract.status === "active" ? "default" : "secondary"} className={contract.status === "active" ? "bg-primary" : ""}>
                        {contract.status === "active" ? "Actif" : "En attente"}
                      </Badge>
                    </div>

                    <div className="space-y-3 mb-6">
                      <div className="flex items-center justify-between text-sm">
                        <span className="text-muted-foreground">Cotisation mensuelle</span>
                        <span className="font-semibold">{contract.price} EUR/mois</span>
                      </div>
                      <div className="flex items-center justify-between text-sm">
                        <span className="text-muted-foreground">Date de debut</span>
                        <span className="font-medium">{contract.startDate}</span>
                      </div>
                      <div className="flex items-center justify-between text-sm">
                        <span className="text-muted-foreground">Prochain prelevement</span>
                        <span className="font-medium">{contract.nextPayment}</span>
                      </div>
                    </div>

                    <div className="flex gap-2">
                      <Button variant="outline" size="sm" className="flex-1 gap-2">
                        <FileText className="w-4 h-4" />
                        Details
                      </Button>
                      <Button variant="outline" size="sm" className="flex-1 gap-2">
                        <Download className="w-4 h-4" />
                        Telecharger
                      </Button>
                    </div>
                  </Card>)}
              </div>
            </TabsContent>

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
                        <th className="text-left p-4 text-sm font-medium text-muted-foreground">Date</th>
                        <th className="text-left p-4 text-sm font-medium text-muted-foreground">Reference</th>
                        <th className="text-left p-4 text-sm font-medium text-muted-foreground">Montant</th>
                        <th className="text-left p-4 text-sm font-medium text-muted-foreground">Methode</th>
                        <th className="text-left p-4 text-sm font-medium text-muted-foreground">Statut</th>
                        <th className="text-right p-4 text-sm font-medium text-muted-foreground">Actions</th>
                      </tr>
                    </thead>
                    <tbody>
                      {payments.map(payment => <tr key={payment.id} className="border-b border-border hover:bg-accent/50 transition-colors">
                          <td className="p-4">
                            <div className="flex items-center gap-2">
                              <Calendar className="w-4 h-4 text-muted-foreground" />
                              <span className="text-sm">{payment.date}</span>
                            </div>
                          </td>
                          <td className="p-4 text-sm font-medium">{payment.id}</td>
                          <td className="p-4 text-sm font-semibold">{payment.amount} EUR</td>
                          <td className="p-4 text-sm text-muted-foreground">{payment.method}</td>
                          <td className="p-4">
                            <Badge variant={payment.status === "paid" ? "default" : "secondary"} className={payment.status === "paid" ? "bg-green-100 text-green-700 hover:bg-green-100" : ""}>
                              <CheckCircle2 className="w-3 h-3 mr-1" />
                              {payment.status === "paid" ? "Paye" : "En attente"}
                            </Badge>
                          </td>
                          <td className="p-4 text-right">
                            <Button variant="ghost" size="sm" className="gap-2">
                              <Download className="w-4 h-4" />
                              Recu
                            </Button>
                          </td>
                        </tr>)}
                    </tbody>
                  </table>
                </div>
              </Card>
            </TabsContent>

            <TabsContent value="reviews" className="space-y-6">
              <div className="flex items-center justify-between">
                <h2 className="text-2xl font-semibold">Mes avis</h2>
                <Badge variant="outline">Synchronises avec l'espace employe</Badge>
              </div>

              <Card className="p-6 border-border">
                <div className="grid gap-4">
                  <div className="grid sm:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="review-subject">Sujet</Label>
                      <Input id="review-subject" value={reviewForm.subject} onChange={(e) => setReviewForm((prev) => ({ ...prev, subject: e.target.value }))} placeholder="Votre retour" />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="review-rating">Note</Label>
                      <select id="review-rating" value={reviewForm.rating} onChange={(e) => setReviewForm((prev) => ({ ...prev, rating: Number(e.target.value) }))} className="w-full h-10 px-3 rounded-lg border border-border bg-white">
                        {[5, 4, 3, 2, 1].map((rating) => <option key={rating} value={rating}>{rating} etoile{rating > 1 ? "s" : ""}</option>)}
                      </select>
                    </div>
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="review-message">Message</Label>
                    <Textarea id="review-message" rows={4} value={reviewForm.message} onChange={(e) => setReviewForm((prev) => ({ ...prev, message: e.target.value }))} placeholder="Partagez votre experience" className="resize-none" />
                  </div>
                  <div className="flex justify-end">
                    <Button onClick={submitReview} disabled={submittingReview || !reviewForm.subject || !reviewForm.message} className="gap-2">
                      <Plus className="w-4 h-4" />
                      {submittingReview ? "Envoi..." : "Ajouter mon avis"}
                    </Button>
                  </div>
                </div>
              </Card>

              <div className="grid gap-6">
                {clientFeedbacks.length > 0 ? clientFeedbacks.map((feedback) => <Card key={feedback.id} className="p-6 border-border">
                    <div className="flex items-start justify-between gap-4 mb-4">
                      <div>
                        <h3 className="text-lg font-semibold">{feedback.subject}</h3>
                        <p className="text-sm text-muted-foreground">{feedback.date} a {feedback.time}</p>
                      </div>
                      <div className="flex gap-1">
                        {[...Array(5)].map((_, index) => <Star key={index} className={`w-4 h-4 ${index < feedback.rating ? "text-yellow-400 fill-yellow-400" : "text-gray-300"}`} />)}
                      </div>
                    </div>
                    <p className="text-muted-foreground mb-4">{feedback.message}</p>
                    <div className="flex flex-wrap gap-2">
                      <Badge variant="secondary">{feedback.type}</Badge>
                      <Badge variant="outline">{feedback.source}</Badge>
                      <Badge className={feedback.isResponded ? "bg-green-100 text-green-700 hover:bg-green-100" : "bg-amber-100 text-amber-700 hover:bg-amber-100"}>
                        {feedback.isResponded ? "Repondu" : "En attente de reponse"}
                      </Badge>
                    </div>
                  </Card>) : <Card className="p-6 border-border">
                    <p className="text-muted-foreground">Aucun avis synchronise pour ce compte pour le moment.</p>
                  </Card>}
              </div>
            </TabsContent>

            <TabsContent value="profile" className="space-y-6">
              <h2 className="text-2xl font-semibold">Mon profil</h2>

              <div className="grid lg:grid-cols-2 gap-6">
                <Card className="p-6 sm:p-8 border-border">
                  <div className="flex items-center gap-4 mb-6">
                    <Avatar className="w-20 h-20">
                      <AvatarImage src={mergedProfile?.profileImage} alt={profileName} />
                      <AvatarFallback className="bg-primary/10 text-primary text-2xl">
                        {mergedProfile?.avatarLabel || "CL"}
                      </AvatarFallback>
                    </Avatar>
                    <div>
                      <h3 className="text-xl font-semibold">{profileName}</h3>
                      <p className="text-muted-foreground">{profileEmail}</p>
                    </div>
                  </div>

                  <div className="space-y-4">
                    <div>
                      <p className="text-sm text-muted-foreground mb-1">Telephone</p>
                      <p className="font-medium">{profilePhone}</p>
                    </div>
                    <div>
                      <p className="text-sm text-muted-foreground mb-1">Adresse</p>
                      <p className="font-medium">{profileAddress}</p>
                    </div>
                    <div>
                      <p className="text-sm text-muted-foreground mb-1">Membre depuis</p>
                      <p className="font-medium">{memberSince}</p>
                    </div>
                  </div>

                  <Link to="/settings/profile">
                    <Button className="w-full mt-6" variant="outline">Modifier mes informations</Button>
                  </Link>
                </Card>

                <div className="space-y-6">
                  <Card className="p-6 sm:p-8 border-border">
                    <h3 className="font-semibold mb-4">Actions rapides</h3>
                    <div className="space-y-3">
                      <Link to="/sinistre" className="block">
                        <Button variant="outline" className="w-full justify-start gap-3">
                          <AlertTriangle className="w-5 h-5 text-destructive" />
                          Declarer un sinistre
                        </Button>
                      </Link>
                      <Button variant="outline" className="w-full justify-start gap-3">
                        <FileText className="w-5 h-5 text-primary" />
                        Telecharger mes attestations
                      </Button>
                      <Button variant="outline" className="w-full justify-start gap-3">
                        <CreditCard className="w-5 h-5 text-primary" />
                        Gerer mes moyens de paiement
                      </Button>
                    </div>
                  </Card>

                  <Card className="p-6 sm:p-8 border-border bg-accent/50">
                    <h3 className="font-semibold mb-2">Besoin d'aide ?</h3>
                    <p className="text-sm text-muted-foreground mb-4">Notre equipe est disponible 24/7 pour vous assister</p>
                    <Button className="w-full bg-primary hover:bg-primary/90">Contacter le support</Button>
                  </Card>
                </div>
              </div>
            </TabsContent>
          </Tabs>
        </div>
      </div>

      <Footer />
    </div>;
}

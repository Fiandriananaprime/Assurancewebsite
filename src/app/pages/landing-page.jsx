import { Link } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Shield, Zap, DollarSign, CheckCircle2, Car, Home, Bike, ArrowRight, Star, Lock, Clock, Award } from "lucide-react";
import { motion } from "motion/react";
import { ImageWithFallback } from "../components/figma/ImageWithFallback";
import { useEffect, useState } from "react";
import ScoreBadge from "../components/score-badge";
import { computeCreditScore } from "../utils/creditScore";
import { resolveProfileImage } from "../auth";
import { getPublicTestimonials } from "../mock-data";

// Prefer an explicit VITE_API_URL in production; during local dev we rely on the Vite dev-server proxy
// so use a relative path when VITE_API_URL is not set to avoid cross-origin response blocking.
const API_URL = import.meta.env.VITE_API_URL || '';

export function LandingPage() {
  const [testimonials, setTestimonials] = useState([]);

  useEffect(() => {
    let mounted = true;
    async function load() {
      try {
  // ask the backend for a small set (limit=3) of public feedbacks stored in the DB
  const resp = await fetch(`${API_URL}/api/feedbacks/public/landing?limit=3`);
        const body = await resp.json().catch(() => ({}));
        const items = (body && body.data) ? body.data : (body || []);
        // Normalize to an array: the API may return a single object or an array
        const normalized = Array.isArray(items) ? items : (items ? [items] : []);
        if (mounted) {
          // Merge in any pending local feedbacks saved by the client (so recently submitted feedback shows immediately)
          let pending = [];
          try {
            const rawPending = localStorage.getItem('assurance-pending-feedbacks');
            if (rawPending) pending = JSON.parse(rawPending) || [];
          } catch (e) {
            pending = [];
          }

          const combined = [...(pending || []), ...(normalized || [])];
          // Normalize image fields so ImageWithFallback always receives a string src
          const normalizedCombined = (combined || []).map((it, idx) => {
            const rawImage = it.image || it.profileImage || it.profile_image_url || (it.client && (it.client.profileImage || it.client.profile_image_url)) || '';
            const image = resolveProfileImage(rawImage);
            return { id: it.id || it._id || `local-${idx}-${Date.now()}`, ...it, image };
          });
          // debug: log what we got from API and local pending
          try {
            // eslint-disable-next-line no-console
            console.debug('landing testimonials debug', { body, normalized, pending, combined });
          } catch (e) {}

          if (!normalizedCombined || normalizedCombined.length === 0) {
            // fallback to local mock testimonials so the UI shows something
            try {
              const mock = getPublicTestimonials();
              // eslint-disable-next-line no-console
              console.debug('landing testimonials using mock', mock);
              setTestimonials(mock);
            } catch (e) {
              setTestimonials([]);
            }
          } else {
            setTestimonials(normalizedCombined);
          }
        }
      } catch (err) {
        console.error('Failed to load public testimonials', err);
      }
    }
    load();
    // Listen for pending feedbacks updates so the landing page can show newly-submitted reviews immediately
    function onPendingFeedbacks(e) {
      try {
        const testimonial = e && e.detail && e.detail.testimonial;
        if (!testimonial) return;
        const image = resolveProfileImage(testimonial.image || testimonial.profileImage || testimonial.profile_image_url || '');
        const normal = { id: testimonial.id || `local-${Date.now()}`, ...testimonial, image };
        setTestimonials((prev) => {
          const next = [normal, ...(prev || [])];
          return next.slice(0, 10);
        });
      } catch (err) {
        // ignore
      }
    }
    window.addEventListener('pending_feedbacks:updated', onPendingFeedbacks);
    return () => {
      mounted = false;
      try { window.removeEventListener('pending_feedbacks:updated', onPendingFeedbacks); } catch (e) {}
    };
  }, []);
  const fadeInUp = {
    initial: {
      opacity: 0,
      y: 20
    },
    animate: {
      opacity: 1,
      y: 0
    },
    transition: {
      duration: 0.5
    }
  };
  const staggerContainer = {
    animate: {
      transition: {
        staggerChildren: 0.1
      }
    }
  };

  return <div className="min-h-screen bg-white">
      <Header />

      <section className="relative pt-8 sm:pt-32 pb-16 sm:pb-24 overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-b from-accent/30 via-white to-white" />
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid lg:grid-cols-2 gap-12 lg:gap-16 items-center">
            <motion.div initial={{ opacity: 0, x: -20 }} animate={{ opacity: 1, x: 0 }} transition={{ duration: 0.6 }} className="space-y-6 sm:space-y-8">
              <div className="inline-flex items-center gap-2 px-4 py-2 bg-accent/50 rounded-full border border-primary/20">
                <Shield className="w-4 h-4 text-primary" />
                <span className="text-sm font-medium text-primary">Assurance MAMA nouvelle generation</span>
              </div>

              <h1 className="text-3xl sm:text-4xl lg:text-5xl font-bold leading-tight tracking-tight">
                Assurez votre vehicule <span className="text-primary">en 2 minutes</span>
              </h1>

              <p className="text-lg sm:text-xl text-muted-foreground leading-relaxed">
                Une assurance auto, moto et habitation moderne, transparente et 100% en ligne.
                Obtenez votre devis instantane et payez en toute securite.
              </p>

              <div className="flex flex-col sm:flex-row items-start sm:items-center gap-4">
                <Link to="/devis" className="w-full sm:w-auto">
                  <Button size="lg" className="w-full sm:w-auto bg-primary hover:bg-primary/90 text-lg h-14 px-8 group">
                    Obtenir un devis gratuit
                    <ArrowRight className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" />
                  </Button>
                </Link>
                <Button size="lg" variant="outline" className="w-full sm:w-auto text-lg h-14 px-8">
                  Voir les formules
                </Button>
              </div>

              <div className="flex items-center gap-8 pt-4">
                <div className="flex items-center gap-2">
                  <CheckCircle2 className="w-5 h-5 text-primary" />
                  <span className="text-sm text-muted-foreground">Sans engagement</span>
                </div>
                <div className="flex items-center gap-2">
                  <CheckCircle2 className="w-5 h-5 text-primary" />
                  <span className="text-sm text-muted-foreground">Devis instantane</span>
                </div>
              </div>
            </motion.div>

            <motion.div initial={{ opacity: 0, scale: 0.95 }} animate={{ opacity: 1, scale: 1 }} transition={{ duration: 0.6, delay: 0.2 }} className="relative">
              <div className="relative rounded-3xl overflow-hidden">
                <ImageWithFallback src="assets/hero-car.png" alt="Modern luxury car" className="relative z-10 w-full h-[400px] sm:h-[500px] object-cover" />
              </div>

              <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.6, delay: 0.4 }} className="absolute bottom-20 z-15 left-[40%] backdrop-blur-sm bg-white/40 rounded-2xl  p-6 border border-border">
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 bg-primary/10 rounded-xl flex items-center justify-center">
                    <Award className="w-6 h-6 text-primary" />
                  </div>
                  <div>
                    <p className="text-2xl font-bold">98%</p>
                    <p className="text-sm text-muted-foreground">Clients satisfaits</p>
                  </div>
                </div>
              </motion.div>
            </motion.div>
          </div>
        </div>
      </section>

      <section className="py-16 sm:py-24 bg-secondary/50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div {...fadeInUp} className="text-center max-w-3xl mx-auto mb-12 sm:mb-16">
            <h2 className="text-3xl sm:text-4xl font-bold mb-4">Pourquoi choisir Assurance MAMA ?</h2>
            <p className="text-lg text-muted-foreground">Une experience d'assurance repensee pour vous faire gagner du temps et de l'argent</p>
          </motion.div>

          <motion.div variants={staggerContainer} initial="initial" whileInView="animate" viewport={{ once: true }} className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8">
            {[
              { icon: Zap, title: "Souscription rapide", description: "Obtenez votre contrat en moins de 2 minutes chrono" },
              { icon: DollarSign, title: "Prix transparents", description: "Aucun frais cache, tout est clair des le depart" },
              { icon: Lock, title: "100% securise", description: "Paiement SSL et donnees cryptees" },
              { icon: Clock, title: "Support 24/7", description: "Une equipe disponible a tout moment pour vous aider" },
              { icon: Shield, title: "Couverture complete", description: "Protection optimale pour tous vos biens" },
              { icon: Award, title: "Sans engagement", description: "Resiliez quand vous voulez, sans penalites" }
            ].map((feature, index) => <motion.div key={index} variants={fadeInUp}>
                <Card className="p-6 sm:p-8 h-full border-border hover:shadow-lg hover:border-primary/20 transition-all group">
                  <div className="w-14 h-14 bg-accent rounded-2xl flex items-center justify-center mb-6 group-hover:bg-primary group-hover:scale-110 transition-all">
                    <feature.icon className="w-7 h-7 text-primary group-hover:text-white" />
                  </div>
                  <h3 className="text-xl font-semibold mb-3">{feature.title}</h3>
                  <p className="text-muted-foreground leading-relaxed">{feature.description}</p>
                </Card>
              </motion.div>)}
          </motion.div>
        </div>
      </section>

      <section className="py-16 sm:py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div {...fadeInUp} className="text-center max-w-3xl mx-auto mb-12 sm:mb-16">
            <h2 className="text-3xl sm:text-4xl font-bold mb-4">Nos formules d'assurance</h2>
            <p className="text-lg text-muted-foreground">Choisissez la protection adaptee a vos besoins</p>
          </motion.div>

          <div className="grid md:grid-cols-3 gap-6 sm:gap-8">
            {[
              { icon: Car, title: "Assurance Auto", price: "29EUR", features: ["Responsabilite civile", "Assistance 24/7", "Bris de glace", "Vol et incendie"], popular: false },
              { icon: Bike, title: "Assurance Moto", price: "19EUR", features: ["Tous risques", "Equipement pilote", "Accessoires", "Protection juridique"], popular: true },
              { icon: Home, title: "Assurance Habitation", price: "12EUR", features: ["Degats des eaux", "Incendie", "Vol et vandalisme", "Responsabilite civile"], popular: false }
            ].map((plan, index) => <motion.div key={index} initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: index * 0.1 }}>
                <Card className={`p-6 sm:p-8 h-full relative overflow-hidden ${plan.popular ? "border-2 border-primary shadow-xl" : "border-border hover:border-primary/20"} transition-all`}>
                  {plan.popular && <div className="absolute top-0 right-0 bg-primary text-white text-xs font-semibold px-4 py-1 rounded-bl-xl">Populaire</div>}

                  <div className="w-16 h-16 bg-accent rounded-2xl flex items-center justify-center mb-6">
                    <plan.icon className="w-8 h-8 text-primary" />
                  </div>

                  <h3 className="text-2xl font-semibold mb-2">{plan.title}</h3>
                  <div className="mb-6">
                    <span className="text-4xl font-bold">{plan.price}</span>
                    <span className="text-muted-foreground">/mois</span>
                  </div>

                  <ul className="space-y-3 mb-8">
                    {plan.features.map((feature, i) => <li key={i} className="flex items-center gap-3">
                        <CheckCircle2 className="w-5 h-5 text-primary flex-shrink-0" />
                        <span className="text-sm text-muted-foreground">{feature}</span>
                      </li>)}
                  </ul>

                  <Link to="/devis" className="block">
                    <Button className={`w-full ${plan.popular ? "bg-primary hover:bg-primary/90" : "bg-secondary hover:bg-secondary/80 text-foreground"}`}>
                      Choisir cette formule
                    </Button>
                  </Link>
                </Card>
              </motion.div>)}
          </div>
        </div>
      </section>

      <section className="py-16 sm:py-24 bg-secondary/50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div {...fadeInUp} className="text-center max-w-3xl mx-auto mb-12 sm:mb-16">
            <h2 className="text-3xl sm:text-4xl font-bold mb-4">Ils nous font confiance</h2>
            <p className="text-lg text-muted-foreground">Ces temoignages publics sont synchronises avec les retours visibles cote employe.</p>
          </motion.div>

          <div className="grid md:grid-cols-3 gap-6 sm:gap-8">
            {(() => {
              // compute a numeric score for each testimonial (prefer explicit fields)
              const scored = (testimonials || []).map((t) => {
                let score = 0;
                try {
                  score = Number(t.creditScore ?? t.loyaltyScore ?? (t.client && (t.client.creditScore ?? t.client.loyaltyScore)));
                } catch (e) {
                  score = 0;
                }

                if (!score) {
                  // attempt to compute from client metadata when available
                  const joinedAt = t.joinedAt || (t.client && t.client.joinedAt) || (t.client && t.client.joinDate);
                  const contracts = (t.client && t.client.contracts) || t.contracts || [];
                  const incidents = (t.client && t.client.incidents) || t.incidents || [];
                  const feedbacks = (t.client && t.client.feedbacks) || t.feedbacks || [];
                  const followsOnSocial = (t.client && t.client.followsOnSocial) || t.followsOnSocial || false;
                  try {
                    score = computeCreditScore({ joinedAt, contracts, incidents, feedbacks, followsOnSocial });
                  } catch (e) {
                    score = 0;
                  }
                }

                return { testimonial: t, score: Number(score || 0), rating: Number(t.rating || 0) };
              });

              // sort by score desc, then rating desc
              scored.sort((a, b) => {
                if (b.score !== a.score) return b.score - a.score;
                return (b.rating || 0) - (a.rating || 0);
              });

              const top3 = scored.slice(0, 3);

              // eslint-disable-next-line no-console
              console.debug('landing scored testimonials', scored.map(x => ({ id: x.testimonial.id, score: x.score, rating: x.rating })), 'top3', top3.map(x => x.testimonial.id));
              return top3.map((s, index) => {
                const testimonial = s.testimonial;
                return <motion.div key={testimonial.id ?? index} initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: index * 0.06 }}>
                    <Card className="p-6 sm:p-8 h-full border-border hover:shadow-lg transition-shadow">
                      <div className="flex items-center gap-4 mb-4">
                        <div className="w-12 h-12 rounded-full overflow-hidden bg-muted">
                          <ImageWithFallback src={testimonial.image} alt={testimonial.name} className="w-full h-full object-cover" />
                        </div>
                        <div className="flex-1">
                          <div className="flex items-center justify-between gap-4">
                            <div>
                              <p className="font-semibold">{testimonial.name}</p>
                              <p className="text-sm text-muted-foreground">{testimonial.role}</p>
                            </div>
                            <div className="flex items-center gap-2">
                              <ScoreBadge score={s.score} />
                            </div>
                          </div>
                        </div>
                      </div>

                      <div className="flex gap-1 mb-4">
                        {Array.from({ length: testimonial.rating }).map((_, i) => <Star key={i} className="w-4 h-4 fill-primary text-primary" />)}
                      </div>

                      <p className="text-muted-foreground leading-relaxed">"{testimonial.comment}"</p>
                    </Card>
                  </motion.div>;
              });
            })()}
          </div>
        </div>
      </section>

      <section className="py-16 sm:py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div {...fadeInUp} className="text-center max-w-3xl mx-auto mb-12">
            <h2 className="text-3xl sm:text-4xl font-bold mb-4">Partenaires de confiance</h2>
            <p className="text-lg text-muted-foreground">Nous collaborons avec les meilleurs du secteur</p>
          </motion.div>

          <div className="flex flex-wrap justify-center items-center gap-8 sm:gap-12 lg:gap-16">
            {["assets/partner1.png", "assets/partner2.png", "assets/partner3.jpg", "assets/partner4.png", "assets/partner5.png"].map((logo, index) => <motion.div key={index} initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: index * 0.1 }}>
              <ImageWithFallback src={logo} alt={`Partner ${index + 1}`} className="w-40 object-contain" />
            </motion.div>)}
          </div>
        </div>
      </section>

      <section className="py-16 sm:py-24 bg-primary text-white">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <motion.div {...fadeInUp} className="space-y-6">
            <h2 className="text-3xl sm:text-4xl lg:text-5xl font-bold">Pret a faire des economies ?</h2>
            <p className="text-lg sm:text-xl opacity-90">Obtenez votre devis personnalise en 2 minutes et decouvrez combien vous pouvez economiser</p>
            <div className="flex flex-col sm:flex-row items-center justify-center gap-4 pt-4">
              <Link to="/devis" className="w-full sm:w-auto">
                <Button size="lg" variant="secondary" className="w-full sm:w-auto text-lg h-14 px-8 bg-white text-primary hover:bg-white/90">
                  Obtenir mon devis gratuit
                  <ArrowRight className="ml-2 w-5 h-5" />
                </Button>
              </Link>
            </div>
          </motion.div>
        </div>
      </section>

      <Footer />
    </div>;
}

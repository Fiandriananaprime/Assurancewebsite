import { Link } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import {
  Shield,
  Zap,
  DollarSign,
  CheckCircle2,
  Car,
  Home,
  Bike,
  ArrowRight,
  Star,
  Lock,
  Clock,
  Award,
} from "lucide-react";
import { motion } from "motion/react";
import { ImageWithFallback } from "../components/figma/ImageWithFallback";

export function LandingPage() {
  const fadeInUp = {
    initial: { opacity: 0, y: 20 },
    animate: { opacity: 1, y: 0 },
    transition: { duration: 0.5 },
  };

  const staggerContainer = {
    animate: {
      transition: {
        staggerChildren: 0.1,
      },
    },
  };

  return (
    <div className="min-h-screen bg-white">
      <Header />

      {/* Hero Section */}
      <section className="relative pt-24 sm:pt-32 pb-16 sm:pb-24 overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-b from-accent/30 via-white to-white" />
        
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid lg:grid-cols-2 gap-12 lg:gap-16 items-center">
            <motion.div
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ duration: 0.6 }}
              className="space-y-6 sm:space-y-8"
            >
              <div className="inline-flex items-center gap-2 px-4 py-2 bg-accent/50 rounded-full border border-primary/20">
                <Shield className="w-4 h-4 text-primary" />
                <span className="text-sm font-medium text-primary">
                  Assurance nouvelle génération
                </span>
              </div>

              <h1 className="text-4xl sm:text-5xl lg:text-6xl font-bold leading-tight tracking-tight">
                Assurez votre véhicule{" "}
                <span className="text-primary">en 2 minutes</span>
              </h1>

              <p className="text-lg sm:text-xl text-muted-foreground leading-relaxed">
                Une assurance auto, moto et habitation moderne, transparente et 100% en ligne.
                Obtenez votre devis instantané et payez en toute sécurité.
              </p>

              <div className="flex flex-col sm:flex-row items-start sm:items-center gap-4">
                <Link to="/devis" className="w-full sm:w-auto">
                  <Button
                    size="lg"
                    className="w-full sm:w-auto bg-primary hover:bg-primary/90 text-lg h-14 px-8 group"
                  >
                    Obtenir un devis gratuit
                    <ArrowRight className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" />
                  </Button>
                </Link>
                <Button
                  size="lg"
                  variant="outline"
                  className="w-full sm:w-auto text-lg h-14 px-8"
                >
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
                  <span className="text-sm text-muted-foreground">Devis instantané</span>
                </div>
              </div>
            </motion.div>

            <motion.div
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ duration: 0.6, delay: 0.2 }}
              className="relative"
            >
              <div className="relative rounded-3xl overflow-hidden shadow-2xl">
                <ImageWithFallback
                  src="https://images.unsplash.com/photo-1772429799333-c1c83676a771?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjBsdXh1cnklMjBjYXIlMjBkcml2aW5nfGVufDF8fHx8MTc3NjQxNTIwMnww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral"
                  alt="Modern luxury car"
                  className="w-full h-[400px] sm:h-[500px] object-cover"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/20 to-transparent" />
              </div>

              {/* Floating Stats Card */}
              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.6, delay: 0.4 }}
                className="absolute -bottom-6 -left-6 bg-white rounded-2xl shadow-xl p-6 border border-border"
              >
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

      {/* Features Section */}
      <section className="py-16 sm:py-24 bg-secondary/50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            {...fadeInUp}
            className="text-center max-w-3xl mx-auto mb-12 sm:mb-16"
          >
            <h2 className="text-3xl sm:text-4xl font-bold mb-4">
              Pourquoi choisir AssurPro ?
            </h2>
            <p className="text-lg text-muted-foreground">
              Une expérience d'assurance repensée pour vous faire gagner du temps et de l'argent
            </p>
          </motion.div>

          <motion.div
            variants={staggerContainer}
            initial="initial"
            whileInView="animate"
            viewport={{ once: true }}
            className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8"
          >
            {[
              {
                icon: Zap,
                title: "Souscription rapide",
                description: "Obtenez votre contrat en moins de 2 minutes chrono",
              },
              {
                icon: DollarSign,
                title: "Prix transparents",
                description: "Aucun frais caché, tout est clair dès le départ",
              },
              {
                icon: Lock,
                title: "100% sécurisé",
                description: "Paiement SSL et données cryptées",
              },
              {
                icon: Clock,
                title: "Support 24/7",
                description: "Une équipe disponible à tout moment pour vous aider",
              },
              {
                icon: Shield,
                title: "Couverture complète",
                description: "Protection optimale pour tous vos biens",
              },
              {
                icon: Award,
                title: "Sans engagement",
                description: "Résiliez quand vous voulez, sans pénalités",
              },
            ].map((feature, index) => (
              <motion.div key={index} variants={fadeInUp}>
                <Card className="p-6 sm:p-8 h-full border-border hover:shadow-lg hover:border-primary/20 transition-all group">
                  <div className="w-14 h-14 bg-accent rounded-2xl flex items-center justify-center mb-6 group-hover:bg-primary group-hover:scale-110 transition-all">
                    <feature.icon className="w-7 h-7 text-primary group-hover:text-white" />
                  </div>
                  <h3 className="text-xl font-semibold mb-3">{feature.title}</h3>
                  <p className="text-muted-foreground leading-relaxed">
                    {feature.description}
                  </p>
                </Card>
              </motion.div>
            ))}
          </motion.div>
        </div>
      </section>

      {/* Insurance Plans Section */}
      <section className="py-16 sm:py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            {...fadeInUp}
            className="text-center max-w-3xl mx-auto mb-12 sm:mb-16"
          >
            <h2 className="text-3xl sm:text-4xl font-bold mb-4">
              Nos formules d'assurance
            </h2>
            <p className="text-lg text-muted-foreground">
              Choisissez la protection adaptée à vos besoins
            </p>
          </motion.div>

          <div className="grid md:grid-cols-3 gap-6 sm:gap-8">
            {[
              {
                icon: Car,
                title: "Assurance Auto",
                price: "29€",
                features: [
                  "Responsabilité civile",
                  "Assistance 24/7",
                  "Bris de glace",
                  "Vol et incendie",
                ],
                popular: false,
              },
              {
                icon: Bike,
                title: "Assurance Moto",
                price: "19€",
                features: [
                  "Tous risques",
                  "Équipement pilote",
                  "Accessoires",
                  "Protection juridique",
                ],
                popular: true,
              },
              {
                icon: Home,
                title: "Assurance Habitation",
                price: "12€",
                features: [
                  "Dégâts des eaux",
                  "Incendie",
                  "Vol et vandalisme",
                  "Responsabilité civile",
                ],
                popular: false,
              },
            ].map((plan, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: index * 0.1 }}
              >
                <Card
                  className={`p-6 sm:p-8 h-full relative overflow-hidden ${
                    plan.popular
                      ? "border-2 border-primary shadow-xl"
                      : "border-border hover:border-primary/20"
                  } transition-all`}
                >
                  {plan.popular && (
                    <div className="absolute top-0 right-0 bg-primary text-white text-xs font-semibold px-4 py-1 rounded-bl-xl">
                      Populaire
                    </div>
                  )}

                  <div className="w-16 h-16 bg-accent rounded-2xl flex items-center justify-center mb-6">
                    <plan.icon className="w-8 h-8 text-primary" />
                  </div>

                  <h3 className="text-2xl font-semibold mb-2">{plan.title}</h3>
                  <div className="mb-6">
                    <span className="text-4xl font-bold">{plan.price}</span>
                    <span className="text-muted-foreground">/mois</span>
                  </div>

                  <ul className="space-y-3 mb-8">
                    {plan.features.map((feature, i) => (
                      <li key={i} className="flex items-center gap-3">
                        <CheckCircle2 className="w-5 h-5 text-primary flex-shrink-0" />
                        <span className="text-sm text-muted-foreground">{feature}</span>
                      </li>
                    ))}
                  </ul>

                  <Link to="/devis" className="block">
                    <Button
                      className={`w-full ${
                        plan.popular
                          ? "bg-primary hover:bg-primary/90"
                          : "bg-secondary hover:bg-secondary/80 text-foreground"
                      }`}
                    >
                      Choisir cette formule
                    </Button>
                  </Link>
                </Card>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Testimonials Section */}
      <section className="py-16 sm:py-24 bg-secondary/50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            {...fadeInUp}
            className="text-center max-w-3xl mx-auto mb-12 sm:mb-16"
          >
            <h2 className="text-3xl sm:text-4xl font-bold mb-4">
              Ils nous font confiance
            </h2>
            <p className="text-lg text-muted-foreground">
              Plus de 50 000 clients satisfaits à travers le pays
            </p>
          </motion.div>

          <div className="grid md:grid-cols-3 gap-6 sm:gap-8">
            {[
              {
                name: "Sophie Martin",
                role: "Cliente depuis 2 ans",
                image: "https://images.unsplash.com/photo-1649589244330-09ca58e4fa64?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwcm9mZXNzaW9uYWwlMjB3b21hbiUyMHBvcnRyYWl0fGVufDF8fHx8MTc3NjQwNzgzOHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
                comment:
                  "Une expérience incroyable ! J'ai souscrit mon assurance auto en moins de 3 minutes. Le prix est transparent et le service client réactif.",
                rating: 5,
              },
              {
                name: "Thomas Dubois",
                role: "Client depuis 1 an",
                image: "https://images.unsplash.com/photo-1626863905121-3b0c0ed7b94c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxoYXBweSUyMGN1c3RvbWVyJTIwc2F0aXNmaWVkfGVufDF8fHx8MTc3NjMzNDY5N3ww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
                comment:
                  "Enfin une assurance moderne qui comprend mes besoins ! Le dashboard est intuitif et j'ai tout sous contrôle. Je recommande à 100%.",
                rating: 5,
              },
              {
                name: "Marie Leclerc",
                role: "Cliente depuis 3 ans",
                image: "https://images.unsplash.com/photo-1649589244330-09ca58e4fa64?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwcm9mZXNzaW9uYWwlMjB3b21hbiUyMHBvcnRyYWl0fGVufDF8fHx8MTc3NjQwNzgzOHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
                comment:
                  "Le meilleur rapport qualité-prix du marché. J'ai économisé 40% par rapport à mon ancienne assurance tout en ayant une meilleure couverture.",
                rating: 5,
              },
            ].map((testimonial, index) => (
              <motion.div
                key={index}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: index * 0.1 }}
              >
                <Card className="p-6 sm:p-8 h-full border-border hover:shadow-lg transition-shadow">
                  <div className="flex items-center gap-4 mb-4">
                    <div className="w-12 h-12 rounded-full overflow-hidden bg-muted">
                      <ImageWithFallback
                        src={testimonial.image}
                        alt={testimonial.name}
                        className="w-full h-full object-cover"
                      />
                    </div>
                    <div>
                      <p className="font-semibold">{testimonial.name}</p>
                      <p className="text-sm text-muted-foreground">{testimonial.role}</p>
                    </div>
                  </div>

                  <div className="flex gap-1 mb-4">
                    {Array.from({ length: testimonial.rating }).map((_, i) => (
                      <Star key={i} className="w-4 h-4 fill-primary text-primary" />
                    ))}
                  </div>

                  <p className="text-muted-foreground leading-relaxed">
                    "{testimonial.comment}"
                  </p>
                </Card>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Trust Section */}
      <section className="py-16 sm:py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            {...fadeInUp}
            className="text-center max-w-3xl mx-auto mb-12"
          >
            <h2 className="text-3xl sm:text-4xl font-bold mb-4">
              Partenaires de confiance
            </h2>
            <p className="text-lg text-muted-foreground">
              Nous collaborons avec les meilleurs du secteur
            </p>
          </motion.div>

          <div className="flex flex-wrap justify-center items-center gap-8 sm:gap-12 lg:gap-16 opacity-50">
            {["AXA", "MAIF", "MACIF", "Allianz", "Groupama", "MMA"].map(
              (partner, index) => (
                <div
                  key={index}
                  className="text-2xl font-bold text-muted-foreground hover:text-foreground transition-colors"
                >
                  {partner}
                </div>
              )
            )}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-16 sm:py-24 bg-primary text-white">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <motion.div {...fadeInUp} className="space-y-6">
            <h2 className="text-3xl sm:text-4xl lg:text-5xl font-bold">
              Prêt à faire des économies ?
            </h2>
            <p className="text-lg sm:text-xl opacity-90">
              Obtenez votre devis personnalisé en 2 minutes et découvrez combien vous
              pouvez économiser
            </p>
            <div className="flex flex-col sm:flex-row items-center justify-center gap-4 pt-4">
              <Link to="/devis" className="w-full sm:w-auto">
                <Button
                  size="lg"
                  variant="secondary"
                  className="w-full sm:w-auto text-lg h-14 px-8 bg-white text-primary hover:bg-white/90"
                >
                  Obtenir mon devis gratuit
                  <ArrowRight className="ml-2 w-5 h-5" />
                </Button>
              </Link>
            </div>
          </motion.div>
        </div>
      </section>

      <Footer />
    </div>
  );
}

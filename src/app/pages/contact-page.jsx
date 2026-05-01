import { useState } from "react";
import { Link } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { ClientMessenger } from "../components/client-messenger";
import { Card } from "../components/ui/card";
import { Input } from "../components/ui/input";
import { Textarea } from "../components/ui/textarea";
import { Label } from "../components/ui/label";
import { Checkbox } from "../components/ui/checkbox";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "../components/ui/select";
import { RadioGroup, RadioGroupItem } from "../components/ui/radio-group";
import { Form, FormField, FormItem, FormLabel, FormControl, FormMessage } from "../components/ui/form";
import { useToast, ToastManager } from "../components/ui/toast-manager";

import {
    Mail,
    Phone,
    MapPin,
    MessageCircle,
    Clock,
    HelpCircle,
    Send,
    CheckCircle2,
    Star,
    ChevronDown,
    ChevronUp,
    User,
    Building2,
    Globe,
    Calendar,
    Shield,
    ArrowRight
} from "lucide-react";
import { motion, AnimatePresence } from "motion/react";

export function ContactPage() {
    const [activeFaq, setActiveFaq] = useState(null);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [formSubmitted, setFormSubmitted] = useState(false);
    const [subject, setSubject] = useState("");
    const [rating, setRating] = useState(5);
    const [hoverRating, setHoverRating] = useState(0);
    const toast = useToast();

    const faqItems = [
        {
            question: "Combien de temps faut-il pour obtenir une réponse à ma demande ?",
            answer: "Nous traitons toutes les demandes dans un délai de 24 à 48 heures maximum. Pour les demandes urgentes, vous pouvez nous contacter par téléphone au 01 23 45 67 89."
        },
        {
            question: "Puis-je modifier mon contrat après souscription ?",
            answer: "Oui, vous pouvez modifier votre contrat à tout moment via votre espace client ou en contactant notre service client. Certaines modifications peuvent entraîner une modification de votre prime."
        },
        {
            question: "Comment déclarer un sinistre en ligne ?",
            answer: "Connectez-vous à votre espace client, rendez-vous dans la section 'Sinistres' et suivez les étapes de déclaration. Vous pourrez joindre les documents nécessaires et suivre l'avancement de votre dossier."
        },
        {
            question: "Quels documents sont nécessaires pour souscrire une assurance ?",
            answer: "Pour souscrire une assurance auto, nous avons besoin de votre permis de conduire, de la carte grise du véhicule et d'un justificatif de domicile. Pour l'habitation, un justificatif de domicile et un état des lieux sont requis."
        }
    ];

    const handleSubmit = async (data) => {
        setIsSubmitting(true);
        // Simulation d'envoi
        await new Promise(resolve => setTimeout(resolve, 2000));
        setIsSubmitting(false);
        setFormSubmitted(true);
        
        toast.push("Votre message a été envoyé avec succès !", { type: 'success' });

        // Reset form after 3 seconds
        setTimeout(() => {
            setFormSubmitted(false);
        }, 3000);
    };

    return (
        <div className="min-h-screen bg-white">
            <Header />
            <ToastManager manager={toast} />

            {/* Hero Section */}
            <section className="relative py-16 sm:py-24 overflow-hidden">
                <div className="absolute inset-0 bg-gradient-to-br from-accent/20 via-white to-white" />
                <div className="absolute top-20 right-10 w-72 h-72 bg-primary/10 rounded-full blur-3xl" />
                <div className="absolute bottom-20 left-10 w-96 h-96 bg-accent/10 rounded-full blur-3xl" />

                <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="text-center max-w-4xl mx-auto">
                        <motion.div
                            initial={{ opacity: 0, y: 20 }}
                            animate={{ opacity: 1, y: 0 }}
                            transition={{ duration: 0.6 }}
                        >
                            <div className="inline-flex items-center gap-3 px-6 py-3 bg-accent/50 rounded-full border border-primary/20 mb-6">
                                <Mail className="w-5 h-5 text-primary" />
                                <span className="text-sm font-medium text-primary">
                                    Assistance 24/7
                                </span>
                            </div>

                            <h1 className="text-4xl sm:text-5xl lg:text-6xl font-bold mb-6">
                                Nous sommes là pour vous aider
                            </h1>

                            <p className="text-lg sm:text-xl text-muted-foreground leading-relaxed mb-8">
                                Une équipe dédiée est à votre écoute pour répondre à toutes vos questions
                                et vous accompagner dans vos démarches d'assurance.
                            </p>

                            <div className="flex flex-col sm:flex-row gap-4 justify-center">
                                <Link to="/devis">
                                    <Button size="lg" className="bg-primary hover:bg-primary/90 text-lg h-14 px-8 group">
                                        Obtenir un devis
                                        <ArrowRight className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" />
                                    </Button>
                                </Link>
                                <Button size="lg" variant="outline" className="text-lg h-14 px-8">
                                    Nous appeler
                                </Button>
                            </div>
                        </motion.div>
                    </div>
                </div>
            </section>

            {/* Contact Methods */}
            <section className="py-16 sm:py-24 bg-secondary/30">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        viewport={{ once: true }}
                        className="text-center mb-16"
                    >
                        <h2 className="text-3xl sm:text-4xl font-bold mb-4">
                            Nos coordonnées
                        </h2>
                        <p className="text-lg text-muted-foreground">
                            Choisissez la méthode de contact qui vous convient le mieux
                        </p>
                    </motion.div>

                    <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6 sm:gap-8">
                        {[
                            {
                                icon: Phone,
                                title: "Par téléphone",
                                subtitle: "01 23 45 67 89",
                                description: "Du lundi au vendredi de 8h à 20h",
                                color: "text-blue-600",
                                bg: "bg-blue-50"
                            },
                            {
                                icon: Mail,
                                title: "Par email",
                                subtitle: "contact@mama.mg",
                                description: "Réponse sous 24-48h",
                                color: "text-green-600",
                                bg: "bg-green-50"
                            },
                            {
                                icon: MessageCircle,
                                title: "Chat en direct",
                                subtitle: "Disponible maintenant",
                                description: "Assistance instantanée",
                                color: "text-purple-600",
                                bg: "bg-purple-50"
                            },
                            {
                                icon: MapPin,
                                title: "En agence",
                                subtitle: "Paris, Lyon, Marseille",
                                description: "Sur rendez-vous",
                                color: "text-orange-600",
                                bg: "bg-orange-50"
                            }
                        ].map((contact, index) => (
                            <motion.div
                                key={index}
                                initial={{ opacity: 0, y: 20 }}
                                whileInView={{ opacity: 1, y: 0 }}
                                viewport={{ once: true }}
                                transition={{ delay: index * 0.1 }}
                            >
                                <Card 
                                    className="p-6 h-full border-border hover:shadow-lg transition-all group cursor-pointer"
                                    onClick={() => {
                                        if (contact.title === "Chat en direct") {
                                            window.dispatchEvent(new CustomEvent("open-customer-chat"));
                                        }
                                    }}
                                >
                                    <div className="flex items-start gap-4">
                                        <div className={`w-14 h-14 ${contact.bg} rounded-xl flex items-center justify-center group-hover:scale-110 transition-transform`}>
                                            <contact.icon className={`w-7 h-7 ${contact.color}`} />
                                        </div>
                                        <div className="flex-1">
                                            <h3 className="font-semibold mb-2">{contact.title}</h3>
                                            <p className="text-2xl font-bold text-primary mb-2">{contact.subtitle}</p>
                                            <p className="text-sm text-muted-foreground">{contact.description}</p>
                                        </div>
                                    </div>
                                </Card>
                            </motion.div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Contact Form */}
            <section className="py-16 sm:py-24">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="grid lg:grid-cols-2 gap-12 lg:gap-16 items-start">
                        {/* Form Section */}
                        <motion.div
                            initial={{ opacity: 0, x: -20 }}
                            whileInView={{ opacity: 1, x: 0 }}
                            viewport={{ once: true }}
                            className="space-y-8"
                        >
                            <div>
                                <h2 className="text-3xl sm:text-4xl font-bold mb-4">
                                    Envoyez-nous un message
                                </h2>
                                <p className="text-lg text-muted-foreground">
                                    Remplissez le formulaire ci-dessous et nous vous répondrons dans les plus brefs délais.
                                </p>
                            </div>

                            <AnimatePresence mode="wait">
                                {formSubmitted ? (
                                    <motion.div
                                        key="success"
                                        initial={{ opacity: 0, scale: 0.95 }}
                                        animate={{ opacity: 1, scale: 1 }}
                                        exit={{ opacity: 0, scale: 0.95 }}
                                        className="bg-green-50 border border-green-200 rounded-xl p-6"
                                    >
                                        <div className="flex items-center gap-3 mb-3">
                                            <CheckCircle2 className="w-8 h-8 text-green-600" />
                                            <h3 className="text-lg font-semibold text-green-800">
                                                Message envoyé avec succès !
                                            </h3>
                                        </div>
                                        <p className="text-green-700">
                                            Nous avons bien reçu votre message et nous vous répondrons dans les plus brefs délais.
                                        </p>
                                    </motion.div>
                                ) : (
                                    <motion.form
                                        key="form"
                                        initial={{ opacity: 0, scale: 0.95 }}
                                        animate={{ opacity: 1, scale: 1 }}
                                        exit={{ opacity: 0, scale: 0.95 }}
                                        className="space-y-6"
                                        onSubmit={handleSubmit}
                                    >
                                        <div className="grid sm:grid-cols-2 gap-6">
                                            <div className="space-y-2">
                                                <Label htmlFor="name">Nom complet</Label>
                                                <Input id="name" name="name" placeholder="Votre nom" required />
                                            </div>
                                            <div className="space-y-2">
                                                <Label htmlFor="email">Email</Label>
                                                <Input id="email" name="email" type="email" placeholder="votre@email.com" required />
                                            </div>
                                        </div>

                                        <div className="grid sm:grid-cols-2 gap-6">
                                            <div className="space-y-2">
                                                <Label htmlFor="phone">Téléphone</Label>
                                                <Input id="phone" name="phone" type="tel" placeholder="+33 6 12 34 56 78" />
                                            </div>
                                            <div className="space-y-2">
                                                <Label htmlFor="subject">Sujet</Label>
                                                <Select value={subject} onValueChange={setSubject}>
                                                    <SelectTrigger id="subject">
                                                        <SelectValue placeholder="Choisissez un sujet" />
                                                    </SelectTrigger>
                                                    <SelectContent>
                                                        <SelectItem value="devis">Demande de devis</SelectItem>
                                                        <SelectItem value="sinistre">Déclaration de sinistre</SelectItem>
                                                        <SelectItem value="contrat">Modification de contrat</SelectItem>
                                                        <SelectItem value="question">Question générale</SelectItem>
                                                        <SelectItem value="autre">Autre</SelectItem>
                                                    </SelectContent>
                                                </Select>
                                            </div>
                                        </div>

                                    <div className="space-y-3">
                                        <Label>Quelle note donneriez-vous à notre service ?</Label>
                                        <div className="flex gap-2">
                                            {[1, 2, 3, 4, 5].map((star) => (
                                                <button
                                                    key={star}
                                                    type="button"
                                                    onMouseEnter={() => setHoverRating(star)}
                                                    onMouseLeave={() => setHoverRating(0)}
                                                    onClick={() => setRating(star)}
                                                    className="focus:outline-none transition-transform hover:scale-110"
                                                >
                                                    <Star
                                                        className={`w-8 h-8 ${
                                                            star <= (hoverRating || rating)
                                                                ? "text-yellow-400 fill-yellow-400"
                                                                : "text-gray-300"
                                                        }`}
                                                    />
                                                </button>
                                            ))}
                                        </div>
                                        <p className="text-xs text-muted-foreground italic">
                                            {rating === 5 ? "Excellent !" : rating === 1 ? "Très déçu" : "Merci pour votre retour"}
                                        </p>
                                    </div>

                                        <div className="space-y-2">
                                            <Label htmlFor="message">Message</Label>
                                            <Textarea
                                                id="message"
                                                name="message"
                                                placeholder="Décrivez votre demande en quelques mots..."
                                                rows={6}
                                                required
                                            />
                                        </div>

                                        <div className="space-y-4">
                                            <Label>Comment préférez-vous être contacté ?</Label>
                                            <RadioGroup defaultValue="email" className="flex flex-col sm:flex-row gap-4">
                                                <div className="flex items-center space-x-2">
                                                    <RadioGroupItem value="email" id="contact-email" />
                                                    <Label htmlFor="contact-email">Email</Label>
                                                </div>
                                                <div className="flex items-center space-x-2">
                                                    <RadioGroupItem value="phone" id="contact-phone" />
                                                    <Label htmlFor="contact-phone">Téléphone</Label>
                                                </div>
                                                <div className="flex items-center space-x-2">
                                                    <RadioGroupItem value="sms" id="contact-sms" />
                                                    <Label htmlFor="contact-sms">SMS</Label>
                                                </div>
                                            </RadioGroup>
                                        </div>

                                        <div className="flex items-center space-x-2">
                                            <Checkbox id="newsletter" />
                                            <Label htmlFor="newsletter" className="text-sm">
                                                J'accepte de recevoir des informations et offres promotionnelles par email
                                            </Label>
                                        </div>

                                        <Button
                                            type="submit"
                                            size="lg"
                                            className="w-full sm:w-auto bg-primary hover:bg-primary/90 h-14 px-8"
                                            disabled={isSubmitting}
                                        >
                                            {isSubmitting ? (
                                                <>
                                                    <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white mr-3" />
                                                    Envoi en cours...
                                                </>
                                            ) : (
                                                <>
                                                    <Send className="mr-2 w-5 h-5" />
                                                    Envoyer le message
                                                </>
                                            )}
                                        </Button>
                                    </motion.form>
                                )}
                            </AnimatePresence>
                        </motion.div>

                        {/* Info Section */}
                        <motion.div
                            initial={{ opacity: 0, x: 20 }}
                            whileInView={{ opacity: 1, x: 0 }}
                            viewport={{ once: true }}
                            className="space-y-8"
                        >
                            <Card className="p-8 border-border">
                                <div className="space-y-6">
                                    <div className="flex items-center gap-3">
                                        <div className="w-12 h-12 bg-accent rounded-xl flex items-center justify-center">
                                            <Clock className="w-6 h-6 text-primary" />
                                        </div>
                                        <div>
                                            <h3 className="font-semibold">Horaires d'ouverture</h3>
                                            <p className="text-sm text-muted-foreground">Du lundi au vendredi</p>
                                        </div>
                                    </div>

                                    <div className="grid gap-3 text-sm">
                                        <div className="flex justify-between">
                                            <span className="text-muted-foreground">Lundi - Jeudi</span>
                                            <span>8h00 - 20h00</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-muted-foreground">Vendredi</span>
                                            <span>8h00 - 19h00</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-muted-foreground">Samedi</span>
                                            <span>9h00 - 17h00</span>
                                        </div>
                                        <div className="flex justify-between">
                                            <span className="text-muted-foreground">Dimanche</span>
                                            <span>Fermé</span>
                                        </div>
                                    </div>
                                </div>
                            </Card>

                            <Card className="p-8 border-border">
                                <div className="space-y-6">
                                    <div className="flex items-center gap-3">
                                        <div className="w-12 h-12 bg-accent rounded-xl flex items-center justify-center">
                                            <Shield className="w-6 h-6 text-primary" />
                                        </div>
                                        <div>
                                            <h3 className="font-semibold">Garanties de confidentialité</h3>
                                            <p className="text-sm text-muted-foreground">Vos données sont protégées</p>
                                        </div>
                                    </div>

                                    <div className="space-y-3 text-sm text-muted-foreground">
                                        <div className="flex items-center gap-2">
                                            <CheckCircle2 className="w-4 h-4 text-green-500" />
                                            <span>Vos informations sont traitées confidentiellement</span>
                                        </div>
                                        <div className="flex items-center gap-2">
                                            <CheckCircle2 className="w-4 h-4 text-green-500" />
                                            <span>Protection conforme au RGPD</span>
                                        </div>
                                        <div className="flex items-center gap-2">
                                            <CheckCircle2 className="w-4 h-4 text-green-500" />
                                            <span>Accès sécurisé à vos données personnelles</span>
                                        </div>
                                    </div>
                                </div>
                            </Card>

                            {/* Testimonial */}
                            <Card className="p-6 border-border bg-gradient-to-r from-accent/20 to-primary/10">
                                <div className="flex items-center gap-4">
                                    <div className="w-16 h-16 bg-white rounded-full flex items-center justify-center">
                                        <Star className="w-8 h-8 text-primary" />
                                    </div>
                                    <div>
                                        <p className="font-medium">"Un service client exceptionnel !"</p>
                                        <p className="text-sm text-muted-foreground mt-1">Marie Dupont, cliente depuis 2 ans</p>
                                    </div>
                                </div>
                            </Card>
                        </motion.div>
                    </div>
                </div>
            </section>

            {/* FAQ Section */}
            <section className="py-16 sm:py-24 bg-secondary/30">
                <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        viewport={{ once: true }}
                        className="text-center mb-12"
                    >
                        <h2 className="text-3xl sm:text-4xl font-bold mb-4">
                            Questions fréquentes
                        </h2>
                        <p className="text-lg text-muted-foreground">
                            Retrouvez les réponses aux questions les plus courantes
                        </p>
                    </motion.div>

                    <div className="space-y-4">
                        {faqItems.map((item, index) => (
                            <motion.div
                                key={index}
                                initial={{ opacity: 0, y: 20 }}
                                whileInView={{ opacity: 1, y: 0 }}
                                viewport={{ once: true }}
                                transition={{ delay: index * 0.1 }}
                            >
                                <Card className="border-border overflow-hidden">
                                    <button
                                        className="w-full text-left p-6 flex items-center justify-between hover:bg-accent/50 transition-colors"
                                        onClick={() => setActiveFaq(activeFaq === index ? null : index)}
                                    >
                                        <div className="flex items-center gap-4">
                                            <HelpCircle className="w-6 h-6 text-primary flex-shrink-0" />
                                            <span className="text-lg font-medium">{item.question}</span>
                                        </div>
                                        <div className="flex items-center gap-2">
                                            <span className="text-sm text-muted-foreground">Réponse</span>
                                            {activeFaq === index ? (
                                                <ChevronUp className="w-5 h-5 text-primary" />
                                            ) : (
                                                <ChevronDown className="w-5 h-5 text-muted-foreground" />
                                            )}
                                        </div>
                                    </button>

                                    <AnimatePresence>
                                        {activeFaq === index && (
                                            <motion.div
                                                initial={{ opacity: 0, height: 0 }}
                                                animate={{ opacity: 1, height: "auto" }}
                                                exit={{ opacity: 0, height: 0 }}
                                                className="border-t border-border"
                                            >
                                                <div className="p-6">
                                                    <p className="text-muted-foreground leading-relaxed">{item.answer}</p>
                                                </div>
                                            </motion.div>
                                        )}
                                    </AnimatePresence>
                                </Card>
                            </motion.div>
                        ))}
                    </div>

                    <div className="text-center mt-8">
                        <p className="text-muted-foreground mb-4">
                            Vous ne trouvez pas réponse à votre question ?
                        </p>
                        <Link to="/contact">
                            <Button variant="outline" size="lg" className="gap-2">
                                <MessageCircle className="w-5 h-5" />
                                Nous contacter
                            </Button>
                        </Link>
                    </div>
                </div>
            </section>

            <ClientMessenger />
            <Footer />
        </div>
    );
}

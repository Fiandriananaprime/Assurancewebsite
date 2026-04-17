import { useState } from "react";
import { useNavigate } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Label } from "../components/ui/label";
import { Input } from "../components/ui/input";
import { Separator } from "../components/ui/separator";
import { CreditCard, Lock, CheckCircle2, Smartphone, Calendar } from "lucide-react";
import { motion } from "motion/react";

export function PaymentPage() {
  const navigate = useNavigate();
  const [paymentMethod, setPaymentMethod] = useState<"card" | "mobile">("card");
  const [isProcessing, setIsProcessing] = useState(false);

  const contractPrice = 35; // Prix simulé depuis la page devis

  const handlePayment = async () => {
    setIsProcessing(true);
    
    // Simulation de traitement de paiement
    setTimeout(() => {
      setIsProcessing(false);
      navigate("/dashboard");
    }, 2000);
  };

  return (
    <div className="min-h-screen bg-secondary/30">
      <Header />

      <div className="pt-24 sm:pt-32 pb-16 sm:pb-24">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            className="text-center mb-8 sm:mb-12"
          >
            <h1 className="text-3xl sm:text-4xl font-bold mb-4">
              Finalisation du paiement
            </h1>
            <p className="text-lg text-muted-foreground">
              Sécurisez votre contrat en quelques clics
            </p>
          </motion.div>

          <div className="grid lg:grid-cols-3 gap-8">
            {/* Payment Form */}
            <div className="lg:col-span-2 space-y-6">
              {/* Payment Method Selection */}
              <Card className="p-6 sm:p-8 border-border shadow-lg">
                <h2 className="text-xl font-semibold mb-6">Mode de paiement</h2>

                <div className="grid sm:grid-cols-2 gap-4 mb-6">
                  <button
                    onClick={() => setPaymentMethod("card")}
                    className={`p-4 rounded-xl border-2 transition-all ${
                      paymentMethod === "card"
                        ? "border-primary bg-accent"
                        : "border-border bg-white hover:border-primary/50"
                    }`}
                  >
                    <div className="flex items-center gap-3">
                      <CreditCard className="w-6 h-6 text-primary" />
                      <div className="text-left">
                        <p className="font-medium">Carte bancaire</p>
                        <p className="text-xs text-muted-foreground">Visa, Mastercard</p>
                      </div>
                    </div>
                  </button>

                  <button
                    onClick={() => setPaymentMethod("mobile")}
                    className={`p-4 rounded-xl border-2 transition-all ${
                      paymentMethod === "mobile"
                        ? "border-primary bg-accent"
                        : "border-border bg-white hover:border-primary/50"
                    }`}
                  >
                    <div className="flex items-center gap-3">
                      <Smartphone className="w-6 h-6 text-primary" />
                      <div className="text-left">
                        <p className="font-medium">Mobile Money</p>
                        <p className="text-xs text-muted-foreground">Orange, MTN, Moov</p>
                      </div>
                    </div>
                  </button>
                </div>

                {/* Card Payment Form */}
                {paymentMethod === "card" && (
                  <motion.div
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    className="space-y-4"
                  >
                    <div className="space-y-2">
                      <Label htmlFor="cardNumber">Numéro de carte</Label>
                      <div className="relative">
                        <Input
                          id="cardNumber"
                          placeholder="1234 5678 9012 3456"
                          maxLength={19}
                        />
                        <div className="absolute right-3 top-1/2 -translate-y-1/2 flex gap-1">
                          <div className="w-8 h-5 bg-gradient-to-r from-blue-600 to-blue-400 rounded text-white text-[8px] flex items-center justify-center font-bold">
                            VISA
                          </div>
                          <div className="w-8 h-5 bg-gradient-to-r from-red-600 to-orange-400 rounded text-white text-[8px] flex items-center justify-center font-bold">
                            MC
                          </div>
                        </div>
                      </div>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="cardName">Nom sur la carte</Label>
                      <Input id="cardName" placeholder="JEAN DUPONT" />
                    </div>

                    <div className="grid grid-cols-2 gap-4">
                      <div className="space-y-2">
                        <Label htmlFor="expiry">Date d'expiration</Label>
                        <Input id="expiry" placeholder="MM/AA" maxLength={5} />
                      </div>

                      <div className="space-y-2">
                        <Label htmlFor="cvv">CVV</Label>
                        <Input
                          id="cvv"
                          type="password"
                          placeholder="123"
                          maxLength={3}
                        />
                      </div>
                    </div>
                  </motion.div>
                )}

                {/* Mobile Money Form */}
                {paymentMethod === "mobile" && (
                  <motion.div
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    className="space-y-4"
                  >
                    <div className="space-y-2">
                      <Label htmlFor="mobileOperator">Opérateur</Label>
                      <select
                        id="mobileOperator"
                        className="w-full h-10 px-3 rounded-lg border border-border bg-white"
                      >
                        <option value="">Sélectionner un opérateur</option>
                        <option value="orange">Orange Money</option>
                        <option value="mtn">MTN Mobile Money</option>
                        <option value="moov">Moov Money</option>
                      </select>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="phoneNumber">Numéro de téléphone</Label>
                      <Input
                        id="phoneNumber"
                        placeholder="+33 6 12 34 56 78"
                        type="tel"
                      />
                    </div>
                  </motion.div>
                )}

                <div className="mt-6 p-4 bg-accent/50 rounded-xl border border-primary/20">
                  <div className="flex gap-3">
                    <Lock className="w-5 h-5 text-primary flex-shrink-0" />
                    <div className="text-sm">
                      <p className="font-medium text-primary mb-1">Paiement 100% sécurisé</p>
                      <p className="text-muted-foreground">
                        Vos données bancaires sont cryptées avec la norme SSL et ne sont jamais stockées sur nos serveurs.
                      </p>
                    </div>
                  </div>
                </div>
              </Card>

              {/* Billing Address */}
              <Card className="p-6 sm:p-8 border-border shadow-lg">
                <h2 className="text-xl font-semibold mb-6">Adresse de facturation</h2>

                <div className="space-y-4">
                  <div className="grid sm:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="firstName">Prénom</Label>
                      <Input id="firstName" placeholder="Jean" />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="lastName">Nom</Label>
                      <Input id="lastName" placeholder="Dupont" />
                    </div>
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="email">Email</Label>
                    <Input id="email" type="email" placeholder="jean.dupont@example.com" />
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="address">Adresse</Label>
                    <Input id="address" placeholder="123 Rue de la Paix" />
                  </div>

                  <div className="grid sm:grid-cols-2 gap-4">
                    <div className="space-y-2">
                      <Label htmlFor="city">Ville</Label>
                      <Input id="city" placeholder="Paris" />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="postalCode">Code postal</Label>
                      <Input id="postalCode" placeholder="75001" maxLength={5} />
                    </div>
                  </div>
                </div>
              </Card>
            </div>

            {/* Order Summary */}
            <div className="lg:col-span-1">
              <Card className="p-6 sm:p-8 border-border shadow-lg sticky top-24">
                <h2 className="text-xl font-semibold mb-6">Récapitulatif</h2>

                <div className="space-y-4 mb-6">
                  <div className="flex items-start gap-3">
                    <div className="w-10 h-10 bg-accent rounded-lg flex items-center justify-center flex-shrink-0">
                      <CreditCard className="w-5 h-5 text-primary" />
                    </div>
                    <div className="flex-1">
                      <p className="font-medium">Assurance Auto</p>
                      <p className="text-sm text-muted-foreground">Formule Premium</p>
                    </div>
                  </div>

                  <Separator />

                  <div className="space-y-2 text-sm">
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Cotisation mensuelle</span>
                      <span className="font-medium">{contractPrice}€</span>
                    </div>
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Frais de dossier</span>
                      <span className="font-medium text-primary">Offerts</span>
                    </div>
                  </div>

                  <Separator />

                  <div className="flex justify-between items-center">
                    <span className="font-semibold">Total aujourd'hui</span>
                    <span className="text-2xl font-bold text-primary">{contractPrice}€</span>
                  </div>

                  <div className="text-xs text-muted-foreground">
                    Puis {contractPrice}€/mois, résiliable à tout moment
                  </div>
                </div>

                <div className="space-y-3 mb-6">
                  <div className="flex items-center gap-2 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-primary" />
                    <span className="text-muted-foreground">Activation immédiate</span>
                  </div>
                  <div className="flex items-center gap-2 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-primary" />
                    <span className="text-muted-foreground">Attestation par email</span>
                  </div>
                  <div className="flex items-center gap-2 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-primary" />
                    <span className="text-muted-foreground">Sans engagement</span>
                  </div>
                </div>

                <Button
                  onClick={handlePayment}
                  disabled={isProcessing}
                  className="w-full h-12 bg-primary hover:bg-primary/90 gap-2"
                >
                  {isProcessing ? (
                    <>
                      <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                      Traitement...
                    </>
                  ) : (
                    <>
                      <Lock className="w-4 h-4" />
                      Payer {contractPrice}€
                    </>
                  )}
                </Button>

                <div className="mt-4 flex items-center justify-center gap-2 text-xs text-muted-foreground">
                  <Lock className="w-3 h-3" />
                  <span>Paiement sécurisé SSL</span>
                </div>
              </Card>
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </div>
  );
}

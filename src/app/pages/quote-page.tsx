import { useState } from "react";
import { Link, useNavigate } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Label } from "../components/ui/label";
import { Input } from "../components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "../components/ui/select";
import { Progress } from "../components/ui/progress";
import { Car, Home, Bike, ArrowRight, ArrowLeft, CheckCircle2, Shield } from "lucide-react";
import { motion } from "motion/react";

type VehicleType = "auto" | "moto" | "habitation";

interface QuoteData {
  vehicleType: VehicleType | "";
  brand: string;
  model: string;
  year: string;
  driverAge: string;
  usage: string;
  location: string;
  coverage: string;
}

export function QuotePage() {
  const navigate = useNavigate();
  const [step, setStep] = useState(1);
  const [quoteData, setQuoteData] = useState<QuoteData>({
    vehicleType: "",
    brand: "",
    model: "",
    year: "",
    driverAge: "",
    usage: "",
    location: "",
    coverage: "",
  });

  const [calculatedPrice, setCalculatedPrice] = useState<number | null>(null);

  const totalSteps = 3;
  const progress = (step / totalSteps) * 100;

  const updateData = (field: keyof QuoteData, value: string) => {
    setQuoteData((prev) => ({ ...prev, [field]: value }));
  };

  const calculatePrice = () => {
    let basePrice = 0;
    
    // Base price by vehicle type
    if (quoteData.vehicleType === "auto") basePrice = 35;
    if (quoteData.vehicleType === "moto") basePrice = 25;
    if (quoteData.vehicleType === "habitation") basePrice = 15;

    // Age adjustment
    const age = parseInt(quoteData.driverAge);
    if (age < 25) basePrice *= 1.5;
    else if (age > 60) basePrice *= 1.2;

    // Coverage adjustment
    if (quoteData.coverage === "premium") basePrice *= 1.8;
    else if (quoteData.coverage === "medium") basePrice *= 1.3;

    setCalculatedPrice(Math.round(basePrice));
  };

  const handleNext = () => {
    if (step < totalSteps) {
      setStep(step + 1);
    } else {
      calculatePrice();
    }
  };

  const handleBack = () => {
    if (step > 1) setStep(step - 1);
  };

  const canProceed = () => {
    if (step === 1) {
      return quoteData.vehicleType && quoteData.brand && quoteData.model && quoteData.year;
    }
    if (step === 2) {
      return quoteData.driverAge && quoteData.usage;
    }
    if (step === 3) {
      return quoteData.location && quoteData.coverage;
    }
    return false;
  };

  return (
    <div className="min-h-screen bg-secondary/30">
      <Header />

      <div className="pt-24 sm:pt-32 pb-16 sm:pb-24">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          {/* Header */}
          <motion.div
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            className="text-center mb-8 sm:mb-12"
          >
            <h1 className="text-3xl sm:text-4xl font-bold mb-4">
              Obtenez votre devis en ligne
            </h1>
            <p className="text-lg text-muted-foreground">
              Répondez à quelques questions pour recevoir votre tarif personnalisé
            </p>
          </motion.div>

          {calculatedPrice === null ? (
            <>
              {/* Progress Bar */}
              <div className="mb-8">
                <div className="flex items-center justify-between mb-2">
                  <span className="text-sm font-medium">
                    Étape {step} sur {totalSteps}
                  </span>
                  <span className="text-sm text-muted-foreground">{Math.round(progress)}%</span>
                </div>
                <Progress value={progress} className="h-2" />
              </div>

              {/* Form Card */}
              <Card className="p-6 sm:p-8 lg:p-10 border-border shadow-lg">
                <motion.div
                  key={step}
                  initial={{ opacity: 0, x: 20 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: -20 }}
                  transition={{ duration: 0.3 }}
                >
                  {/* Step 1: Vehicle Information */}
                  {step === 1 && (
                    <div className="space-y-6">
                      <h2 className="text-2xl font-semibold mb-6">
                        Type de véhicule / bien
                      </h2>

                      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                        {[
                          { type: "auto" as VehicleType, icon: Car, label: "Auto" },
                          { type: "moto" as VehicleType, icon: Bike, label: "Moto" },
                          { type: "habitation" as VehicleType, icon: Home, label: "Habitation" },
                        ].map((option) => (
                          <button
                            key={option.type}
                            onClick={() => updateData("vehicleType", option.type)}
                            className={`p-6 rounded-xl border-2 transition-all hover:border-primary hover:shadow-md ${
                              quoteData.vehicleType === option.type
                                ? "border-primary bg-accent"
                                : "border-border bg-white"
                            }`}
                          >
                            <option.icon className="w-8 h-8 mx-auto mb-3 text-primary" />
                            <p className="font-medium">{option.label}</p>
                          </button>
                        ))}
                      </div>

                      <div className="grid sm:grid-cols-2 gap-4">
                        <div className="space-y-2">
                          <Label htmlFor="brand">Marque</Label>
                          <Input
                            id="brand"
                            placeholder="Ex: Renault, Peugeot..."
                            value={quoteData.brand}
                            onChange={(e) => updateData("brand", e.target.value)}
                          />
                        </div>

                        <div className="space-y-2">
                          <Label htmlFor="model">Modèle</Label>
                          <Input
                            id="model"
                            placeholder="Ex: Clio, 308..."
                            value={quoteData.model}
                            onChange={(e) => updateData("model", e.target.value)}
                          />
                        </div>
                      </div>

                      <div className="space-y-2">
                        <Label htmlFor="year">Année de mise en circulation</Label>
                        <Select value={quoteData.year} onValueChange={(val) => updateData("year", val)}>
                          <SelectTrigger>
                            <SelectValue placeholder="Sélectionnez l'année" />
                          </SelectTrigger>
                          <SelectContent>
                            {Array.from({ length: 20 }, (_, i) => 2026 - i).map((year) => (
                              <SelectItem key={year} value={year.toString()}>
                                {year}
                              </SelectItem>
                            ))}
                          </SelectContent>
                        </Select>
                      </div>
                    </div>
                  )}

                  {/* Step 2: Driver Information */}
                  {step === 2 && (
                    <div className="space-y-6">
                      <h2 className="text-2xl font-semibold mb-6">
                        Informations conducteur
                      </h2>

                      <div className="space-y-2">
                        <Label htmlFor="driverAge">Âge du conducteur principal</Label>
                        <Select value={quoteData.driverAge} onValueChange={(val) => updateData("driverAge", val)}>
                          <SelectTrigger>
                            <SelectValue placeholder="Sélectionnez votre âge" />
                          </SelectTrigger>
                          <SelectContent>
                            <SelectItem value="18-24">18-24 ans</SelectItem>
                            <SelectItem value="25-34">25-34 ans</SelectItem>
                            <SelectItem value="35-44">35-44 ans</SelectItem>
                            <SelectItem value="45-54">45-54 ans</SelectItem>
                            <SelectItem value="55-64">55-64 ans</SelectItem>
                            <SelectItem value="65+">65 ans et plus</SelectItem>
                          </SelectContent>
                        </Select>
                      </div>

                      <div className="space-y-2">
                        <Label htmlFor="usage">Usage du véhicule</Label>
                        <Select value={quoteData.usage} onValueChange={(val) => updateData("usage", val)}>
                          <SelectTrigger>
                            <SelectValue placeholder="Sélectionnez l'usage" />
                          </SelectTrigger>
                          <SelectContent>
                            <SelectItem value="personal">Usage personnel</SelectItem>
                            <SelectItem value="commute">Trajet domicile-travail</SelectItem>
                            <SelectItem value="professional">Usage professionnel</SelectItem>
                          </SelectContent>
                        </Select>
                      </div>

                      <Card className="p-4 bg-accent/50 border-primary/20">
                        <div className="flex gap-3">
                          <Shield className="w-5 h-5 text-primary flex-shrink-0 mt-0.5" />
                          <div className="text-sm">
                            <p className="font-medium text-primary mb-1">Vos données sont protégées</p>
                            <p className="text-muted-foreground">
                              Nous utilisons un cryptage SSL pour garantir la sécurité de vos informations.
                            </p>
                          </div>
                        </div>
                      </Card>
                    </div>
                  )}

                  {/* Step 3: Coverage & Location */}
                  {step === 3 && (
                    <div className="space-y-6">
                      <h2 className="text-2xl font-semibold mb-6">
                        Localisation et garanties
                      </h2>

                      <div className="space-y-2">
                        <Label htmlFor="location">Code postal</Label>
                        <Input
                          id="location"
                          placeholder="Ex: 75001"
                          value={quoteData.location}
                          onChange={(e) => updateData("location", e.target.value)}
                          maxLength={5}
                        />
                      </div>

                      <div className="space-y-2">
                        <Label>Niveau de couverture</Label>
                        <div className="space-y-3">
                          {[
                            {
                              value: "basic",
                              title: "Formule Essentielle",
                              description: "Responsabilité civile obligatoire",
                            },
                            {
                              value: "medium",
                              title: "Formule Confort",
                              description: "RC + Vol + Incendie + Bris de glace",
                            },
                            {
                              value: "premium",
                              title: "Formule Premium",
                              description: "Tous risques + Assistance + Protection juridique",
                            },
                          ].map((option) => (
                            <button
                              key={option.value}
                              onClick={() => updateData("coverage", option.value)}
                              className={`w-full p-4 rounded-xl border-2 text-left transition-all hover:border-primary ${
                                quoteData.coverage === option.value
                                  ? "border-primary bg-accent"
                                  : "border-border bg-white"
                              }`}
                            >
                              <div className="flex items-start gap-3">
                                <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center mt-0.5 ${
                                  quoteData.coverage === option.value
                                    ? "border-primary bg-primary"
                                    : "border-muted"
                                }`}>
                                  {quoteData.coverage === option.value && (
                                    <div className="w-2 h-2 rounded-full bg-white" />
                                  )}
                                </div>
                                <div className="flex-1">
                                  <p className="font-medium mb-1">{option.title}</p>
                                  <p className="text-sm text-muted-foreground">{option.description}</p>
                                </div>
                              </div>
                            </button>
                          ))}
                        </div>
                      </div>
                    </div>
                  )}
                </motion.div>

                {/* Navigation Buttons */}
                <div className="flex items-center justify-between mt-8 pt-6 border-t border-border">
                  <Button
                    variant="ghost"
                    onClick={handleBack}
                    disabled={step === 1}
                    className="gap-2"
                  >
                    <ArrowLeft className="w-4 h-4" />
                    Retour
                  </Button>

                  <Button
                    onClick={handleNext}
                    disabled={!canProceed()}
                    className="bg-primary hover:bg-primary/90 gap-2"
                  >
                    {step === totalSteps ? "Calculer mon devis" : "Continuer"}
                    <ArrowRight className="w-4 h-4" />
                  </Button>
                </div>
              </Card>
            </>
          ) : (
            /* Quote Result */
            <motion.div
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
            >
              <Card className="p-8 sm:p-10 lg:p-12 border-border shadow-xl text-center">
                <div className="w-20 h-20 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-6">
                  <CheckCircle2 className="w-10 h-10 text-primary" />
                </div>

                <h2 className="text-3xl font-bold mb-4">Votre devis personnalisé</h2>
                <p className="text-muted-foreground mb-8">
                  Voici le tarif calculé en fonction de vos informations
                </p>

                <div className="bg-accent/50 rounded-2xl p-8 mb-8">
                  <p className="text-sm text-muted-foreground mb-2">À partir de</p>
                  <p className="text-5xl sm:text-6xl font-bold text-primary mb-2">
                    {calculatedPrice}€
                  </p>
                  <p className="text-muted-foreground">par mois</p>
                </div>

                <div className="space-y-3 mb-8 text-left max-w-md mx-auto">
                  <div className="flex items-center gap-3">
                    <CheckCircle2 className="w-5 h-5 text-primary flex-shrink-0" />
                    <span className="text-sm text-muted-foreground">
                      {quoteData.coverage === "premium" ? "Tous risques" : quoteData.coverage === "medium" ? "Formule Confort" : "Formule Essentielle"}
                    </span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle2 className="w-5 h-5 text-primary flex-shrink-0" />
                    <span className="text-sm text-muted-foreground">Assistance 24/7 incluse</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle2 className="w-5 h-5 text-primary flex-shrink-0" />
                    <span className="text-sm text-muted-foreground">Sans engagement</span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle2 className="w-5 h-5 text-primary flex-shrink-0" />
                    <span className="text-sm text-muted-foreground">Résiliation à tout moment</span>
                  </div>
                </div>

                <div className="flex flex-col sm:flex-row gap-4 justify-center">
                  <Button
                    onClick={() => {
                      setCalculatedPrice(null);
                      setStep(1);
                    }}
                    variant="outline"
                    size="lg"
                  >
                    Modifier mes informations
                  </Button>
                  <Link to="/paiement">
                    <Button size="lg" className="bg-primary hover:bg-primary/90 gap-2">
                      Continuer vers le paiement
                      <ArrowRight className="w-4 h-4" />
                    </Button>
                  </Link>
                </div>
              </Card>
            </motion.div>
          )}
        </div>
      </div>

      <Footer />
    </div>
  );
}

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
import useTariffs from "../hooks/useTariffs";

const API_URL = import.meta.env.VITE_API_URL || "";

export function QuotePage() {
  const navigate = useNavigate();
  const tariffsHook = useTariffs();
  const { data: tariffsData, loading: tariffsLoading } = tariffsHook;
  const [step, setStep] = useState(1);
  const [quoteData, setQuoteData] = useState({
    vehicleType: "",
    brand: "",
    model: "",
    year: "",
    driverAge: "",
    puissance: "",
    kilometrage: "",
    cylindree: "",
    superficie: "",
    mobilier: "",
    usage: "",
    location: "",
    coverage: ""
  });
  const [calculatedPrice, setCalculatedPrice] = useState(null);
  const [savingQuote, setSavingQuote] = useState(false);
  const [savedQuote, setSavedQuote] = useState(null);

  const buildQuotePayload = () => ({
    type: quoteData.vehicleType || "auto",
    amount: calculatedPrice,
    deductible: quoteData.coverage === "premium" ? 100 : quoteData.coverage === "medium" ? 200 : 300,
    coverage_details: {
      coverage: quoteData.coverage,
      usage: quoteData.usage,
      location: quoteData.location
    },
    vehicle_details: quoteData.vehicleType === "habitation" ? undefined : {
      brand: quoteData.brand,
      model: quoteData.model,
      year: quoteData.year,
      puissance: quoteData.puissance || null,
      kilometrage: quoteData.kilometrage || null,
      cylindree: quoteData.cylindree || null
    },
    property_details: quoteData.vehicleType === "habitation" ? {
      superficie: quoteData.superficie || null,
      mobilier: quoteData.mobilier || null
    } : undefined
  });

  const saveQuoteToCheckout = quote => {
    if (!quote) return;
    localStorage.setItem("assurance-pending-quote", JSON.stringify({
      id: quote.id,
      reference: quote.reference,
      amount: Number(quote.amount ?? calculatedPrice ?? 0),
      deductible: Number(quote.deductible ?? 0),
      type: quote.type || quoteData.vehicleType,
      coverage_details: quote.coverage_details || {
        coverage: quoteData.coverage,
        usage: quoteData.usage,
        location: quoteData.location
      },
      vehicle_details: quote.vehicle_details || buildQuotePayload().vehicle_details || null,
      property_details: quote.property_details || buildQuotePayload().property_details || null,
      quoteData
    }));
  };

  const saveQuote = async () => {
    if (calculatedPrice == null) return null;

    setSavingQuote(true);
    try {
      const token = localStorage.getItem("assurance-auth-token");
      const res = await fetch(`${API_URL}/api/quotes`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          ...(token ? { Authorization: `Bearer ${token}` } : {})
        },
        body: JSON.stringify(buildQuotePayload())
      });

      const data = await res.json().catch(() => ({}));
      if (!res.ok) {
        if (res.status === 401) {
          alert("Vous devez vous connecter pour enregistrer le devis.");
          navigate("/login");
          return null;
        }
        throw new Error(data?.message || "Erreur lors de l'enregistrement");
      }

      const quote = data.data || data;
      setSavedQuote(quote);
      saveQuoteToCheckout(quote);
      return quote;
    } catch (err) {
      console.error("Save quote failed", err);
      alert("Erreur lors de l'enregistrement du devis");
      return null;
    } finally {
      setSavingQuote(false);
    }
  };

  const handleContinueToPayment = async () => {
    const quote = savedQuote || await saveQuote();
    if (quote) {
      navigate("/paiement");
    }
  };
  const totalSteps = 3;
  const progress = step / totalSteps * 100;
  const updateData = (field, value) => {
    setQuoteData(prev => ({
      ...prev,
      [field]: value
    }));
  };
  const calculatePrice = () => {
    let basePrice = 0;
    const { data: tariffs = {} } = tariffsHook;
    const { puissance = [], age = [], kilometrage = [], cylindree = [], superficie = [], mobilier = [] } = tariffs || {};

    // Base price by vehicle type (starting point)
    if (quoteData.vehicleType === "auto") basePrice = 35;
    if (quoteData.vehicleType === "moto") basePrice = 25;
    if (quoteData.vehicleType === "habitation") basePrice = 15;

    // Collect multipliers (default 1)
    let ageCoeff = 1;
    let puissanceCoeff = 1;
    let kmCoeff = 1;
    let cylCoeff = 1;
    let supCoeff = 1; // for habitation we'll set base from prime_base
    let mobilierCoeff = 1;
    let coverageCoeff = 1;
    let usageCoeff = 1;

    // Age coefficient: if tariff table available try to match, otherwise fallback to rules
    try {
      const sel = quoteData.driverAge;
      if (Array.isArray(age) && age.length > 0) {
        // sel might be age_min string (from tariff options) or a range like '18-24'
        let found = null;
        if (sel && String(sel).match(/^\d+$/)) {
          found = age.find(a => String(a.age_min) === String(sel));
        } else if (sel && String(sel).includes('-')) {
          const low = parseInt(String(sel).split('-')[0], 10);
          found = age.find(a => (a.age_min <= low) && (a.age_max === null || a.age_max === undefined || low <= a.age_max));
        }
        if (found) ageCoeff = parseFloat(found.coeff_age);
      } else {
        // fallback simple rules based on selected label
        if (sel) {
          const low = parseInt(String(sel).split('-')[0], 10);
          if (!isNaN(low)) {
            if (low < 25) ageCoeff = 1.5; else if (low > 60) ageCoeff = 1.2; else ageCoeff = 1;
          }
        }
      }
    } catch (e) { console.warn('age coeff error', e); }

    // Auto: puissance & kilometrage
    if (quoteData.vehicleType === 'auto') {
      try {
        if (quoteData.puissance) {
          const p = (Array.isArray(puissance) ? puissance : []).find(pw => String(pw.cv_fiscaux) === String(quoteData.puissance));
          if (p) puissanceCoeff = parseFloat(p.coeff_puissance);
        }
        if (quoteData.kilometrage) {
          const k = (Array.isArray(kilometrage) ? kilometrage : []).find(km => String(km.id) === String(quoteData.kilometrage));
          if (k) kmCoeff = parseFloat(k.coeff_km);
        }
      } catch (e) { console.warn('auto coeff error', e); }
    }

    // Moto: cylindree
    if (quoteData.vehicleType === 'moto') {
      try {
        if (quoteData.cylindree) {
          if (Array.isArray(cylindree) && cylindree.length > 0) {
            const c = cylindree.find(cy => String(cy.id) === String(quoteData.cylindree));
            if (c) cylCoeff = parseFloat(c.coeff_cylindree);
            else {
              // maybe the value is a CC number (fallback options); map by libelle or numeric
              const numeric = parseInt(String(quoteData.cylindree).replace(/[^0-9]/g, ''), 10);
              if (!isNaN(numeric)) {
                // approximate mapping similar to DB seeds
                if (numeric <= 50) cylCoeff = 0.7; else if (numeric <= 125) cylCoeff = 0.85; else if (numeric <= 250) cylCoeff = 1.0; else if (numeric <= 500) cylCoeff = 1.25; else if (numeric <= 750) cylCoeff = 1.5; else if (numeric <= 1000) cylCoeff = 1.75; else cylCoeff = 2.0;
              }
            }
          } else {
            // no tariff table: use numeric fallback
            const numeric = parseInt(String(quoteData.cylindree).replace(/[^0-9]/g, ''), 10);
            if (!isNaN(numeric)) {
              if (numeric <= 50) cylCoeff = 0.7; else if (numeric <= 125) cylCoeff = 0.85; else if (numeric <= 250) cylCoeff = 1.0; else if (numeric <= 500) cylCoeff = 1.25; else if (numeric <= 750) cylCoeff = 1.5; else if (numeric <= 1000) cylCoeff = 1.75; else cylCoeff = 2.0;
            }
          }
        }
      } catch (e) { console.warn('moto coeff error', e); }
    }

    // Habitation: superficie base and mobilier coeff
    if (quoteData.vehicleType === 'habitation') {
      try {
        if (quoteData.superficie && Array.isArray(superficie) && superficie.length > 0) {
          const s = superficie.find(su => String(su.id) === String(quoteData.superficie));
          if (s) basePrice = parseFloat(s.prime_base_eur);
        }
        if (quoteData.mobilier) {
          const m = (Array.isArray(mobilier) ? mobilier : []).find(mo => String(mo.id) === String(quoteData.mobilier));
          if (m) mobilierCoeff = parseFloat(m.coeff_mobilier);
        }
      } catch (e) { console.warn('hab coeff error', e); }
    }

    // Coverage coefficients: basic=1, medium=1.5, premium=2
    if (quoteData.coverage === 'basic') coverageCoeff = 1; else if (quoteData.coverage === 'medium') coverageCoeff = 1.5; else if (quoteData.coverage === 'premium') coverageCoeff = 2;

    // Usage coefficients: personal=1, commute=1.1, professional=1.25
    if (quoteData.usage === 'personal') usageCoeff = 1; else if (quoteData.usage === 'commute') usageCoeff = 1.1; else if (quoteData.usage === 'professional') usageCoeff = 1.25;

    // Final price calculation: multiply base by all coefficients
    const finalPrice = Math.round(basePrice * ageCoeff * puissanceCoeff * kmCoeff * cylCoeff * mobilierCoeff * coverageCoeff * usageCoeff);
    setCalculatedPrice(finalPrice);
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
      // require vehicle-specific tariff selections when applicable
      if (!quoteData.vehicleType || !quoteData.brand || !quoteData.model || !quoteData.year) return false;
      if (quoteData.vehicleType === 'auto') return Boolean(quoteData.puissance && quoteData.kilometrage);
      if (quoteData.vehicleType === 'moto') return Boolean(quoteData.cylindree);
      if (quoteData.vehicleType === 'habitation') return Boolean(quoteData.superficie && quoteData.mobilier);
      return true;
    }
    if (step === 2) {
      return quoteData.driverAge && quoteData.usage;
    }
    if (step === 3) {
      return quoteData.location && quoteData.coverage;
    }
    return false;
  };
  return <div className="min-h-screen bg-secondary/30">
      <Header />

      <div className="pt-24 sm:pt-32 pb-16 sm:pb-24">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          {/* Header */}
          <motion.div initial={{
          opacity: 0,
          y: -20
        }} animate={{
          opacity: 1,
          y: 0
        }} className="text-center mb-8 sm:mb-12">
            <h1 className="text-3xl sm:text-4xl font-bold mb-4">
              Obtenez votre devis en ligne
            </h1>
            <p className="text-lg text-muted-foreground">
              Répondez à quelques questions pour recevoir votre tarif personnalisé
            </p>
          </motion.div>

          {calculatedPrice === null ? <>
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
                <motion.div key={step} initial={{
              opacity: 0,
              x: 20
            }} animate={{
              opacity: 1,
              x: 0
            }} exit={{
              opacity: 0,
              x: -20
            }} transition={{
              duration: 0.3
            }}>
                  {/* Step 1: Vehicle Information */}
                  {step === 1 && <div className="space-y-6">
                      <h2 className="text-2xl font-semibold mb-6">
                        Type de véhicule / bien
                      </h2>

                      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                        {[{
                    type: "auto",
                    icon: Car,
                    label: "Auto"
                  }, {
                    type: "moto",
                    icon: Bike,
                    label: "Moto"
                  }, {
                    type: "habitation",
                    icon: Home,
                    label: "Habitation"
                  }].map(option => <button key={option.type} onClick={() => updateData("vehicleType", option.type)} className={`p-6 rounded-xl border-2 transition-all hover:border-primary hover:shadow-md ${quoteData.vehicleType === option.type ? "border-primary bg-accent" : "border-border bg-white"}`}>
                            <option.icon className="w-8 h-8 mx-auto mb-3 text-primary" />
                            <p className="font-medium">{option.label}</p>
                          </button>)}
                      </div>

                      <div className="grid sm:grid-cols-2 gap-4">
                        <div className="space-y-2">
                          <Label htmlFor="brand">Marque</Label>
                          <Input id="brand" placeholder="Ex: Renault, Peugeot..." value={quoteData.brand} onChange={e => updateData("brand", e.target.value)} />
                        </div>

                        <div className="space-y-2">
                          <Label htmlFor="model">Modèle</Label>
                          <Input id="model" placeholder="Ex: Clio, 308..." value={quoteData.model} onChange={e => updateData("model", e.target.value)} />
                        </div>
                      </div>

                      <div className="space-y-2">
                        <Label htmlFor="year">Année de mise en circulation</Label>
                        <Select value={quoteData.year} onValueChange={val => updateData("year", val)}>
                          <SelectTrigger>
                            <SelectValue placeholder="Sélectionnez l'année" />
                          </SelectTrigger>
                          <SelectContent>
                            {Array.from({
                        length: 20
                      }, (_, i) => 2026 - i).map(year => <SelectItem key={year} value={year.toString()}>
                                {year}
                              </SelectItem>)}
                          </SelectContent>
                        </Select>
                      </div>
                    </div>}

                  {/* Step 2: Driver Information */}
                  {step === 2 && <div className="space-y-6">
                      <h2 className="text-2xl font-semibold mb-6">
                        Informations conducteur
                      </h2>

                      <div className="space-y-2">
                        <Label htmlFor="driverAge">Âge du conducteur principal</Label>
                        <Select value={quoteData.driverAge} onValueChange={val => updateData("driverAge", val)}>
                          <SelectTrigger>
                            <SelectValue placeholder="Sélectionnez votre âge" />
                          </SelectTrigger>
                          <SelectContent>
                            {!tariffsLoading && tariffsData && Array.isArray(tariffsData.age) && tariffsData.age.length > 0 ? (
                              tariffsData.age.map(a => (
                                <SelectItem key={a.age_min} value={String(a.age_min)}>{a.age_min}{a.age_max ? ` - ${a.age_max}` : '+'}</SelectItem>
                              ))
                            ) : (
                              <>
                                <SelectItem value="18-24">18-24 ans</SelectItem>
                                <SelectItem value="25-34">25-34 ans</SelectItem>
                                <SelectItem value="35-44">35-44 ans</SelectItem>
                                <SelectItem value="45-54">45-54 ans</SelectItem>
                                <SelectItem value="55-64">55-64 ans</SelectItem>
                                <SelectItem value="65+">65 ans et plus</SelectItem>
                              </>
                            )}
                          </SelectContent>
                        </Select>
                      </div>

                      <div className="space-y-2">
                        <Label htmlFor="usage">Usage du véhicule</Label>
                        <Select value={quoteData.usage} onValueChange={val => updateData("usage", val)}>
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
                    </div>}

                  {/* Step 3: Coverage & Location */}
                  {step === 3 && <div className="space-y-6">
                      <h2 className="text-2xl font-semibold mb-6">
                        Localisation et garanties
                      </h2>

                      <div className="space-y-2">
                        <Label htmlFor="location">Code postal</Label>
                        <Input id="location" placeholder="Ex: 75001" value={quoteData.location} onChange={e => updateData("location", e.target.value)} maxLength={5} />
                      </div>

                      <div className="space-y-2">
                        <Label>Niveau de couverture</Label>
                        <div className="space-y-3">
                          {[{
                      value: "basic",
                      title: "Formule Essentielle",
                      description: "Responsabilité civile obligatoire"
                    }, {
                      value: "medium",
                      title: "Formule Confort",
                      description: "RC + Vol + Incendie + Bris de glace"
                    }, {
                      value: "premium",
                      title: "Formule Premium",
                      description: "Tous risques + Assistance + Protection juridique"
                    }].map(option => <button key={option.value} onClick={() => updateData("coverage", option.value)} className={`w-full p-4 rounded-xl border-2 text-left transition-all hover:border-primary ${quoteData.coverage === option.value ? "border-primary bg-accent" : "border-border bg-white"}`}>
                              <div className="flex items-start gap-3">
                                <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center mt-0.5 ${quoteData.coverage === option.value ? "border-primary bg-primary" : "border-muted"}`}>
                                  {quoteData.coverage === option.value && <div className="w-2 h-2 rounded-full bg-white" />}
                                </div>
                                <div className="flex-1">
                                  <p className="font-medium mb-1">{option.title}</p>
                                  <p className="text-sm text-muted-foreground">{option.description}</p>
                                </div>
                              </div>
                            </button>)}
                        </div>
                      </div>
                    </div>}

                  {/* Additional selects for tariff-based options */}
                  {step === 1 && quoteData.vehicleType === 'auto' && !tariffsLoading && tariffsData && (
                    <div className="mt-4 grid sm:grid-cols-2 gap-4">
                      <div>
                        <Label>Puissance fiscale</Label>
                        <Select value={quoteData.puissance} onValueChange={val => updateData('puissance', val)}>
                          <SelectTrigger><SelectValue placeholder="Sélectionnez" /></SelectTrigger>
                          <SelectContent>
                            {(tariffsData.puissance || []).map(p => (
                              <SelectItem key={p.cv_fiscaux} value={String(p.cv_fiscaux)}>{p.cv_fiscaux} CV</SelectItem>
                            ))}
                          </SelectContent>
                        </Select>
                      </div>
                      <div>
                        <Label>Kilométrage annuel</Label>
                        <Select value={quoteData.kilometrage} onValueChange={val => updateData('kilometrage', val)}>
                          <SelectTrigger><SelectValue placeholder="Sélectionnez" /></SelectTrigger>
                          <SelectContent>
                            {(tariffsData.kilometrage || []).map(k => (
                              <SelectItem key={k.id} value={String(k.id)}>{k.libelle}</SelectItem>
                            ))}
                          </SelectContent>
                        </Select>
                      </div>
                    </div>
                  )}

                  {step === 1 && quoteData.vehicleType === 'moto' && (
                    <div className="mt-4">
                      <Label>Cylindrée</Label>
                      <Select value={quoteData.cylindree} onValueChange={val => updateData('cylindree', val)}>
                        <SelectTrigger><SelectValue placeholder="Sélectionnez" /></SelectTrigger>
                        <SelectContent>
                          {!tariffsLoading && tariffsData && Array.isArray(tariffsData.cylindree) && tariffsData.cylindree.length > 0 ? (
                            (tariffsData.cylindree || []).map(c => (
                              <SelectItem key={c.id} value={String(c.id)}>{c.libelle}</SelectItem>
                            ))
                          ) : (
                            // Fallback static options when the backend tariffs are not available
                            <>
                              <SelectItem value="50">50 cc</SelectItem>
                              <SelectItem value="125">125 cc</SelectItem>
                              <SelectItem value="250">250 cc</SelectItem>
                              <SelectItem value="500">500 cc</SelectItem>
                              <SelectItem value="750">750 cc</SelectItem>
                              <SelectItem value="1000">1000 cc</SelectItem>
                              <SelectItem value=">1000">&gt; 1000 cc</SelectItem>
                            </>
                          )}
                        </SelectContent>
                      </Select>
                    </div>
                  )}

                  {step === 1 && quoteData.vehicleType === 'habitation' && !tariffsLoading && tariffsData && (
                    <div className="mt-4 grid sm:grid-cols-2 gap-4">
                      <div>
                        <Label>Superficie</Label>
                        <Select value={quoteData.superficie} onValueChange={val => updateData('superficie', val)}>
                          <SelectTrigger><SelectValue placeholder="Sélectionnez" /></SelectTrigger>
                          <SelectContent>
                            {(tariffsData.superficie || []).map(s => (
                              <SelectItem key={s.id} value={String(s.id)}>{s.libelle}</SelectItem>
                            ))}
                          </SelectContent>
                        </Select>
                      </div>
                      <div>
                        <Label>Valeur mobilier</Label>
                        <Select value={quoteData.mobilier} onValueChange={val => updateData('mobilier', val)}>
                          <SelectTrigger><SelectValue placeholder="Sélectionnez" /></SelectTrigger>
                          <SelectContent>
                            {(tariffsData.mobilier || []).map(m => (
                              <SelectItem key={m.id} value={String(m.id)}>{m.libelle}</SelectItem>
                            ))}
                          </SelectContent>
                        </Select>
                      </div>
                    </div>
                  )}
                </motion.div>

                {/* Navigation Buttons */}
                <div className="flex items-center justify-between mt-8 pt-6 border-t border-border">
                  <Button variant="ghost" onClick={handleBack} disabled={step === 1} className="gap-2">
                    <ArrowLeft className="w-4 h-4" />
                    Retour
                  </Button>

                  <Button onClick={handleNext} disabled={!canProceed()} className="bg-primary hover:bg-primary/90 gap-2">
                    {step === totalSteps ? "Calculer mon devis" : "Continuer"}
                    <ArrowRight className="w-4 h-4" />
                  </Button>
                </div>
              </Card>
            </> : (/* Quote Result */
        <motion.div initial={{
          opacity: 0,
          scale: 0.95
        }} animate={{
          opacity: 1,
          scale: 1
        }}>
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
                              <Button onClick={() => {
                            setCalculatedPrice(null);
                            setStep(1);
                          }} variant="outline" size="lg">
                                Modifier mes informations
                              </Button>
                              <div className="flex gap-3">
                                <Button onClick={async () => {
                                  // Save quote to backend
                                  if (calculatedPrice == null) return;
                                  setSavingQuote(true);
                                  try {
                                    const token = localStorage.getItem('assurance-auth-token');
                                    const payload = {
                                      type: quoteData.vehicleType || 'auto',
                                      amount: calculatedPrice,
                                      coverage_details: {
                                        coverage: quoteData.coverage,
                                        usage: quoteData.usage
                                      },
                                      vehicle_details: quoteData.vehicleType === 'habitation' ? undefined : {
                                        brand: quoteData.brand,
                                        model: quoteData.model,
                                        year: quoteData.year,
                                        puissance: quoteData.puissance || null,
                                        kilometrage: quoteData.kilometrage || null,
                                        cylindree: quoteData.cylindree || null
                                      },
                                      property_details: quoteData.vehicleType === 'habitation' ? {
                                        superficie: quoteData.superficie || null,
                                        mobilier: quoteData.mobilier || null
                                      } : undefined
                                    };

                                    const res = await fetch(`${API_URL}/api/quotes`, {
                                      method: 'POST',
                                      headers: {
                                        'Content-Type': 'application/json',
                                        ...(token ? { Authorization: `Bearer ${token}` } : {})
                                      },
                                      body: JSON.stringify(payload)
                                    });

                                    const data = await res.json().catch(() => ({}));
                                    if (!res.ok) {
                                      if (res.status === 401) {
                                        window.dispatchEvent(new CustomEvent('show_dialog', {
                                          detail: {
                                            title: 'Connexion requise',
                                            description: 'Vous devez vous connecter pour enregistrer le devis.',
                                            actions: [{ label: 'Se connecter', action: () => window.location.href = '/login' }]
                                          }
                                        }));
                                      } else {
                                        throw new Error(data?.message || 'Erreur lors de l\'enregistrement');
                                      }
                                    } else {
                                      setSavedQuote(data.data || data);
                                      saveQuoteToCheckout(data.data || data);
                                      window.dispatchEvent(new CustomEvent('show_dialog', {
                                        detail: {
                                          title: 'Devis enregistré',
                                          description: 'Votre devis a été enregistré avec succès. Vous pouvez maintenant le finaliser au paiement.',
                                          actions: [{ label: 'Aller au paiement', action: () => window.location.href = '/paiement' }, { label: 'Fermer', action: () => {} }]
                                        }
                                      }));
                                    }
                                  } catch (err) {
                                    console.error('Save quote failed', err);
                                    window.dispatchEvent(new CustomEvent('show_dialog', {
                                      detail: {
                                        title: 'Erreur',
                                        description: "Erreur lors de l'enregistrement du devis.",
                                        actions: [{ label: 'Fermer', action: () => {} }]
                                      }
                                    }));
                                  } finally {
                                    setSavingQuote(false);
                                  }
                                }} size="lg" className="bg-primary hover:bg-primary/90 gap-2" disabled={savingQuote}>
                                  {savingQuote ? 'Enregistrement...' : 'Enregistrer le devis'}
                                </Button>

                                <Link to="/paiement" onClick={(event) => {
                                  if (!savedQuote) {
                                    event.preventDefault();
                                    window.dispatchEvent(new CustomEvent('show_dialog', {
                                      detail: {
                                        title: 'Devis non enregistré',
                                        description: "Enregistrez d'abord le devis pour continuer.",
                                        actions: [{ label: 'Fermer', action: () => {} }]
                                      }
                                    }));
                                  }
                                }}>
                                  <Button size="lg" className="bg-secondary/80 hover:bg-secondary/90 gap-2" disabled={!savedQuote}>
                                    Continuer vers le paiement
                                    <ArrowRight className="w-4 h-4" />
                                  </Button>
                                </Link>
                              </div>
                </div>
              </Card>
            </motion.div>)}
        </div>
      </div>

      <Footer />
    </div>;
}

import { useState } from "react";
import { useNavigate } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Label } from "../components/ui/label";
import { Input } from "../components/ui/input";
import { Textarea } from "../components/ui/textarea";
import { Badge } from "../components/ui/badge";
import {
  AlertTriangle,
  Upload,
  X,
  CheckCircle2,
  Clock,
  FileText,
  Camera,
} from "lucide-react";
import { motion } from "motion/react";

interface ClaimFile {
  id: string;
  name: string;
  size: string;
}

export function ClaimsPage() {
  const navigate = useNavigate();
  const [files, setFiles] = useState<ClaimFile[]>([]);
  const [isSubmitted, setIsSubmitted] = useState(false);

  const existingClaims = [
    {
      id: "SIN-2024-001",
      date: "15/03/2026",
      type: "Accident matériel",
      status: "in_progress",
      contract: "Renault Clio",
    },
  ];

  const handleFileUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const uploadedFiles = e.target.files;
    if (uploadedFiles) {
      const newFiles: ClaimFile[] = Array.from(uploadedFiles).map((file, index) => ({
        id: `file-${Date.now()}-${index}`,
        name: file.name,
        size: (file.size / 1024).toFixed(2) + " KB",
      }));
      setFiles([...files, ...newFiles]);
    }
  };

  const removeFile = (id: string) => {
    setFiles(files.filter((file) => file.id !== id));
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setIsSubmitted(true);
    
    // Simulate submission
    setTimeout(() => {
      navigate("/dashboard");
    }, 3000);
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
            <div className="w-16 h-16 bg-destructive/10 rounded-full flex items-center justify-center mx-auto mb-4">
              <AlertTriangle className="w-8 h-8 text-destructive" />
            </div>
            <h1 className="text-3xl sm:text-4xl font-bold mb-4">
              Déclarer un sinistre
            </h1>
            <p className="text-lg text-muted-foreground">
              Nous sommes là pour vous accompagner dans cette situation
            </p>
          </motion.div>

          {!isSubmitted ? (
            <div className="grid lg:grid-cols-3 gap-8">
              {/* Main Form */}
              <div className="lg:col-span-2 space-y-6">
                <Card className="p-6 sm:p-8 border-border shadow-lg">
                  <h2 className="text-xl font-semibold mb-6">Informations du sinistre</h2>

                  <form onSubmit={handleSubmit} className="space-y-6">
                    <div className="space-y-2">
                      <Label htmlFor="contract">Contrat concerné *</Label>
                      <select
                        id="contract"
                        required
                        className="w-full h-10 px-3 rounded-lg border border-border bg-white"
                      >
                        <option value="">Sélectionner un contrat</option>
                        <option value="cnt-001">Renault Clio - Assurance Auto</option>
                        <option value="cnt-002">Appartement Paris 15ème</option>
                      </select>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="claimType">Type de sinistre *</Label>
                      <select
                        id="claimType"
                        required
                        className="w-full h-10 px-3 rounded-lg border border-border bg-white"
                      >
                        <option value="">Sélectionner un type</option>
                        <option value="accident">Accident matériel</option>
                        <option value="theft">Vol</option>
                        <option value="fire">Incendie</option>
                        <option value="glass">Bris de glace</option>
                        <option value="vandalism">Vandalisme</option>
                        <option value="natural">Catastrophe naturelle</option>
                      </select>
                    </div>

                    <div className="grid sm:grid-cols-2 gap-4">
                      <div className="space-y-2">
                        <Label htmlFor="date">Date du sinistre *</Label>
                        <Input id="date" type="date" required max="2026-04-17" />
                      </div>

                      <div className="space-y-2">
                        <Label htmlFor="time">Heure approximative</Label>
                        <Input id="time" type="time" />
                      </div>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="location">Lieu du sinistre *</Label>
                      <Input
                        id="location"
                        placeholder="Adresse complète"
                        required
                      />
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="description">Description détaillée *</Label>
                      <Textarea
                        id="description"
                        placeholder="Décrivez les circonstances du sinistre..."
                        rows={6}
                        required
                        className="resize-none"
                      />
                      <p className="text-xs text-muted-foreground">
                        Soyez aussi précis que possible pour accélérer le traitement
                      </p>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="witnesses">Témoins</Label>
                      <Input
                        id="witnesses"
                        placeholder="Nom et coordonnées des éventuels témoins"
                      />
                    </div>

                    <div className="space-y-2">
                      <Label>Responsabilité</Label>
                      <div className="space-y-2">
                        {[
                          { value: "me", label: "Je suis responsable" },
                          { value: "other", label: "Un tiers est responsable" },
                          { value: "shared", label: "Responsabilité partagée" },
                          { value: "unknown", label: "Non déterminé" },
                        ].map((option) => (
                          <label
                            key={option.value}
                            className="flex items-center gap-3 p-3 rounded-lg border border-border hover:bg-accent/50 cursor-pointer transition-colors"
                          >
                            <input
                              type="radio"
                              name="responsibility"
                              value={option.value}
                              className="w-4 h-4 text-primary"
                            />
                            <span className="text-sm">{option.label}</span>
                          </label>
                        ))}
                      </div>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="thirdParty">Informations du tiers (si applicable)</Label>
                      <Textarea
                        id="thirdParty"
                        placeholder="Nom, assurance, numéro de contrat, plaque d'immatriculation..."
                        rows={3}
                        className="resize-none"
                      />
                    </div>

                    {/* File Upload */}
                    <div className="space-y-4">
                      <Label>Photos et documents</Label>
                      <div className="border-2 border-dashed border-border rounded-xl p-8 text-center hover:border-primary/50 transition-colors">
                        <input
                          type="file"
                          id="fileUpload"
                          multiple
                          accept="image/*,.pdf"
                          onChange={handleFileUpload}
                          className="hidden"
                        />
                        <label htmlFor="fileUpload" className="cursor-pointer">
                          <div className="w-16 h-16 bg-accent rounded-full flex items-center justify-center mx-auto mb-4">
                            <Camera className="w-8 h-8 text-primary" />
                          </div>
                          <p className="font-medium mb-2">
                            Cliquez pour ajouter des fichiers
                          </p>
                          <p className="text-sm text-muted-foreground">
                            Photos du sinistre, constat amiable, devis de réparation...
                          </p>
                          <p className="text-xs text-muted-foreground mt-2">
                            JPG, PNG ou PDF - Maximum 10 Mo par fichier
                          </p>
                        </label>
                      </div>

                      {files.length > 0 && (
                        <div className="space-y-2">
                          {files.map((file) => (
                            <div
                              key={file.id}
                              className="flex items-center justify-between p-3 bg-accent/50 rounded-lg border border-border"
                            >
                              <div className="flex items-center gap-3">
                                <FileText className="w-5 h-5 text-primary" />
                                <div>
                                  <p className="text-sm font-medium">{file.name}</p>
                                  <p className="text-xs text-muted-foreground">{file.size}</p>
                                </div>
                              </div>
                              <button
                                type="button"
                                onClick={() => removeFile(file.id)}
                                className="p-1 hover:bg-destructive/10 rounded transition-colors"
                              >
                                <X className="w-4 h-4 text-destructive" />
                              </button>
                            </div>
                          ))}
                        </div>
                      )}
                    </div>

                    <Button
                      type="submit"
                      className="w-full h-12 bg-primary hover:bg-primary/90 gap-2"
                    >
                      <Upload className="w-5 h-5" />
                      Envoyer ma déclaration
                    </Button>
                  </form>
                </Card>
              </div>

              {/* Sidebar */}
              <div className="lg:col-span-1 space-y-6">
                <Card className="p-6 border-border shadow-lg sticky top-24">
                  <h3 className="font-semibold mb-4">Conseils importants</h3>
                  <ul className="space-y-3 text-sm text-muted-foreground">
                    <li className="flex items-start gap-2">
                      <CheckCircle2 className="w-4 h-4 text-primary flex-shrink-0 mt-0.5" />
                      <span>Déclarez votre sinistre dans les 5 jours ouvrés</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <CheckCircle2 className="w-4 h-4 text-primary flex-shrink-0 mt-0.5" />
                      <span>Prenez un maximum de photos du sinistre</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <CheckCircle2 className="w-4 h-4 text-primary flex-shrink-0 mt-0.5" />
                      <span>Conservez tous les documents (constat, devis...)</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <CheckCircle2 className="w-4 h-4 text-primary flex-shrink-0 mt-0.5" />
                      <span>Ne reconnaissez jamais votre responsabilité sur place</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <CheckCircle2 className="w-4 h-4 text-primary flex-shrink-0 mt-0.5" />
                      <span>Contactez notre assistance 24/7 si nécessaire</span>
                    </li>
                  </ul>
                </Card>

                {existingClaims.length > 0 && (
                  <Card className="p-6 border-border shadow-lg">
                    <h3 className="font-semibold mb-4">Mes sinistres en cours</h3>
                    <div className="space-y-3">
                      {existingClaims.map((claim) => (
                        <div
                          key={claim.id}
                          className="p-3 bg-accent/50 rounded-lg border border-border"
                        >
                          <div className="flex items-start justify-between mb-2">
                            <p className="text-sm font-medium">{claim.id}</p>
                            <Badge
                              variant="secondary"
                              className="bg-yellow-100 text-yellow-700 hover:bg-yellow-100"
                            >
                              <Clock className="w-3 h-3 mr-1" />
                              En cours
                            </Badge>
                          </div>
                          <p className="text-xs text-muted-foreground mb-1">{claim.type}</p>
                          <p className="text-xs text-muted-foreground">{claim.contract}</p>
                          <p className="text-xs text-muted-foreground">
                            Déclaré le {claim.date}
                          </p>
                        </div>
                      ))}
                    </div>
                  </Card>
                )}

                <Card className="p-6 border-primary bg-accent/50">
                  <h3 className="font-semibold mb-2">Besoin d'aide ?</h3>
                  <p className="text-sm text-muted-foreground mb-4">
                    Notre équipe assistance est disponible 24h/24, 7j/7
                  </p>
                  <Button variant="outline" className="w-full">
                    Appeler l'assistance
                  </Button>
                </Card>
              </div>
            </div>
          ) : (
            /* Success Message */
            <motion.div
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              className="max-w-2xl mx-auto"
            >
              <Card className="p-8 sm:p-12 text-center border-border shadow-xl">
                <div className="w-20 h-20 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-6">
                  <CheckCircle2 className="w-10 h-10 text-primary" />
                </div>

                <h2 className="text-3xl font-bold mb-4">
                  Déclaration envoyée avec succès
                </h2>
                <p className="text-lg text-muted-foreground mb-8">
                  Votre dossier a été créé et sera traité dans les plus brefs délais
                </p>

                <div className="bg-accent/50 rounded-xl p-6 mb-8">
                  <p className="text-sm text-muted-foreground mb-2">
                    Numéro de dossier
                  </p>
                  <p className="text-2xl font-bold text-primary">SIN-2026-{Math.floor(Math.random() * 1000)}</p>
                </div>

                <div className="space-y-3 mb-8 text-left">
                  <div className="flex items-center gap-3">
                    <CheckCircle2 className="w-5 h-5 text-primary flex-shrink-0" />
                    <span className="text-sm text-muted-foreground">
                      Vous recevrez une confirmation par email
                    </span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle2 className="w-5 h-5 text-primary flex-shrink-0" />
                    <span className="text-sm text-muted-foreground">
                      Un expert vous contactera sous 48h
                    </span>
                  </div>
                  <div className="flex items-center gap-3">
                    <CheckCircle2 className="w-5 h-5 text-primary flex-shrink-0" />
                    <span className="text-sm text-muted-foreground">
                      Suivez l'avancement dans votre dashboard
                    </span>
                  </div>
                </div>

                <Button
                  onClick={() => navigate("/dashboard")}
                  className="bg-primary hover:bg-primary/90"
                  size="lg"
                >
                  Retour au dashboard
                </Button>
              </Card>
            </motion.div>
          )}
        </div>
      </div>

      <Footer />
    </div>
  );
}

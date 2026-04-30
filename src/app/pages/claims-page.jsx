import { useEffect, useMemo, useState } from "react";
import { useNavigate } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Label } from "../components/ui/label";
import { Input } from "../components/ui/input";
import { Textarea } from "../components/ui/textarea";
import { Badge } from "../components/ui/badge";
import { AlertTriangle, Upload, X, CheckCircle2, Clock, FileText, Camera } from "lucide-react";
import { motion } from "motion/react";

const API_URL = import.meta.env.VITE_API_URL || "";

const claimTypeLabels = {
  accident: "Accident materiel",
  theft: "Vol",
  fire: "Incendie",
  glass: "Bris de glace",
  vandalism: "Vandalisme",
  natural: "Catastrophe naturelle"
};

export function ClaimsPage() {
  const navigate = useNavigate();
  const [files, setFiles] = useState([]);
  const [contracts, setContracts] = useState([]);
  const [existingClaims, setExistingClaims] = useState([]);
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [submissionReference, setSubmissionReference] = useState("");
  const [form, setForm] = useState({
    contractId: "",
    claimType: "",
    date: new Date().toISOString().slice(0, 10),
    time: "",
    location: "",
    description: "",
    witnesses: "",
    responsibility: "",
    thirdParty: ""
  });

  useEffect(() => {
    let mounted = true;

    async function loadData() {
      try {
        const token = localStorage.getItem("assurance-auth-token");
        const headers = {
          "Content-Type": "application/json",
          ...(token ? { Authorization: `Bearer ${token}` } : {})
        };

        const [contractsResp, incidentsResp] = await Promise.all([
          fetch(`${API_URL}/api/contracts/my-contracts`, { headers }),
          fetch(`${API_URL}/api/incidents/my-incidents`, { headers })
        ]);

        const contractsBody = await contractsResp.json().catch(() => ({}));
        const incidentsBody = await incidentsResp.json().catch(() => ({}));

        const contractItems = (contractsBody && contractsBody.data) || contractsBody || [];
        const incidentItems = (incidentsBody && incidentsBody.data) || incidentsBody || [];

        if (!mounted) return;

        const normalizedContracts = Array.isArray(contractItems) ? contractItems.map((contract) => ({
          id: contract.id,
          type: contract.type,
          label: contract.policy_number || contract.id,
          subtitle: contract.vehicle_info?.brand || contract.property_info?.address || contract.client_name || ""
        })) : [];

        const normalizedIncidents = Array.isArray(incidentItems) ? incidentItems.map((incident) => ({
          id: incident.id,
          reference: incident.reference,
          date: incident.date,
          type: incident.title,
          status: incident.status,
          contract: incident.policy_number || incident.contract_id
        })) : [];

        setContracts(normalizedContracts);
        setExistingClaims(normalizedIncidents);
        setForm((prev) => ({
          ...prev,
          contractId: prev.contractId || normalizedContracts[0]?.id || ""
        }));
      } catch (error) {
        console.error("Failed to load claims data", error);
      }
    }

    loadData();
    return () => { mounted = false; };
  }, []);

  const selectedContract = useMemo(
    () => contracts.find((contract) => contract.id === form.contractId) || null,
    [contracts, form.contractId]
  );

  const handleFileUpload = (e) => {
    const uploadedFiles = e.target.files;
    if (uploadedFiles) {
      const newFiles = Array.from(uploadedFiles).map((file, index) => ({
        id: `file-${Date.now()}-${index}`,
        name: file.name,
        size: `${(file.size / 1024).toFixed(2)} KB`
      }));
      setFiles((prev) => [...prev, ...newFiles]);
    }
  };

  const removeFile = (id) => {
    setFiles((prev) => prev.filter((file) => file.id !== id));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!selectedContract) return;

    setIsSubmitting(true);
    try {
      const token = localStorage.getItem("assurance-auth-token");
      const headers = {
        "Content-Type": "application/json",
        ...(token ? { Authorization: `Bearer ${token}` } : {})
      };

      const details = [
        form.description,
        form.witnesses ? `Temoins: ${form.witnesses}` : "",
        form.responsibility ? `Responsabilite: ${form.responsibility}` : "",
        form.thirdParty ? `Tiers: ${form.thirdParty}` : "",
        files.length ? `Pieces jointes declarees: ${files.map((file) => file.name).join(", ")}` : ""
      ].filter(Boolean).join("\n\n");

      const payload = {
        contract_id: selectedContract.id,
        title: claimTypeLabels[form.claimType] || "Declaration de sinistre",
        description: details,
        date: form.date,
        time: form.time || null,
        location: form.location,
        type: selectedContract.type,
        severity: "moyen"
      };

      const res = await fetch(`${API_URL}/api/incidents`, {
        method: "POST",
        headers,
        body: JSON.stringify(payload)
      });

      const body = await res.json().catch(() => ({}));
      if (!res.ok) {
        throw new Error(body?.message || "Erreur lors de la declaration");
      }

      const created = body.data || body;
      setSubmissionReference(created.reference || created.id);
      setExistingClaims((prev) => [{
        id: created.id,
        reference: created.reference,
        date: created.date,
        type: created.title,
        status: created.status,
        contract: selectedContract.label
      }, ...prev]);
      setIsSubmitted(true);
    } catch (error) {
      console.error("Incident submission failed", error);
      alert("La declaration n'a pas pu etre envoyee.");
    } finally {
      setIsSubmitting(false);
    }
  };

  return <div className="min-h-screen bg-secondary/30">
      <Header />

      <div className="pt-24 sm:pt-32 pb-16 sm:pb-24">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }} className="text-center mb-8 sm:mb-12">
            <div className="w-16 h-16 bg-destructive/10 rounded-full flex items-center justify-center mx-auto mb-4">
              <AlertTriangle className="w-8 h-8 text-destructive" />
            </div>
            <h1 className="text-3xl sm:text-4xl font-bold mb-4">
              Declarer un sinistre
            </h1>
            <p className="text-lg text-muted-foreground">
              Votre declaration sera enregistree en base et visible cote employe
            </p>
          </motion.div>

          {!isSubmitted ? <div className="grid lg:grid-cols-3 gap-8">
              <div className="lg:col-span-2 space-y-6">
                <Card className="p-6 sm:p-8 border-border shadow-lg">
                  <h2 className="text-xl font-semibold mb-6">Informations du sinistre</h2>

                  <form onSubmit={handleSubmit} className="space-y-6">
                    <div className="space-y-2">
                      <Label htmlFor="contract">Contrat concerne *</Label>
                      <select id="contract" value={form.contractId} onChange={(e) => setForm((prev) => ({ ...prev, contractId: e.target.value }))} required className="w-full h-10 px-3 rounded-lg border border-border bg-white">
                        <option value="">Selectionner un contrat</option>
                        {contracts.map((contract) => <option key={contract.id} value={contract.id}>
                            {contract.label} - {contract.type}
                          </option>)}
                      </select>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="claimType">Type de sinistre *</Label>
                      <select id="claimType" value={form.claimType} onChange={(e) => setForm((prev) => ({ ...prev, claimType: e.target.value }))} required className="w-full h-10 px-3 rounded-lg border border-border bg-white">
                        <option value="">Selectionner un type</option>
                        <option value="accident">Accident materiel</option>
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
                        <Input id="date" type="date" required max={new Date().toISOString().slice(0, 10)} value={form.date} onChange={(e) => setForm((prev) => ({ ...prev, date: e.target.value }))} />
                      </div>

                      <div className="space-y-2">
                        <Label htmlFor="time">Heure approximative</Label>
                        <Input id="time" type="time" value={form.time} onChange={(e) => setForm((prev) => ({ ...prev, time: e.target.value }))} />
                      </div>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="location">Lieu du sinistre *</Label>
                      <Input id="location" placeholder="Adresse complete" required value={form.location} onChange={(e) => setForm((prev) => ({ ...prev, location: e.target.value }))} />
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="description">Description detaillee *</Label>
                      <Textarea id="description" placeholder="Decrivez les circonstances du sinistre..." rows={6} required className="resize-none" value={form.description} onChange={(e) => setForm((prev) => ({ ...prev, description: e.target.value }))} />
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="witnesses">Temoins</Label>
                      <Input id="witnesses" placeholder="Nom et coordonnees des temoins" value={form.witnesses} onChange={(e) => setForm((prev) => ({ ...prev, witnesses: e.target.value }))} />
                    </div>

                    <div className="space-y-2">
                      <Label>Responsabilite</Label>
                      <div className="space-y-2">
                        {[
                          { value: "me", label: "Je suis responsable" },
                          { value: "other", label: "Un tiers est responsable" },
                          { value: "shared", label: "Responsabilite partagee" },
                          { value: "unknown", label: "Non determine" }
                        ].map((option) => <label key={option.value} className="flex items-center gap-3 p-3 rounded-lg border border-border hover:bg-accent/50 cursor-pointer transition-colors">
                            <input type="radio" name="responsibility" value={option.value} checked={form.responsibility === option.value} onChange={(e) => setForm((prev) => ({ ...prev, responsibility: e.target.value }))} className="w-4 h-4 text-primary" />
                            <span className="text-sm">{option.label}</span>
                          </label>)}
                      </div>
                    </div>

                    <div className="space-y-2">
                      <Label htmlFor="thirdParty">Informations du tiers</Label>
                      <Textarea id="thirdParty" placeholder="Nom, assurance, numero de contrat..." rows={3} className="resize-none" value={form.thirdParty} onChange={(e) => setForm((prev) => ({ ...prev, thirdParty: e.target.value }))} />
                    </div>

                    <div className="space-y-4">
                      <Label>Photos et documents</Label>
                      <div className="border-2 border-dashed border-border rounded-xl p-8 text-center hover:border-primary/50 transition-colors">
                        <input type="file" id="fileUpload" multiple accept="image/*,.pdf" onChange={handleFileUpload} className="hidden" />
                        <label htmlFor="fileUpload" className="cursor-pointer">
                          <div className="w-16 h-16 bg-accent rounded-full flex items-center justify-center mx-auto mb-4">
                            <Camera className="w-8 h-8 text-primary" />
                          </div>
                          <p className="font-medium mb-2">
                            Cliquez pour ajouter des fichiers
                          </p>
                          <p className="text-sm text-muted-foreground">
                            Les noms des fichiers seront rattaches a la declaration.
                          </p>
                        </label>
                      </div>

                      {files.length > 0 && <div className="space-y-2">
                          {files.map((file) => <div key={file.id} className="flex items-center justify-between p-3 bg-accent/50 rounded-lg border border-border">
                              <div className="flex items-center gap-3">
                                <FileText className="w-5 h-5 text-primary" />
                                <div>
                                  <p className="text-sm font-medium">{file.name}</p>
                                  <p className="text-xs text-muted-foreground">{file.size}</p>
                                </div>
                              </div>
                              <button type="button" onClick={() => removeFile(file.id)} className="p-1 hover:bg-destructive/10 rounded transition-colors">
                                <X className="w-4 h-4 text-destructive" />
                              </button>
                            </div>)}
                        </div>}
                    </div>

                    <Button type="submit" disabled={isSubmitting || !form.contractId} className="w-full h-12 bg-primary hover:bg-primary/90 gap-2">
                      <Upload className="w-5 h-5" />
                      {isSubmitting ? "Envoi..." : "Envoyer ma declaration"}
                    </Button>
                  </form>
                </Card>
              </div>

              <div className="lg:col-span-1 space-y-6">
                <Card className="p-6 border-border shadow-lg sticky top-24">
                  <h3 className="font-semibold mb-4">Conseils importants</h3>
                  <ul className="space-y-3 text-sm text-muted-foreground">
                    <li className="flex items-start gap-2">
                      <CheckCircle2 className="w-4 h-4 text-primary flex-shrink-0 mt-0.5" />
                      <span>Declarez votre sinistre dans les 5 jours ouvres</span>
                    </li>
                    <li className="flex items-start gap-2">
                      <CheckCircle2 className="w-4 h-4 text-primary flex-shrink-0 mt-0.5" />
                      <span>Le dossier sera visible sur les ecrans employe apres envoi</span>
                    </li>
                  </ul>
                </Card>

                {existingClaims.length > 0 && <Card className="p-6 border-border shadow-lg">
                    <h3 className="font-semibold mb-4">Mes sinistres en cours</h3>
                    <div className="space-y-3">
                      {existingClaims.map((claim) => <div key={claim.id} className="p-3 bg-accent/50 rounded-lg border border-border">
                          <div className="flex items-start justify-between mb-2">
                            <p className="text-sm font-medium">{claim.reference || claim.id}</p>
                            <Badge variant="secondary" className="bg-yellow-100 text-yellow-700 hover:bg-yellow-100">
                              <Clock className="w-3 h-3 mr-1" />
                              {claim.status}
                            </Badge>
                          </div>
                          <p className="text-xs text-muted-foreground mb-1">{claim.type}</p>
                          <p className="text-xs text-muted-foreground">{claim.contract}</p>
                          <p className="text-xs text-muted-foreground">
                            Declare le {claim.date}
                          </p>
                        </div>)}
                    </div>
                  </Card>}
              </div>
            </div> : <motion.div initial={{ opacity: 0, scale: 0.95 }} animate={{ opacity: 1, scale: 1 }} className="max-w-2xl mx-auto">
              <Card className="p-8 sm:p-12 text-center border-border shadow-xl">
                <div className="w-20 h-20 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-6">
                  <CheckCircle2 className="w-10 h-10 text-primary" />
                </div>

                <h2 className="text-3xl font-bold mb-4">
                  Declaration envoyee avec succes
                </h2>
                <p className="text-lg text-muted-foreground mb-8">
                  Votre dossier est en base et remonte cote employe.
                </p>

                <div className="bg-accent/50 rounded-xl p-6 mb-8">
                  <p className="text-sm text-muted-foreground mb-2">
                    Numero de dossier
                  </p>
                  <p className="text-2xl font-bold text-primary">{submissionReference}</p>
                </div>

                <Button onClick={() => navigate("/dashboard")} className="bg-primary hover:bg-primary/90" size="lg">
                  Retour au dashboard
                </Button>
              </Card>
            </motion.div>}
        </div>
      </div>

      <Footer />
    </div>;
}

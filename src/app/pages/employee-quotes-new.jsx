import { useState, useEffect } from "react";
import { useNavigate } from "react-router";
import { EmployeeHeader } from "../components/employee-header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Input } from "../components/ui/input";
import { Select } from "../components/ui/select";
import { Textarea } from "../components/ui/textarea";

export default function EmployeeQuotesNewPage() {
    const navigate = useNavigate();
    const [clients, setClients] = useState([]);
    const [loadingClients, setLoadingClients] = useState(true);
    const [form, setForm] = useState({
        client_id: '',
        type: 'auto',
        amount: '',
        deductible: '',
        coverage_details: '',
        validity_days: 30,
        vehicle_details: {}
    });
    const [saving, setSaving] = useState(false);
    const token = localStorage.getItem('assurance-auth-token');

    useEffect(() => {
        async function loadClients() {
            try {
                const res = await fetch('/api/users?role=client&limit=100', {
                    headers: { Authorization: token ? `Bearer ${token}` : '' }
                });
                const data = await res.json();
                // normalize
                const list = data && data.data ? data.data : Array.isArray(data) ? data : (data.users || data.users?.users || []);
                setClients(list || []);
            } catch (e) {
                console.error('Failed to load clients', e);
            } finally {
                setLoadingClients(false);
            }
        }
        loadClients();
    }, [token]);

    const productSpecificFields = {
        auto: [
            { key: 'brand', label: 'Marque' },
            { key: 'model', label: 'Modèle' },
            { key: 'power', label: 'Puissance (ch)' },
            { key: 'seats', label: 'Nombre de sièges' }
        ],
        habitation: [
            { key: 'm2', label: 'Surface (m²)' },
            { key: 'rooms', label: 'Nombre de pièces' }
        ],
        moto: [
            { key: 'cc', label: 'Cylindrée (cc)' },
            { key: 'power', label: 'Puissance (ch)' }
        ]
    };

    function setProductField(key, value) {
        setForm(prev => ({ ...prev, vehicle_details: { ...prev.vehicle_details, [key]: value } }));
    }

    async function handleSubmit(e) {
        e.preventDefault();
        setSaving(true);
        try {
            const payload = {
                ...form,
                amount: parseFloat(form.amount) || 0,
                deductible: form.deductible ? parseFloat(form.deductible) : undefined
            };
            const res = await fetch('/api/quotes', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json', Authorization: token ? `Bearer ${token}` : '' },
                body: JSON.stringify(payload)
            });
            const data = await res.json();
            if (!res.ok) throw new Error(data?.message || 'Failed to create quote');
            // redirect to quotes list
            navigate('/employee/quotes');
        } catch (err) {
            console.error(err);
            alert('Erreur lors de la création du devis');
        } finally {
            setSaving(false);
        }
    }

    return (
        <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
            <EmployeeHeader />
            <div className="pt-24 pb-16">
                <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
                    <Card className="p-6 border-border">
                        <h1 className="text-2xl font-bold mb-4">Nouveau Devis</h1>
                        <form onSubmit={handleSubmit} className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Client</label>
                                {loadingClients ? (
                                    <div>Chargement...</div>
                                ) : (
                                    <select value={form.client_id} onChange={(e) => setForm(prev => ({ ...prev, client_id: e.target.value }))} className="w-full px-3 py-2 border rounded">
                                        <option value="">-- Sélectionner un client --</option>
                                        {clients.map(c => (
                                            <option key={c.id} value={c.id}>{c.email || (c.profile && `${c.profile.first_name} ${c.profile.last_name}`) || c.name}</option>
                                        ))}
                                    </select>
                                )}
                            </div>

                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Type</label>
                                <select value={form.type} onChange={(e) => setForm(prev => ({ ...prev, type: e.target.value }))} className="w-full px-3 py-2 border rounded">
                                    <option value="auto">Auto</option>
                                    <option value="habitation">Habitation</option>
                                    <option value="moto">Moto</option>
                                </select>
                            </div>

                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Montant (€/mois)</label>
                                <input type="number" step="0.01" value={form.amount} onChange={(e) => setForm(prev => ({ ...prev, amount: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                            </div>

                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Franchise (€)</label>
                                <input type="number" step="0.01" value={form.deductible} onChange={(e) => setForm(prev => ({ ...prev, deductible: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                            </div>

                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Détails de couverture</label>
                                <textarea value={form.coverage_details} onChange={(e) => setForm(prev => ({ ...prev, coverage_details: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                            </div>

                            {/* Product specific fields */}
                            <div>
                                <h3 className="font-medium mb-2">Informations spécifiques</h3>
                                {productSpecificFields[form.type].map(f => (
                                    <div key={f.key} className="mb-2">
                                        <label className="block text-sm text-gray-700 mb-1">{f.label}</label>
                                        <input type="text" value={form.vehicle_details[f.key] || ''} onChange={(e) => setProductField(f.key, e.target.value)} className="w-full px-3 py-2 border rounded" />
                                    </div>
                                ))}
                            </div>

                            <div className="flex justify-end">
                                <Button type="submit" className="bg-green-600 hover:bg-green-700" disabled={saving || !form.client_id}>
                                    {saving ? 'Enregistrement...' : 'Créer le devis'}
                                </Button>
                            </div>
                        </form>
                    </Card>
                </div>
            </div>
            <Footer />
        </div>
    );
}

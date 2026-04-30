import { useState, useEffect } from "react";
import { useNavigate } from "react-router";
import { EmployeeHeader } from "../components/employee-header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";

export default function EmployeeEventNewPage() {
    const navigate = useNavigate();
    const token = localStorage.getItem('assurance-auth-token');
    const [form, setForm] = useState({
        type: 'event',
        title: '',
        description: '',
        location: '',
        event_date: '',
        time: '',
        image_url: '',
        organizer: ''
    });
    const [imageFile, setImageFile] = useState(null);
    const [previewUrl, setPreviewUrl] = useState('');

    useEffect(() => {
        let objUrl;
        if (imageFile) {
            objUrl = URL.createObjectURL(imageFile);
            setPreviewUrl(objUrl);
        } else if (form.image_url) {
            setPreviewUrl(form.image_url);
        } else {
            setPreviewUrl('');
        }

        return () => {
            if (objUrl) URL.revokeObjectURL(objUrl);
        };
    }, [imageFile, form.image_url]);
    const [saving, setSaving] = useState(false);

    async function handleSubmit(e) {
        e.preventDefault();
        setSaving(true);
        try {
            const fd = new FormData();
            fd.append('type', 'event');
            fd.append('title', form.title);
            fd.append('content', form.description);
            fd.append('description', form.description);
            if (form.location) fd.append('location', form.location);
            if (form.event_date) fd.append('event_date', form.event_date);
            if (form.time) fd.append('time', form.time);
            if (form.image_url) fd.append('image_url', form.image_url);
            if (imageFile) fd.append('image', imageFile);
            if (form.organizer) fd.append('organizer', form.organizer);

            const res = await fetch('/api/content', {
                method: 'POST',
                headers: { Authorization: token ? `Bearer ${token}` : '' },
                body: fd
            });
            const data = await res.json();
            if (!res.ok) throw new Error(data?.message || 'Échec création événement');
            navigate('/employee/blog-management');
        } catch (err) {
            console.error(err);
            alert('Erreur lors de la création de l\'événement');
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
                        <h1 className="text-2xl font-bold mb-4">Nouvel Événement</h1>
                        <form onSubmit={handleSubmit} className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Titre</label>
                                <input value={form.title} onChange={(e) => setForm(prev => ({ ...prev, title: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                            </div>

                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Description</label>
                                <textarea value={form.description} onChange={(e) => setForm(prev => ({ ...prev, description: e.target.value }))} className="w-full px-3 py-2 border rounded h-40" />
                            </div>

                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <label className="block text-sm font-medium text-gray-700 mb-1">Date</label>
                                    <input type="date" value={form.event_date} onChange={(e) => setForm(prev => ({ ...prev, event_date: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                                </div>
                                <div>
                                    <label className="block text-sm font-medium text-gray-700 mb-1">Heure</label>
                                    <input type="time" value={form.time} onChange={(e) => setForm(prev => ({ ...prev, time: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                                </div>
                            </div>

                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Lieu</label>
                                <input value={form.location} onChange={(e) => setForm(prev => ({ ...prev, location: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                            </div>

                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Organisateur</label>
                                <input value={form.organizer} onChange={(e) => setForm(prev => ({ ...prev, organizer: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                            </div>

                            <div className="grid grid-cols-1 lg:grid-cols-3 gap-4 items-start">
                                <div className="lg:col-span-2">
                                    <label className="block text-sm font-medium text-gray-700 mb-1">Image URL</label>
                                    <input value={form.image_url} onChange={(e) => setForm(prev => ({ ...prev, image_url: e.target.value }))} placeholder="https://.../image.jpg" className="w-full px-3 py-2 border rounded mb-2" />
                                    <input type="file" accept="image/*" onChange={(e) => setImageFile(e.target.files && e.target.files[0])} />
                                    <p className="text-xs text-gray-500 mt-2">Image : JPG, PNG. Taille recommandée 1200x630px.</p>
                                </div>
                                <div className="lg:col-span-1">
                                    <div className="w-full h-40 bg-gray-100 border border-dashed rounded flex items-center justify-center overflow-hidden">
                                        {previewUrl ? (
                                            <img src={previewUrl} alt="Aperçu" className="w-full h-full object-cover" />
                                        ) : (
                                            <div className="text-sm text-gray-400">Aperçu de l'image</div>
                                        )}
                                    </div>
                                </div>
                            </div>

                            <div className="flex justify-end">
                                <Button type="submit" className="bg-purple-600 hover:bg-purple-700" disabled={saving || !form.title || !form.event_date}>
                                    {saving ? 'Enregistrement...' : 'Créer l\'événement'}
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

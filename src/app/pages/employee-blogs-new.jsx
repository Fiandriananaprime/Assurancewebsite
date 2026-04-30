import { useState, useEffect } from "react";
import { useNavigate } from "react-router";
import { EmployeeHeader } from "../components/employee-header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";

export default function EmployeeBlogNewPage() {
    const navigate = useNavigate();
    const token = localStorage.getItem('assurance-auth-token');
    const [form, setForm] = useState({
        type: 'blog',
        title: '',
        excerpt: '',
        content: '',
        category: '',
        image_url: '',
        read_time: ''
    });
    const [imageFile, setImageFile] = useState(null);
    const [previewUrl, setPreviewUrl] = useState('');

    useEffect(() => {
        // prefer uploaded file preview, otherwise use image_url
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
            fd.append('type', 'blog');
            fd.append('title', form.title);
            fd.append('excerpt', form.excerpt);
            fd.append('content', form.content);
            if (form.category) fd.append('category', form.category);
            if (form.read_time) fd.append('read_time', form.read_time);
            if (form.image_url) fd.append('image_url', form.image_url);
            if (imageFile) fd.append('image', imageFile);

            const res = await fetch('/api/content', {
                method: 'POST',
                headers: { Authorization: token ? `Bearer ${token}` : '' },
                body: fd
            });
            const data = await res.json();
            if (!res.ok) throw new Error(data?.message || 'Échec création blog');
            navigate('/employee/blog-management');
        } catch (err) {
            console.error(err);
            alert('Erreur lors de la création du blog');
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
                        <h1 className="text-2xl font-bold mb-4">Nouveau Blog</h1>
                        <form onSubmit={handleSubmit} className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Titre</label>
                                <input value={form.title} onChange={(e) => setForm(prev => ({ ...prev, title: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                            </div>

                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Extrait</label>
                                <textarea value={form.excerpt} onChange={(e) => setForm(prev => ({ ...prev, excerpt: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                            </div>

                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">Contenu</label>
                                <textarea value={form.content} onChange={(e) => setForm(prev => ({ ...prev, content: e.target.value }))} className="w-full px-3 py-2 border rounded h-40" />
                            </div>

                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <label className="block text-sm font-medium text-gray-700 mb-1">Catégorie</label>
                                    <input value={form.category} onChange={(e) => setForm(prev => ({ ...prev, category: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                                </div>
                                <div>
                                    <label className="block text-sm font-medium text-gray-700 mb-1">Temps de lecture (min)</label>
                                    <input value={form.read_time} onChange={(e) => setForm(prev => ({ ...prev, read_time: e.target.value }))} className="w-full px-3 py-2 border rounded" />
                                </div>
                            </div>

                            <div className="grid grid-cols-1 lg:grid-cols-3 gap-4 items-start">
                                <div className="lg:col-span-2">
                                    <label className="block text-sm font-medium text-gray-700 mb-1">Image URL (ou uploadez via fichier)</label>
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
                                <Button type="submit" className="bg-green-600 hover:bg-green-700" disabled={saving || !form.title || !form.content}>
                                    {saving ? 'Enregistrement...' : 'Créer le blog'}
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

import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router";
import { EmployeeHeader } from "../components/employee-header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";

function EmployeeBlogEditPage() {
    const { id } = useParams();
    const navigate = useNavigate();
    const token = localStorage.getItem('assurance-auth-token');
    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const [form, setForm] = useState({ title: '', excerpt: '', content: '', category: '', image_url: '', read_time: '' });
    const [imageFile, setImageFile] = useState(null);
    const [previewUrl, setPreviewUrl] = useState('');

    useEffect(() => {
        let mounted = true;
        async function load() {
            try {
                const res = await fetch(`/api/content/${id}`);
                const data = await res.json();
                if (!res.ok) throw new Error(data?.message || 'Failed to load');
                const content = data.data || data;
                if (!mounted) return;
                setForm({
                    title: content.title || '',
                    excerpt: content.excerpt || '',
                    content: content.content || '',
                    category: content.category || '',
                    image_url: content.image_url || '',
                    read_time: content.read_time || ''
                });
                setPreviewUrl(content.image_url || '');
            } catch (err) {
                console.error('Failed to load content', err);
                alert('Erreur chargement contenu');
            } finally {
                if (mounted) setLoading(false);
            }
        }
        load();
        return () => { mounted = false; };
    }, [id]);

    useEffect(() => {
        let objUrl;
        if (imageFile) {
            objUrl = URL.createObjectURL(imageFile);
            setPreviewUrl(objUrl);
        } else {
            setPreviewUrl(form.image_url || '');
        }
        return () => { if (objUrl) URL.revokeObjectURL(objUrl); };
    }, [imageFile, form.image_url]);

    async function handleSubmit(e) {
        e.preventDefault();
        setSaving(true);
        try {
            const fd = new FormData();
            fd.append('title', form.title);
            fd.append('excerpt', form.excerpt);
            fd.append('content', form.content);
            fd.append('category', form.category);
            fd.append('read_time', form.read_time);
            if (form.image_url) fd.append('image_url', form.image_url);
            if (imageFile) fd.append('image', imageFile);

            const res = await fetch(`/api/content/${id}`, {
                method: 'PUT',
                headers: { Authorization: token ? `Bearer ${token}` : '' },
                body: fd
            });
            const data = await res.json();
            if (!res.ok) throw new Error(data?.message || 'Failed to update');
            navigate('/employee/blog-management');
        } catch (err) {
            console.error(err);
            alert('Erreur lors de la mise à jour');
        } finally {
            setSaving(false);
        }
    }

    if (loading) return <div>Chargement...</div>;

    return (
        <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
            <EmployeeHeader />
            <div className="pt-24 pb-16">
                <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
                    <Card className="p-6 border-border">
                        <h1 className="text-2xl font-bold mb-4">Modifier le Blog</h1>
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
                            <div className="grid grid-cols-1 lg:grid-cols-3 gap-4 items-start">
                                <div className="lg:col-span-2">
                                    <label className="block text-sm font-medium text-gray-700 mb-1">Image URL (ou uploadez via fichier)</label>
                                    <input value={form.image_url} onChange={(e) => setForm(prev => ({ ...prev, image_url: e.target.value }))} placeholder="https://.../image.jpg" className="w-full px-3 py-2 border rounded mb-2" />
                                    <input type="file" accept="image/*" onChange={(e) => setImageFile(e.target.files && e.target.files[0])} />
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
                                <Button type="submit" className="bg-green-600 hover:bg-green-700" disabled={saving}>
                                    {saving ? 'Enregistrement...' : 'Mettre à jour le blog'}
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

export default EmployeeBlogEditPage;

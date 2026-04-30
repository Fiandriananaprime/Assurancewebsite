import { useEffect, useMemo, useState } from "react";
import { useNavigate, useParams } from "react-router";
import { motion } from "motion/react";
import { Avatar, AvatarFallback, AvatarImage } from "../../../components/ui/avatar";
import { Button } from "../../../components/ui/button";
import { Card } from "../../../components/ui/card";
import { Input } from "../../../components/ui/input";
import { Label } from "../../../components/ui/label";
import { EmployeeHeader } from "../../../components/employee-header";
import { Footer } from "../../../components/footer";
import { Camera, Loader2, Save, ShieldCheck } from "lucide-react";
import { getAuthUser, normalizeAuthUser, saveAuthUser } from "../../../auth";

const API_URL = import.meta.env.VITE_API_URL || "http://localhost:5000";

export default function EmployeeSettingsSection() {
  const { section } = useParams();
  const navigate = useNavigate();
  const [isLoading, setIsLoading] = useState(false);
  const [status, setStatus] = useState("");
  const [user, setUser] = useState(null);
  const [selectedImage, setSelectedImage] = useState(null);
  const [avatarPreview, setAvatarPreview] = useState("");
  const [formData, setFormData] = useState({
    firstName: "",
    lastName: "",
    email: "",
    role: "",
    phone: "",
    address: "",
  });

  useEffect(() => {
    const authUser = getAuthUser();
    if (!authUser) {
      navigate("/login");
      return;
    }

    setUser(authUser);
    setFormData({
      firstName: authUser.firstName || "",
      lastName: authUser.lastName || "",
      email: authUser.email || "",
      role: authUser.role === "admin" ? "Administrateur" : "Employe",
      phone: authUser.phone || "",
      address: authUser.address || "",
    });
    setAvatarPreview(authUser.profileImage || "");
  }, [navigate]);

  useEffect(() => {
    return () => {
      if (avatarPreview?.startsWith("blob:")) {
        URL.revokeObjectURL(avatarPreview);
      }
    };
  }, [avatarPreview]);

  const avatarLabel = useMemo(() => {
    const initials = `${formData.firstName?.charAt(0) || ""}${formData.lastName?.charAt(0) || ""}`.toUpperCase();
    return initials || user?.avatarLabel || "EM";
  }, [formData.firstName, formData.lastName, user?.avatarLabel]);

  const handleImageChange = (event) => {
    const file = event.target.files?.[0];
    if (!file) {
      return;
    }

    if (avatarPreview?.startsWith("blob:")) {
      URL.revokeObjectURL(avatarPreview);
    }

    setSelectedImage(file);
    setAvatarPreview(URL.createObjectURL(file));
  };

  const handleSave = async (event) => {
    event.preventDefault();
    setIsLoading(true);
    setStatus("");

    try {
      const token = window.localStorage.getItem("assurance-auth-token");
      if (!token) {
        navigate("/login");
        return;
      }

      const payload = new FormData();
      payload.append("first_name", formData.firstName);
      payload.append("last_name", formData.lastName);
      payload.append("phone", formData.phone);
      payload.append("address", formData.address);
      if (selectedImage) {
        payload.append("profile_image", selectedImage);
      }

      const response = await fetch(`${API_URL}/api/users/profile`, {
        method: "PUT",
        headers: {
          Authorization: `Bearer ${token}`,
        },
        body: payload,
      });

      const body = await response.json().catch(() => ({}));
      if (!response.ok) {
        throw new Error(body.message || "Impossible de mettre à jour le profil.");
      }

      const updatedProfile = (body && body.data) || body || {};
      const updatedUser = normalizeAuthUser({
        ...user,
        ...updatedProfile,
        profileImage: updatedProfile.profile_image_url,
      });

      saveAuthUser(updatedUser);
      setUser(updatedUser);
      setSelectedImage(null);
      setAvatarPreview(updatedUser.profileImage || "");
      setStatus("Profil employe mis a jour.");
    } catch (error) {
      setStatus(error.message || "Une erreur est survenue.");
    } finally {
      setIsLoading(false);
    }
  };

  const title = section ? section.replace("-", " ").replace(/\b\w/g, (char) => char.toUpperCase()) : "Parametres";

  if (section !== "profile") {
    return (
      <div className="min-h-screen bg-gray-50">
        <EmployeeHeader />
        <div className="max-w-4xl mx-auto pt-32 p-6">
          <h1 className="text-2xl font-bold mb-4">{title} - Espace Employe</h1>
          <p className="text-muted-foreground">Page de parametres employe pour "{section}".</p>
        </div>
        <Footer />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <EmployeeHeader />
      <div className="max-w-3xl mx-auto pt-32 pb-16 px-4">
        <motion.div initial={{ opacity: 0, scale: 0.98 }} animate={{ opacity: 1, scale: 1 }}>
          <div className="flex items-center gap-3 mb-8">
            <h1 className="text-3xl font-bold text-gray-900">Profil Professionnel</h1>
            <ShieldCheck className="w-6 h-6 text-primary" />
          </div>

          <Card className="p-8 border-border shadow-md bg-white">
            <form onSubmit={handleSave} className="space-y-6">
              <div className="flex flex-col items-center gap-4 border-b border-border pb-6">
                <Avatar className="w-24 h-24">
                  <AvatarImage src={avatarPreview} alt={user?.name || "Profil employe"} />
                  <AvatarFallback className="bg-primary/10 text-primary text-2xl">
                    {avatarLabel}
                  </AvatarFallback>
                </Avatar>
                <div className="w-full max-w-sm space-y-2">
                  <Label htmlFor="employee-profile-image">Photo de profil</Label>
                  <label htmlFor="employee-profile-image" className="flex cursor-pointer items-center justify-center gap-2 rounded-md border border-dashed border-border px-4 py-3 text-sm text-muted-foreground hover:border-primary hover:text-primary">
                    <Camera className="w-4 h-4" />
                    Choisir une photo
                  </label>
                  <Input id="employee-profile-image" type="file" accept="image/*" className="hidden" onChange={handleImageChange} />
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-2">
                  <Label htmlFor="firstName">Prenom</Label>
                  <Input id="firstName" value={formData.firstName} onChange={(event) => setFormData({ ...formData, firstName: event.target.value })} />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="lastName">Nom</Label>
                  <Input id="lastName" value={formData.lastName} onChange={(event) => setFormData({ ...formData, lastName: event.target.value })} />
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-2">
                  <Label htmlFor="email">Email Pro</Label>
                  <Input id="email" value={formData.email} disabled className="bg-gray-100" />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="role">Poste / Role</Label>
                  <Input id="role" value={formData.role} disabled className="bg-gray-100 font-medium text-primary" />
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-2">
                  <Label htmlFor="phone">Ligne Directe</Label>
                  <Input id="phone" value={formData.phone} onChange={(event) => setFormData({ ...formData, phone: event.target.value })} />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="address">Adresse</Label>
                  <Input id="address" value={formData.address} onChange={(event) => setFormData({ ...formData, address: event.target.value })} />
                </div>
              </div>

              <div className="pt-4 border-t border-border flex justify-between items-center">
                <p className="text-xs text-muted-foreground italic">{status || "Les changements sont synchronises dans tout l'espace employe."}</p>
                <Button type="submit" disabled={isLoading} className="gap-2">
                  {isLoading ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
                  Mettre a jour mon profil
                </Button>
              </div>
            </form>
          </Card>
        </motion.div>
      </div>
      <Footer />
    </div>
  );
}

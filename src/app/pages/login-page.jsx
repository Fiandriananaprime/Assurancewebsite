import { useState } from "react";
import { Link, useNavigate } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Input } from "../components/ui/input";
import { Label } from "../components/ui/label";
import { Checkbox } from "../components/ui/checkbox";
import { createAuthUser, getDefaultRouteForRole, saveAuthUser } from "../auth";
import {
    Shield,
    Lock,
    Mail,
    Eye,
    EyeOff,
    ArrowRight,
    CheckCircle2,
    AlertCircle
} from "lucide-react";
import { motion } from "motion/react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export function LoginPage() {
    const navigate = useNavigate();
    const [showPassword, setShowPassword] = useState(false);
    const [isLoading, setIsLoading] = useState(false);
    const [errors, setErrors] = useState({});
    const [formData, setFormData] = useState({
        email: "",
        password: "",
        rememberMe: false
    });

    const validateForm = () => {
        const newErrors = {};

        if (!formData.email) {
            newErrors.email = "L'email est requis";
        } else if (!/\S+@\S+\.\S+/.test(formData.email)) {
            newErrors.email = "Format d'email invalide";
        }

        if (!formData.password) {
            newErrors.password = "Le mot de passe est requis";
        } else if (formData.password.length < 6) {
            newErrors.password = "Le mot de passe doit contenir au moins 6 caractères";
        }

        setErrors(newErrors);
        return Object.keys(newErrors).length === 0;
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!validateForm()) return;

        setIsLoading(true);

        try {
            // Try real backend login first
            const resp = await fetch(`${API_URL}/api/auth/login`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ email: formData.email, password: formData.password })
            });

            const data = await resp.json();

            if (resp.ok) {
                const { user, profile, profileImage, name } = data.data;
                // Save auth user and token
                const authUserObject = createAuthUser(user.email, {
                    ...user,
                    ...profile, // Merge profile data
                    name: name || `${profile?.first_name || ''} ${profile?.last_name || ''}`.trim(),
                    profileImage: profileImage || profile?.profile_image_url,
                    avatarLabel: (profile?.first_name?.[0] || '') + (profile?.last_name?.[0] || '')
                });

                saveAuthUser(authUserObject);
                window.localStorage.setItem('assurance-auth-token', data.data.accessToken);
                navigate(getDefaultRouteForRole(user.role));
            } else {
                setErrors({ api: data.message || "Identifiants invalides" });
            }
        } catch (err) {
            setErrors({ api: "Impossible de contacter le serveur" });
        } finally {
            setIsLoading(false);
        }
    };

    const handleSocialLogin = async (provider) => {
        setIsLoading(true);
        try {
            const resp = await fetch(`${API_URL}/api/auth/login`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ email: `${provider}.client@example.com`, password: 'social-login' })
            });

            const data = await resp.json();

            if (resp.ok) {
                const authUser = data.data.user;
                saveAuthUser(authUser);
                window.localStorage.setItem('assurance-auth-token', data.data.accessToken);
                // Assuming refreshToken is also returned and needs to be stored
                if (data.data.refreshToken) {
                    window.localStorage.setItem('assurance-refresh-token', data.data.refreshToken);
                }
                navigate(getDefaultRouteForRole(authUser.role));
            } else {
                setErrors({ api: data.message || "Connexion sociale échouée" });
            }
        } catch (err) {
            setErrors({ api: "Erreur de connexion au serveur" });
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <div className="min-h-screen bg-white">
            <Header />

            <div className="pt-20">
                <div className="min-h-[calc(100vh-80px)] grid lg:grid-cols-2">
                    {/* Left Side - Form */}
                    <div className="flex items-center justify-center p-6 sm:p-12 lg:p-16">
                        <motion.div
                            initial={{ opacity: 0, x: -20 }}
                            animate={{ opacity: 1, x: 0 }}
                            transition={{ duration: 0.6 }}
                            className="w-full max-w-md"
                        >
                            <div className="text-center mb-8">
                                <div className="inline-flex items-center gap-2 px-4 py-2 bg-accent/50 rounded-full border border-primary/20 mb-6">
                                    <Shield className="w-4 h-4 text-primary" />
                                    <span className="text-sm font-medium text-primary">
                                        Connexion sécurisée
                                    </span>
                                </div>

                                <h1 className="text-3xl sm:text-4xl font-bold mb-3">
                                    Bon retour parmi nous
                                </h1>
                                <p className="text-lg text-muted-foreground">
                                    Connectez-vous à votre espace client
                                </p>
                            </div>

                            <Card className="p-6 sm:p-8 border-border">
                                <form onSubmit={handleSubmit} className="space-y-6">
                                    {errors.api && (
                                        <div className="p-3 rounded-md bg-destructive/10 text-destructive text-sm flex items-center gap-2">
                                            <AlertCircle className="w-4 h-4" />
                                            {errors.api}
                                        </div>
                                    )}
                                    {/* Email Field */}
                                    <div className="space-y-2">
                                        <Label htmlFor="email">Email</Label>
                                        <div className="relative">
                                            <Mail className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-foreground" />
                                            <Input
                                                id="email"
                                                type="email"
                                                placeholder="votre@email.com"
                                                className={`pl-10 ${errors.email ? 'border-destructive focus-visible:ring-destructive/20' : ''}`}
                                                value={formData.email}
                                                onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                                            />
                                        </div>
                                        {errors.email && (
                                            <p className="text-sm text-destructive flex items-center gap-1">
                                                <AlertCircle className="w-3 h-3" />
                                                {errors.email}
                                            </p>
                                        )}
                                    </div>

                                    {/* Password Field */}
                                    <div className="space-y-2">
                                        <div className="flex items-center justify-between">
                                            <Label htmlFor="password">Mot de passe</Label>
                                            <Link
                                                to="/forgot-password"
                                                className="text-sm text-primary hover:underline"
                                            >
                                                Mot de passe oublié ?
                                            </Link>
                                        </div>
                                        <div className="relative">
                                            <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-foreground" />
                                            <Input
                                                id="password"
                                                type={showPassword ? "text" : "password"}
                                                placeholder="••••••••"
                                                className={`pl-10 pr-10 ${errors.password ? 'border-destructive focus-visible:ring-destructive/20' : ''}`}
                                                value={formData.password}
                                                onChange={(e) => setFormData({ ...formData, password: e.target.value })}
                                            />
                                            <button
                                                type="button"
                                                onClick={() => setShowPassword(!showPassword)}
                                                className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground transition-colors"
                                            >
                                                {showPassword ? (
                                                    <EyeOff className="w-5 h-5" />
                                                ) : (
                                                    <Eye className="w-5 h-5" />
                                                )}
                                            </button>
                                        </div>
                                        {errors.password && (
                                            <p className="text-sm text-destructive flex items-center gap-1">
                                                <AlertCircle className="w-3 h-3" />
                                                {errors.password}
                                            </p>
                                        )}
                                    </div>

                                    {/* Remember Me */}
                                    <div className="flex items-center space-x-2">
                                        <Checkbox
                                            id="rememberMe"
                                            checked={formData.rememberMe}
                                            onCheckedChange={(checked) => setFormData({ ...formData, rememberMe: checked })}
                                        />
                                        <Label htmlFor="rememberMe" className="text-sm cursor-pointer">
                                            Se souvenir de moi
                                        </Label>
                                    </div>

                                    {/* Submit Button */}
                                    <Button
                                        type="submit"
                                        size="lg"
                                        className="w-full bg-primary hover:bg-primary/90 h-12"
                                        disabled={isLoading}
                                    >
                                        {isLoading ? (
                                            <>
                                                <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white mr-3" />
                                                Connexion en cours...
                                            </>
                                        ) : (
                                            <>
                                                Se connecter
                                                <ArrowRight className="ml-2 w-5 h-5" />
                                            </>
                                        )}
                                    </Button>
                                </form>

                                {/* Divider */}
                                <div className="relative my-8">
                                    <div className="absolute inset-0 flex items-center">
                                        <div className="w-full border-t border-border"></div>
                                    </div>
                                    <div className="relative flex justify-center text-sm">
                                        <span className="px-4 bg-card text-muted-foreground">ou continuer avec</span>
                                    </div>
                                </div>

                                {/* Social Login Buttons */}
                                <div className="space-y-3">
                                    <Button
                                        type="button"
                                        variant="outline"
                                        size="lg"
                                        className="w-full h-12 gap-3"
                                        onClick={() => handleSocialLogin('google')}
                                        disabled={isLoading}
                                    >
                                        <svg className="w-5 h-5" viewBox="0 0 24 24">
                                            <path
                                                fill="currentColor"
                                                d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"
                                            />
                                            <path
                                                fill="currentColor"
                                                d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
                                            />
                                            <path
                                                fill="currentColor"
                                                d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"
                                            />
                                            <path
                                                fill="currentColor"
                                                d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"
                                            />
                                        </svg>
                                        Continuer avec Google
                                    </Button>

                                    <Button
                                        type="button"
                                        variant="outline"
                                        size="lg"
                                        className="w-full h-12 gap-3"
                                        onClick={() => handleSocialLogin('apple')}
                                        disabled={isLoading}
                                    >
                                        <svg className="w-5 h-5" viewBox="0 0 24 24" fill="currentColor">
                                            <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z" />
                                        </svg>
                                        Continuer avec Apple
                                    </Button>

                                    <Button
                                        type="button"
                                        variant="outline"
                                        size="lg"
                                        className="w-full h-12 gap-3"
                                        onClick={() => handleSocialLogin('facebook')}
                                        disabled={isLoading}
                                    >
                                        <svg className="w-5 h-5 text-blue-600" viewBox="0 0 24 24" fill="currentColor">
                                            <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
                                        </svg>
                                        Continuer avec Facebook
                                    </Button>
                                </div>

                                {/* Sign Up Link */}
                                <div className="mt-8 text-center">
                                    <p className="text-sm text-muted-foreground">
                                        Pas encore de compte ?{" "}
                                        <Link
                                            to="/signup"
                                            className="text-primary font-medium hover:underline"
                                        >
                                            S'inscrire gratuitement
                                        </Link>
                                    </p>
                                </div>
                            </Card>

                            {/* Security Note */}
                            <div className="mt-6 flex items-center justify-center gap-2 text-sm text-muted-foreground">
                                <Shield className="w-4 h-4" />
                                <span>Connexion chiffrée et sécurisée</span>
                            </div>
                        </motion.div>
                    </div>

                    {/* Right Side - Visual */}
                    <div className="hidden lg:flex items-center justify-center bg-gradient-to-br from-primary/10 via-accent/20 to-primary/5 relative overflow-hidden">
                        {/* Animated Background Elements */}
                        <div className="absolute top-20 left-20 w-72 h-72 bg-primary/10 rounded-full blur-3xl animate-pulse" />
                        <div className="absolute bottom-20 right-20 w-96 h-96 bg-accent/20 rounded-full blur-3xl animate-pulse" style={{ animationDelay: '1s' }} />
                        <div className="absolute top-1/2 left-1/2 w-64 h-64 bg-primary/5 rounded-full blur-2xl animate-pulse" style={{ animationDelay: '2s' }} />

                        <motion.div
                            initial={{ opacity: 0, scale: 0.95 }}
                            animate={{ opacity: 1, scale: 1 }}
                            transition={{ duration: 0.8, delay: 0.2 }}
                            className="relative z-10 max-w-lg px-8"
                        >
                            <div className="text-center">
                                <div className="mb-8">
                                    <div className="w-24 h-24 mx-auto bg-primary/10 rounded-3xl flex items-center justify-center mb-6">
                                        <Shield className="w-12 h-12 text-primary" />
                                    </div>
                                    <h2 className="text-4xl font-bold mb-4">
                                        Assurance MAMA
                                    </h2>
                                    <p className="text-lg text-muted-foreground leading-relaxed">
                                        Rejoignez des milliers de clients qui nous font confiance
                                        pour protéger ce qui compte le plus pour eux.
                                    </p>
                                </div>

                                {/* Stats */}
                                <div className="grid grid-cols-3 gap-6 mt-12">
                                    <div className="text-center">
                                        <p className="text-3xl font-bold text-primary">50K+</p>
                                        <p className="text-sm text-muted-foreground mt-1">Clients satisfaits</p>
                                    </div>
                                    <div className="text-center">
                                        <p className="text-3xl font-bold text-primary">98%</p>
                                        <p className="text-sm text-muted-foreground mt-1">Taux de satisfaction</p>
                                    </div>
                                    <div className="text-center">
                                        <p className="text-3xl font-bold text-primary">24/7</p>
                                        <p className="text-sm text-muted-foreground mt-1">Support client</p>
                                    </div>
                                </div>

                                {/* Testimonial */}
                                <Card className="mt-12 p-6 bg-white/50 backdrop-blur-sm border-border">
                                    <div className="flex items-center gap-1 mb-3 justify-center">
                                        {[1, 2, 3, 4, 5].map((star) => (
                                            <svg key={star} className="w-5 h-5 fill-primary text-primary" viewBox="0 0 24 24">
                                                <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-3.01L12 2z" />
                                            </svg>
                                        ))}
                                    </div>
                                    <p className="text-muted-foreground italic mb-4">
                                        "Une expérience incroyable ! J'ai souscrit mon assurance auto en moins de 3 minutes.
                                        Le prix est transparent et le service client réactif."
                                    </p>
                                    <p className="font-semibold">— Sophie Martin, cliente depuis 2 ans</p>
                                </Card>
                            </div>
                        </motion.div>
                    </div>
                </div>
            </div>

            <Footer />
        </div>
    );
}

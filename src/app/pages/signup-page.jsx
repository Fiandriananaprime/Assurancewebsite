import { useState } from "react";
import { Link, useNavigate } from "react-router";
import { Header } from "../components/header";
import { Footer } from "../components/footer";
import { Button } from "../components/ui/button";
import { Card } from "../components/ui/card";
import { Input } from "../components/ui/input";
import { Label } from "../components/ui/label";
import { Checkbox } from "../components/ui/checkbox";
import { saveAuthUser, getDefaultRouteForRole, createAuthUser } from "../auth";
import {
    Shield,
    User,
    Mail,
    Lock,
    Eye,
    EyeOff,
    Calendar,
    Building2,
    MapPin,
    ArrowRight,
    CheckCircle2,
    AlertCircle
} from "lucide-react";
import { motion } from "motion/react";

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000';

export function SignupPage() {
    const navigate = useNavigate();
    const [showPassword, setShowPassword] = useState(false);
    const [showConfirmPassword, setShowConfirmPassword] = useState(false);
    const [isLoading, setIsLoading] = useState(false);
    const [isEmployeeEmail, setIsEmployeeEmail] = useState(false);
    const [errors, setErrors] = useState({});
    const [formData, setFormData] = useState({
        firstName: "",
        lastName: "",
        email: "",
        phone: "",
        birthDate: "",
        address: "",
        password: "",
        confirmPassword: "",
        acceptTerms: false,
        newsletter: false
    });

    const handleEmailChange = (e) => {
        const email = e.target.value;
        setFormData({ ...formData, email });
        setIsEmployeeEmail(email.trim().toLowerCase().endsWith('@assurance.com'));
    };

    const validateForm = () => {
        const newErrors = {};

        if (!formData.firstName.trim()) {
            newErrors.firstName = "Le prénom est requis";
        }

        if (!formData.lastName.trim()) {
            newErrors.lastName = "Le nom est requis";
        }

        if (!formData.email) {
            newErrors.email = "L'email est requis";
        } else if (!/\S+@\S+\.\S+/.test(formData.email)) {
            newErrors.email = "Format d'email invalide";
        }

        if (!formData.phone) {
            newErrors.phone = "Le numéro de téléphone est requis";
        } else if (!/^\+?[0-9]{8,15}$/.test(formData.phone.replace(/\s/g, ''))) {
            newErrors.phone = "Format de téléphone invalide";
        }

        if (!formData.birthDate) {
            newErrors.birthDate = "La date de naissance est requise";
        } else {
            const birth = new Date(formData.birthDate);
            const today = new Date();
            const age = today.getFullYear() - birth.getFullYear();
            if (age < 18 || age > 100) {
                newErrors.birthDate = "Vous devez avoir entre 18 et 100 ans";
            }
        }

        if (!formData.address) {
            newErrors.address = "L'adresse est requise";
        }

        if (!formData.password) {
            newErrors.password = "Le mot de passe est requis";
        } else if (formData.password.length < 8) {
            newErrors.password = "Le mot de passe doit contenir au moins 8 caractères";
        } else if (!/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/.test(formData.password)) {
            newErrors.password = "Le mot de passe doit contenir au moins une majuscule, une minuscule et un chiffre";
        }

        if (!formData.confirmPassword) {
            newErrors.confirmPassword = "La confirmation du mot de passe est requise";
        } else if (formData.password !== formData.confirmPassword) {
            newErrors.confirmPassword = "Les mots de passe ne correspondent pas";
        }

        if (!formData.acceptTerms) {
            newErrors.acceptTerms = "Vous devez accepter les conditions générales";
        }

        setErrors(newErrors);
        return Object.keys(newErrors).length === 0;
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (!validateForm()) return;
        setIsLoading(true);
        try {
            const resp = await fetch(`${API_URL}/api/auth/register`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    email: formData.email,
                    password: formData.password,
                    first_name: formData.firstName,
                    last_name: formData.lastName,
                    phone: formData.phone,
                    address: formData.address,
                    birth_date: formData.birthDate
                })
            });

            const data = await resp.json();

            if (resp.ok) {
                const { user, profile } = data.data;

                const authUserObject = createAuthUser(user.email, {
                    ...user,
                    name: profile ? `${profile.first_name} ${profile.last_name}` : undefined,
                    phone: profile?.phone || "",
                    address: profile?.address || ""
                });

                saveAuthUser(authUserObject);
                window.localStorage.setItem('assurance-auth-token', data.data.accessToken);
                navigate(getDefaultRouteForRole(user.role));
            } else {
                // If backend returns validation errors array, map them to form fields
                if (data && data.errors && Array.isArray(data.errors)) {
                    const fieldErrors = {};
                    data.errors.forEach(err => {
                        // express-validator typically provides { msg, param }
                        if (err.param) {
                            fieldErrors[err.param.replace(/\W+/g, '')] = err.msg || err.message || data.message;
                        }
                    });
                    // Merge with any generic api message
                    if (data.message) fieldErrors.api = data.message;
                    setErrors(fieldErrors);
                } else {
                    setErrors({ api: data.message || "Erreur lors de l'inscription" });
                }
            }
        } catch (err) {
            setErrors({ api: "Erreur de connexion au serveur" });
        } finally {
            setIsLoading(false);
        }
    };

    const handleSocialSignup = async (provider) => {
        setIsLoading(true);
        // Simuler l'inscription sociale
        await new Promise(resolve => setTimeout(resolve, 1500));
        setIsLoading(false);
        navigate("/dashboard");
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
                                {isEmployeeEmail ? (
                                    <div className="inline-flex items-center gap-2 px-4 py-2 bg-blue-50 rounded-full border border-blue-200 mb-6">
                                        <User className="w-4 h-4 text-blue-600" />
                                        <span className="text-sm font-medium text-blue-600">
                                            Inscription Collaborateur MAMA
                                        </span>
                                    </div>
                                ) : (
                                    <div className="inline-flex items-center gap-2 px-4 py-2 bg-accent/50 rounded-full border border-primary/20 mb-6">
                                        <Shield className="w-4 h-4 text-primary" />
                                        <span className="text-sm font-medium text-primary">
                                            Inscription sécurisée
                                        </span>
                                    </div>
                                )}

                                <h1 className="text-3xl sm:text-4xl font-bold mb-3">
                                    Créer votre compte
                                </h1>
                                <p className="text-lg text-muted-foreground">
                                    Rejoignez des milliers de clients satisfaits
                                </p>
                            </div>

                            <Card className="p-6 sm:p-8 border-border">
                                <form onSubmit={handleSubmit} className="space-y-6">
                                    {/* Personal Information */}
                                    <div className="grid sm:grid-cols-2 gap-4">
                                        <div className="space-y-2">
                                            <Label htmlFor="firstName">Prénom</Label>
                                            <div className="relative">
                                                <User className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-foreground" />
                                                <Input
                                                    id="firstName"
                                                    placeholder="Votre prénom"
                                                    className={`pl-10 ${errors.firstName ? 'border-destructive focus-visible:ring-destructive/20' : ''}`}
                                                    value={formData.firstName}
                                                    onChange={(e) => setFormData({ ...formData, firstName: e.target.value })}
                                                />
                                            </div>
                                            {errors.firstName && (
                                                <p className="text-sm text-destructive flex items-center gap-1">
                                                    <AlertCircle className="w-3 h-3" />
                                                    {errors.firstName}
                                                </p>
                                            )}
                                        </div>

                                        <div className="space-y-2">
                                            <Label htmlFor="lastName">Nom</Label>
                                            <div className="relative">
                                                <User className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-foreground" />
                                                <Input
                                                    id="lastName"
                                                    placeholder="Votre nom"
                                                    className={`pl-10 ${errors.lastName ? 'border-destructive focus-visible:ring-destructive/20' : ''}`}
                                                    value={formData.lastName}
                                                    onChange={(e) => setFormData({ ...formData, lastName: e.target.value })}
                                                />
                                            </div>
                                            {errors.lastName && (
                                                <p className="text-sm text-destructive flex items-center gap-1">
                                                    <AlertCircle className="w-3 h-3" />
                                                    {errors.lastName}
                                                </p>
                                            )}
                                        </div>
                                    </div>

                                    {/* Contact Information */}
                                    <div className="space-y-4">
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
                                                    onChange={handleEmailChange}
                                                />
                                            </div>
                                            {errors.email && (
                                                <p className="text-sm text-destructive flex items-center gap-1">
                                                    <AlertCircle className="w-3 h-3" />
                                                    {errors.email}
                                                </p>
                                            )}
                                        </div>

                                        <div className="space-y-2">
                                            <Label htmlFor="phone">Téléphone</Label>
                                            <div className="relative">
                                                <Building2 className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-foreground" />
                                                <Input
                                                    id="phone"
                                                    type="tel"
                                                    placeholder="+33 6 12 34 56 78"
                                                    className={`pl-10 ${errors.phone ? 'border-destructive focus-visible:ring-destructive/20' : ''}`}
                                                    value={formData.phone}
                                                    onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                                                />
                                            </div>
                                            {errors.phone && (
                                                <p className="text-sm text-destructive flex items-center gap-1">
                                                    <AlertCircle className="w-3 h-3" />
                                                    {errors.phone}
                                                </p>
                                            )}
                                        </div>

                                        <div className="grid sm:grid-cols-2 gap-4">
                                            <div className="space-y-2">
                                                <Label htmlFor="birthDate">Date de naissance</Label>
                                                <div className="relative">
                                                    <Calendar className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-foreground" />
                                                    <Input
                                                        id="birthDate"
                                                        type="date"
                                                        className={`pl-10 ${errors.birthDate ? 'border-destructive focus-visible:ring-destructive/20' : ''}`}
                                                        value={formData.birthDate}
                                                        onChange={(e) => setFormData({ ...formData, birthDate: e.target.value })}
                                                    />
                                                </div>
                                                {errors.birthDate && (
                                                    <p className="text-sm text-destructive flex items-center gap-1">
                                                        <AlertCircle className="w-3 h-3" />
                                                        {errors.birthDate}
                                                    </p>
                                                )}
                                            </div>

                                            <div className="space-y-2">
                                                <Label htmlFor="address">Code postal</Label>
                                                <div className="relative">
                                                    <MapPin className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-foreground" />
                                                    <Input
                                                        id="address"
                                                        placeholder="75001"
                                                        className={`pl-10 ${errors.address ? 'border-destructive focus-visible:ring-destructive/20' : ''}`}
                                                        value={formData.address}
                                                        onChange={(e) => setFormData({ ...formData, address: e.target.value })}
                                                    />
                                                </div>
                                                {errors.address && (
                                                    <p className="text-sm text-destructive flex items-center gap-1">
                                                        <AlertCircle className="w-3 h-3" />
                                                        {errors.address}
                                                    </p>
                                                )}
                                            </div>
                                        </div>
                                    </div>

                                    {/* Password Fields */}
                                    <div className="space-y-4">
                                        <div className="space-y-2">
                                            <Label htmlFor="password">Mot de passe</Label>
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

                                        <div className="space-y-2">
                                            <Label htmlFor="confirmPassword">Confirmer le mot de passe</Label>
                                            <div className="relative">
                                                <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-foreground" />
                                                <Input
                                                    id="confirmPassword"
                                                    type={showConfirmPassword ? "text" : "password"}
                                                    placeholder="••••••••"
                                                    className={`pl-10 pr-10 ${errors.confirmPassword ? 'border-destructive focus-visible:ring-destructive/20' : ''}`}
                                                    value={formData.confirmPassword}
                                                    onChange={(e) => setFormData({ ...formData, confirmPassword: e.target.value })}
                                                />
                                                <button
                                                    type="button"
                                                    onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                                                    className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground transition-colors"
                                                >
                                                    {showConfirmPassword ? (
                                                        <EyeOff className="w-5 h-5" />
                                                    ) : (
                                                        <Eye className="w-5 h-5" />
                                                    )}
                                                </button>
                                            </div>
                                            {errors.confirmPassword && (
                                                <p className="text-sm text-destructive flex items-center gap-1">
                                                    <AlertCircle className="w-3 h-3" />
                                                    {errors.confirmPassword}
                                                </p>
                                            )}
                                        </div>
                                    </div>

                                    {/* Terms and Conditions */}
                                    <div className="space-y-4">
                                        <div className="flex items-start space-x-2">
                                            <Checkbox
                                                id="acceptTerms"
                                                checked={formData.acceptTerms}
                                                onCheckedChange={(checked) => setFormData({ ...formData, acceptTerms: checked })}
                                            />
                                            <Label htmlFor="acceptTerms" className="text-sm cursor-pointer">
                                                J'accepte les <Link to="/terms" className="text-primary hover:underline">conditions générales</Link> et la <Link to="/privacy" className="text-primary hover:underline">politique de confidentialité</Link>
                                            </Label>
                                        </div>
                                        {errors.acceptTerms && (
                                            <p className="text-sm text-destructive flex items-center gap-1">
                                                <AlertCircle className="w-3 h-3" />
                                                {errors.acceptTerms}
                                            </p>
                                        )}

                                        <div className="flex items-center space-x-2">
                                            <Checkbox
                                                id="newsletter"
                                                checked={formData.newsletter}
                                                onCheckedChange={(checked) => setFormData({ ...formData, newsletter: checked })}
                                            />
                                            <Label htmlFor="newsletter" className="text-sm cursor-pointer">
                                                J'accepte de recevoir des informations et offres promotionnelles par email
                                            </Label>
                                        </div>
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
                                                Création du compte...
                                            </>
                                        ) : (
                                            <>
                                                Créer mon compte
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

                                {/* Social Signup Buttons */}
                                <div className="space-y-3">
                                    <Button
                                        type="button"
                                        variant="outline"
                                        size="lg"
                                        className="w-full h-12 gap-3"
                                        onClick={() => handleSocialSignup('google')}
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
                                        S'inscrire avec Google
                                    </Button>

                                    <Button
                                        type="button"
                                        variant="outline"
                                        size="lg"
                                        className="w-full h-12 gap-3"
                                        onClick={() => handleSocialSignup('apple')}
                                        disabled={isLoading}
                                    >
                                        <svg className="w-5 h-5" viewBox="0 0 24 24" fill="currentColor">
                                            <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z" />
                                        </svg>
                                        S'inscrire avec Apple
                                    </Button>
                                </div>

                                {/* Login Link */}
                                <div className="mt-8 text-center">
                                    <p className="text-sm text-muted-foreground">
                                        Vous avez déjà un compte ?{" "}
                                        <Link
                                            to="/login"
                                            className="text-primary font-medium hover:underline"
                                        >
                                            Se connecter
                                        </Link>
                                    </p>
                                </div>
                            </Card>

                            {/* Security Note */}
                            <div className="mt-6 flex items-center justify-center gap-2 text-sm text-muted-foreground">
                                <Shield className="w-4 h-4" />
                                <span>Données sécurisées et confidentielles</span>
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
                                        <CheckCircle2 className="w-12 h-12 text-primary" />
                                    </div>
                                    <h2 className="text-4xl font-bold mb-4">
                                        Pourquoi nous choisir ?
                                    </h2>
                                    <p className="text-lg text-muted-foreground leading-relaxed">
                                        Des tarifs compétitifs, une souscription en 2 minutes,
                                        et un service client à votre écoute.
                                    </p>
                                </div>

                                {/* Benefits */}
                                <div className="space-y-6">
                                    <div className="flex items-center gap-4 text-left">
                                        <div className="w-12 h-12 bg-accent rounded-xl flex items-center justify-center">
                                            <Shield className="w-6 h-6 text-primary" />
                                        </div>
                                        <div>
                                            <h3 className="font-semibold">Protection optimale</h3>
                                            <p className="text-sm text-muted-foreground">Couverture complète pour tous vos besoins</p>
                                        </div>
                                    </div>

                                    <div className="flex items-center gap-4 text-left">
                                        <div className="w-12 h-12 bg-accent rounded-xl flex items-center justify-center">
                                            <ArrowRight className="w-6 h-6 text-primary" />
                                        </div>
                                        <div>
                                            <h3 className="font-semibold">Souscription express</h3>
                                            <p className="text-sm text-muted-foreground">En 2 minutes chrono, sans paperasse</p>
                                        </div>
                                    </div>

                                    <div className="flex items-center gap-4 text-left">
                                        <div className="w-12 h-12 bg-accent rounded-xl flex items-center justify-center">
                                            <Calendar className="w-6 h-6 text-primary" />
                                        </div>
                                        <div>
                                            <h3 className="font-semibold">Assistance 24/7</h3>
                                            <p className="text-sm text-muted-foreground">À votre écoute à tout moment</p>
                                        </div>
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
                                        "Inscription ultra-rapide et interface intuitive.
                                        J'ai trouvé l'assurance parfaite pour ma voiture en quelques clics !"
                                    </p>
                                    <p className="font-semibold">— Thomas Dubois, client depuis 1 an</p>
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
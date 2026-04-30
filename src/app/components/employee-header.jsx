import { Link, useLocation, useNavigate } from "react-router";
import { Shield, Menu, X, User, Users, FileText, Calendar, Bell, Settings, LogOut, Plus, Home, CreditCard, Lock, Sliders, Monitor, Globe, Link2, HelpCircle } from "lucide-react";
import { Button } from "./ui/button";
import { Avatar, AvatarFallback, AvatarImage } from "./ui/avatar";
import {
    DropdownMenu,
    DropdownMenuTrigger,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
} from "./ui/dropdown-menu";
import { useState } from "react";
import { useEffect, useRef } from "react";
import { io } from "socket.io-client";
import { clearAuthUser } from "../auth";
import { motion, AnimatePresence } from "motion/react";
import { Badge } from "./ui/badge";
import { useAuthUser } from "../hooks/use-auth-user";

export function EmployeeHeader() {
    const location = useLocation();
    const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

    // Notifications count
    const [notificationCount, setNotificationCount] = useState(0);
    const socketRef = useRef(null);
    const navigate = useNavigate();

    useEffect(() => {
        // Éviter les connexions multiples si le socket existe déjà
        if (socketRef.current?.connected) return;

        const token = window.localStorage.getItem('assurance-auth-token');
        if (!token) return;

        try {
            const socket = io(import.meta.env.VITE_API_URL || 'http://localhost:5000', {
                auth: { token },
                transports: ['websocket']
            });
            socketRef.current = socket;

            socket.on("connect_error", (err) => { // Keep this block for error handling
                console.error("Erreur de connexion socket (notifications):", err);
                try {
                    const msg = err && (err.message || String(err));
                    if (msg && String(msg).toLowerCase().includes('authentication error')) {
                        console.warn("Authentication error with employee notification socket. Clearing token and redirecting to login.");
                        try { clearAuthUser(); } catch (e) {}
                        try { window.localStorage.removeItem('assurance-refresh-token'); } catch (e) {}
                        try { socket.disconnect(); } catch (e) {}
                        try { delete window.__MAMA_SOCKET; } catch (e) {}
                        navigate('/login'); // Redirect to login page
                    }
                } catch (e) {
                    console.error('Error handling employee notification connect_error:', e);
                }
            });
            socket.on('connect', () => {
                // Optionally fetch unseen notifications count from API later
                console.log('Employee socket connected', socketRef.current.id);
            });

            socket.on('notification', (payload) => {
                // Increase notification count and optionally handle payload
                setNotificationCount((c) => c + 1);
                console.log('Notification received (employee):', payload);
            });

            socket.on('disconnect', () => {
                console.log('Employee socket disconnected');
            });
        } catch (err) {
            console.warn('Failed to initialize employee socket', err);
        }

        return () => {
            try { socketRef.current?.disconnect(); } catch (e) {}
        };
    }, [navigate]); // navigate est stable, mais requis ici par les bonnes pratiques

    const navItems = [
        {
            label: "Tableau de bord",
            path: "/employee",
            icon: Home
        },
        {
            label: "Clients",
            path: "/employee/clients",
            icon: Users,
            submenu: [
                { label: "Liste Clients", path: "/employee/clients" },
                { label: "Contrats", path: "/employee/clients?tab=contracts" },
                { label: "Feedbacks", path: "/employee/clients?tab=feedbacks" },
                { label: "Incidents", path: "/employee/clients?tab=incidents" }
            ]
        },
        {
            label: "Blogs/Evenements",
            path: "/employee/blog-management",
            icon: FileText
        }
    ];

    // Mock employee info
    const authUser = useAuthUser();
    const employeeName = authUser?.name || "Employé";
    const employeeRole = authUser?.role === "admin" ? "Administrateur" : "Employé";
    const employeeAvatar = authUser?.profileImage;
    const employeeAvatarLabel = authUser?.avatarLabel || "EM";

    return (
        <header className="fixed top-0 left-0 right-0 z-50 bg-primary text-white shadow-lg">
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div className="flex items-center justify-between h-16 sm:h-20">
                    {/* Logo */}
                    <Link to="/employee" className="flex items-center gap-3 group">
                        <div className="w-12 h-12 bg-white rounded-full flex items-center overflow-hidden justify-center group-hover:scale-105 transition-transform shadow-lg">
                            <img src="/assets/logo.png" alt="MAMA Logo" className="w-8 h-8" />
                        </div>
                        <div>
                            <span className="text-xl font-bold tracking-tight">Assurance MAMA</span> {/* Keep this */}
                            <p className="text-xs opacity-80">Espace Employé</p>
                        </div>
                    </Link>

                    {/* Desktop Navigation */}
                    <nav className="hidden lg:flex items-center gap-6">
                        {navItems.map((item) => (
                            <div key={item.path} className="relative group">
                                <Link
                                    to={item.path}
                                    className={`flex items-center gap-2 text-sm transition-all hover:text-yellow-200 ${location.pathname.startsWith(item.path) ? "text-yellow-200 font-medium border-b-2 border-yellow-200 pb-1" : "text-white/80"
                                        }`}
                                >
                                    <item.icon className="w-4 h-4" />
                                    <span>{item.label}</span>
                                    {item.submenu && (
                                        <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                                        </svg>
                                    )}
                                </Link>

                                {/* Submenu */}
                                {item.submenu && (
                                    <div className="absolute top-full left-0 mt-2 bg-white text-gray-900 rounded-lg shadow-lg border border-gray-200 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 min-w-[160px]">
                                        {item.submenu.map((subItem) => (
                                            <Link
                                                key={subItem.path}
                                                to={subItem.path}
                                                className={`block px-4 py-2 text-sm hover:bg-gray-100 ${location.pathname === subItem.path ? "bg-gray-100 font-medium" : ""
                                                    }`}
                                            >
                                                {subItem.label}
                                            </Link>
                                        ))}
                                    </div>
                                )}
                            </div>
                        ))}
                    </nav>

                    {/* Desktop Actions */}
                    <div className="hidden lg:flex items-center gap-4">
                        {/* User Info */}
                        <div className="flex items-center gap-3 bg-white/10 px-4 py-2 rounded-full">
                            <Link to="/employee/settings/profile" className="flex items-center gap-3">
                                <Avatar className="w-8 h-8"> {/* Use AvatarImage if available */}
                                    <AvatarImage src={employeeAvatar} alt={employeeName} />
                                    <AvatarFallback className="bg-white text-primary"> {/* Fallback to initials */}
                                        <User className="w-5 h-5" />
                                    </AvatarFallback>
                                </Avatar>
                                <div className="text-left">
                                    <p className="text-sm font-medium">{employeeName}</p>
                                    <p className="text-xs opacity-80">{employeeRole}</p>
                                </div>
                            </Link>
                                    <DropdownMenu>
                                        <DropdownMenuTrigger asChild>
                                            <Button variant="ghost" size="sm" className="text-white hover:text-yellow-200">
                                                <Settings className="w-4 h-4" />
                                            </Button>
                                        </DropdownMenuTrigger>
                                            <DropdownMenuContent align="end">
                                                    <DropdownMenuLabel>Paramètres</DropdownMenuLabel>
                                                    <DropdownMenuItem onClick={() => navigate('/employee/settings/profile')}><User className="w-4 h-4 mr-2" />Profil</DropdownMenuItem>
                                                    <DropdownMenuItem onClick={() => navigate('/employee/settings/privacy')}><Shield className="w-4 h-4 mr-2" />Confidentialité</DropdownMenuItem>
                                                    <DropdownMenuItem onClick={() => navigate('/employee/settings/payments')}><CreditCard className="w-4 h-4 mr-2" />Modes de paiement</DropdownMenuItem>
                                                    <DropdownMenuItem onClick={() => navigate('/employee/settings/security')}><Lock className="w-4 h-4 mr-2" />Sécurité</DropdownMenuItem>
                                                <DropdownMenuSeparator />
                                                <DropdownMenuLabel>Préférences</DropdownMenuLabel>
                                                <DropdownMenuItem onClick={() => navigate('/employee/settings/notifications')}><Bell className="w-4 h-4 mr-2" />Notifications</DropdownMenuItem>
                                                <DropdownMenuItem onClick={() => navigate('/employee/settings/preferences')}><Sliders className="w-4 h-4 mr-2" />Préférences</DropdownMenuItem>
                                                <DropdownMenuItem onClick={() => navigate('/employee/settings/appearance')}><Monitor className="w-4 h-4 mr-2" />Apparence</DropdownMenuItem>
                                                <DropdownMenuItem onClick={() => navigate('/employee/settings/language')}><Globe className="w-4 h-4 mr-2" />Langue</DropdownMenuItem>
                                                <DropdownMenuSeparator />
                                                <DropdownMenuLabel>Facturation & Intégrations</DropdownMenuLabel>
                                                <DropdownMenuItem onClick={() => navigate('/employee/settings/billing')}><CreditCard className="w-4 h-4 mr-2" />Facturation</DropdownMenuItem>
                                                <DropdownMenuItem onClick={() => navigate('/employee/settings/connected-apps')}><Link2 className="w-4 h-4 mr-2" />Applications connectées</DropdownMenuItem>
                                                <DropdownMenuItem onClick={() => navigate('/employee/settings/help')}><HelpCircle className="w-4 h-4 mr-2" />Aide & Support</DropdownMenuItem>
                                            </DropdownMenuContent>
                                    </DropdownMenu>
                            <Button variant="ghost" size="sm" className="text-white hover:text-yellow-200" onClick={() => { clearAuthUser(); navigate('/'); }}>
                                <LogOut className="w-4 h-4" />
                            </Button>
                        </div>

                        {/* Notifications */}
                        <Button variant="ghost" size="sm" className="relative">
                            <Bell className="w-5 h-5" />
                            {notificationCount > 0 && (
                                <Badge className="absolute -top-1 -right-1 bg-red-500 text-white text-xs px-1 min-w-[18px]">
                                    {notificationCount}
                                </Badge>
                            )}
                        </Button>
                    </div>

                    {/* Mobile Menu Button */}
                    <button
                        onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
                        className="lg:hidden p-2 text-white hover:bg-white/10 rounded-lg transition-colors"
                    >
                        {mobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
                    </button>
                </div>
            </div>

            {/* Mobile Menu */}
            <AnimatePresence>
                {mobileMenuOpen && (
                    <motion.div
                        initial={{ opacity: 0, height: 0 }}
                        animate={{ opacity: 1, height: "auto" }}
                        exit={{ opacity: 0, height: 0 }}
                        className="lg:hidden border-t border-white/20 bg-gradient-to-b from-primary/95 to-blue-600/95"
                    >
                        <div className="px-4 py-4 space-y-3">
                            {/* User Info */}
                            <div className="bg-white/10 rounded-lg p-4 mb-3">
                                <div className="flex items-center gap-3">
                                    <Avatar className="w-10 h-10">
                                        <AvatarImage src={employeeAvatar} alt={employeeName} />
                                        <AvatarFallback className="bg-white text-primary">{employeeAvatarLabel}</AvatarFallback>
                                    </Avatar>
                                    <div>
                                        <p className="font-semibold">{employeeName}</p>
                                        <p className="text-sm opacity-80">{employeeRole}</p>
                                    </div>
                                </div>
                            </div>

                            {/* Navigation Items */}
                            {navItems.map((item) => (
                                <div key={item.path}>
                                    <Link
                                        to={item.path}
                                        onClick={() => setMobileMenuOpen(false)}
                                        className={`flex items-center gap-3 px-4 py-3 rounded-lg transition-colors ${location.pathname.startsWith(item.path) ? "bg-white text-primary" : "text-white hover:bg-white/10"
                                            }`}
                                    >
                                        <item.icon className="w-5 h-5" />
                                        <span className="font-medium">{item.label}</span>
                                        {item.submenu && (
                                            <svg className="w-4 h-4 ml-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                                            </svg>
                                        )}
                                    </Link>

                                    {/* Mobile Submenu */}
                                    {item.submenu && location.pathname.startsWith(item.path) && (
                                        <div className="ml-6 border-l-2 border-white/20 pl-4">
                                            {item.submenu.map((subItem) => (
                                                <Link
                                                    key={subItem.path}
                                                    to={subItem.path}
                                                    onClick={() => setMobileMenuOpen(false)}
                                                    className={`block px-4 py-2 text-sm ${location.pathname === subItem.path ? "text-primary font-medium" : "text-white/80"
                                                        }`}
                                                >
                                                    • {subItem.label}
                                                </Link>
                                            ))}
                                        </div>
                                    )}
                                </div>
                            ))}

                            {/* Bottom Actions */}
                            <div className="border-t border-white/20 pt-3 mt-2 flex gap-2">
                                <Link to="/employee/settings" onClick={() => setMobileMenuOpen(false)} className="flex-1">
                                    <Button variant="ghost" size="sm" className="w-full text-white hover:bg-white/10 justify-center">
                                        <Settings className="w-4 h-4 mr-2" />
                                        Paramètres
                                    </Button>
                                </Link>
                                <Button variant="ghost" size="sm" className="flex-1 text-white hover:bg-white/10" onClick={() => { clearAuthUser(); navigate('/'); }}>
                                    <LogOut className="w-4 h-4 mr-2" />
                                    Déconnexion
                                </Button>
                            </div>
                        </div>
                    </motion.div>
                )}
            </AnimatePresence>
        </header>
    );
}

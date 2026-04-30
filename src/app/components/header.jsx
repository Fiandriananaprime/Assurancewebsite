import { Link, useLocation, useNavigate } from "react-router";
import { Menu, X, User, LayoutDashboard, LogOut, Ellipsis, Settings, Shield, CreditCard, Lock, Bell, Sliders, Monitor, Globe, Link2, HelpCircle } from "lucide-react";
import { Button } from "./ui/button";
import { useMemo, useState } from "react";
import { motion, AnimatePresence } from "motion/react";
import { Avatar, AvatarFallback, AvatarImage } from "./ui/avatar";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "./ui/dropdown-menu";
import { clearAuthUser, getDefaultRouteForRole } from "../auth";
import { useAuthUser } from "../hooks/use-auth-user";

export function Header() {
  const location = useLocation();
  const navigate = useNavigate();
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const authUser = useAuthUser();

  const navItems = [
    {
      label: "Accueil",
      path: "/",
    },
    {
      label: "Blog/Actualites",
      path: "/blog",
    },
    {
      label: "Devis",
      path: "/devis",
    },
    {
      label: "Dashboard",
      path: "/dashboard",
    },
    {
      label: "Contact",
      path: "/contact",
    },
  ];

  // auth info will be set below; filteredNavItems and settingsPath are computed after auth state

  const isAuthenticated = Boolean(authUser);
  const isClient = authUser && authUser.role === "client";

  // Only show Dashboard in top nav for authenticated clients
  const filteredNavItems = navItems.filter((item) => {
    if (item.path === "/dashboard" && !isClient) return false;
    return true;
  });

  const settingsPath = isClient ? "/settings" : "/employee/settings";
  const dashboardPath = useMemo(() => {
    if (!authUser) {
      return "/dashboard"; // default public dashboard route
    }

    return getDefaultRouteForRole(authUser.role);
  }, [authUser]);

  const handleLogout = () => {
    clearAuthUser();
    setMobileMenuOpen(false);
    // After logout, always redirect to main client homepage
    navigate("/");
  };

  return (
    <header className="fixed top-0 left-0 right-0 z-50 bg-white/80 backdrop-blur-lg border-b border-border">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16 sm:h-20">
          <Link to="/" className="flex items-center gap-2 group">
            <div className="w-10 h-10 bg-primary rounded-full flex items-center overflow-hidden justify-center group-hover:scale-105 transition-transform">
              <img src="assets/logo.png" alt="MAMA Logo" />
            </div>
            <span className="text-xl font-semibold tracking-tight hidden sm:block">
              Assurance MAMA
            </span>
          </Link>

          <nav className="hidden md:flex items-center gap-8">
            {filteredNavItems.map((item) => (
              <Link
                key={item.path}
                to={item.path}
                className={`text-sm transition-colors hover:text-primary ${
                  location.pathname === item.path ? "text-primary font-medium" : "text-muted-foreground"
                }`}
              >
                {item.label}
              </Link>
            ))}
          </nav>

          <div className="hidden md:flex items-center gap-3">
            {isAuthenticated && (
              <DropdownMenu>
                <DropdownMenuTrigger asChild>
                  <button className="p-2 rounded-md hover:bg-secondary/10">
                    <Settings className="w-5 h-5" />
                  </button>
                </DropdownMenuTrigger>
                <DropdownMenuContent align="end" className="w-56">
                  <DropdownMenuLabel>Paramètres du compte</DropdownMenuLabel>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/profile")}><User className="w-4 h-4 mr-2" />Profil</DropdownMenuItem>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/privacy")}><Shield className="w-4 h-4 mr-2" />Confidentialité</DropdownMenuItem>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/payments")}><CreditCard className="w-4 h-4 mr-2" />Modes de paiement</DropdownMenuItem>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/security")}><Lock className="w-4 h-4 mr-2" />Sécurité</DropdownMenuItem>
                  <DropdownMenuSeparator />
                  <DropdownMenuLabel>Préférences</DropdownMenuLabel>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/notifications")}><Bell className="w-4 h-4 mr-2" />Notifications</DropdownMenuItem>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/preferences")}><Sliders className="w-4 h-4 mr-2" />Préférences</DropdownMenuItem>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/appearance")}><Monitor className="w-4 h-4 mr-2" />Apparence</DropdownMenuItem>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/language")}><Globe className="w-4 h-4 mr-2" />Langue</DropdownMenuItem>
                  <DropdownMenuSeparator />
                  <DropdownMenuLabel>Facturation & Intégrations</DropdownMenuLabel>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/billing")}><CreditCard className="w-4 h-4 mr-2" />Facturation</DropdownMenuItem>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/connected-apps")}><Link2 className="w-4 h-4 mr-2" />Applications connectées</DropdownMenuItem>
                  <DropdownMenuItem onClick={() => navigate(settingsPath + "/help")}><HelpCircle className="w-4 h-4 mr-2" />Aide & Support</DropdownMenuItem>
                </DropdownMenuContent>
              </DropdownMenu>
            )}
            {isAuthenticated ? (
              <DropdownMenu>
                <DropdownMenuTrigger asChild>
                  <button className="flex items-center gap-3 rounded-full border border-border bg-white/90 pl-2 pr-3 py-2 shadow-sm transition hover:border-primary/40 hover:shadow-md"> {/* Ensure AvatarImage is used */}
                    <Avatar className="w-10 h-10">
                      <AvatarImage src={authUser?.profileImage} alt={authUser?.name} />
                      <AvatarFallback className="bg-primary text-white font-semibold">
                        {authUser?.avatarLabel || <User className="w-5 h-5" />}
                      </AvatarFallback>
                    </Avatar>
                    <div className="text-left leading-tight max-w-[180px]">
                      <p className="text-sm font-semibold truncate">{authUser?.name}</p>
                      <p className="text-xs text-muted-foreground truncate">{authUser?.email}</p>
                    </div>
                    <Ellipsis className="w-4 h-4 text-muted-foreground" />
                  </button>
                </DropdownMenuTrigger>
                <DropdownMenuContent align="end" className="w-56">
                  <DropdownMenuLabel className="space-y-1">
                    <p className="font-semibold">{authUser?.name}</p>
                    <p className="text-xs font-normal text-muted-foreground">{authUser?.email}</p>
                  </DropdownMenuLabel>
                  <DropdownMenuSeparator />
                  {/* Only show dashboard link if user is a client or employee with a dashboard route */}
                  {(isClient || authUser?.role === "employee") && (
                    <DropdownMenuItem onClick={() => navigate(dashboardPath)}>
                      <LayoutDashboard className="w-4 h-4" />
                      {authUser?.role === "employee" ? "Espace employé" : "Espace client"}
                    </DropdownMenuItem>
                  )}
                  <DropdownMenuItem onClick={handleLogout}>
                    <LogOut className="w-4 h-4" />
                    Déconnexion
                  </DropdownMenuItem>
                </DropdownMenuContent>
              </DropdownMenu>
              ) : (
              <>
                <Link to="/login">
                  <Button variant="ghost" size="sm">
                    Se connecter
                  </Button>
                </Link>
                <Link to="/devis">
                  <Button size="sm" className="bg-primary hover:bg-primary/90">
                    Obtenir un devis
                  </Button>
                </Link>
              </>
            )}
          </div>

          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="md:hidden p-2 text-foreground hover:bg-secondary rounded-lg transition-colors"
          >
            {mobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
          </button>
        </div>
      </div>

      <AnimatePresence>
        {mobileMenuOpen && (
              <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: "auto" }}
            exit={{ opacity: 0, height: 0 }}
            className="md:hidden border-t border-border bg-white"
          >
            <div className="px-4 py-4 space-y-3">
              {navItems.map((item) => (
                <Link
                  key={item.path}
                  to={item.path}
                  onClick={() => setMobileMenuOpen(false)}
                  className={`block px-4 py-2 rounded-lg transition-colors ${
                    location.pathname === item.path ? "bg-primary text-white" : "text-foreground hover:bg-secondary"
                  }`}
                >
                  {item.label}
                </Link>
              ))}
              <div className="pt-3 border-t border-border space-y-2">
                {isAuthenticated ? (
                  <>
                        <Link to={dashboardPath} onClick={() => setMobileMenuOpen(false)}>
                      <div className="w-full bg-primary text-white rounded-lg p-3 flex items-center gap-3 hover:bg-primary/90 transition-colors">
                        <div className="w-8 h-8 bg-white rounded-full flex items-center justify-center text-primary font-semibold text-sm">
                          {authUser?.avatarLabel || "CL"}
                        </div>
                        <div>
                          <p className="text-sm font-semibold">{authUser?.name}</p>
                          <p className="text-xs text-white/80">
                            {authUser?.role === "employee" ? "Espace employe" : "Espace client"}
                          </p>
                        </div>
                      </div>
                    </Link>
                        <Link to={settingsPath} onClick={() => setMobileMenuOpen(false)}>
                          <Button variant="ghost" className="w-full justify-start">
                            <Settings className="w-4 h-4 mr-2" />
                            Paramètres
                          </Button>
                        </Link>
                    <Button variant="ghost" className="w-full justify-start" onClick={handleLogout}>
                      <LogOut className="w-4 h-4 mr-2" />
                      Deconnexion
                    </Button>
                  </>
                ) : (
                  <>
                    <Link to="/login" onClick={() => setMobileMenuOpen(false)}>
                      <Button variant="ghost" className="w-full">
                        Se connecter
                      </Button>
                    </Link>
                    <Link to="/devis" onClick={() => setMobileMenuOpen(false)}>
                      <Button className="w-full bg-primary hover:bg-primary/90">
                        Obtenir un devis
                      </Button>
                    </Link>
                  </>
                )}
              </div>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  );
}

import { Link } from "react-router";
import { Mail, Phone, MapPin, MessageCircle } from "lucide-react";
import { Facebook, Twitter, Linkedin, Instagram } from "lucide-react";

export function Footer() {
  const currentYear = new Date().getFullYear();

  return (
    <footer className="bg-secondary border-t border-border">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 lg:py-16">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 lg:gap-12">
          {/* Logo and Socials */}
          <div className="space-y-4">
            <Link to="/" className="flex items-center gap-2">
              <div className="w-10 h-10 bg-primary overflow-hidden rounded-full flex items-center justify-center">
                <img src="/assets/logo.png" alt="MAMA Logo" />
              </div>
              <span className="text-xl font-semibold">Assurance MAMA</span>
            </Link>
            <p className="text-sm text-muted-foreground leading-relaxed">
              Assurance moderne, simple et transparente pour votre véhicule et votre habitation.
            </p>
            <div className="flex items-center gap-3">
              <a aria-label="Facebook" href="#" className="w-9 h-9 rounded-lg bg-white border border-border flex items-center justify-center transition-transform transform hover:scale-105 hover:bg-primary hover:text-white hover:border-primary elevated shadow-sm hover:shadow-md">
                <Facebook className="w-4 h-4" />
              </a>
              <a aria-label="Twitter" href="#" className="w-9 h-9 rounded-lg bg-white border border-border flex items-center justify-center transition-transform transform hover:scale-105 hover:bg-primary hover:text-white hover:border-primary elevated shadow-sm hover:shadow-md">
                <Twitter className="w-4 h-4" />
              </a>
              <a aria-label="LinkedIn" href="#" className="w-9 h-9 rounded-lg bg-white border border-border flex items-center justify-center transition-transform transform hover:scale-105 hover:bg-primary hover:text-white hover:border-primary elevated shadow-sm hover:shadow-md">
                <Linkedin className="w-4 h-4" />
              </a>
              <a aria-label="Instagram" href="#" className="w-9 h-9 rounded-lg bg-white border border-border flex items-center justify-center transition-transform transform hover:scale-105 hover:bg-primary hover:text-white hover:border-primary elevated shadow-sm hover:shadow-md">
                <Instagram className="w-4 h-4" />
              </a>
            </div>
          </div>

          {/* Products */}
          <div>
            <h4 className="font-semibold mb-4">Produits</h4>
            <ul className="space-y-3">
              <li><Link to="/devis" className="text-sm text-muted-foreground hover:text-primary transition-colors">Assurance Auto</Link></li>
              <li><Link to="/devis" className="text-sm text-muted-foreground hover:text-primary transition-colors">Assurance Moto</Link></li>
              <li><Link to="/devis" className="text-sm text-muted-foreground hover:text-primary transition-colors">Assurance Habitation</Link></li>
              <li><Link to="/devis" className="text-sm text-muted-foreground hover:text-primary transition-colors">Comparateur</Link></li>
            </ul>
          </div>

          {/* Company */}
          <div>
            <h4 className="font-semibold mb-4">Entreprise</h4>
            <ul className="space-y-3">
              <li><a href="#" className="text-sm text-muted-foreground hover:text-primary transition-colors">À propos</a></li>
              <li><a href="#" className="text-sm text-muted-foreground hover:text-primary transition-colors">Carrières</a></li>
              <li><a href="#" className="text-sm text-muted-foreground hover:text-primary transition-colors">Blog</a></li>
              <li><a href="#" className="text-sm text-muted-foreground hover:text-primary transition-colors">Presse</a></li>
            </ul>
          </div>

          {/* Legal */}
          <div>
            <h4 className="font-semibold mb-4">Légal</h4>
            <ul className="space-y-3">
              <li><Link to="/mentions-legales" className="text-sm text-muted-foreground hover:text-primary transition-colors">Mentions légales</Link></li>
              <li><Link to="/politique-confidentialite" className="text-sm text-muted-foreground hover:text-primary transition-colors">Confidentialité</Link></li>
              <li><Link to="/conditions-generales-utilisation" className="text-sm text-muted-foreground hover:text-primary transition-colors">CGU</Link></li>
              <li><a href="#" className="text-sm text-muted-foreground hover:text-primary transition-colors">Cookies</a></li>
            </ul>
          </div>
        </div>

        <div className="mt-12 pt-8 border-t border-border">
          <div className="flex flex-col sm:flex-row justify-between items-center gap-4">
            <p className="text-sm text-muted-foreground">
              © {currentYear} Assurance MAMA. Tous droits réservés.
            </p>
            <div className="flex items-center gap-6">
              <span className="text-xs text-muted-foreground">Paiement sécurisé SSL</span>
              <div className="flex items-center gap-2">
                <div className="w-8 h-6 bg-white border border-border rounded flex items-center justify-center text-[10px] font-semibold">
                  VISA
                </div>
                <div className="w-8 h-6 bg-white border border-border rounded flex items-center justify-center text-[10px] font-semibold">
                  MC
                </div>
                <div className="w-8 h-6 bg-white border border-border rounded flex items-center justify-center text-[10px] font-semibold">
                  MM
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}
import { Link } from "react-router";

export default function EmployeeSettingsIndex() {
  return (
    <div className="min-h-screen pt-24 bg-white">
      <div className="max-w-4xl mx-auto p-6">
        <h1 className="text-2xl font-bold mb-4">Paramètres (Espace employé)</h1>
        <p className="text-muted-foreground mb-4">Sélectionnez une section.</p>
        <ul className="grid grid-cols-2 gap-2">
          <li><Link to="profile" className="block p-3 border rounded">Profil</Link></li>
          <li><Link to="privacy" className="block p-3 border rounded">Confidentialité</Link></li>
          <li><Link to="payments" className="block p-3 border rounded">Modes de paiement</Link></li>
          <li><Link to="security" className="block p-3 border rounded">Sécurité</Link></li>
          <li><Link to="notifications" className="block p-3 border rounded">Notifications</Link></li>
          <li><Link to="preferences" className="block p-3 border rounded">Préférences</Link></li>
          <li><Link to="billing" className="block p-3 border rounded">Facturation</Link></li>
          <li><Link to="connected-apps" className="block p-3 border rounded">Applications connectées</Link></li>
        </ul>
      </div>
    </div>
  );
}

import { Footer } from "../components/footer";
import { Header } from "../components/header";

export function ConditionsGeneralesUtilisation() {
  return (
    <div className="min-h-screen bg-gray-50">
      <Header />
      <main className="max-w-4xl mx-auto p-6 pt-32">
        <h1 className="text-3xl font-bold mb-4">Conditions générales d'utilisation (CGU)</h1>
        <div className="prose">
          <p>Bienvenue sur Assurance MAMA. En utilisant notre site, vous acceptez les présentes conditions générales d'utilisation.</p>
          <h2>Accès au service</h2>
          <p>L'accès au site est réservé aux utilisateurs respectant les lois en vigueur et ces conditions.</p>
          <h2>Responsabilités</h2>
          <p>Nous mettons en œuvre tous les moyens raisonnables pour assurer la disponibilité du service mais ne pouvons garantir une disponibilité continue.</p>
          <h2>Modification des CGU</h2>
          <p>Nous nous réservons le droit de modifier ces CGU. Les utilisateurs seront informés en cas de changement substantiel.</p>
        </div>
      </main>
      <Footer />
    </div>
  );
}

export default ConditionsGeneralesUtilisation;

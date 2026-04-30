import { Footer } from "../components/footer";
import { Header } from "../components/header";

export function PolitiqueConfidentialite() {
  return (
    <div className="min-h-screen bg-gray-50">
      <Header />
      <main className="max-w-4xl mx-auto p-6 pt-32">
        <h1 className="text-3xl font-bold mb-4">Politique de confidentialité</h1>
        <div className="prose">
          <p>Cette politique explique comment Assurance MAMA collecte, utilise et protège vos données personnelles.</p>
          <h2>Collecte des données</h2>
          <p>Nous collectons les informations nécessaires pour fournir nos services (nom, email, informations de contrat, etc.).</p>
          <h2>Utilisation des données</h2>
          <p>Les données sont utilisées pour la gestion de votre contrat, la facturation, le support client et les obligations légales.</p>
          <h2>Droits</h2>
          <p>Vous disposez d'un droit d'accès, de rectification, d'opposition et de suppression. Contactez notre DPO via la page Contact.</p>
        </div>
      </main>
      <Footer />
    </div>
  );
}

export default PolitiqueConfidentialite;

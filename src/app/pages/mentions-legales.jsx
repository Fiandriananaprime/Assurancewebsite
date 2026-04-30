import { Footer } from "../components/footer";
import { Header } from "../components/header";

export function MentionsLegales() {
  return (
    <div className="min-h-screen bg-gray-50">
      <Header />
      <main className="max-w-4xl mx-auto p-6 pt-32">
        <h1 className="text-3xl font-bold mb-4">Mentions légales</h1>
        <div className="prose">
          <p>Assurance MAMA</p>
          <p>Siège social: 123 Rue Exemple, 75000 Paris</p>
          <p>SIRET: 000 000 000 00000</p>
          <p>Directeur de la publication: Monsieur / Madame X</p>
          <p>Hébergeur: Exemple Hébergement - 1 Rue Hébergeur, 75000 Paris</p>
          <p>Pour toute question concernant ces mentions légales, veuillez nous contacter via la page Contact.</p>
        </div>
      </main>
      <Footer />
    </div>
  );
}

export default MentionsLegales;

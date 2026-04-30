const Content = require('../src/models/Content');
const Event = require('../src/models/Event');
const pool = require('../src/config/database');

async function seed() {
  try {
    console.log('Seeding content...');

    const blogs = [
      {
        title: "Comment bien choisir son assurance auto en 2026",
        excerpt: "Guide actualisé pour choisir l'assurance auto la mieux adaptée à votre situation.",
        content: "Contenu riche et pratique sur le choix d'une assurance auto...",
        author_id: null,
        category: "Conseils",
        image_url: "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=1200",
        status: 'publie',
        read_time: '5 min'
      },
      {
        title: "Les avantages de l'assurance habitation tout risque",
        excerpt: "Explications sur la couverture multirisque habitation.",
        content: "Détails sur la multirisque habitation...",
        author_id: null,
        category: "Actualités",
        image_url: "https://images.unsplash.com/photo-1560184897-6a1d7a9f3c8e?w=1200",
        status: 'publie',
        read_time: '4 min'
      }
    ];

    for (const b of blogs) {
      const created = await Content.create({ ...b, type: 'blog' });
      console.log('Created blog id:', created.id, created.title);
    }

    const events = [
      {
        title: 'Webinaire : Optimiser votre couverture assurance',
        excerpt: 'Participez à notre webinaire gratuit',
        content: 'Nous présenterons des astuces pour optimiser vos garanties et réduire les coûts sans sacrifier la protection.',
        author_id: null,
        category: 'Evenements',
        image_url: 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?w=1200',
        status: 'publie',
        event_date: new Date(Date.now() + 7 * 24 * 3600 * 1000).toISOString().slice(0,10),
        time: '18:00',
        location: 'En ligne',
        organizer: 'Equipe MAMA Assurance',
        attendees: 0,
        external_url: 'https://example.com/webinaire-optimiser',
        read_time: '1 min'
      },
      {
        title: 'Atelier : Comprendre les clauses d\'assurance',
        excerpt: 'Atelier pratique pour comprendre vos contrats',
        content: 'Exemples et cas pratiques pour déchiffrer les clauses et mieux négocier votre contrat.',
        author_id: null,
        category: 'Evenements',
        image_url: 'https://images.unsplash.com/photo-1508385082359-fb4f3f1a6cc9?w=1200',
        status: 'publie',
        event_date: new Date(Date.now() + 14 * 24 * 3600 * 1000).toISOString().slice(0,10),
        time: '09:30',
        location: 'Siège Paris - Salle 3',
        organizer: 'Equipe MAMA Assurance',
        attendees: 30,
        external_url: '',
        read_time: '1 min'
      }
    ];

    for (const e of events) {
      const created = await Event.create(e);
      console.log('Created event id:', created.id, created.title);
    }

    console.log('Seeding completed.');
  } catch (err) {
    console.error('Seeding error:', err.message || err);
    process.exitCode = 1;
  } finally {
    await pool.end();
  }
}

seed();

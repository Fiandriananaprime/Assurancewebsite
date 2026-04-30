# Espace Employé - Assurance MAMA

## Vue d'ensemble

L'espace employé est une section dédiée du site d'assurance MAMA qui permet aux employés de gérer toutes les opérations internes de l'entreprise. Cette section est complètement séparée de l'interface client et dispose de sa propre navigation et de ses propres fonctionnalités.

## Comment accéder à l'espace employé

### URL d'accès
- **URL principale**: `http://localhost:5173/employee` ou `http://localhost:5173/employee/dashboard`
- **Navbar dédiée**: Une fois connecté, vous accédez à une navbar spécifique avec toutes les fonctionnalités employé

### Routes disponibles

1. **Tableau de bord** (`/employee/dashboard`)
   - Vue d'ensemble de toutes les activités
   - Statistiques rapides
   - Accès rapide aux différentes sections

2. **Gestion Blog/Événements** (`/employee/blog-management`)
   - Créer, modifier et supprimer des articles de blog
   - Gérer les événements (webinaires, ateliers)
   - Suivre les statistiques de lecture

3. **Sinistres récents** (`/employee/incidents`)
   - Liste complète des sinistres
   - Suivi de l'état d'avancement
   - Gestion des priorités et assignations

4. **Logs d'inscription** (`/employee/signup-logs`)
   - Historique des nouvelles inscriptions
   - Suivi des sources d'acquisition
   - Statistiques de conversion

5. **Nouveaux contrats** (`/employee/new-contracts`)
   - Gestion des nouveaux contrats
   - Suivi des contrats en attente
   - Validation et activation

6. **Retours clients** (`/employee/feedback`)
   - Consultation des feedbacks clients
   - Gestion des réclamations
   - Suivi des réponses

7. **Clients actuels** (`/employee/clients`)
   - Liste complète des clients
   - Informations détaillées par client
   - Historique des interactions

8. **Devis** (`/employee/quotes`)
   - Création et gestion des devis
   - Suivi des devis en attente
   - Statistiques de conversion

## Fonctionnalités principales

### Pour chaque section, vous pouvez :

- **Rechercher** : Utiliser la barre de recherche pour trouver rapidement un élément
- **Filtrer** : Appliquer des filtres par statut, type, date, etc.
- **Trier** : Organiser les données selon différents critères
- **Exporter** : Télécharger les données au format CSV/Excel
- **Actions rapides** : Modifier, supprimer, contacter, etc.

### Design et UX

- **Interface moderne** : Design épuré et professionnel
- **Responsive** : Adapté à tous les écrans (desktop, tablette, mobile)
- **Couleurs distinctives** : Thème bleu/gradient pour différencier de l'interface client
- **Navigation intuitive** : Navbar dédiée avec icônes et libellés clairs

## Données statiques

Toutes les données affichées sont actuellement **statiques** (mock data). Cela signifie que :

- Les informations sont codées en dur dans les composants
- Il n'y a pas de base de données connectée
- Les actions (créer, modifier, supprimer) ne persistent pas les changements
- C'est une maquette fonctionnelle prête à être connectée à un backend

## Prochaines étapes (Backend)

Pour rendre l'application fonctionnelle, il faudra :

1. **Créer une API** pour chaque entité (blogs, incidents, contrats, etc.)
2. **Connecter les composants** à cette API via des appels HTTP
3. **Gérer l'authentification** pour sécuriser l'accès employé
4. **Implémenter la persistance** des données (base de données)
5. **Ajouter des formulaires** pour créer/modifier les éléments

## Structure des fichiers

```
src/app/
├── components/
│   ├── employee-header.jsx          # Navbar dédiée employé
│   └── ... autres components
├── pages/
│   ├── employee-dashboard-page.jsx   # Page principale
│   ├── employee-blog-management-page.jsx
│   ├── employee-incidents-page.jsx
│   ├── employee-signup-logs-page.jsx
│   ├── employee-new-contracts-page.jsx
│   ├── employee-feedback-page.jsx
│   ├── employee-quotes-page.jsx
│   ├── employee-clients-page.jsx
│   └── ... autres pages
└── routes.jsx                        # Configuration des routes
```

## Technologies utilisées

- **React** : Framework UI
- **React Router** : Gestion des routes
- **Tailwind CSS** : Styles et design
- **Lucide React** : Icônes
- **Motion** : Animations

## Développement local

1. **Installer les dépendances** :
   ```bash
   npm install
   ```

2. **Lancer le serveur de développement** :
   ```bash
   npm run dev
   ```

3. **Accéder à l'espace employé** :
   - Ouvrez votre navigateur à `http://localhost:5173/employee`

## Notes importantes

- Cette section est **uniquement destinée aux employés** de l'entreprise
- Dans une version de production, il faudra implémenter un système d'authentification robuste
- Les données sensibles ne doivent pas être exposées côté client
- Prévoir une séparation claire entre les rôles (admin, employé, manager, etc.)

## Support

Pour toute question ou problème, contactez l'équipe de développement.
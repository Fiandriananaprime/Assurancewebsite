UI improvements

But: rendre l'interface plus professionnelle, accessible et réactive.

Changments proposés et implémentés:

1. Palette & tokens CSS
   - Utiliser variables CSS dans `src/styles/theme.css` (déjà présent). Ajouter utilitaires : `elevated`, `animate-shimmer`, `.sr-only`, `focus-ring`.

2. Micro-interactions
   - Boutons: ombre, hover scale, active scale, transitions (implémenté dans `src/app/components/ui/button.jsx`).
   - Liens de navigation: Underline animé et indication d'élément actif (implémenté dans `src/app/components/header.jsx`).

3. Loaders & skeletons
   - Skeleton avec shimmer (implémenté `src/app/components/ui/skeleton.jsx`).

4. Accessibilité
   - Skip link ajouté dans `Header`.
   - Ajout d'`aria-label` aux icônes sociales dans le footer.

5. Polissage du footer
   - Social buttons avec élévation et animation scale (implémenté `src/app/components/footer.jsx`).

6. Nouveaux utilitaires
   - Ajout d'animations et utilitaires dans `src/styles/theme.css` (shimmer, .sr-only, elevated, focus-ring).

7. Composants supplémentaires (ajoutés maintenant):
   - Toast simple animé (accessible) — fichier `src/app/components/ui/toast.jsx`.
   - Ripple utility CSS et small `Card` utilitaire pour hover lift.

Futurs axes recommandés:
- Uniformiser typographie et échelle (ajuster vars font-size et textes h1-h4).
- Ajouter tests visuels (storybook ou snapshots) si besoin.
- Faire un audit d'accessibilité complet.
- Ajouter animations supplémentaires sur messenger (message reactions animées) et sur dashboard (charts animés).

Comment tester:
- Démarrer le serveur dev (npm run dev) et naviguer sur plusieurs pages: header, landing, messenger, pages employés.
- Vérifier les boutons, skeletons pendant chargement, social buttons et le toast (je fournis un exemple pour déclencher un toast).

Notes:
- Quelques linters statiques peuvent signaler les directives Tailwind dans `theme.css` (@apply, @custom-variant). Elles sont normalement traitées à la build si Tailwind/PostCSS est installé.

---
Changements appliqués automatiquement par l'agent. Pour continuer, indique la priorité: "toasts & modals", "messenger polish", "dashboard polish" ou "continuer partout".

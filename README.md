
  # UI/UX Design for Insurance Website

  This is a code bundle for UI/UX Design for Insurance Website. The original project is available at https://www.figma.com/design/xfZk0XkAvdl0xQIbxIsSAo/UI-UX-Design-for-Insurance-Website.

  ## Running the code

  Run `npm i` to install the dependencies.

  Run `npm run dev` to start the development server.

UI improvements and new components
--------------------------------

I added several UI improvements (skeleton shimmer, button polish, header underline animation, accessible skip-link, toast manager, card utilities, avatar fallback improvements).

How to test the Toast manager quickly:

1. In a top-level component (for example `src/main.jsx` or `src/app/App.jsx`) import the manager hook and component:

```jsx
import { useToast, ToastManager } from './app/components/ui/toast-manager';

function Root() {
  const manager = useToast();
  return (
    <>
      <YourApp />
      <ToastManager manager={manager} />
    </>
  );
}
```

2. To show a toast from a child, forward the `push` function or wire a context. Example:

```jsx
manager.push('Saved!', { type: 'success' });
```

Notes:
- Some linters may flag Tailwind directives inside `src/styles/theme.css` (for example `@apply`) if they don't run through PostCSS/Tailwind; this is expected if you open the file directly in an editor that doesn't process Tailwind. The build should handle it when running the configured tooling.

  
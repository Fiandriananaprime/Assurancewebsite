import { createBrowserRouter } from "react-router";
import { LandingPage } from "./pages/landing-page";
import { QuotePage } from "./pages/quote-page";
import { PaymentPage } from "./pages/payment-page";
import { DashboardPage } from "./pages/dashboard-page";
import { ClaimsPage } from "./pages/claims-page";

export const router = createBrowserRouter([
  {
    path: "/",
    Component: LandingPage,
  },
  {
    path: "/devis",
    Component: QuotePage,
  },
  {
    path: "/paiement",
    Component: PaymentPage,
  },
  {
    path: "/dashboard",
    Component: DashboardPage,
  },
  {
    path: "/sinistre",
    Component: ClaimsPage,
  },
]);

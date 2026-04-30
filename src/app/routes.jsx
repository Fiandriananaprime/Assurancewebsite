import { createBrowserRouter } from "react-router";
import { LandingPage } from "./pages/landing-page";
import { QuotePage } from "./pages/quote-page";
import { PaymentPage } from "./pages/payment-page";
import { DashboardPage } from "./pages/dashboard-page";
import { ClaimsPage } from "./pages/claims-page";
import { BlogPage } from "./pages/blog-page";
import { ContactPage } from "./pages/contact-page";
import { LoginPage } from "./pages/login-page";
import { SignupPage } from "./pages/signup-page";
import { EmployeeDashboardPage } from "./pages/employee-dashboard-page";
import { EmployeeClientsPage } from "./pages/employee-clients-page";
import { EmployeeClientDetailPage } from "./pages/employee-client-detail-page";
import { EmployeeBlogManagementPage } from "./pages/employee-blog-management-page";
import { EmployeeIncidentsPage } from "./pages/employee-incidents-page";
import { EmployeeIncidentDetailPage } from "./pages/employee-incident-detail-page";
import { EmployeeSignupLogsPage } from "./pages/employee-signup-logs-page";
import { EmployeeNewContractsPage } from "./pages/employee-new-contracts-page";
import { EmployeeContractDetailPage } from "./pages/employee-contract-detail-page";
import { EmployeeFeedbackPage } from "./pages/employee-feedback-page";
import { EmployeeQuotesPage } from "./pages/employee-quotes-page";
import EmployeeQuotesNewPage from "./pages/employee-quotes-new";
import EmployeeBlogNewPage from "./pages/employee-blogs-new";
import EmployeeEventNewPage from "./pages/employee-events-new";
import EmployeeBlogEditPage from "./pages/employee-blog-edit";
import EmployeeEventEditPage from "./pages/employee-event-edit";
import SettingsIndex from "./pages/settings/index";
import SettingsSection from "./pages/settings/[section]";
import EmployeeSettingsIndex from "./pages/employee/settings/index";
import EmployeeSettingsSection from "./pages/employee/settings/[section]";
import { MentionsLegales } from "./pages/mentions-legales";
import { PolitiqueConfidentialite } from "./pages/politique-confidentialite";
import { ConditionsGeneralesUtilisation } from "./pages/conditions-generales-utilisation";
export const router = createBrowserRouter([{
  path: "/",
  Component: LandingPage
}, {
  path: "/devis",
  Component: QuotePage
}, {
  path: "/paiement",
  Component: PaymentPage
}, {
  path: "/dashboard",
  Component: DashboardPage
}, {
  path: "/sinistre",
  Component: ClaimsPage
}, {
  path: "/blog",
  Component: BlogPage
}, {
  path: "/contact",
  Component: ContactPage
}, {
  path: "/login",
  Component: LoginPage
}, {
  path: "/signup",
  Component: SignupPage
}, {
  path: "/employee",
  Component: EmployeeDashboardPage
}, {
  path: "/employee/dashboard",
  Component: EmployeeDashboardPage
}, {
  path: "/employee/clients",
  Component: EmployeeClientsPage
}, {
  path: "/employee/clients/:clientId",
  Component: EmployeeClientDetailPage
}, {
  path: "/employee/blog-management",
  Component: EmployeeBlogManagementPage
}, {
  path: "/employee/incidents",
  Component: EmployeeIncidentsPage
}, {
  path: "/employee/incidents/:incidentId",
  Component: EmployeeIncidentDetailPage
}, {
  path: "/employee/signup-logs",
  Component: EmployeeSignupLogsPage
}, {
  path: "/employee/new-contracts",
  Component: EmployeeNewContractsPage
}, {
  path: "/employee/contracts/:contractId",
  Component: EmployeeContractDetailPage
}, {
  path: "/employee/feedback",
  Component: EmployeeFeedbackPage
}, {
  path: "/employee/quotes",
  Component: EmployeeQuotesPage
}, {
  path: "/employee/quotes/new",
  Component: EmployeeQuotesNewPage
}, {
  path: "/employee/blogs/new",
  Component: EmployeeBlogNewPage
}, {
  path: "/employee/events/new",
  Component: EmployeeEventNewPage
}, {
  path: "/employee/blogs/:id/edit",
  Component: EmployeeBlogEditPage
}, {
  path: "/employee/events/:id/edit",
  Component: EmployeeEventEditPage
}, {
  path: "/settings",
  Component: SettingsIndex
}, {
  path: "/settings/:section",
  Component: SettingsSection
}, {
  path: "/mentions-legales",
  Component: MentionsLegales
}, {
  path: "/politique-confidentialite",
  Component: PolitiqueConfidentialite
}, {
  path: "/conditions-generales-utilisation",
  Component: ConditionsGeneralesUtilisation
}, {
  path: "/employee/settings",
  Component: EmployeeSettingsIndex
}, {
  path: "/employee/settings/:section",
  Component: EmployeeSettingsSection
}]);

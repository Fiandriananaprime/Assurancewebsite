import { createRoot } from "react-dom/client";
import App from "./app/App.jsx";
import GlobalDialog from "./app/components/global-dialog";
import "./styles/index.css";

createRoot(document.getElementById("root")).render(
	<>
		<App />
		<GlobalDialog />
	</>
);
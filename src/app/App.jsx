import { RouterProvider } from "react-router";
import { router } from "./routes";
import UseGlobalEvents from "./hooks/use-global-events";

export default function App() {
  return <>
      <UseGlobalEvents />
      <RouterProvider router={router} />
    </>;
}
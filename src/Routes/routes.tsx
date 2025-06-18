import { createBrowserRouter } from "react-router-dom";
import AboutUs from "../StartPages/AboutUs";
import NavBar from "../components/NavBar";
import WelcomePage from "../StartPages/WelcomePage";
import LogIn from "../StartPages/LogIn";
import RegisterPage from "../StartPages/RegisterPage";

export const router = createBrowserRouter([
  {
    path: "/",
    element: (
      <>
        <NavBar />
        <WelcomePage />
      </>
    ),
  },
  {
    path: "/aboutus",
    element: (
      <>
        <NavBar />
        <AboutUs />
      </>
    ),
  },

  {
    path: "/signin",
    element: <LogIn />,
  },
  {
    path: "/signup",
    element: <RegisterPage />,
  },
]);

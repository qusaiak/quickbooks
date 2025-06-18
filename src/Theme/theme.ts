import { createTheme, type PaletteMode } from "@mui/material/styles";

export const getTheme = (mode: PaletteMode) =>
  createTheme({
    palette: {
      mode,
      ...(mode === "light"
        ? {
            primary: { main: "#2e2e48" },
            background: { default: "#ebf2f3", paper: "#2e2e48" },
            text: { primary: "#fffff" },
            secondary: {
              main: "#8b93a5",
            },
          }
        : {
            primary: { main: "#2e2e48" },
            background: { default: "#8b93a5", paper: "#ebf2f3" },
            text: { primary: "#ffffff" },
            secondary: {
              main: "#c8e6c9",
            },
          }),
    },

    typography: {
      h1: {
        fontSize: "1.8rem",

        fontWeight: 700,
      },
      h2: {
        fontSize: "1.4rem",
        fontWeight: 10,
      },
      h3: {
        fontSize: "1rem",
        fontWeight: 600,
      },
      h4: {
        fontSize: "0.75rem",
        fontWeight: 500,
      },
      h5: {
        fontSize: "0.5rem",
        fontWeight: 500,
      },
      h6: {
        fontSize: "0.25rem",
        fontWeight: 500,
      },
    },

    breakpoints: {
      values: {
        xs: 0,
        sm: 600,
        md: 900,
        lg: 1200,
        xl: 1536,
      },
    },

    shape: {
      borderRadius: 12,
    },
  });

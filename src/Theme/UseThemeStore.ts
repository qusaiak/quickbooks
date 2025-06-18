import { create } from "zustand";

interface ThemeState {
  mode: "light" | "dark";
  toggleTheme: () => void;
}

// Read from localStorage
const getInitialTheme = (): "light" | "dark" => {
  return (localStorage.getItem("theme") as "light" | "dark") || "light";
};

// Create Zustand store
export const useThemeStore = create<ThemeState>((set) => ({
  mode: getInitialTheme(),
  toggleTheme: () => {
    set((state) => {
      const newMode: "light" | "dark" =
        state.mode === "light" ? "dark" : "light";
      localStorage.setItem("theme", newMode);
      return { mode: newMode };
    });
  },
}));

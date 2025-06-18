import { IconButton } from "@mui/material";
import { Brightness4, Brightness7 } from "@mui/icons-material";
import { useTheme } from "@mui/material/styles";
import { useThemeStore } from "./UseThemeStore";

const ThemeToggle = () => {
  const toggleTheme = useThemeStore((state) => state.toggleTheme);
  const theme = useTheme();

  return (
    <IconButton onClick={toggleTheme} color="inherit">
      {theme.palette.mode === "dark" ? <Brightness7 /> : <Brightness4 />}
    </IconButton>
  );
};

export default ThemeToggle;

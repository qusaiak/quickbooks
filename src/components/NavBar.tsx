import { Box, Stack, styled, Typography, useTheme } from "@mui/material";
import { useNavigate } from "react-router-dom";
import logo from "../assets/appLogo.png";

const TypografyStylee = styled("a")(({ theme }) => ({
  cursor: "pointer",
  marginInline: 15,
  fontSize: 20,
  fontWeight: 700,
  fontStyle: "italic",
  whiteSpace: "nowrap",
  color: theme.palette.primary.main,
  textDecoration: "none",
  [theme.breakpoints.down("sm")]: {
    fontSize: 17,
    marginInline: 5,
  },
}));

const NavBar = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  return (
    <div>
      <Box
        width={"100vw"}
        bgcolor={theme.palette.background.default}
        padding={1}
      >
        <Stack direction={"row"} justifyContent={"space-between"}>
          <Stack direction={"row"} spacing={3} mt={1} alignItems="center">
            <img src={logo} alt="logo" style={{ height: 60, width: 60 }} />

            <Stack>
              <Typography
                variant="h1"
                fontStyle={"italic"}
                color={theme.palette.background.paper}
                sx={{
                  [theme.breakpoints.down("sm")]: {
                    fontSize: 19,
                  },
                }}
              >
                QuickBooks
              </Typography>{" "}
            </Stack>
          </Stack>

          <Box
            display={"flex"}
            sx={{
              mt: 3,
              mr: 3,
              borderBottom: "2px solid #2e2e48",
            }}
          >
            <TypografyStylee
              sx={{
                pl: 5,
                [theme.breakpoints.down("sm")]: {
                  pl: 2,
                },
              }}
              onClick={() => navigate("/")}
            >
              Home
            </TypografyStylee>

            <TypografyStylee onClick={() => navigate("/aboutus")}>
              About us
            </TypografyStylee>

            <TypografyStylee
              sx={{
                pr: 5,
                [theme.breakpoints.down("sm")]: {
                  pr: 2,
                },
              }}
              onClick={() => navigate("/signin")}
            >
              Sign in
            </TypografyStylee>
          </Box>
        </Stack>
      </Box>
    </div>
  );
};

export default NavBar;

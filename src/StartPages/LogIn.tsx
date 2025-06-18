"use client";

import { Controller, useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import {
  Box,
  Typography,
  TextField,
  Button,
  CircularProgress,
  FormControl,
  IconButton,
  InputAdornment,
  InputLabel,
  OutlinedInput,
  FormHelperText,
  useTheme,
  styled,
  Stack,
} from "@mui/material";
import { type AuthInput, authSchema } from "../Schema/RegisterSchema";
import { useState } from "react";
import { VisibilityOff, Visibility, ArrowBack } from "@mui/icons-material";
import { useNavigate } from "react-router-dom";
import logo from "../assets/appLogo.png";

const TypografyStylee = styled("a")(({ theme }) => ({
  cursor: "pointer",
  whiteSpace: "nowrap",
  color: theme.palette.primary.main,
  textDecoration: "none",
  "&:hover": {
    color: theme.palette.secondary.main,
  },
  fontSize: 12,
  margin: 2,
}));

function LogIn() {
  const [showPassword, setShowPassword] = useState(false);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();
  const theme = useTheme();

  //for hid and show password
  const handleClickShowPassword = () => setShowPassword((show) => !show);

  const handleMouseDownPassword = (
    event: React.MouseEvent<HTMLButtonElement>
  ) => {
    event.preventDefault();
  };

  const handleMouseUpPassword = (
    event: React.MouseEvent<HTMLButtonElement>
  ) => {
    event.preventDefault();
  };

  //to handle validation fron react-hook-form while the field change depandent on AuthInput rule
  const {
    control,
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm<AuthInput>({
    resolver: zodResolver(authSchema),
    mode: "onChange",
    reValidateMode: "onBlur",
  });

  const onSubmit = async () => {
    console.log(email, password);
    //  API to submit
  };

  return (
    <Box
      height={"100vh"}
      sx={{
        backgroundImage: `url(${logo}) `,
        backgroundSize: "62%",
        backgroundRepeat: "no-repeat",
        overflow: "hidden",
        fontWeight: 700,
      }}
    >
      <IconButton onClick={() => navigate(-1)}>
        <ArrowBack />
      </IconButton>

      {/* make ui responsive with use breakpoints */}
      <Stack
        ml={"26%"}
        sx={{
          [theme.breakpoints.down("sm")]: {
            ml: "8%",
          },
        }}
        mt={"4%"}
        direction={"row"}
        spacing={"10%"}
      >
        <Box
          component="form"
          onSubmit={handleSubmit(onSubmit)}
          border={"1px solid gray"}
          sx={{
            maxWidth: 600,
            mx: "auto",
            my: 9,
            p: 5,
            fontWeight: 700,
            color: "black",
            borderRadius: 4,
            backdropFilter: "blur(17px)",
            boxShadow: "0 4px 30px rgba(0, 0, 0, 0.3)", // ظل ناعم
            border: "1px solid rgba(255, 255, 255, 0.3)",
            backgroundColor: "rgba(255, 255, 255, 0.3)",
          }}
        >
          <Typography variant="h1" gutterBottom>
            Login
          </Typography>
          <TextField
            label="Email"
            fullWidth
            margin="normal"
            {...register("email")}
            error={!!errors.email}
            helperText={errors.email?.message}
            onChange={(e) => setEmail(e.target.value)}
          />
          <Controller
            name="password"
            control={control}
            defaultValue=""
            render={({ field }) => (
              <FormControl
                fullWidth
                variant="outlined"
                error={!!errors.password}
                margin="normal"
              >
                <InputLabel htmlFor="outlined-adornment-password">
                  Password
                </InputLabel>
                <OutlinedInput
                  id="outlined-adornment-password"
                  type={showPassword ? "text" : "password"}
                  label="Password"
                  {...field}
                  onChange={(e) => {
                    field.onChange(e); // updates RHF state
                    setPassword(e.target.value); // updates local state
                  }}
                  endAdornment={
                    <InputAdornment position="end">
                      <IconButton
                        aria-label={
                          showPassword ? "Hide password" : "Show password"
                        }
                        onClick={handleClickShowPassword}
                        onMouseDown={handleMouseDownPassword}
                        onMouseUp={handleMouseUpPassword}
                        edge="end"
                      >
                        {showPassword ? <VisibilityOff /> : <Visibility />}
                      </IconButton>
                    </InputAdornment>
                  }
                />
                <FormHelperText>{errors.password?.message}</FormHelperText>
              </FormControl>
            )}
          />
          <Box mt={2}>
            <Button
              type="submit"
              variant="contained"
              color="primary"
              onClick={onSubmit}
              disabled={isSubmitting}
              fullWidth
              startIcon={isSubmitting && <CircularProgress size={20} />}
            >
              {isSubmitting ? "Logging in..." : "Login"}
            </Button>
            <Stack mt={2}>
              <TypografyStylee onClick={() => navigate("/signup")}>
                Don't Have An Account?
              </TypografyStylee>
              <TypografyStylee>Forgot Password?</TypografyStylee>
            </Stack>
          </Box>
        </Box>

        <Box maxWidth={"24%"} textAlign={"center"} alignSelf={"center"}>
          <Typography> More One Service In One Place</Typography>
          <Typography> Favorite Places are Closer For You</Typography>{" "}
          <Typography> In One Click</Typography>
          <Typography> And Faster</Typography>
        </Box>
      </Stack>
    </Box>
  );
}

export default LogIn;

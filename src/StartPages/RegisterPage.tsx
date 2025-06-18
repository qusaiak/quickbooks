import {
  Box,
  IconButton,
  Stack,
  Step,
  StepLabel,
  Stepper,
  Typography,
} from "@mui/material";
import { useState } from "react";
import { authSchema } from "../Schema/RegisterSchema";
import { useRegisterStore } from "../Store/UseRegisterStore";
import StepOne from "../components/StepOne";
import StepTwo from "../components/StepTwo";
import { ArrowBack } from "@mui/icons-material";
import { useNavigate } from "react-router-dom";

const steps = ["Personal Info", "Service Info"];

export default function RegisterPage() {
  const [activeStep, setActiveStep] = useState(0);
  const { data, reset } = useRegisterStore();

  const navigate = useNavigate();

  const handleNext = () => setActiveStep((prev) => prev + 1);
  const handleBack = () => setActiveStep((prev) => prev - 1);

  const handleFinalSubmit = async () => {
    const result = authSchema.safeParse(data);
    if (!result.success) {
      console.log("Validation failed. Check your inputs.");
      return;
    }
    console.log("Submitting data:", result.data);
    //  API to submit
    reset();
  };

  return (
    <Box>
      <Stack direction={"row"}>
        <IconButton onClick={() => navigate(-1)}>
          <ArrowBack />
        </IconButton>
        <Typography m={2} variant="h1">
          Register Request
        </Typography>
      </Stack>

      <Typography mx={8}>Lets Go To Make Our Team Know You Butter </Typography>

      <Box sx={{ width: "80%", mx: "auto", mt: 4 }}>
        <Stepper activeStep={activeStep}>
          {steps.map((label) => (
            <Step key={label}>
              <StepLabel>{label}</StepLabel>
            </Step>
          ))}
        </Stepper>

        <Box sx={{ mt: 4 }}>
          {activeStep === 0 && <StepOne onNext={handleNext} />}
          {activeStep === 1 && (
            <StepTwo onBack={handleBack} onSubmit={handleFinalSubmit} />
          )}
        </Box>
      </Box>
    </Box>
  );
}

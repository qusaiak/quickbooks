import { zodResolver } from "@hookform/resolvers/zod";
import {
  Backdrop,
  Box,
  Button,
  Fade,
  FormControl,
  FormHelperText,
  FormLabel,
  IconButton,
  InputLabel,
  MenuItem,
  Modal,
  Select,
  Stack,
  TextField,
  Typography,
  useTheme,
} from "@mui/material";
import { Controller, useForm } from "react-hook-form";
import { z } from "zod";
import { useEffect, useState } from "react";
import { serviceInfoSchema } from "../Schema/RegisterSchema";
import { useRegisterStore } from "../Store/UseRegisterStore";
import { PictureAsPdf } from "@mui/icons-material";
import { useNavigate } from "react-router-dom";

//for handle go back to previous step and submit data
type Props = {
  onBack: () => void;
  onSubmit: () => void;
};

type ServiceInfo = z.infer<typeof serviceInfoSchema>;

const services = ["Salon", "Restaurant", "Clinic", "Hotel"];
const cities = [
  "Damascus ",
  "Aleppo ",
  "Homs ",
  "Hama",
  "Latakia",
  "Idlib ",
  "Deir ez-Zor",
  "Ar-Raqqa ",
  "Al-Hasaka",
  "Tartous ",
  "Daraa",
  "As-Sweida",
  "Quneitra ",
  "Rif Dimashq ",
];

const style = {
  position: "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: "60%",
  border: "2px solid #000",
  boxShadow: 24,
  p: 4,
};

export default function StepTwo({ onBack, onSubmit }: Props) {
  const { data, setData } = useRegisterStore();
  const [previews, setPreviews] = useState<
    Record<"commercial_Register" | "ownerShip_Bond" | "licensing", string>
  >({
    commercial_Register: "",
    ownerShip_Bond: "",
    licensing: "",
  });
  const [open, setOpen] = useState(false);

  const theme = useTheme();
  const naavigate = useNavigate();
  const {
    register,
    control,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm<ServiceInfo>({
    resolver: zodResolver(serviceInfoSchema),
    defaultValues: {
      placeName: data.placeName || "",
      service: data.service || "",
      location: data.location || "",
      licenses: data.licenses || {},
    },
  });

  const handleFinalSubmit = (values: ServiceInfo) => {
    setData(values);
    onSubmit();
  };

  //for can display the upload file
  const watchLicenses = watch("licenses");

  useEffect(() => {
    const newPreviews = { ...previews };
    (Object.keys(previews) as (keyof typeof previews)[]).forEach((key) => {
      const file = watchLicenses?.[key]?.[0];
      if (file) {
        newPreviews[key] = URL.createObjectURL(file);
      }
    });
    setPreviews(newPreviews);
  }, [watchLicenses]);

  const handleOpen = () => setOpen(true);
  const handleClose = () => setOpen(false);

  return (
    <form onSubmit={handleSubmit(handleFinalSubmit)} noValidate>
      <Stack spacing={2} maxWidth={600} mx={"auto"} mb={3}>
        <TextField
          label="Place Name"
          {...register("placeName")}
          error={!!errors.placeName}
          helperText={errors.placeName?.message}
        />

        <FormHelperText sx={{ fontSize: 10 }}>
          Please Select The Type Of Service You Are Provide{" "}
        </FormHelperText>
        <FormControl fullWidth error={!!errors.service}>
          <InputLabel>Service</InputLabel>
          <Controller
            name="service"
            control={control}
            render={({ field }) => (
              <Select
                {...field}
                label="Service"
                sx={{ backgroundColor: theme.palette.background.default }}
              >
                {services.map((service) => (
                  <MenuItem
                    sx={{
                      backgroundColor: theme.palette.background.default,
                      border: "none",
                      ":hover": {
                        backgroundColor: theme.palette.secondary.main,
                      },
                    }}
                    key={service}
                    value={service}
                  >
                    {service}
                  </MenuItem>
                ))}
              </Select>
            )}
          />
          <Typography color="error" variant="caption">
            {errors.service?.message}
          </Typography>
        </FormControl>

        <FormHelperText sx={{ fontSize: 10 }}>
          Please Select Your City{" "}
        </FormHelperText>
        <FormControl fullWidth error={!!errors.location}>
          <InputLabel>City</InputLabel>
          <Controller
            name="location"
            control={control}
            render={({ field }) => (
              <Select {...field} label="City">
                {cities.map((city) => (
                  <MenuItem
                    key={city}
                    value={city}
                    sx={{
                      backgroundColor: theme.palette.background.default,
                      border: "none",
                      ":hover": {
                        backgroundColor: theme.palette.secondary.main,
                      },
                    }}
                  >
                    {city}
                  </MenuItem>
                ))}
              </Select>
            )}
          />
          <Typography color="error" variant="caption">
            {errors.location?.message}
          </Typography>
        </FormControl>

        <FormHelperText sx={{ fontSize: 10 }}>
          Please uploade All Docs And If You Uploade Lease Contract insted of
          the OwnerShip Bond{" "}
        </FormHelperText>
        {(Object.keys(previews) as (keyof typeof previews)[]).map((type) => (
          <Box key={type}>
            <FormLabel>
              {type.charAt(0).toUpperCase() + type.slice(1)} (PDF)
            </FormLabel>
            <IconButton
              component="label"
              sx={{ my: -4 }}
              color={errors.licenses ? "error" : "primary"}
            >
              <PictureAsPdf />
              <input
                type="file"
                accept="application/pdf"
                hidden
                {...register(`licenses.${type}` as const)}
              />
            </IconButton>
            {/* show name of the uploaded file */}
            {watchLicenses?.[type]?.[0]?.name && (
              <Typography variant="body2" mt={1}>
                {watchLicenses[type][0].name}
              </Typography>
            )}

            {errors.licenses?.[type] && (
              <Typography color="error" variant="caption">
                {(errors.licenses[type] as { message?: string })?.message}
              </Typography>
            )}
          </Box>
        ))}

        <Stack direction="row" spacing={2} justifyContent="space-between">
          <Button variant="outlined" onClick={onBack}>
            Back
          </Button>
          <Button
            onClick={() => {
              handleOpen();
              setTimeout(() => {
                naavigate("/signin");
              }, 7000);
            }}
            variant="contained"
            type="submit"
          >
            Submit
          </Button>
          <Modal
            aria-labelledby="transition-modal-title"
            aria-describedby="transition-modal-description"
            open={open}
            onClose={handleClose}
            closeAfterTransition
            slots={{ backdrop: Backdrop }}
            slotProps={{
              backdrop: {
                timeout: 500,
              },
            }}
          >
            <Fade in={open}>
              <Box
                sx={style}
                bgcolor={theme.palette.background.default}
                borderRadius={2}
                color={theme.palette.primary.main}
              >
                <Typography
                  id="transition-modal-title"
                  variant="h2"
                  component="h2"
                >
                  Your request has been registered.
                </Typography>
                <Typography
                  id="transition-modal-title"
                  variant="h2"
                  component="h2"
                >
                  Thank you for choosing our platform.
                </Typography>
                <Typography
                  id="transition-modal-title"
                  variant="h2"
                  component="h2"
                >
                  Your request will be answered as soon as possible.
                </Typography>{" "}
                <Typography
                  id="transition-modal-title"
                  variant="h2"
                  component="h2"
                >
                  Please check your email.
                </Typography>
              </Box>
            </Fade>
          </Modal>
        </Stack>
      </Stack>
    </form>
  );
}

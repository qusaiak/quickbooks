import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { TextField, Button, Stack, FormHelperText } from "@mui/material";
import { z } from "zod";
import { personalInfoSchema } from "../Schema/RegisterSchema";
import { useRegisterStore } from "../Store/UseRegisterStore";


type Props = {
  onNext: () => void;
};

type PersonalInfo = z.infer<typeof personalInfoSchema>;

export default function StepOne({ onNext }: Props) {
  const { data, setData } = useRegisterStore();

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<PersonalInfo>({
    resolver: zodResolver(personalInfoSchema),
    mode: "onChange",
    defaultValues: {
      ownerName: data.ownerName || "",
      email: data.email || "",
      phone: data.phone || "",
      password: data.password || "",
    },
  });

  const onSubmit = (values: PersonalInfo) => {
    setData(values);

    //move to next step
    onNext();
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)} noValidate>
      <Stack spacing={2} maxWidth={600} mx={"auto"} mb={3}>
        <FormHelperText sx={{ fontSize: 10 }}>
          Please Enter The Owner Of Place{" "}
        </FormHelperText>
        <TextField
          label="Owner Name"
          {...register("ownerName")}
          error={!!errors.ownerName}
          helperText={errors.ownerName?.message}
        />

        <FormHelperText sx={{ fontSize: 10 }}>
          {" "}
          This Contact Email You Will Use For Login To Your Account
        </FormHelperText>
        <TextField
          label="Email"
          type="email"
          {...register("email")}
          error={!!errors.email}
          helperText={errors.email?.message}
        />

        <TextField
          label="Phone Number"
          type="number"
          {...register("phone")}
          error={!!errors.phone}
          helperText={errors.phone?.message}
        />

        <FormHelperText sx={{ fontSize: 10 }}>
          Please Enter Strong Password contains Symbols , Strings And Numbers{" "}
        </FormHelperText>
        <TextField
          label="Password"
          type="password"
          {...register("password")}
          error={!!errors.password}
          helperText={errors.password?.message}
        />

        <Button
          type="submit"
          variant="contained"
          sx={{ width: 90, alignSelf: "end" }}
        >
          Next
        </Button>
      </Stack>
    </form>
  );
}

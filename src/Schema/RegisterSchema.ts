import { z } from "zod";

export const personalInfoSchema = z.object({
  ownerName: z.string({ message: "Name is Required" }).min(1),

  email: z.string().email({ message: "Invalid email" }),

  phone: z
    .string({ message: "Phone number is required" })
    .min(10, { message: "Phone number must be  10 digits" })
    .max(10, { message: "Phone number must be 10 digits" })
    .regex(/^\d+$/, {
      message: "Phone number must contain only digits (no symbols)",
    }),

  password: z
    .string()
    .min(6, { message: "Password must be at least 6 characters" }),
});

export const serviceInfoSchema = z.object({
  placeName: z.string({ message: "Name is Required" }).min(1),

  service: z.string().min(1, { message: "Please select a service" }),

  location: z.string().min(1, { message: "Please select a city" }),

  licenses: z.object({
    commercial_Register: z.any({
      message: "Commercial Register license is required",
    }),
    ownerShip_Bond: z.any({ message: "OwnerShip Bond license is required" }),
    licensing: z.any({ message: "Licensing license is required" }),
  }),
});

export const authSchema = personalInfoSchema.merge(serviceInfoSchema);

export type AuthInput = z.infer<typeof authSchema>;

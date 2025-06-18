import { create } from "zustand";
import type { AuthInput } from "../Schema/RegisterSchema";

type RegisterState = {
  data: Partial<AuthInput>;
  setData: (values: Partial<AuthInput>) => void;
  reset: () => void;
};

export const useRegisterStore = create<RegisterState>((set) => ({
  data: {},
  setData: (values) => set((state) => ({ data: { ...state.data, ...values } })),
  reset: () => set({ data: {} }),
}));

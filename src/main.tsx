// import { StrictMode } from 'react'
// import { createRoot } from 'react-dom/client'
// // import  './App.css'
// import router from './Routes/routes.jsx'
// import { RouterProvider } from 'react-router-dom'
// import { CssBaseline } from '@mui/material'
// createRoot(document.getElementById('root')!).render(
//   <StrictMode>
//      <CssBaseline />
//     {/* <App /> */}
//     <RouterProvider router={router} />
//   </StrictMode>,
// )



import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { CssBaseline, ThemeProvider } from '@mui/material';

import { RouterProvider } from 'react-router-dom';
import { useThemeStore } from './Theme/UseThemeStore';
import { getTheme } from './Theme/theme';
import { router } from './Routes/routes';

// Custom theme and Zustand store
 // Your Zustand store

// Get current mode from Zustand directly
const mode = useThemeStore.getState().mode;
const theme = getTheme(mode);

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <RouterProvider router={router} />
    </ThemeProvider>
  </StrictMode>
);

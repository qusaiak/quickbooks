import { Box } from "@mui/material";

import { Outlet } from "react-router-dom";

const WelcomePage = () => {
  return (
    <>
      <Box component="main" sx={{ padding: 3 }}>
        <Outlet />
      </Box>
    </>
  );
};

export default WelcomePage;

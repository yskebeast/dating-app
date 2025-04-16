import { Button, Stack, Typography } from "@mui/material";
import React from "react";

export default function Page() {
  return (
    <Stack
      height="100lvh"
      justifyContent="center"
      alignItems="center"
      gap="32px"
    >
      <Typography id="login_heading" variant="h1" fontSize="1.5rem">
        dashboard
      </Typography>

      <Button type="submit">Signin with GitHub</Button>
    </Stack>
  );
}

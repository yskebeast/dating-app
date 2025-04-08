import type { NextAuthConfig } from "next-auth";
import GitHub from "next-auth/providers/github";

import Credentials from "next-auth/providers/credentials";

export const authConfig: NextAuthConfig = {
  providers: [
    GitHub({
      clientId: process.env.GITHUB_ID!,
      clientSecret: process.env.GITHUB_SECRET!,
    }),
  ],
  // secret: process.env.NEXTAUTH_SECRET,

  pages: {
    signIn: "/login",
  },
};

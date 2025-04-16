import NextAuth from "next-auth";
import GitHub from "next-auth/providers/github";

console.log("aaaaaaaaaaaaaaaaaaaaaa");
export const { auth, handlers, signIn, signOut } = NextAuth({
  providers: [
    GitHub({
      clientId: process.env.GITHUB_CLIENT_ID!,
      clientSecret: process.env.GITHUB_CLIENT_SECRET!,
    }),
  ],
  trustHost: true,
  secret: process.env.NEXTAUTH_SECRET,
  pages: {
    signIn: "/login",
  },
  callbacks: {
    authorized({ request, auth }) {
      const { pathname } = request.nextUrl;
      if (pathname === "/login") {
        console.log("aaaaaaaaaa", pathname);
        return !!auth;
      }
      return true;
    },
  },
});

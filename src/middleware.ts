export { auth as middleware } from "@/auth";

console.log("Middleware is running");

export const config = {
  matcher: ["/((?!api|_next/static|_next/image|favicon.ico).*)"],
};

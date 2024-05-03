export async function GET() {
  const apiKey = process.env.DATA_API_KEY || "default_api_key";
  const res = await fetch("https://data.mongodb-api.com/...", {
    headers: {
      "Content-Type": "application/json",
      "API-Key": apiKey,
    },
  });
  const data = await res.json();
  

  return Response.json({ data });
}

import express from "express";
import routes from "./routes";
import dotenv from "dotenv";

dotenv.config();

const app = express();
app.use(express.json());

app.get("/health", (_req, res) => res.json({ ok: true }));

app.use((err: any, _req: any, res: any, _next: any) => {
  const code = err?.status || 500;
  res.status(code).json({ message: err?.message || "Erro interno" });
});

app.use("/api", routes);
export default app;

import express from "express";

const app = express();
app.use(express.json());

app.get("/", (req, res) => {
  res.send("🚀 API rodando com Node.js + Express!");
});

export default app;

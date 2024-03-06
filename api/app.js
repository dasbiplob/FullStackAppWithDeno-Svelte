import { Hono, serveStatic } from "./deps.js";

const app = new Hono();

app.use("/", serveStatic({ path: './static/index.html' }))
app.use("/favicon.png", serveStatic({ path: './static/favicon.png' }))
app.use("/_app/*", serveStatic({ root: './static/' }))

app.get("/api/random", (c) => c.json({
  random: Math.random()
}));

export default app;

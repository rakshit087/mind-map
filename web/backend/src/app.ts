import express from "express";
import config from "config";
import connect from "./utils/connect";
import logger from "./utils/logger";
import routes from "./routes";

// Get port from config
const port = config.get<number>("port");
const app = express();

app.listen(port, async () => {
  logger.info(`Server is running on port ${port}`);
  await connect();
  routes(app);
});

console.log("hello world");

import express from "express";
import config from "config";

const port = config.get<number>("port");
const app = express();

app.listen(port, () => {
  console.log("Server is running on port 1337");
});

console.log("hello world");

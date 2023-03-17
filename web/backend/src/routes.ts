import { Express, Request, Response } from "express";
import { createUserHandler } from "./controller/user.controller";

function routes(app: Express) {
  app.get("/", (req: Request, res: Response) => {
    res.send("Hello World!");
  });
  app.post("/api/users", createUserHandler);
}

export default routes;

// Description: Middleware to validate the request body, query and params

import { Request, Response, NextFunction } from "express";
import { AnyZodObject } from "zod";

const validate = (schema: AnyZodObject) => {
  return (req: Request, res: Response, next: NextFunction) => {
    try {
      schema.parse({ body: req.body, query: req.query, params: req.params });
      next();
    } catch (err: any) {
      return res.status(400).json({ error: err.errors });
    }
  };
};

export default validate;

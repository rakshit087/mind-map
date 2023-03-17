import { DocumentDefinition } from "mongoose";
import UserModel, { UserI } from "../models/user.model";

export async function createUser(input: DocumentDefinition<UserI>) {
  try {
    return await UserModel.create(input);
  } catch (error: any) {
    throw new Error(error);
  }
}

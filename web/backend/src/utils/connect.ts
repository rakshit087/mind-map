// To connect to the database

import mongoose from "mongoose";
import config from "config";

const dbUri = config.get<string>("dbUri");

const connect = async () => {
  try {
    await mongoose.connect(dbUri);
    console.log("Connected to database");
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

export default connect;

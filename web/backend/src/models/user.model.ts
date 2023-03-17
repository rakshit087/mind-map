import mongoose from "mongoose";
import bcrypt from "bcrypt";
import config from "config";

export interface UserI extends mongoose.Document {
  name: string;
  email: string;
  password: string;
  createdAt: Date;
  updatedAt: Date;
}

// Define a User Schema with Mongoose
const userSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: true,
      unique: true,
    },
  },
  {
    timestamps: true,
  }
);

//  Using pre hook to hash the password before saving it to the database
userSchema.pre("save", async function (next) {
  let user = this as UserI;
  if (!user.isModified("password")) {
    return next();
  }
  const salt = await bcrypt.genSalt(10);
  const hash = await bcrypt.hash(user.password, salt);
  user.password = hash;
  next();
});

const UserModel = mongoose.model("User", userSchema);

export default UserModel;

import { Router } from "express";
import { UserController } from "./user.controller";

const userRouter = Router();
const controller = new UserController();

userRouter.post("/create", controller.createUser);

export default userRouter;

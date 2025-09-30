import { Router } from "express";
import userRouter from "../modules/user/user.router";
const routes = Router();

routes.use("/user", userRouter);

export default routes;

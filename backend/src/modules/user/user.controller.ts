import { Request, Response } from "express";
import UserService from "./user.service";

const service = new UserService();

export class UserController {
  async createUser(req: Request, res: Response) {
    try {
      const data = req.body.data;
      const user = await service.createUser(data);
      return res.status(200).json({ data: user });
    } catch (error) {
      return res.status(500).json({ erro: "Erro ao criar usuário" });
    }
  }
}

export default UserController;

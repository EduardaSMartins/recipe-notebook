import { user } from "../../generated/prisma";
import UserRepository from "./user.repository";

const repository = new UserRepository();

export class UserService {
  async createUser(data: user) {
    try {
      const newUser = await repository.create(data);
      console.log("newUser", newUser);
      return newUser;
    } catch (error) {
      throw new Error("Erro ao criar usuário");
    }
  }
}

export default UserService;

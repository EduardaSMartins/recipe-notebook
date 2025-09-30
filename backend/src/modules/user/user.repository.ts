import { user } from "../../generated/prisma";
import { prisma } from "../../prisma";

export class UserRepository {
  async create(data: user): Promise<user> {
    return prisma.user.create({ data });
  }
}

export default UserRepository;

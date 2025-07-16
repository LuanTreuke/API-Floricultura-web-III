import { Injectable, BadRequestException } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { CreateEnderecoDto } from './dto/create-endereco.dto';
import { UpdateEnderecoDto } from './dto/update-endereco.dto';

@Injectable()
export class EnderecoService {
  constructor(private prisma: PrismaService) {}

  create(data: CreateEnderecoDto) {
    return this.prisma.endereco.create({ data });
  }

  findAll() {
    return this.prisma.endereco.findMany();
  }

  findOne(id: number) {
    return this.prisma.endereco.findUnique({ where: { id } });
  }

  update(id: number, data: UpdateEnderecoDto) {
    return this.prisma.endereco.update({ where: { id }, data });
  }

  async remove(id: number) {
    try {
      return await this.prisma.endereco.delete({ where: { id } });
    } catch (error) {
      if (error.code === 'P2003') {
        throw new BadRequestException('Não é possível excluir este endereço pois ele está vinculado a um pedido.');
      }
      throw error;
    }
  }
}
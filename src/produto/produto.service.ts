import { Injectable, BadRequestException } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { CreateProdutoDto } from './dto/create-produto.dto';
import { UpdateProdutoDto } from './dto/update-produto.dto';

@Injectable()
export class ProdutoService {
  constructor(private prisma: PrismaService) {}

  create(data: CreateProdutoDto) {
    return this.prisma.produto.create({ data });
  }

  findAll() {
    return this.prisma.produto.findMany();
  }

  findOne(id: number) {
    return this.prisma.produto.findUnique({ where: { id } });
  }

  update(id: number, data: UpdateProdutoDto) {
    return this.prisma.produto.update({ where: { id }, data });
  }

  async remove(id: number) {
    try {
      return await this.prisma.produto.delete({ where: { id } });
    } catch (error) {
      if (error.code === 'P2003') {
        throw new BadRequestException('Não é possível excluir este produto pois ele está vinculado a um pedido.');
      }
      throw error;
    }
  }
}

import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ProdutoModule } from './produto/produto.module';
import { PedidoModule } from './pedido/pedido.module';
import { EnderecoModule } from './endereco/endereco.module';
import { PrismaService } from './prisma.service';

@Module({
  imports: [ProdutoModule, PedidoModule, EnderecoModule],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}

import { StatusPedido } from '@prisma/client';

export class CreatePedidoDto {
  imagemEntrega?: string;
  horaEntrega?: Date;
  dataEntrega?: Date;
  nomeDestinatario?: string;
  dataPedido?: Date;
  horaPedido?: Date;
  nomeCliente?: string;
  telefoneCliente?: string;
  status?: StatusPedido;
  pagamentoConfirmado?: boolean;
  cobrarNoEndereco?: boolean;
  observacao?: string;
  enderecoId: number;
  produtoId: number;
}

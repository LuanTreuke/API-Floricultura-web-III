/*
  Warnings:

  - You are about to alter the column `status` on the `pedido` table. The data in that column could be lost. The data in that column will be cast from `Enum(EnumId(0))` to `Enum(EnumId(0))`.

*/
-- AlterTable
ALTER TABLE `pedido` MODIFY `status` ENUM('RECEBIDO', 'ENTREGUE') NOT NULL DEFAULT 'RECEBIDO';

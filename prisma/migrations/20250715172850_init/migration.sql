-- CreateTable
CREATE TABLE `Produto` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `descricao` VARCHAR(191) NULL,
    `preco` DECIMAL(10, 2) NOT NULL,
    `imagem_url` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pedido` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `imagem_entrega` VARCHAR(255) NULL,
    `hora_entrega` DATETIME(3) NULL,
    `data_entrega` DATETIME(3) NULL,
    `nome_destinatario` VARCHAR(255) NULL,
    `data_pedido` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `hora_pedido` DATETIME(3) NULL,
    `nome_cliente` VARCHAR(255) NULL,
    `telefone_cliente` VARCHAR(15) NULL,
    `status` ENUM('RECEBIDO', 'PENDENTE') NOT NULL DEFAULT 'PENDENTE',
    `pagamento_confirmado` BOOLEAN NOT NULL DEFAULT false,
    `cobrar_no_endereco` BOOLEAN NOT NULL DEFAULT false,
    `observacao` TEXT NULL,
    `Endereco_id` INTEGER NOT NULL,
    `Produto_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Endereco` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `rua` VARCHAR(255) NOT NULL,
    `numero` VARCHAR(10) NOT NULL,
    `bairro` VARCHAR(255) NOT NULL,
    `cep` VARCHAR(255) NOT NULL,
    `cidade` VARCHAR(50) NOT NULL,
    `complemento` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_Endereco_id_fkey` FOREIGN KEY (`Endereco_id`) REFERENCES `Endereco`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_Produto_id_fkey` FOREIGN KEY (`Produto_id`) REFERENCES `Produto`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

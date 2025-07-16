## Project setup

```bash
$ npm install
```

## Compile and run the project

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Run tests

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Banco de dados

```bash

CREATE DATABASE floricultura CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE floricultura;


CREATE TABLE Produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    imagem_url VARCHAR(255)
);

CREATE TABLE Endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cep VARCHAR(255) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    complemento TEXT
);

CREATE TABLE Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    imagem_entrega VARCHAR(255),
    hora_entrega DATETIME,
    data_entrega DATETIME,
    nome_destinatario VARCHAR(255),
    data_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    hora_pedido DATETIME,
    nome_cliente VARCHAR(255),
    telefone_cliente VARCHAR(15),
    status ENUM('RECEBIDO', 'PENDENTE') NOT NULL DEFAULT 'PENDENTE',
    pagamento_confirmado BOOLEAN NOT NULL DEFAULT FALSE,
    cobrar_no_endereco BOOLEAN NOT NULL DEFAULT FALSE,
    observacao TEXT,
    Endereco_id INT NOT NULL,
    Produto_id INT NOT NULL,
    CONSTRAINT fk_pedido_endereco FOREIGN KEY (Endereco_id) REFERENCES Endereco(id) ON DELETE RESTRICT,
    CONSTRAINT fk_pedido_produto FOREIGN KEY (Produto_id) REFERENCES Produto(id)
);
```


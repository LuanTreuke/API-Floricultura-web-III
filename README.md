
# API Floricultura - Web III

Esta API foi desenvolvida para gerenciar pedidos, produtos e endereços de uma floricultura, utilizando o framework NestJS e Prisma ORM para garantir performance, escalabilidade e facilidade de manutenção. O projeto faz parte da disciplina Web III e segue arquitetura RESTful.

## Autor

Luan Eduardo Treuke

## Tecnologias Utilizadas
- **TypeScript**
- **NestJS**
- **Prisma ORM**
- **MySQL**
- **Jest** (testes automatizados)
- **ESLint/Prettier** (padronização de código)

## Como Executar

1. Instale as dependências:
   ```bash
   npm install
   ```
2. Configure o banco de dados MySQL e a variável `DATABASE_URL` no arquivo `.env`.
3. Rode as migrations do Prisma:
   ```bash
   npx prisma migrate dev --name init
   ```
4. Inicie o servidor:
   ```bash
   npm run start:dev
   ```

## Testes

```bash
# unit tests
npm run test

# e2e tests
npm run test:e2e

# test coverage
npm run test:cov
```


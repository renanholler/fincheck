# Arquitetura do Fincheck

## Visão Geral

O Fincheck segue uma arquitetura **Client-Server** moderna, com separação clara entre frontend e backend, comunicando-se via API REST.

## Diagrama de Arquitetura

```
┌──────────────────────────────────────────────────────────┐
│                    Camada de Apresentação                │
│                                                          │
│  ┌────────────────────────────────────────────────────┐  │
│  │              React Application (SPA)               │  │
│  │                                                    │  │
│  │  ├─ Pages (Rotas)                                  │  │
│  │  ├─ Components (UI)                                │  │
│  │  ├─ Hooks (Lógica)                                 │  │
│  │  ├─ Services (HTTP Client)                         │  │
│  │  └─ State Management (React Query)                 │  │
│  └────────────────────────────────────────────────────┘  │
└─────────────────────────┬────────────────────────────────┘
                          │ HTTPS/REST
                          │ JSON
┌─────────────────────────▼────────────────────────────────┐
│                    Camada de Aplicação                   │
│                                                          │
│  ┌────────────────────────────────────────────────────┐  │
│  │              NestJS Application                    │  │
│  │                                                    │  │
│  │  ├─ Controllers (Endpoints)                        │  │
│  │  ├─ Services (Business Logic)                      │  │
│  │  ├─ DTOs (Validation)                              │  │
│  │  ├─ Guards (Authentication)                        │  │
│  │  ├─ Pipes (Data Transform)                         │  │
│  │  └─ Filters (Error Handling)                       │  │
│  └────────────────────────────────────────────────────┘  │
└─────────────────────────┬────────────────────────────────┘
                          │ Prisma Client
                          │ Type-safe queries
┌─────────────────────────▼────────────────────────────────┐
│                    Camada de Persistência                │
│                                                          │
│  ┌────────────────────────────────────────────────────┐  │
│  │                  PostgreSQL                        │  │
│  │                                                    │  │
│  │  ├─ Users                                          │  │
│  │  ├─ BankAccounts                                   │  │
│  │  ├─ Categories                                     │  │
│  │  └─ Transactions                                   │  │
│  └────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────┘
```

## Módulos do Backend

### Auth Module
**Responsabilidade**: Autenticação e autorização

- Login de usuários
- Cadastro (signup)
- Geração de JWT tokens
- Validação de tokens
- Proteção de rotas

**Endpoints**:
- `POST /auth/signin` - Login
- `POST /auth/signup` - Cadastro

### Users Module
**Responsabilidade**: Gestão de usuários

- Buscar dados do usuário autenticado
- Atualizar perfil

**Endpoints**:
- `GET /users/me` - Dados do usuário atual

### Categories Module
**Responsabilidade**: Categorias de transações

- Listar categorias do usuário
- Categorias pré-definidas por tipo (INCOME/EXPENSE)

**Endpoints**:
- `GET /categories` - Lista categorias

### Bank Accounts Module
**Responsabilidade**: Contas bancárias

- CRUD de contas
- Cálculo de saldo
- Listagem de contas do usuário

**Endpoints**:
- `GET /bank-accounts` - Listar contas
- `POST /bank-accounts` - Criar conta
- `PUT /bank-accounts/:id` - Atualizar conta
- `DELETE /bank-accounts/:id` - Deletar conta

### Transactions Module
**Responsabilidade**: Receitas e despesas

- CRUD de transações
- Filtros por período, categoria, tipo
- Vínculo com contas bancárias
- Atualização automática de saldos

**Endpoints**:
- `GET /transactions` - Listar transações
- `POST /transactions` - Criar transação
- `PUT /transactions/:id` - Atualizar transação
- `DELETE /transactions/:id` - Deletar transação

## Frontend - Estrutura de Páginas

```
/                       → Login/Signup
/dashboard              → Dashboard principal
  ├─ Visão geral
  ├─ Gráficos
  └─ Resumo financeiro
/transactions           → Lista de transações
/accounts               → Gerenciar contas
/categories             → Gerenciar categorias
```

## Fluxo de Autenticação

```
1. Usuário faz login
   └─> POST /auth/signin
       └─> Backend valida credenciais
           └─> Gera JWT token
               └─> Frontend armazena no localStorage

2. Requisições subsequentes
   └─> Frontend inclui header: Authorization: Bearer <token>
       └─> Backend valida token (AuthGuard)
           └─> Extrai userId do token
               └─> Injeta no request (CurrentUser decorator)

3. Logout
   └─> Frontend remove token do localStorage
```

## Segurança

### Backend
- ✅ Bcrypt para hash de senhas
- ✅ JWT para autenticação stateless
- ✅ Guards para proteção de rotas
- ✅ Class Validator para validação de DTOs
- ✅ Isolamento de dados por usuário
- ✅ CORS configurado

### Frontend
- ✅ Token armazenado em localStorage
- ✅ Rotas protegidas (React Router)
- ✅ Validação de formulários
- ✅ Sanitização de inputs
- ✅ HTTPS em produção

## Banco de Dados

### Schema Principal

```prisma
User {
  id: UUID
  name: String
  email: String (unique)
  password: String (hashed)
  bankAccounts: BankAccount[]
  categories: Category[]
  transactions: Transaction[]
}

BankAccount {
  id: UUID
  name: String
  initialBalance: Decimal
  type: CHECKING | INVESTMENT | CASH
  color: String
  userId: UUID
  transactions: Transaction[]
}

Category {
  id: UUID
  name: String
  icon: String
  type: INCOME | EXPENSE
  userId: UUID
  transactions: Transaction[]
}

Transaction {
  id: UUID
  name: String
  value: Decimal
  date: DateTime
  type: INCOME | EXPENSE
  bankAccountId: UUID
  categoryId: UUID
  userId: UUID
}
```

## Decisões Técnicas

### Por que NestJS?
- Framework maduro e opinado
- TypeScript first
- Arquitetura modular
- Decorators poderosos
- Excelente integração com Prisma

### Por que Prisma?
- Type-safety completa
- Migrations automáticas
- Query builder intuitivo
- Excelente DX
- Suporte a PostgreSQL

### Por que React Query?
- Cache automático
- Revalidação inteligente
- Loading/Error states
- Otimistic updates
- Sincronização de estado server

### Por que Submodules?
- Repositórios independentes
- Facilita CI/CD separado
- Times podem trabalhar isoladamente
- Versionamento granular
- Mantém histórico completo

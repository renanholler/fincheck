# API Documentation

> 📝 Esta documentação será expandida em breve.

## Base URL

```
http://localhost:3000
```

## Autenticação

A API usa JWT (JSON Web Tokens) para autenticação. Após o login, inclua o token no header de todas as requisições:

```
Authorization: Bearer <seu-token-jwt>
```

## Endpoints

### Authentication

#### POST /auth/signup
Cadastro de novo usuário.

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "senha123"
}
```

**Response (201):**
```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

#### POST /auth/signin
Login de usuário.

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "senha123"
}
```

**Response (200):**
```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

---

### Users

#### GET /users/me
Retorna dados do usuário autenticado.

**Headers:**
```
Authorization: Bearer <token>
```

**Response (200):**
```json
{
  "id": "uuid",
  "name": "John Doe",
  "email": "john@example.com"
}
```

---

### Bank Accounts

#### GET /bank-accounts
Lista todas as contas do usuário.

**Headers:**
```
Authorization: Bearer <token>
```

**Response (200):**
```json
[
  {
    "id": "uuid",
    "name": "Conta Corrente",
    "initialBalance": 1000.00,
    "type": "CHECKING",
    "color": "#3b82f6"
  }
]
```

#### POST /bank-accounts
Cria uma nova conta.

**Request Body:**
```json
{
  "name": "Conta Corrente",
  "initialBalance": 1000.00,
  "type": "CHECKING",
  "color": "#3b82f6"
}
```

**Response (201):**
```json
{
  "id": "uuid",
  "name": "Conta Corrente",
  "initialBalance": 1000.00,
  "type": "CHECKING",
  "color": "#3b82f6"
}
```

#### PUT /bank-accounts/:id
Atualiza uma conta.

#### DELETE /bank-accounts/:id
Remove uma conta.

---

### Categories

#### GET /categories
Lista categorias do usuário.

**Response (200):**
```json
[
  {
    "id": "uuid",
    "name": "Salário",
    "icon": "income",
    "type": "INCOME"
  },
  {
    "id": "uuid",
    "name": "Alimentação",
    "icon": "food",
    "type": "EXPENSE"
  }
]
```

---

### Transactions

#### GET /transactions
Lista transações do usuário.

**Query Parameters:**
- `month` (number): Mês (1-12)
- `year` (number): Ano
- `bankAccountId` (string, optional): Filtrar por conta
- `type` (string, optional): INCOME | EXPENSE

**Response (200):**
```json
[
  {
    "id": "uuid",
    "name": "Salário",
    "value": 5000.00,
    "date": "2026-02-01T00:00:00.000Z",
    "type": "INCOME",
    "category": {
      "id": "uuid",
      "name": "Salário",
      "icon": "income"
    },
    "bankAccount": {
      "id": "uuid",
      "name": "Conta Corrente"
    }
  }
]
```

#### POST /transactions
Cria uma transação.

**Request Body:**
```json
{
  "name": "Compra supermercado",
  "value": 250.50,
  "date": "2026-02-07",
  "type": "EXPENSE",
  "bankAccountId": "uuid",
  "categoryId": "uuid"
}
```

#### PUT /transactions/:id
Atualiza uma transação.

#### DELETE /transactions/:id
Remove uma transação.

---

## Error Responses

### 400 Bad Request
```json
{
  "statusCode": 400,
  "message": ["email must be an email"],
  "error": "Bad Request"
}
```

### 401 Unauthorized
```json
{
  "statusCode": 401,
  "message": "Unauthorized"
}
```

### 404 Not Found
```json
{
  "statusCode": 404,
  "message": "Not Found"
}
```

### 500 Internal Server Error
```json
{
  "statusCode": 500,
  "message": "Internal server error"
}
```

---

## Tipos de Dados

### BankAccountType
- `CHECKING` - Conta Corrente
- `INVESTMENT` - Investimentos
- `CASH` - Dinheiro

### TransactionType
- `INCOME` - Receita
- `EXPENSE` - Despesa

---

**Para mais detalhes, consulte o código-fonte em [/api](https://github.com/renanholler/fincheck_api)**

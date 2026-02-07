# Fincheck Architecture

## Overview

Fincheck follows a modern **Client-Server** architecture with a clear separation between frontend and backend, communicating through a REST API.

## Architecture Diagram

```
┌──────────────────────────────────────────────────────────┐
│                    Presentation Layer                    │
│                                                          │
│  ┌────────────────────────────────────────────────────┐  │
│  │              React Application (SPA)               │  │
│  │                                                    │  │
│  │  ├─ Pages (Routes)                                 │  │
│  │  ├─ Components (UI)                                │  │
│  │  ├─ Hooks (Logic)                                  │  │
│  │  ├─ Services (HTTP Client)                         │  │
│  │  └─ State Management (React Query)                 │  │
│  └────────────────────────────────────────────────────┘  │
└─────────────────────────┬────────────────────────────────┘
                          │ HTTPS/REST
                          │ JSON
┌─────────────────────────▼────────────────────────────────┐
│                    Application Layer                     │
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
│                    Persistence Layer                    │
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

## Backend Modules

### Auth Module

**Responsibility**: Authentication and authorization

* User login
* User signup
* JWT token generation
* Token validation
* Route protection

**Endpoints**

* `POST /auth/signin` — Login
* `POST /auth/signup` — Signup

---

### Users Module

**Responsibility**: User management

* Fetch authenticated user data
* Update profile

**Endpoints**

* `GET /users/me` — Current user data

---

### Categories Module

**Responsibility**: Transaction categories

* List user categories
* Default categories by type (INCOME/EXPENSE)

**Endpoints**

* `GET /categories` — List categories

---

### Bank Accounts Module

**Responsibility**: Bank accounts

* Account CRUD
* Balance calculation
* List user accounts

**Endpoints**

* `GET /bank-accounts` — List accounts
* `POST /bank-accounts` — Create account
* `PUT /bank-accounts/:id` — Update account
* `DELETE /bank-accounts/:id` — Delete account

---

### Transactions Module

**Responsibility**: Income and expenses

* Transaction CRUD
* Filters by period, category and type
* Link with bank accounts
* Automatic balance updates

**Endpoints**

* `GET /transactions` — List transactions
* `POST /transactions` — Create transaction
* `PUT /transactions/:id` — Update transaction
* `DELETE /transactions/:id` — Delete transaction

---

## Frontend — Pages Structure

```
/                     → Login/Signup
/dashboard            → Main dashboard
  ├─ Overview
  ├─ Charts
  └─ Financial summary
/transactions         → Transactions list
/accounts             → Manage accounts
/categories           → Manage categories
```

---

## Authentication Flow

```
1. User logs in
   └─> POST /auth/signin
       └─> Backend validates credentials
           └─> Generates JWT token
               └─> Frontend stores token in localStorage

2. Subsequent requests
   └─> Frontend sends header: Authorization: Bearer <token>
       └─> Backend validates token (AuthGuard)
           └─> Extracts userId from token
               └─> Injects into request (CurrentUser decorator)

3. Logout
   └─> Frontend removes token from localStorage
```

---

## Security

### Backend

* Bcrypt password hashing
* Stateless JWT authentication
* Guards for route protection
* DTO validation with class-validator
* User data isolation
* Configured CORS

### Frontend

* Token stored in localStorage
* Protected routes
* Form validation
* Input sanitization
* HTTPS in production

---

## Database

### Main Schema

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

---

## Technical Decisions

### Why NestJS?

* Mature and opinionated framework
* TypeScript-first
* Modular architecture
* Powerful decorators
* Excellent Prisma integration

### Why Prisma?

* Full type-safety
* Automatic migrations
* Intuitive query builder
* Great developer experience
* PostgreSQL support

### Why React Query?

* Automatic caching
* Smart revalidation
* Loading/error states
* Optimistic updates
* Server state synchronization

### Why Submodules?

* Independent repositories
* Easier separate CI/CD
* Teams can work independently
* Granular versioning
* Full history preserved

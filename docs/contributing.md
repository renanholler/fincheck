# Guia de Contribuição

Obrigado por considerar contribuir com o Fincheck! Este documento fornece diretrizes para contribuir com o projeto.

## 🚀 Como Contribuir

### 1. Fork e Clone

```bash
# Fork o repositório no GitHub
# Clone seu fork
git clone --recurse-submodules https://github.com/SEU-USUARIO/fincheck.git
cd fincheck

# Adicione o repositório original como upstream
git remote add upstream https://github.com/renanholler/fincheck.git
```

### 2. Crie uma Branch

```bash
# Sempre crie uma branch a partir da main atualizada
git checkout main
git pull upstream main

# Crie sua branch de feature
git checkout -b feature/minha-feature
# ou
git checkout -b fix/meu-bugfix
```

### 3. Desenvolva

- Faça suas alterações
- Siga os padrões de código do projeto
- Adicione testes se aplicável
- Mantenha commits atômicos e descritivos

### 4. Commit

Seguimos o padrão [Conventional Commits](https://www.conventionalcommits.org/):

```bash
# Formato
tipo(escopo): descrição curta

corpo (opcional)

footer (opcional)
```

**Tipos**:
- `feat`: Nova funcionalidade
- `fix`: Correção de bug
- `docs`: Documentação
- `style`: Formatação, ponto-e-vírgula, etc (não afeta código)
- `refactor`: Refatoração (não é fix nem feat)
- `perf`: Melhoria de performance
- `test`: Adicionar ou refatorar testes
- `chore`: Tarefas de build, configs, etc

**Exemplos**:

```bash
feat(transactions): adiciona filtro por categoria

fix(auth): corrige validação de email

docs(readme): atualiza instruções de setup

refactor(api): simplifica lógica de cálculo de saldo
```

### 5. Push e Pull Request

```bash
# Push sua branch
git push origin feature/minha-feature

# Abra um Pull Request no GitHub
```

## 📝 Padrões de Código

### Backend (NestJS)

```typescript
// Use PascalCase para classes
export class UserService {}

// Use camelCase para métodos e variáveis
getUserById(userId: string) {}

// Use async/await
async findAll(): Promise<User[]> {
  return this.prisma.user.findMany();
}

// DTOs com class-validator
export class CreateUserDto {
  @IsString()
  @IsNotEmpty()
  name: string;

  @IsEmail()
  email: string;
}
```

### Frontend (React)

```typescript
// Componentes em PascalCase
export function MyComponent() {}

// Hooks customizados com 'use' prefix
export function useAuth() {}

// Props tipadas
interface ButtonProps {
  label: string;
  onClick: () => void;
}

// Desestruturação de props
export function Button({ label, onClick }: ButtonProps) {
  return <button onClick={onClick}>{label}</button>;
}
```

## 🧪 Testes

### Backend

```bash
# Rodar testes
cd api
pnpm test

# Testes com coverage
pnpm test:cov

# Testes e2e
pnpm test:e2e
```

### Frontend

```bash
# Rodar testes
cd frontend
pnpm test

# Testes com coverage
pnpm test:coverage
```

## 📦 Trabalhando com Submodules

### Fazer Mudanças na API ou Frontend

```bash
# Entre no submodule
cd api  # ou frontend

# Crie uma branch
git checkout -b feature/minha-feature

# Faça suas alterações
# ...

# Commit e push NO SUBMODULE
git add .
git commit -m "feat: minha feature"
git push origin feature/minha-feature

# Volte ao monorepo
cd ..

# Atualize a referência do submodule
git add api  # ou frontend
git commit -m "chore: update api submodule"
git push
```

### Atualizar Submodules

```bash
# Atualizar para os últimos commits
git submodule update --remote

# Commit as novas referências
git add api frontend
git commit -m "chore: update submodules"
```

## 🐛 Reportar Bugs

Ao reportar bugs, inclua:

1. **Descrição clara** do problema
2. **Passos para reproduzir**
3. **Comportamento esperado**
4. **Comportamento atual**
5. **Screenshots** (se aplicável)
6. **Ambiente**:
   - OS
   - Versão do Node
   - Versão do Docker

Use o template de issue no GitHub.

## 💡 Sugerir Features

Ao sugerir features:

1. **Descreva a feature** claramente
2. **Justifique** por que seria útil
3. **Proponha** uma implementação (se tiver ideia)
4. **Considere** o impacto na UX

## ✅ Checklist do Pull Request

Antes de abrir um PR, verifique:

- [ ] Código segue os padrões do projeto
- [ ] Commits seguem Conventional Commits
- [ ] Testes foram adicionados/atualizados
- [ ] Documentação foi atualizada (se necessário)
- [ ] Não há erros de lint
- [ ] Build passa sem erros
- [ ] PR tem descrição clara do que faz

## 🔍 Code Review

Todos os PRs passam por code review. Esperamos:

- Código limpo e legível
- Lógica clara e bem comentada (quando necessário)
- Testes adequados
- Sem breaking changes (ou bem justificados)

## 📞 Dúvidas?

- Abra uma issue para discussão
- Entre em contato pelo LinkedIn

## 📜 Licença

Ao contribuir, você concorda que suas contribuições serão licenciadas sob a mesma licença do projeto.

---

**Obrigado por contribuir! 🎉**

# Estrutura do Projeto - Plataforma de Marcenaria Estilo Uber

## Estrutura de Diretórios

```
projeto-marcenaria/
├── app/
│   ├── api/                     # Rotas da API
│   │   ├── auth/                # Autenticação
│   │   ├── orcamentos/          # Endpoints de orçamentos
│   │   ├── marceneiros/         # Endpoints de marceneiros
│   │   ├── clientes/            # Endpoints de clientes
│   │   └── webhook/             # Webhooks para integração n8n
│   ├── cliente/                 # Área do cliente
│   │   ├── dashboard/           # Dashboard do cliente
│   │   ├── orcamentos/          # Visualização de orçamentos
│   │   └── perfil/              # Perfil do cliente
│   ├── marceneiro/              # Área do marceneiro
│   │   ├── dashboard/           # Dashboard do marceneiro
│   │   ├── solicitacoes/        # Lista de solicitações
│   │   ├── orcamentos/          # Orçamentos participando
│   │   └── perfil/              # Perfil do marceneiro
│   ├── cadastro/                # Cadastro de usuários
│   ├── login/                   # Página de login
│   ├── components/              # Componentes compartilhados
│   │   ├── ui/                  # Componentes de UI
│   │   ├── chatbot/             # Componentes do chatbot
│   │   └── layout/              # Componentes de layout
│   ├── lib/                     # Utilitários e helpers
│   ├── styles/                  # Estilos globais
│   ├── layout.tsx               # Layout principal
│   └── page.tsx                 # Página inicial
├── public/                      # Arquivos estáticos
│   ├── images/                  # Imagens
│   └── icons/                   # Ícones
├── prisma/                      # Configuração do Prisma ORM
│   ├── schema.prisma            # Schema do banco de dados
│   └── migrations/              # Migrações do banco de dados
├── scripts/                     # Scripts utilitários
├── types/                       # Definições de tipos TypeScript
├── middleware.ts                # Middleware do Next.js
├── next.config.js               # Configuração do Next.js
├── tailwind.config.js           # Configuração do Tailwind CSS
├── tsconfig.json                # Configuração do TypeScript
└── package.json                 # Dependências do projeto
```

## Páginas Principais

### Área Pública
1. **Página Inicial (/)** - Apresentação da plataforma e chatbot
2. **Como Funciona (/como-funciona)** - Explicação do processo
3. **Cadastro (/cadastro)** - Registro de novos usuários
4. **Login (/login)** - Autenticação de usuários

### Área do Cliente
1. **Dashboard (/cliente/dashboard)** - Visão geral para o cliente
2. **Orçamentos (/cliente/orcamentos)** - Lista de orçamentos solicitados
3. **Detalhes do Orçamento (/cliente/orcamentos/[id])** - Detalhes e propostas
4. **Perfil (/cliente/perfil)** - Informações do cliente

### Área do Marceneiro
1. **Dashboard (/marceneiro/dashboard)** - Visão geral para o marceneiro
2. **Solicitações (/marceneiro/solicitacoes)** - Lista de solicitações de orçamentos
3. **Orçamentos (/marceneiro/orcamentos)** - Orçamentos em que está participando
4. **Detalhes do Orçamento (/marceneiro/orcamentos/[id])** - Detalhes e comunicação
5. **Perfil (/marceneiro/perfil)** - Informações e portfólio do marceneiro

## Componentes Principais

### Componentes de UI
- Button
- Input
- Textarea
- Card
- Badge
- Label
- Table
- Tabs
- Modal
- Dropdown
- Alert
- Toast

### Componentes do Chatbot
- ChatbotContainer
- ChatMessage
- ChatInput
- ChatOption
- ChatForm
- ChatSummary

### Componentes de Layout
- Header
- Footer
- Sidebar
- Navbar
- PageContainer
- AuthLayout
- DashboardLayout

## Rotas da API

### Autenticação
- POST /api/auth/register - Registro de usuário
- POST /api/auth/login - Login de usuário
- GET /api/auth/me - Informações do usuário atual
- POST /api/auth/logout - Logout de usuário

### Orçamentos
- GET /api/orcamentos - Listar orçamentos
- GET /api/orcamentos/[id] - Detalhes do orçamento
- POST /api/orcamentos - Criar orçamento
- PUT /api/orcamentos/[id] - Atualizar orçamento
- DELETE /api/orcamentos/[id] - Excluir orçamento

### Marceneiros
- GET /api/marceneiros - Listar marceneiros
- GET /api/marceneiros/[id] - Detalhes do marceneiro
- POST /api/marceneiros/[id]/propostas - Enviar proposta
- GET /api/marceneiros/solicitacoes - Listar solicitações disponíveis

### Clientes
- GET /api/clientes/orcamentos - Listar orçamentos do cliente
- GET /api/clientes/propostas - Listar propostas recebidas

### Webhook
- POST /api/webhook/n8n - Receber dados do fluxo n8n

## Fluxo de Dados

1. **Chatbot → API → Banco de Dados**
   - Coleta de informações do cliente
   - Geração de orçamento instantâneo
   - Armazenamento no banco de dados

2. **n8n → Webhook → Banco de Dados**
   - Recebimento de dados do fluxo n8n
   - Processamento e armazenamento

3. **Banco de Dados → API → Interface do Marceneiro**
   - Exibição de solicitações de orçamentos
   - Detalhes completos para análise

4. **Marceneiro → API → Banco de Dados → Cliente**
   - Envio de propostas
   - Notificação ao cliente

5. **Cliente → API → Banco de Dados → Marceneiro**
   - Aceitação de proposta
   - Notificação ao marceneiro

## Tecnologias Utilizadas

- **Frontend**: Next.js, React, TypeScript, Tailwind CSS
- **Backend**: API Routes do Next.js
- **Banco de Dados**: SQLite (desenvolvimento), PostgreSQL (produção)
- **ORM**: Prisma
- **Autenticação**: NextAuth.js
- **Validação**: Zod
- **Estilização**: Tailwind CSS, shadcn/ui
- **Formulários**: React Hook Form
- **Estado Global**: Zustand ou Context API
- **Notificações**: React-Toastify
- **Implantação**: Vercel

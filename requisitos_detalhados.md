# Requisitos Detalhados - Plataforma de Marcenaria Estilo Uber

## 1. Visão Geral
A plataforma será um sistema web responsivo e interativo que conecta clientes que precisam de móveis planejados com marceneiros disponíveis, seguindo um modelo similar ao Uber. O sistema utilizará um chatbot na página inicial para coletar informações dos clientes e gerar orçamentos instantâneos, integrando-se com um fluxo n8n existente.

## 2. Arquitetura do Sistema

### 2.1 Frontend
- **Framework**: Next.js com TypeScript
- **Estilização**: Tailwind CSS
- **Componentes**: Componentes reutilizáveis (buttons, inputs, cards, etc.)
- **Responsividade**: Design adaptável para desktop, tablet e dispositivos móveis

### 2.2 Backend
- **API**: Rotas API do Next.js
- **Banco de Dados**: SQLite (conforme esquema fornecido)
- **Integração**: Webhooks para comunicação com n8n

### 2.3 Autenticação
- Sistema de login para marceneiros
- Autenticação baseada em tokens JWT
- Proteção de rotas privadas

## 3. Páginas e Funcionalidades

### 3.1 Área Pública
- **Página Inicial**:
  - Chatbot para coleta de informações do cliente
  - Apresentação da plataforma
  - Seção de marceneiros parceiros
  
- **Fluxo do Chatbot**:
  - Coleta de cidade/região
  - Coleta de tamanho do apartamento (m²)
  - Seleção do tipo de orçamento (apartamento completo, alguns ambientes, móveis específicos)
  - Detalhamento das necessidades específicas
  - Geração de orçamento instantâneo
  - Opção para conectar com marceneiros

- **Página de Cadastro de Marceneiros**:
  - Formulário para novos marceneiros
  - Termos de serviço
  - Validação de dados

### 3.2 Área do Cliente
- **Dashboard do Cliente**:
  - Visualização de orçamentos solicitados
  - Status dos orçamentos
  - Propostas recebidas de marceneiros
  
- **Página de Detalhes do Orçamento**:
  - Informações completas do orçamento
  - Lista de propostas de marceneiros
  - Sistema de comunicação com marceneiros
  - Opção para aceitar proposta

### 3.3 Área do Marceneiro
- **Dashboard do Marceneiro**:
  - Resumo de atividades
  - Notificações de novas demandas
  - Estatísticas de orçamentos

- **Lista de Solicitações de Orçamentos**:
  - Filtros por região, tipo e status
  - Visualização rápida de detalhes principais
  - Indicadores de prioridade/urgência

- **Página de Detalhes do Orçamento**:
  - Todas as informações enviadas pelo cliente
  - Formulário para envio de proposta
  - Histórico de comunicações
  
- **Gerenciamento de Orçamentos**:
  - Lista de orçamentos em que está participando
  - Status de cada orçamento (pendente, em análise, aceito, etc.)
  - Ferramentas para acompanhamento

- **Perfil do Marceneiro**:
  - Informações da marcenaria
  - Portfólio de trabalhos
  - Configurações de área de atuação
  - Especialidades e materiais trabalhados

## 4. Fluxos Principais

### 4.1 Fluxo do Cliente
1. Cliente acessa a página inicial
2. Interage com o chatbot fornecendo informações
3. Recebe orçamento instantâneo
4. Decide se deseja prosseguir para receber propostas de marceneiros
5. Se sim, completa cadastro básico
6. Aguarda propostas de marceneiros
7. Analisa propostas e portfólios
8. Escolhe marceneiro com base no atendimento e portfólio

### 4.2 Fluxo do Marceneiro
1. Marceneiro acessa sua área restrita
2. Visualiza lista de solicitações de orçamentos na região
3. Seleciona orçamentos de interesse
4. Analisa detalhes completos do orçamento
5. Envia proposta personalizada
6. Comunica-se com o cliente para esclarecer detalhes
7. Se proposta for aceita, prossegue com o atendimento

## 5. Requisitos Técnicos

### 5.1 Integração
- API RESTful para comunicação com o frontend
- Webhooks para receber dados do fluxo n8n
- Sistema de notificações em tempo real

### 5.2 Segurança
- Proteção contra CSRF e XSS
- Sanitização de inputs
- Validação de dados em frontend e backend
- Conformidade com LGPD

### 5.3 Performance
- Otimização de carregamento de páginas
- Lazy loading de componentes
- Caching de dados frequentemente acessados

### 5.4 Escalabilidade
- Arquitetura modular
- Separação clara de responsabilidades
- Código reutilizável e manutenível

## 6. Requisitos Não-Funcionais
- Tempo de resposta do sistema < 2 segundos
- Disponibilidade de 99.9%
- Suporte a múltiplos usuários simultâneos
- Interface intuitiva e de fácil navegação
- Compatibilidade com principais navegadores (Chrome, Firefox, Safari, Edge)

## 7. Entregáveis
- Código-fonte completo
- Documentação técnica
- Manual do usuário
- API documentada
- Site implantado e funcional

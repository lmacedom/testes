# Análise de Requisitos da Plataforma de Marcenaria

## Visão Geral
Baseado na análise do site [FacilitApê](https://facilitape.com.br/), estamos desenvolvendo uma plataforma web para marceneiros, semelhante a um "Uber da marcenaria". Esta plataforma será integrada com um fluxo n8n já existente que gera orçamentos instantâneos para clientes.

## Fluxo Atual (FacilitApê)
1. **Coleta de Informações do Cliente**:
   - Localização (cidade/região)
   - Tamanho do apartamento (m²)
   - Tipo de orçamento desejado:
     - Apartamento completo (móveis em todos os ambientes)
     - Alguns ambientes (móveis em um ou mais ambientes específicos)
     - Móveis específicos (ex: um aparador de 3 portas na sala)

2. **Geração de Orçamento Instantâneo**:
   - O sistema utiliza um chatbot (Typebot) para coletar as informações
   - Gera um orçamento instantâneo baseado nos dados fornecidos
   - Todo este fluxo já está implementado com n8n

3. **Conexão com Marcenarias**:
   - O site já possui parcerias com marcenarias como:
     - Marchetto Interni
     - Guaíra Ambientes Planejados
     - Águia Dourada Móveis Planejados

## Requisitos da Nova Plataforma para Marceneiros

### Funcionalidades Principais
1. **Recebimento de Demandas**:
   - Integração com o fluxo n8n existente
   - Recebimento das informações coletadas no chatbot
   - Notificação de novas demandas para marceneiros da região

2. **Gerenciamento de Orçamentos**:
   - Visualização de todos os detalhes do orçamento solicitado
   - Interface para refinamento do orçamento
   - Histórico de orçamentos (pendentes, em andamento, concluídos)

3. **Perfil do Marceneiro**:
   - Cadastro de informações da marcenaria
   - Definição de área de atuação (regiões atendidas)
   - Especialidades (tipos de móveis, materiais, etc.)

4. **Comunicação**:
   - Canal de comunicação com o cliente
   - Possibilidade de envio de propostas refinadas
   - Notificações de atualizações

### Requisitos Técnicos
1. **Integração**:
   - API para receber dados do fluxo n8n
   - Webhook para notificações em tempo real

2. **Interface**:
   - Dashboard para marceneiros
   - Visualização detalhada de orçamentos
   - Responsivo para acesso via desktop e dispositivos móveis

3. **Segurança**:
   - Autenticação de usuários (marceneiros)
   - Proteção de dados dos clientes
   - Conformidade com LGPD

4. **Banco de Dados**:
   - Armazenamento de perfis de marceneiros
   - Histórico de orçamentos
   - Registro de comunicações

## Próximos Passos
- Definir a arquitetura detalhada da plataforma
- Criar wireframes das interfaces principais
- Estabelecer o modelo de dados
- Desenvolver a integração com o n8n

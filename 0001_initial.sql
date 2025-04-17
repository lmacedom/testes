-- Migration number: 0001 	 2025-04-09T18:48:49.000Z
-- Esquema de banco de dados para a plataforma de marceneiros

-- Remover tabelas existentes se necessário
DROP TABLE IF EXISTS marceneiros;
DROP TABLE IF EXISTS orcamentos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS mensagens;
DROP TABLE IF EXISTS counters;
DROP TABLE IF EXISTS access_logs;

-- Tabela de marceneiros
CREATE TABLE IF NOT EXISTS marceneiros (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  senha TEXT NOT NULL,
  telefone TEXT,
  cidade TEXT NOT NULL,
  regiao TEXT NOT NULL,
  especialidades TEXT,
  descricao TEXT,
  logo_url TEXT,
  avaliacao REAL DEFAULT 0,
  ativo BOOLEAN DEFAULT true,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  telefone TEXT,
  cidade TEXT,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de orçamentos
CREATE TABLE IF NOT EXISTS orcamentos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  cliente_id INTEGER,
  tipo_orcamento TEXT NOT NULL, -- 'apartamento_completo', 'alguns_ambientes', 'moveis_especificos'
  tamanho_apartamento INTEGER,
  cidade TEXT NOT NULL,
  detalhes TEXT,
  valor_estimado REAL,
  status TEXT DEFAULT 'pendente', -- 'pendente', 'em_analise', 'aceito', 'recusado', 'finalizado'
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela de atribuições de orçamentos a marceneiros
CREATE TABLE IF NOT EXISTS orcamentos_marceneiros (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  orcamento_id INTEGER NOT NULL,
  marceneiro_id INTEGER NOT NULL,
  status TEXT DEFAULT 'pendente', -- 'pendente', 'visualizado', 'em_analise', 'proposta_enviada', 'aceito', 'recusado'
  valor_proposto REAL,
  detalhes_proposta TEXT,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (orcamento_id) REFERENCES orcamentos(id),
  FOREIGN KEY (marceneiro_id) REFERENCES marceneiros(id)
);

-- Tabela de mensagens
CREATE TABLE IF NOT EXISTS mensagens (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  orcamento_id INTEGER NOT NULL,
  marceneiro_id INTEGER,
  cliente_id INTEGER,
  mensagem TEXT NOT NULL,
  enviado_por TEXT NOT NULL, -- 'cliente', 'marceneiro', 'sistema'
  lida BOOLEAN DEFAULT false,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (orcamento_id) REFERENCES orcamentos(id),
  FOREIGN KEY (marceneiro_id) REFERENCES marceneiros(id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela para logs de acesso (mantida do template original)
CREATE TABLE IF NOT EXISTS access_logs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ip TEXT,
  path TEXT,
  user_id INTEGER,
  user_type TEXT, -- 'marceneiro', 'cliente', 'admin'
  accessed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para contadores (mantida do template original)
CREATE TABLE IF NOT EXISTS counters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL,
  value INTEGER NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Dados iniciais
INSERT INTO counters (name, value) VALUES 
  ('page_views', 0),
  ('api_calls', 0),
  ('orcamentos_criados', 0),
  ('marceneiros_registrados', 0);

-- Índices para melhorar performance
CREATE INDEX idx_marceneiros_cidade ON marceneiros(cidade);
CREATE INDEX idx_marceneiros_regiao ON marceneiros(regiao);
CREATE INDEX idx_orcamentos_status ON orcamentos(status);
CREATE INDEX idx_orcamentos_cidade ON orcamentos(cidade);
CREATE INDEX idx_orcamentos_marceneiros_status ON orcamentos_marceneiros(status);
CREATE INDEX idx_mensagens_orcamento ON mensagens(orcamento_id);
CREATE INDEX idx_access_logs_accessed_at ON access_logs(accessed_at);
CREATE INDEX idx_counters_name ON counters(name);

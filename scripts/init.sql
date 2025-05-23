CREATE TABLE IF NOT EXISTS curso (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS aluno (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  email TEXT NOT NULL,
  criado_em TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_aluno_email ON aluno (email);


ALTER TABLE aluno DROP CONSTRAINT IF EXISTS fk_curso CASCADE;

ALTER TABLE aluno
ADD COLUMN IF NOT EXISTS curso_id INTEGER,
ADD CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES curso(id) ON DELETE SET NULL;

CREATE TABLE professor (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL
);

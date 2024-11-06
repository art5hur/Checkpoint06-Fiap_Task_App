
CREATE TABLE IF NOT EXISTS task_groups (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  color BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS tasks (
  id UUID PRIMARY KEY,
  title TEXT NOT NULL,
  subtitle TEXT,
  date TIMESTAMP NOT NULL,
  is_completed BOOLEAN NOT NULL,
  task_group_id UUID,
  CONSTRAINT fk_task_group
    FOREIGN KEY (task_group_id)
    REFERENCES task_groups(id)
    ON DELETE CASCADE
);


INSERT INTO task_groups (id, name, color) VALUES
  ('d1a35f2e-8c64-4a98-98f1-000000000001', 'Compras no Supermercado', 4294198070),
  ('d1a35f2e-8c64-4a98-98f1-000000000002', 'Trabalho', 4280391411),
  ('d1a35f2e-8c64-4a98-98f1-000000000003', 'Exercícios Físicos', 4293467747),
  ('d1a35f2e-8c64-4a98-98f1-000000000004', 'Organização da Casa', 4288423856),
  ('d1a35f2e-8c64-4a98-98f1-000000000005', 'Estudos', 4278228616);


INSERT INTO tasks (id, title, subtitle, date, is_completed, task_group_id) VALUES
  -- Compras no Supermercado
  ('d1a35f2e-8c64-4a98-98f1-000000000006', 'Comprar leite', 'Desnatado, 2 litros', NOW()::date + TIME '00:00', false, 'd1a35f2e-8c64-4a98-98f1-000000000001'),
  ('d1a35f2e-8c64-4a98-98f1-000000000007', 'Comprar ovos', 'Caixa com 12', NOW()::date + TIME '00:00', false, 'd1a35f2e-8c64-4a98-98f1-000000000001'),
  ('d1a35f2e-8c64-4a98-98f1-000000000008', 'Comprar pão', 'Pão integral', NOW()::date + TIME '00:00', true, 'd1a35f2e-8c64-4a98-98f1-000000000001'),
  ('d1a35f2e-8c64-4a98-98f1-000000000009', 'Comprar frutas', 'Banana e maçã', NOW()::date + TIME '00:00', false, 'd1a35f2e-8c64-4a98-98f1-000000000001'),
  ('d1a35f2e-8c64-4a98-98f1-000000000010', 'Comprar detergente', 'Limão, 500ml', NOW()::date + TIME '00:00', false, 'd1a35f2e-8c64-4a98-98f1-000000000001'),

  -- Trabalho
  ('d1a35f2e-8c64-4a98-98f1-000000000011', 'Enviar relatório semanal', 'Relatório de vendas', NOW()::date + TIME '00:00', false, 'd1a35f2e-8c64-4a98-98f1-000000000002'),
  ('d1a35f2e-8c64-4a98-98f1-000000000012', 'Preparar apresentação', 'Dados do último trimestre', NOW()::date + TIME '00:00', true, 'd1a35f2e-8c64-4a98-98f1-000000000002'),
  ('d1a35f2e-8c64-4a98-98f1-000000000013', 'Reunião com equipe', 'Planejamento semanal', NOW()::date + TIME '00:00', false, 'd1a35f2e-8c64-4a98-98f1-000000000002'),
  ('d1a35f2e-8c64-4a98-98f1-000000000014', 'Responder e-mails', 'Clientes e fornecedores', NOW()::date + TIME '00:00', true, 'd1a35f2e-8c64-4a98-98f1-000000000002'),
  ('d1a35f2e-8c64-4a98-98f1-000000000015', 'Revisar contratos', 'Verificar cláusulas de renovação', NOW()::date + TIME '00:00', false, 'd1a35f2e-8c64-4a98-98f1-000000000002'),

  -- Exercícios Físicos
  ('d1a35f2e-8c64-4a98-98f1-000000000016', 'Caminhar no parque', '30 minutos', NOW()::date + TIME '00:00', true, 'd1a35f2e-8c64-4a98-98f1-000000000003'),
  ('d1a35f2e-8c64-4a98-98f1-000000000017', 'Fazer alongamento', '15 minutos', NOW()::date + TIME '00:00', false, 'd1a35f2e-8c64-4a98-98f1-000000000003')

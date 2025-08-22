
-- Inserir dados
INSERT INTO Cliente (Pnome, Mnome, Sobrenome, BI, Email, Endereço, Data_Nascimento, Telefone) VALUES
('João', 'Carlos', 'Silva', '123456789LA123', 'joao.silva@email.com', 'Rua A, 123 - Luanda', '1990-05-15', '923456789'),
('Maria', 'Eduarda', 'Santos', '987654321LA456', 'maria.santos@email.com', 'Av. B, 456 - Benguela', '1985-08-20', '934567890'),
('Pedro', 'Pontes', 'Oliveira', '456789123LA789', 'pedro.oliveira@email.com', 'Travessa C, 789 - Huambo', '1992-12-10', '945678901'),
('Ana', 'Paula', 'Costa', '321654987LA321', 'ana.costa@email.com', 'Rua D, 321 - Lubango', '1988-03-25', '956789012'),
('Carlos', 'Alberto', 'Mendes', '789123456LA654', 'carlos.mendes@email.com', 'Av. E, 654 - Cabinda', '1995-07-18', '967890123');

INSERT INTO Fornecedor (Razao_social, CNPJ, Telefone, Email) VALUES
('TechImport Angola', '12.345.678/0001-90', '222345678', 'contato@techimport.ao'),
('EletroComércio Lda', '98.765.432/0001-21', '222456789', 'vendas@eletrocomercio.ao'),
('ModaStyle Angola', '45.678.912/0001-34', '222567890', 'moda@modastyle.ao');

INSERT INTO Produto (Nome, Categoria, Descricao, Valor_unit) VALUES
('Smartphone X5', 'Eletrônicos', 'Smartphone 128GB, 6.5 polegadas', 25000.00),
('Notebook Elite', 'Informática', 'Notebook i5, 8GB RAM, 256GB SSD', 75000.00),
('TV LED 55"', 'Eletrônicos', 'Smart TV 55 polegadas 4K', 45000.00),
('Camisa Social', 'Vestuário', 'Camisa social manga longa', 8500.00),
('Tênis Esportivo', 'Calçados', 'Tênis para corrida e caminhada', 12000.00);

INSERT INTO Pedido (cliente_id, Descricao, Valor_total, Data_pedido, Status_pedido) VALUES
(1, 'Pedido de eletrônicos', 70000.00, '2024-01-15', 'Entregue'),
(2, 'Compra de vestuário', 20500.00, '2024-01-16', 'Enviado'),
(3, 'Produtos diversos', 120000.00, '2024-01-17', 'Processando'),
(1, 'Segunda compra', 8500.00, '2024-01-18', 'Pendente'),
(4, 'Pedido especial', 45000.00, '2024-01-19', 'Entregue');

INSERT INTO Item_pedido (pedido_id, produto_id, Quantidade, Valor_unit) VALUES
(1, 1, 2, 25000.00),
(1, 3, 1, 45000.00),
(2, 4, 2, 8500.00),
(2, 5, 1, 12000.00),
(3, 2, 1, 75000.00),
(3, 1, 1, 25000.00),
(3, 3, 1, 45000.00),
(4, 4, 1, 8500.00),
(5, 3, 1, 45000.00);

INSERT INTO Pagamento (pedido_id, Tipo_pagamento, Status_pagamento, Detalhes, Valor_pago, Data_pagamento) VALUES
(1, 'Transferência', 'Confirmado', 'Transferência bancária referência: TRF20240115001' , 70000.00, '2024-01-14'),
(2, 'Cartão', 'Confirmado', 'Pagamento com cartão de crédito Visa terminado em 1234', 20500.00, '2024-01-15'),
(3, 'Check', 'Pendente', 'Check número 789456 aguardando compensação', 120000.00,'2024-01-18'),
(4, 'Dinheiro', 'Confirmado', 'Pagamento em dinheiro na entrega', 8500.00, '2024-01-17'),
(5, 'Transferência', 'Confirmado', 'Transferência bancária referência: TRF20240118002', 45000.00, '2024-01-18');
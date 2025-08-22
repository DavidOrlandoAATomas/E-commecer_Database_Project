-- Listar todos os clientes
SELECT * FROM Cliente;

-- Listar todos os produtos
SELECT produto_id, Nome, Categoria, Valor_unit FROM Produto;

-- Listar pedidos com status
SELECT pedido_id, Data_pedido, Valor_total, Status_pedido FROM Pedido;

-- Clientes nascidos após 1990
SELECT * FROM Cliente WHERE Data_Nascimento > '1990-01-01';

-- Produtos da categoria Eletrônicos
SELECT * FROM Produto WHERE Categoria = 'Eletrônicos';

-- Pedidos com valor superior a 50.000,00
SELECT * FROM Pedido WHERE Valor_total > 50000.00;

-- Pagamentos confirmados
SELECT * FROM Pagamento WHERE Status_pagamento = 'Confirmado';

-- Valor total com desconto de 10%
SELECT 
    pedido_id, 
    Valor_total, 
    Valor_total * 0.9 AS Valor_com_desconto,
    Valor_total * 0.1 AS Desconto
FROM Pedido;

-- Idade dos clientes
SELECT 
    cliente_id,
    CONCAT(Pnome, ' ', Sobrenome) AS Nome_Completo,
    Data_Nascimento,
    TIMESTAMPDIFF(YEAR, Data_Nascimento, CURDATE()) AS Idade
FROM Cliente;

-- Categorização de valor de pedidos
SELECT 
    pedido_id,
    Valor_total,
    CASE 
        WHEN Valor_total > 100000 THEN 'Alto Valor'
        WHEN Valor_total > 50000 THEN 'Médio Valor'
        ELSE 'Baixo Valor'
    END AS Categoria_Valor
FROM Pedido;

-- Produtos ordenados por valor (decrescente)
SELECT * FROM Produto ORDER BY Valor_unit DESC;

-- Clientes ordenados por nome
SELECT * FROM Cliente ORDER BY Pnome, Sobrenome;

-- Pedidos ordenados por data (mais recentes primeiro) e valor
SELECT * FROM Pedido ORDER BY Data_pedido DESC, Valor_total DESC;

-- Itens de pedido ordenados por subtotal
SELECT 
    ip.pedido_id,
    p.Nome AS Produto,
    ip.Quantidade,
    ip.Valor_unit,
    ip.Subtotal
FROM Item_pedido ip
JOIN Produto p ON ip.produto_id = p.produto_id
ORDER BY ip.Subtotal DESC;

-- Clientes com mais de 1 pedido
SELECT 
    c.cliente_id,
    CONCAT(c.Pnome, ' ', c.Sobrenome) AS Cliente,
    COUNT(p.pedido_id) AS Total_Pedidos
FROM Cliente c
JOIN Pedido p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id
HAVING COUNT(p.pedido_id) > 1;

-- Categorias com valor médio superior a 20.000,00
SELECT 
    Categoria,
    COUNT(*) AS Total_Produtos,
    AVG(Valor_unit) AS Valor_Medio
FROM Produto
GROUP BY Categoria
HAVING AVG(Valor_unit) > 20000.00;

-- Pedidos com valor total médio superior a 30.000,00 por status
SELECT 
    Status_pedido,
    COUNT(*) AS Total_Pedidos,
    AVG(Valor_total) AS Valor_Medio
FROM Pedido
GROUP BY Status_pedido
HAVING AVG(Valor_total) > 30000.00;

-- Pedidos com detalhes do cliente
SELECT 
    p.pedido_id,
    p.Data_pedido,
    p.Valor_total,
    p.Status_pedido,
    c.Pnome,
    c.Sobrenome,
    c.Email
FROM Pedido p
JOIN Cliente c using (cliente_id);

-- Itens de pedido com detalhes do produto
SELECT 
    ip.pedido_id,
    ip.Quantidade,
    ip.Valor_unit,
    ip.Subtotal,
    pr.Nome AS Produto,
    pr.Categoria
FROM Item_pedido ip
JOIN Produto pr using (produto_id);

-- Pedidos completos com cliente, itens e pagamento
SELECT 
    p.pedido_id,
    p.Data_pedido,
    p.Valor_total,
    p.Status_pedido,
    CONCAT(c.Pnome, ' ', c.Sobrenome) AS Cliente,
    pg.Tipo_pagamento,
    pg.Status_pagamento,
    COUNT(ip.produto_id) AS Total_Itens
FROM Pedido p
JOIN Cliente c ON p.cliente_id = c.cliente_id
LEFT JOIN Pagamento pg ON p.pedido_id = pg.pedido_id
LEFT JOIN Item_pedido ip ON p.pedido_id = ip.pedido_id
GROUP BY p.pedido_id;

-- Relatório financeiro mensal
SELECT 
    MONTH(p.Data_pedido) AS Mes,
    YEAR(p.Data_pedido) AS Ano,
    COUNT(p.pedido_id) AS Total_Pedidos,
    SUM(p.Valor_total) AS Receita_Total,
    AVG(p.Valor_total) AS Ticket_Medio,
    SUM(CASE WHEN pg.Status_pagamento = 'Confirmado' THEN p.Valor_total ELSE 0 END) AS Receita_Confirmada
FROM Pedido p
LEFT JOIN Pagamento pg ON p.pedido_id = pg.pedido_id
GROUP BY YEAR(p.Data_pedido), MONTH(p.Data_pedido)
ORDER BY Ano DESC, Mes DESC;
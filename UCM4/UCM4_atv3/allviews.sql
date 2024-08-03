-- View para relatório de todas as vendas pagas com dinheiro

CREATE VIEW view_vendas_dinheiro AS
SELECT 
    v.data AS data_venda,
    v.valor_total,
    p.nome AS nome_produto,
    iv.quantidade,
    iv.valor_unitario,
    c.nome AS nome_cliente,
    c.cpf,
    c.telefone
FROM 
    venda v
JOIN 
    item_venda iv ON v.id = iv.venda_id
JOIN 
    produto p ON iv.produto_id = p.id
JOIN 
    cliente c ON v.cliente_id = c.id
WHERE 
    v.tipo_pagamento = 'D'
ORDER BY 
    v.data DESC;

-- View para encontrar todas as vendas de produtos de um dado fabricante
CREATE VIEW view_vendas_fabricante AS
SELECT 
    p.nome AS nome_produto,
    p.descricao,
    iv.quantidade,
    v.data AS data_venda
FROM 
    produto p
JOIN 
    item_venda iv ON p.id = iv.produto_id
JOIN 
    venda v ON iv.venda_id = v.id
WHERE 
    p.fabricante LIKE '%lar%'
ORDER BY 
    p.nome;

-- View para relatório de vendas de produto por cliente
CREATE VIEW view_vendas_por_cliente AS
SELECT 
    c.nome AS nome_cliente,
    c.cpf,
    c.telefone,
    p.nome AS nome_produto,
    p.descricao,
    SUM(iv.subtotal) AS total_venda,
    SUM(iv.quantidade) AS quantidade_total
FROM 
    cliente c
JOIN 
    venda v ON c.id = v.cliente_id
JOIN 
    item_venda iv ON v.id = iv.venda_id
JOIN 
    produto p ON iv.produto_id = p.id
GROUP BY 
    c.nome, c.cpf, c.telefone, p.nome, p.descricao;
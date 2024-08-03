-- Vendas a dinheiro

-- Relatório de todas as vendas pagas em dinheiro

EXPLAIN SELECT
-- SELECT
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
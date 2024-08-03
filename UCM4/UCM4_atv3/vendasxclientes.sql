-- Vendas de produto por cliente

EXPLAIN SELECT
-- SELECT 
    c.nome AS nome_cliente,
    c.cpf,
    c.telefone,
    p.nome AS nome_produto,
    SUM(iv.subtotal) AS valor_total,
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
    c.nome, c.cpf, c.telefone, p.nome;

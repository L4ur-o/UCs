-- Encontrar todas as vendas de produtos de um dado fabricante:

EXPLAIN SELECT
-- SELECT 
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

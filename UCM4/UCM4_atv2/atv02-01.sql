DELIMITER //
CREATE PROCEDURE `ListaComprasCliente`(
    IN p_cliente_id INT,
    IN p_data_inicial DATETIME,
    IN p_data_final DATETIME
)
BEGIN
    SELECT
        c.nome AS nome_cliente,
        v.id AS id_compra,
        v.valor_total AS total_compra,
        p.nome AS nome_produto,
        iv.quantidade AS quantidade_produto
    FROM
        venda v
    JOIN
        cliente c ON v.cliente_id = c.id
    JOIN
        item_venda iv ON v.id = iv.venda_id
    JOIN
        produto p ON iv.produto_id = p.id
    WHERE
        v.cliente_id = p_cliente_id
        AND v.data BETWEEN p_data_inicial AND p_data_final;
END //
DELIMITER ;

-- Chamada da procedure
CALL ListaComprasCliente(2, '2019-01-07 00:00:00', '2024-12-31 23:59:59');

DELIMITER //

CREATE FUNCTION `VerificaStatusCliente`(p_cliente_id INT)
RETURNS VARCHAR(7)
DETERMINISTIC
BEGIN
    DECLARE total_compras DECIMAL(10, 2);
    

    SELECT SUM(valor_total)
    INTO total_compras
    FROM venda
    WHERE cliente_id = p_cliente_id;
    
    IF total_compras > 10000 THEN
        RETURN 'PREMIUM';
    ELSE
        RETURN 'REGULAR';
    END IF;
END //

DELIMITER ;


SELECT VerificaStatusCliente(158) AS status_cliente;

DELIMITER //

CREATE TRIGGER `BeforeInsertUsuario`
BEFORE INSERT ON `usuario`
FOR EACH ROW
BEGIN

    SET NEW.senha = MD5(NEW.senha);
END //

DELIMITER ;

INSERT INTO `usuario` (`login`, `senha`, `ultimo_login`) 
VALUES ('Drystan', 'NobleKnight', NULL);

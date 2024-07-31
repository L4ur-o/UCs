CREATE USER 'user_relatorio'@'localhost' IDENTIFIED BY 'AinzOoalGown123';
CREATE ROLE 'role_relatorio';
GRANT SELECT ON uc4atividades.* TO 'role_relatorio';
GRANT 'role_relatorio' TO 'user_relatorio'@'localhost';
SET DEFAULT ROLE 'role_relatorio' TO 'user_relatorio'@'localhost';

CREATE USER 'user_funcionario'@'localhost' IDENTIFIED BY 'ShalltearBloodfallen123';
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.venda TO 'user_funcionario'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.cliente TO 'user_funcionario'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.produto TO 'user_funcionario'@'localhost';

SHOW GRANTS FOR 'user_relatorio'@'localhost';
SHOW GRANTS FOR 'user_funcionario'@'localhost';

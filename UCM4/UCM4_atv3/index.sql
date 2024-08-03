-- Índices para a consulta de vendas pagas em dinheiro
CREATE INDEX idx_venda_tipo_pagamento ON venda (tipo_pagamento);
CREATE INDEX idx_venda_data ON venda (data);

-- Índices para a consulta de vendas de produtos de um dado fabricante
CREATE INDEX idx_cliente_id ON cliente (id);
CREATE INDEX idx_produto_id ON produto (id);
CREATE INDEX idx_funcionario_id ON funcionario (id);

-- Índices para a consulta de vendas de produtos de um dado fabricante
CREATE INDEX idx_produto_fabricante ON produto (fabricante);

-- Mostrar os Indx que há.
SHOW INDEX FROM item_venda;
SHOW INDEX FROM venda;
SHOW INDEX FROM produto;
SHOW INDEX FROM cliente;
SHOW INDEX FROM funcionario;


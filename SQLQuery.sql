SELECT *
FROM PessoaFisica

SELECT *
FROM PessoaJuridica


SELECT 
    m.idMovimento AS MovimentacaoID,
    p.nome AS Produto,
    pj.razaoSocial AS Fornecedor,
    m.quantidadeProduto AS Quantidade,
    m.valorUnitario AS Preço_Unitário,
    (m.quantidadeProduto * m.valorUnitario) AS Valor_Total
FROM Movimento m
JOIN Produto p ON m.idMovimento = p.Movimento_idMovimento
JOIN PessoaJuridica pj ON m.PessoaJuridica_idPessoaJuridica = pj.idPessoaJuridica

SELECT
	m.idMovimento AS MovimentacaoID,
    p.nome AS Produto,
    pf.nome AS Comprador,
    m.quantidadeProduto AS Quantidade,
    m.valorUnitario AS Preço_Unitário,
    (m.quantidadeProduto * m.valorUnitario) AS Valor_Total
FROM Movimento m
JOIN Produto p ON m.idMovimento = p.Movimento_idMovimento
JOIN PessoaFisica pf ON m.PessoaFisica_idPessoaFisica = pf.idPessoaFisica

SELECT 
    p.nome AS Produto,
    SUM(m.quantidadeProduto * m.valorUnitario) AS Valor_Total
FROM Movimento m
JOIN Produto p ON m.idMovimento = p.Movimento_idMovimento
GROUP BY p.nome;

SELECT 
    p.nome AS Produto,
    SUM(m.quantidadeProduto * m.valorUnitario) AS Valor_Total
FROM Movimento m
JOIN Produto p ON m.idMovimento = p.Movimento_idMovimento
GROUP BY p.nome;

SELECT u.*
FROM Usuario u
WHERE NOT EXISTS (
    SELECT 1
    FROM Movimento m
	WHERE m.Usuario_idUsuario = u.idUsuario AND m.tipo = 'compra'
);

SELECT 
    u.login AS Operador,
    SUM(m.quantidadeProduto * m.valorUnitario) AS Valor_Total
FROM Movimento m
JOIN Usuario u ON m.Usuario_idUsuario = u.idUsuario
GROUP BY u.login;

SELECT 
    u.login AS Operador,
    SUM(m.quantidadeProduto * m.valorUnitario) AS Valor_Total
FROM Movimento m
JOIN Usuario u ON m.Usuario_idUsuario = u.idUsuario
GROUP BY u.login;

SELECT 
    p.nome AS Produto,
    SUM(m.quantidadeProduto * m.valorUnitario) / NULLIF(SUM(m.quantidadeProduto), 0) AS Media_Ponderada
FROM Movimento m
JOIN Produto p ON m.idMovimento = p.Movimento_idMovimento
GROUP BY p.nome;
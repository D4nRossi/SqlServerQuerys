USE AdventureWorks2017
--START das opera��es
BEGIN TRAN T1 -- Bom fazer isso nas gmuds

--CRUD da opera��o
SELECT MAX(BONUS) FROM Sales.SalesPErson
UPDATE Sales.SalesPerson SET Bonus = 6000
--Verifica��o se deu certo
SELECT MAX(BONUS) FROM Sales.SalesPerson
--Caso de erro
ROLLBACK TRAN T1
--Confirmando a vers�o do rollback
SELECT MAX(BONUS) FROM Sales.SalesPerson

--Niveis de Isolamento
/*
READ UNCOMMITED: permite a leitura de dados n�o "commitados" por outras transa��es
READ COMMITED: n�o permite a leitura de dados n�o "commitados" por outras transa��es. Logo, evita leituras sujas
REPEATABLE READ: n�o permite leitura de dados n�o "commitados" por outras transa��es e n�o permite altera��o de dados at� que a transa��o termine
SNAPSHOT: define que a leitura de dados em uma transa��o deve ser consistente com a vers�o dos dados no inicio da transa��o
SERIALIZABLE: realiza o lock de todas as tabelas em SELECTs da transa��o
*/

--Arquivo SQL atual
BEGIN TRAN T2
UPDATE Sales.SalesPerson SET Bonus = 6000

--Novo Arquivo(Outra aba)
SELECT MAX(BONUS) FROM Sales.SalesPerson -- N�o vai retornar nada

--Arquivo SQL atual
ROLLBACK TRAN T2
--Depois que houve uma finaliza��o da transaction, outras pessoas conseguem ver os dados


-- Mudando o nivel de isolamento da query - Outra aba
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
GO
SELECT MAX(BONUS) FROM Sales.SalesPerson -- Com essa parte de cima na query, ela roda 
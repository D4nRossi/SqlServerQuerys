USE AdventureWorks2017
--START das operações
BEGIN TRAN T1 -- Bom fazer isso nas gmuds

--CRUD da operação
SELECT MAX(BONUS) FROM Sales.SalesPErson
UPDATE Sales.SalesPerson SET Bonus = 6000
--Verificação se deu certo
SELECT MAX(BONUS) FROM Sales.SalesPerson
--Caso de erro
ROLLBACK TRAN T1
--Confirmando a versão do rollback
SELECT MAX(BONUS) FROM Sales.SalesPerson

--Niveis de Isolamento
/*
READ UNCOMMITED: permite a leitura de dados não "commitados" por outras transações
READ COMMITED: não permite a leitura de dados não "commitados" por outras transações. Logo, evita leituras sujas
REPEATABLE READ: não permite leitura de dados não "commitados" por outras transações e não permite alteração de dados até que a transação termine
SNAPSHOT: define que a leitura de dados em uma transação deve ser consistente com a versão dos dados no inicio da transação
SERIALIZABLE: realiza o lock de todas as tabelas em SELECTs da transação
*/

--Arquivo SQL atual
BEGIN TRAN T2
UPDATE Sales.SalesPerson SET Bonus = 6000

--Novo Arquivo(Outra aba)
SELECT MAX(BONUS) FROM Sales.SalesPerson -- Não vai retornar nada

--Arquivo SQL atual
ROLLBACK TRAN T2
--Depois que houve uma finalização da transaction, outras pessoas conseguem ver os dados


-- Mudando o nivel de isolamento da query - Outra aba
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
GO
SELECT MAX(BONUS) FROM Sales.SalesPerson -- Com essa parte de cima na query, ela roda 
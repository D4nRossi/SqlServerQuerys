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
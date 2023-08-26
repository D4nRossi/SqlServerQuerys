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
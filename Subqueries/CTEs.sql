USE AdventureWorks2017
--CTEs s�o Commom Table Expressions. Ou seja, s�o nomes temporarios de resultados em formato de tabelas para serem usadas em consultas, as CTEs podem ser usadas em SELECTS, INSERTS, UPDATES e DELETES. Elas podem deixar o c�digo mais legivel. Permitem chamadas recursivas

--Escrevendo CTEs: escolha um nome para a CTE e uma lista de colunas, crie a consulta da CTE, use a CTE em outra consulta
--Cria��o
WITH TopSales(SalesPerson, NumSales) AS
(SELECT SalesPersonID, COUNT(*) FROM Sales.SalesOrderHeader GROUP BY SalesPersonID)
--Utiliza��o
SELECT LoginID, NumSales
FROM HumanResources.Employee e 
INNER JOIN TopSales ON TopSales.SalesPerson = e.BusinessEntityID
ORDER BY NumSales DESC

--Escrevendo CTEs recursivas - Crie uma consulta ancora (topo da �rvore de recurs�o). Adicione o operador UNION ALL. Crie o membro da consulta que chama a CTE recursivamente
WITH DirectReports(ManagerID, EmployeeID, Title, EmployeeLevel) AS
(
	SELECT ManagerID, EmployeeID, Title, 0 AS EmployeeLevel
	FROM dbo.MyEmployees
	WHERE ManagerID IS NULL
	UNION ALL
	--Parte recursiva
	SELECT e.ManagerID, e.EmployeeID, e.Title, EmployeeLevel + 1
	FROM dbo.MyEmployees AS e
		INNER JOIN DirectReports as d
		ON e.ManagerID = d.EmployeeID
)

SELECT ManagerID, EmployeeID, Title, EmployeeLevel
FROM DirectReports
WHERE EmployeeLevel <= 2;
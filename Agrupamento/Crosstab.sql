USE AdventureWorks2017

--Dados originais
SELECT DaysToManufacture, AVG(StandardCost) AS AverageCost
FROM Production.Product
GROUP BY DaysToManufacture

--Pivot - Converte valores em colunas
SELECT 'AverageCost' AS Cost_Stored_By_Production_Days,
[0], [1], [2], [3], [4]
FROM
	(SELECT DaysToManufacture, StandardCost
	FROM Production.Product) AS SourceTable
PIVOT
(
AVG(StandardCost)
FOR DaysToManufacture IN ([0], [1], [2], [3], [4])
) AS PivotTable;

--Unpivot - Converte colunas em valores
SELECT * FROM Sales.SalesOrderDetail UNPIVOT(Qty FOR Prod IN([Bike], [Chain])) UNPVT
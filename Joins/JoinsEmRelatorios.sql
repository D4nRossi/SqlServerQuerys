USE AdventureWorks2017

/*
<> = Operador de desigualdade
*/

--Self Join 
SELECT DISTINCT pv1.ProductID, pv1.BusinessEntityID
FROM Purchasing.ProductVendor pv1
INNER JOIN Purchasing.ProductVendor pv2
ON pv1.ProductID = pv2.ProductID
AND pv1.BusinessEntityID <> pv2.BusinessEntityID
ORDER BY pv1.ProductID

--Non-Equi Joins - Separar por diferença
SELECT DISTINCT p1.ProductSubcategoryID, p1.ListPrice
FROM Production.Product p1
INNER JOIN Production.Product p2
ON p1.ProductSubcategoryID = p2.ProductSubcategoryID
AND p1.ListPrice <> p2.ListPrice
WHERE p1.ListPrice < 15 AND p2.ListPrice < 15
ORDER BY ProductSubcategoryID

--User-Defined Functions podem ser usadas para melhorar o foco, a simplicidade e a experiencia do usuário
GO
CREATE FUNCTION Sales.ufn_SalesByStore (@storied int)
RETURNS TABLE AS RETURN
(SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS 'YTD Total'
FROM Production.Product AS P
JOIN Sales.SalesOrderDetail SD ON SD.ProductID = P.ProductID
JOIN SalesOrderHeader SH ON SH.SalesOrderID = SD.SalesOrderID
WHERE SH.CustomerID = @storied
GROUP BY P.ProductID, P.Name);
GO
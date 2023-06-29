USE AdventureWorks2017

--Group By - Especifica os grupos em que as linhas retornadas devem ser colocadas
SELECT SalesOrderID, SUM(LineTotal) AS SubTotal FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY SalesOrderID

--Having - Filtra as linhas agrupadas e somente pode ser usada no SELECT
SELECT SalesOrderID, SUM(LineTotal) AS SubTotal FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > 100000
ORDER BY SalesOrderID

--ROLLUP E CUBE (Nunca nem vi) - São usados como parametro do group by
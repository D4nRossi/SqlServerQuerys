USE AdventureWorks2017

--É uma subconsulta que possui uma referencia a uma ou mais colunas da consulta exterior (Consulta principal), a subconsulta nessa caso depende do valor da consulta exterior, a subconsulta é executada diversas vezes

--Consulta exterior
SELECT c.LastName, c.FirstName 
FROM Person.Person c
JOIN HumanResources.Employee e ON e.BusinessEntityID = c.BusinessEntityID

--Consulta interior
SELECT Bonus FROM Sales.SalesPerson;

--Subconsulta correlacionada
SELECT c.LastName, c.FirstName 
FROM Person.Person c
JOIN HumanResources.Employee e ON e.BusinessEntityID = c.BusinessEntityID
WHERE 5000 IN (SELECT Bonus FROM Sales.SalesPerson sp WHERE e.BusinessEntityID = sp.BusinessEntityID)

--O Exists testa a existencia de linhas em uma subconsulta
SELECT Name FROM Production.Product
WHERE EXISTS
(SELECT * FROM Production.ProductSubcategory
WHERE ProductSubcategoryID = Production.Product.ProductSubcategoryID
AND Name = 'Wheels')
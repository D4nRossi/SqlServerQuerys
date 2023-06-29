USE AdventureWorks2017

--Rank - Auto-explicativo (Nessa query ele filtra o pre�o por categoria)
--Apresenta gaps, ex(Ordem dos ranks: 1, 1, 1, 4)
SELECT P.Name, P.ListPrice, PSC.Name Category,
RANK() OVER(Partition BY PSC.Name ORDER BY P.ListPrice DESC) AS PriceRank
FROM Production.Product P
JOIN Production.ProductSubcategory PSC 
ON P.ProductSubcategoryID = PSC.ProductSubcategoryID

--Dense_rank - Rank mas sem gaps
--N�o apresenta gaps, ex(Ordem dos ranks: 1, 1, 1, 2)
SELECT P.Name, P.ListPrice, PSC.Name Category,
DENSE_RANK() OVER(Partition BY PSC.Name ORDER BY P.ListPrice DESC) AS PriceRank
FROM Production.Product P
JOIN Production.ProductSubcategory PSC 
ON P.ProductSubcategoryID = PSC.ProductSubcategoryID

--Row_Number - N�o trata os empates
SELECT ROW_NUMBER() OVER(PARTITION BY PSC.Name ORDER BY P.ListPrice) AS ROW, PSC.Name Category, P.Name Product, P.ListPrice
FROM Production.Product P
JOIN Production.ProductSubcategory PSC
ON P.ProductSubcategoryID = PSC.ProductSubcategoryID

--Ntile - Divide por grupos pre-definidos
SELECT NTILE(3) OVER(PARTITION BY PSC.Name ORDER BY P.ListPrice) AS ROW, PSC.Name Category, P.Name Product, P.ListPrice
FROM Production.Product P
JOIN Production.ProductSubcategory PSC
ON P.ProductSubcategoryID = PSC.ProductSubcategoryID
JOIN Production.ProductCategory PC 
ON PSC.ProductCategoryID = PC.ProductCategoryID
USE AdventureWorks2017

/*
https://terminalroot.com.br/2019/10/inner-join-left-join-right-join-mysql.html#:~:text=Diferentes%20tipos%20de%20SQL%20JOINs&text=LEFT%20JOIN%3A%20Retorna%20todos%20os,correspondentes%20da%20tabela%20da%20esquerda.
INNER JOIN : Retorna registros que possuem valores correspondentes nas duas tabelas;
LEFT JOIN: Retorna todos os registros da tabela esquerda e os registros correspondentes da tabela direita;
RIGHT JOIN: Retorna todos os registros da tabela da direita e os registros correspondentes da tabela da esquerda.
FULL JOIN: The Full Join basically returns all records from the left table and also from the right table
*/

--Inner Join - é um join que une linhas de duas tabelas quando há valores identificados pelas condições em ambas as tabelas usando operadores de comparação
SELECT e.LoginID FROM HumanResources.Employee AS e 
INNER JOIN Sales.SalesPerson AS s 
ON e.BusinessEntityID = s.BusinessEntityID

--Outer Joins retornam todas as linhas de pelo menos uma das tabelas ou views mencionadas no FROM. Podem ser LEFT, RIGHT ou FULL
SELECT p.Name, pr.ProductReviewID
FROM Production.Product p
LEFT OUTER JOIN Production.ProductReview pr ON p.ProductID = pr.ProductID
--
SELECT p.Name, pr.ProductReviewID
FROM Production.Product p
RIGHT OUTER JOIN Production.ProductReview pr ON p.ProductID = pr.ProductID
--
SELECT p.Name, pr.ProductReviewID
FROM Production.Product p
FULL OUTER JOIN Production.ProductReview pr ON p.ProductID = pr.ProductID

--Cross Joins - O CROSS JOIN retorna a combinação de cada uma das linhas entre as tabelas envolvidas, também conhecido como Produto cartesiano
SELECT p.BusinessEntityID, t.Name AS Territory
FROM Sales.SalesPerson p
CROSS JOIN Sales.SalesTerritory t
ORDER BY p.BusinessEntityID
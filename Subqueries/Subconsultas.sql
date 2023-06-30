USE AdventureWorks2017

--É uma consulta aninhada com outro SELECT, INSERT, UPDATE ou DELETE
--Todos os produtos que tem a cor diferente do produto 5
SELECT ProductID, Name
FROM Production.Product
WHERE Color NOT IN
(SELECT Color 
FROM Production.Product
WHERE ProductID = 5)

--Uma subconsulta pode ser usada em qualquer lugar onde uma expressão pode ser usada, exceto no ORDER BY
SELECT Name, ListPrice,
(SELECT AVG(ListPrice) FROM Production.Product) AS Average,
ListPrice - (SELECT AVG(ListPrice) FROM Production.Product) AS 'Difference'
FROM Production.Product
WHERE ProductSubcategoryID = 1

--Operadores de comparação que antecedem uma subconsulta podem ser modificados pelo ANY ou ALL, SOME é o padrão ISO do ANY
--Retoran se o valor seja maior ou igual a algum dos itens da subconsulta
SELECT Name
FROM Production.Product
WHERE ListPrice >= ANY 
(SELECT MAX(ListPrice) FROM Production.Product
GROUP BY ProductSubcategoryID)

--Retoran se o valor seja maior ou igual a todos os itens da subconsulta
SELECT Name
FROM Production.Product
WHERE ListPrice >= ALL 
(SELECT MAX(ListPrice) FROM Production.Product
GROUP BY ProductSubcategoryID)

--Uma consulta escalar retorna uma linha, Já uma consulta tabular retorna múltiplas linhas
--Scalar
CREATE TABLE T1 (a int, b int)
CREATE TABLE T2 (a int, b int)
SELECT * FROM T1 WHERE T1.a > (SELECT MAX(T2.a) FROM T2 WHERE T2.b < T1.b)

--Tabular
SELECT Name 
FROM Production.Product
WHERE ListPrice = (SELECT ListPrice FROM Production.Product
WHERE Name = 'Chainring Bolts')
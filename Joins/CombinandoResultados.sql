USE AdventureWorks2017

--Union - Combina dois resultados em um único resultado que inclui todas as linhas de todas as consultas envolvidas
SELECT * FROM X
UNION /*DISTINCT incluido*/
SELECT * FROM Y
--
SELECT * FROM X
UNION ALL /*DISTINCT não incluido*/
SELECT * FROM Y

--Except - Retorna apenas as linhas da tabela da esquerda que não existem na tabela da direita
SELECT ProductID FROM Production.Product
EXCEPT
SELECT ProductID FROM Production.WorkOrder

--Intersect - Retorna apenas as linhas comuns nas duas tabelas
SELECT ProductID FROM Production.Product
INTERSECT
SELECT ProductID FROM Production.WorkOrder

-- Top e Tablesample - esses comandos limitam a quantidade de linhas retornadas em um resultado (USe tablesample para amostras randomicas e TOP com ORDER BY)
SELECT TOP(15) FirstName, LastName FROM Person.Person
SELECT FirstName, LastName FROM Person.Person TABLESAMPLE(5 PERCENT)
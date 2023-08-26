USE AdventureWorks2017

--O Insert insere uma ou mais linhas em uma tabela. Ele insere data_values em uma ou mais table_or_view. Column_list é a lista de colunas que receberão os dados inseridos
INSERT INTO table_or_view [(column_list)] data_values

--Pegando os valores do INSERT com um SELECT
INSERT INTO MyTable(PriKey, Description)
SELECT ForeignKey, Description
FROM SomeView

--Pegando valores de uma procedure
CREATE PROCEDURE dbo.SomeProc
INSERT INTO dbo.SomeTable
EXECUTE dbo.SomeProc

--INSERT com o TOP
INSERT TOP(x) INTO SomeTableA
SELECT SomeColumnX, SomeColumnY
FROM SomeTableB

--Insert no ID (Identity)
SET IDENTITY_INSERT dbo.T1/*Tabela*/ ON;
GO
INSERT INTO dbo.T1(column_1, column_2) VALUES (-99, 'Teste');
GO

--Output - Retorna informações de cada linha afetada pelo INSERT
DECLARE @MyTable table(
ScrapResonID smallint,
Name varchar(50),
ModifiedDate datetime);

INSERT INTO Production.ScrapReason
OUTPUT inserted.ScrapReasonID, inserted.Name, inserted.ModifiedDate INTO @MyTable
VALUES(N'Operator Error', GETDATE());
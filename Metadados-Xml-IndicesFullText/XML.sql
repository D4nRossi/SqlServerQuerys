USE AdventureWorks2017
/*
FOR XML(AUTO, RAW, EXPLICIT): permite a serialização de dados XML. Ou seja, transforma um resultado em XML
OPEN XML: permite a deserialização de dados. Ou seja, transforma um XML em um resultado tabular
XQuery: permite consultas em dados armazenados em formato XML
XML Schema Collections: permite a definição de schemas XML para colunas tipo XML
*/

--Metodos pata trabalhar com dados XML:
/*
Query - Retorna dados por meio de uma consulta no formato do XQuery
Values -  Retorna um valor no formato SQL Server a paretir de uma busca em dados XML
Exists - Verifica se uma consulta XQuery retorna resultados
Modify - Usado para modificação de dados em XML
Nodes - Divide o XML em múltiplas linhas
*/

--Transformando um resultado em XML
SELECT Cust.CustomerID, OrderHeader.SalesOrderID, OrderHeader.Status, Cust.PersonID 
FROM Sales.Customer Cust
JOIN Sales.SalesOrderHeader OrderHeader ON (Cust.CustomerID = OrderHeader.CustomerID)
ORDER BY Cust.CustomerID
FOR XML AUTO

-- Usando o OpenXML para ler um XML em formato tabular
DECLARE @xml_text VARCHAR(4000), @i INT;

SELECT @xml_text = '<root><person LastName="Silva" FirstName="Jose"/><person LastName="Amorim" FirstName="Daniel"/></root>'

EXEC sp_xml_preparedocument @i OUTPUT, @xml_text;

SELECT * FROM OpenXML(@i, '/root/person') WITH (LastName nvarchar(50), FirstName nvarchar(50))

EXEC sp_xml_removedocument @i
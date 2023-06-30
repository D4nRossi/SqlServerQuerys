USE AdventureWorks2017
--Tabelas temporarias locais: iniciam com #, s�o visiveis para a sess�o corrente do usu�riuo e s�o deletadas ao fechar a sess�o;
CREATE TABLE #StoredInfoLocal(
EmployeeID int,
ManagerID int, 
Num int) 
--Tabelas temporarias globais: iniciam com ##, s�o visiveis para todos os usu�rias e s�o deletadas quando todos os usu�rios fecharem a sess�o
CREATE TABLE ##StoredInfoGlobal(
EmployeeID int,
ManagerID int, 
Num int) 

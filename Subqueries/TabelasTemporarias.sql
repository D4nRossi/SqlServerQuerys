USE AdventureWorks2017
--Tabelas temporarias locais: iniciam com #, são visiveis para a sessão corrente do usuáriuo e são deletadas ao fechar a sessão;
CREATE TABLE #StoredInfoLocal(
EmployeeID int,
ManagerID int, 
Num int) 
--Tabelas temporarias globais: iniciam com ##, são visiveis para todos os usuárias e são deletadas quando todos os usuários fecharem a sessão
CREATE TABLE ##StoredInfoGlobal(
EmployeeID int,
ManagerID int, 
Num int) 

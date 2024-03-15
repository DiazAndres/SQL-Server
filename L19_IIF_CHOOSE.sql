/*
	Lesson #19 - IIF, CHOOSE en SQL Server
*/

--IIF(<predicate>, <true_result>, <false_or_unkwon_result>)

SELECT IIF(1=1, IIF(2=1, 'VERDADERO', 'FALSE_2'), 'FALSE_1') AS 'IIF'

SELECT IIF(LEN('SQL SERVER DESDE CERO') = 10, 'OK', 'NOT OK') AS 'Course'

SELECT 
	 [e].[LoginID]
	,[e].[JobTitle]
	,IIf([e].[Gender]='M', 'Male', 'Female') AS 'Gender'
FROM 
	[HumanResources].[Employee] AS [e]


SELECT
	 [pod].[ProductID]
	,[pod].[UnitPrice]
	,[pod].[StockedQty]
	,IIF([pod].[UnitPrice] <= 25 AND [pod].[StockedQty] < 5, 'YES', 'NO') AS 'REQUEST'
FROM
	[Purchasing].[PurchaseOrderDetail] AS [pod]


--CHOOSE

SELECT ISNULL(CHOOSE(5, 'SQL SERVER', 'ORACLE', 'MARIADB', 'MYSQL'), 'NOT EMPTY') AS 'DB'

SELECT CHOOSE(DATEPART(MONTH, GETDATE()), 'ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO') AS 'MONTH'

SELECT UPPER(DATENAME(MONTH, GETDATE()))
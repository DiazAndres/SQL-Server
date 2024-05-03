/*
	Lesson #38 - Views
*/


--CREATE VIEW view_name AS 
--SELECT column1, column2, ...
--FROM table_name
--WHERE condition;

--We can use DML operation on a single table only
--VIEW should not contain Group By, Having, Distinct clauses
--We cannot use a subquery in a VIEW in SQL Server
--We cannot use Set operators in a SQL VIEW

SELECT
	 [poh].[VendorID]
	,[v].[Name]
	,DATENAME(MONTH, ([poh].[OrderDate]))
	,SUM([poh].[TotalDue])
FROM [Purchasing].[PurchaseOrderHeader] AS [poh]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [poh].[VendorID] = [v].[BusinessEntityID]
WHERE 
	YEAR([OrderDate]) = 2014
GROUP BY
	 [poh].[VendorID]
	,[v].[Name]
	,[poh].[OrderDate]




CREATE VIEW [Purchasing].[PurchasingOrderTotalByVendor] 
AS
(
SELECT
	 [poh].[VendorID]
	,[v].[Name]
	,DATENAME(MONTH, ([poh].[OrderDate]))	AS [MonthName]
	,SUM([poh].[TotalDue])					AS [TotalDue]
FROM [Purchasing].[PurchaseOrderHeader] AS [poh]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [poh].[VendorID] = [v].[BusinessEntityID]
WHERE 
	YEAR([OrderDate]) = 2014
GROUP BY
	 [poh].[VendorID]
	,[v].[Name]
	,[poh].[OrderDate]
); 	


--Editar vista
ALTER VIEW [Purchasing].[PurchasingOrderTotalByVendor] 
AS
(
SELECT
	 [poh].[VendorID]						AS [Proveedor]
	,[v].[Name]								AS [Nombre]
	,DATENAME(MONTH, ([poh].[OrderDate]))	AS [Mes]
	,SUM([poh].[TotalDue])					AS [Total]
FROM [Purchasing].[PurchaseOrderHeader] AS [poh]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [poh].[VendorID] = [v].[BusinessEntityID]
WHERE 
	YEAR([OrderDate]) = 2014
GROUP BY
	 [poh].[VendorID]
	,[v].[Name]
	,[poh].[OrderDate]
); 	


--Borrar vista 
DROP VIEW [Purchasing].[PurchasingOrderTotalByVendor] 
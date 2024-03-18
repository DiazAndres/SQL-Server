/*
	Lesson #23 - COUNT, SUM, MIN, MAX, AVG en SQL Server 
*/


-- Agregate functions
--T-SQL supports agregate function such as SUM, COUNT, MIN, MAX


--SUM
SELECT 
	 [pod].[PurchaseOrderID]
	,SUM([pod].[OrderQty]) AS 'TotalByPurchasingID'
	,SUM([pod].[LineTotal]) AS 'LineTotal'
FROM
	[Purchasing].[PurchaseOrderDetail] AS [pod]
GROUP BY
	 [pod].[PurchaseOrderID];



--COUNT
SELECT 
	COUNT(*) AS 'TotalRows'
FROM
	[Sales].[SalesPerson]
--Hacer COUNT con un campo que nunca sea null, debido a que no se cuentan



--MIN
SELECT 
	MIN([pod].[UnitPrice]) AS 'Precio Mínimo'
FROM 
	[Purchasing].[PurchaseOrderDetail] AS [pod]

SELECT TOP(1)
	[pod].[UnitPrice]
FROM 
	[Purchasing].[PurchaseOrderDetail] AS [pod]
ORDER BY 
	[pod].[UnitPrice]



--MAX
SELECT 
	MAX([pod].[UnitPrice]) AS 'Precio Máximo'
FROM 
	[Purchasing].[PurchaseOrderDetail] AS [pod]

SELECT TOP(1)
	[pod].[UnitPrice]
FROM 
	[Purchasing].[PurchaseOrderDetail] AS [pod]
ORDER BY 
	[pod].[UnitPrice] DESC



SELECT 
	 [pod].[PurchaseOrderID]
	,COUNT(*)					AS 'Total de Líneas'
	,MIN([pod].[UnitPrice])		AS 'Precio Mínimo'
	,MAX([pod].[UnitPrice])		AS 'Precio Máximo'
FROM 
	[Purchasing].[PurchaseOrderDetail] AS [pod]
WHERE
	[pod].[PurchaseOrderID] = 515
GROUP BY
	[pod].[PurchaseOrderID]


SELECT 
	 *
FROM 
	[Purchasing].[PurchaseOrderDetail] AS [pod]
WHERE
	[pod].[PurchaseOrderID] = 515


--AVG
SELECT
	 [pod].[PurchaseOrderID]
	,AVG(CAST([pod].[UnitPrice] AS DECIMAL(18,2)))	AS 'Promedio'
FROM
	[Purchasing].[PurchaseOrderDetail] AS [pod]
GROUP BY
	[pod].[PurchaseOrderID]



--Modulus
SELECT
	 38 / 5 AS 'Result'
	,38 % 5 AS 'Remainder'


-- Ejemplos
SELECT 
	 ProductID
	,SUM(OrderQty)
	,SUM(OrderQty) / 4 AS 'Box a surtir'
	,SUM(OrderQty) % 4 AS 'pzas sobrantes'
FROM
	[Purchasing].[PurchaseOrderDetail]
GROUP BY
	ProductID
ORDER BY ProductID


SELECT 
	 ProductID
	,SUM(OrderQty)
	,SUM(OrderQty) / 100 AS 'Box a surtir'
	,SUM(OrderQty) % 100 AS 'pzas sobrantes'
FROM
	[Purchasing].[PurchaseOrderDetail]
GROUP BY
	ProductID
HAVING 
	SUM(OrderQty) >= 100
ORDER BY ProductID
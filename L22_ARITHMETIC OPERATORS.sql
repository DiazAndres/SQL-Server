/*
	Lesson #22 - Arithmetic Operators
*/
--Aritmetic Operators

SELECT 2 + 2 AS SUMA
SELECT 2 - 2 AS RESTA
SELECT 2 * 2 AS MULTIPLICACION
SELECT 2 / 2 AS DIVISION

SELECT 9 / 2.0 AS 'DivisionDecimal'

SELECT CAST(9 AS decimal(18,2)) / CAST(2 AS decimal(18,2)) AS 'DivisonDecimal'


DECLARE @number AS INT = 10
SELECT 10/IIF(@number = 0, 1, @number) AS 'DivisionCero'


SELECT 
	 [pod].[PurchaseOrderDetailID]
	,[pod].[ProductID]
	,[pod].[OrderQty]
	,[pod].[UnitPrice]
	,[pod].[LineTotal]
	,[pod].[OrderQty] * [pod].[UnitPrice] AS 'LineTotalCalculado'
	,CASE
		WHEN ([pod].[OrderQty] * [pod].[UnitPrice]) >= 25000 THEN
			'25 %'
		WHEN ([pod].[OrderQty] * [pod].[UnitPrice]) >= 20000 THEN
			'20 %'
		WHEN ([pod].[OrderQty] * [pod].[UnitPrice]) >= 15000 THEN
			'15 %'
		WHEN ([pod].[OrderQty] * [pod].[UnitPrice]) >= 10000 THEN
			'10 %'
		WHEN ([pod].[OrderQty] * [pod].[UnitPrice]) >= 5000 THEN
			'5 %'
		ELSE
			'0 %'
	 END								AS 'Descuento'
	,CASE
		WHEN ([pod].[OrderQty] * [pod].[UnitPrice]) >= 25000 THEN
			([pod].[OrderQty] * [pod].[UnitPrice]) - (([pod].[OrderQty] * [pod].[UnitPrice]) * 0.025)
		WHEN ([pod].[OrderQty] * [pod].[UnitPrice]) >= 20000 THEN
			([pod].[OrderQty] * [pod].[UnitPrice]) - (([pod].[OrderQty] * [pod].[UnitPrice]) * 0.020)
		WHEN ([pod].[OrderQty] * [pod].[UnitPrice]) >= 15000 THEN
			([pod].[OrderQty] * [pod].[UnitPrice]) - (([pod].[OrderQty] * [pod].[UnitPrice]) * 0.015)
		WHEN ([pod].[OrderQty] * [pod].[UnitPrice]) >= 10000 THEN
			([pod].[OrderQty] * [pod].[UnitPrice]) - (([pod].[OrderQty] * [pod].[UnitPrice]) * 0.010)
		WHEN ([pod].[OrderQty] * [pod].[UnitPrice]) >= 5000 THEN
			([pod].[OrderQty] * [pod].[UnitPrice]) - (([pod].[OrderQty] * [pod].[UnitPrice]) * 0.005)
		ELSE
			([pod].[OrderQty] * [pod].[UnitPrice]) 
	 END								AS 'TotalConDescuento'
FROM
	[Purchasing].[PurchaseOrderDetail] AS [pod]
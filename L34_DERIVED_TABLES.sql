/*
	Lesson #34 - Derived tables en SQL Server 
	Nested query - Consulta anidada
*/
SELECT *
FROM (
		SELECT 
			 [pod].[PurchaseOrderID]
			,[pod].[PurchaseOrderDetailID]
			,ROW_NUMBER() 
				OVER(PARTITION BY [PurchaseOrderID] 
				ORDER BY [pod].[PurchaseOrderDetailID]) AS [Consecutive]
			,[pod].[ProductID]
			,[pod].[UnitPrice]
			,[pod].[OrderQty]
		FROM
			[Purchasing].[PurchaseOrderDetail] AS [pod]
		WHERE
			[pod].[PurchaseOrderID] = 18
	) AS [r1]
WHERE [r1].[Consecutive] <= 3
/*
    Lesson #39 - Table Valued Functions
*/


--Template desde el editor
-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andres Diaz>
-- Create date: <04.05.2024>
-- Description:	<Función que devuelve datos de compras pro proveedor>
-- =============================================
CREATE FUNCTION ufnGetPurchaseOrderTotalByVendor 
(	
	-- Add the parameters for the function here
	@year		AS INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 
		 [potbv].[Proveedor]
		,[potbv].[Nombre]
		,[potbv].[Mes]
		,[potbv].[Total]
		,[potbv].[Status]
		,[potbv].[OrderDate]
  FROM 
	[AdventureWorks2019].[Purchasing].[PurchasingOrderTotalByVendor] AS [potbv]
  WHERE 
	YEAR([potbv].[OrderDate]) = @year
	
)
GO





--Se ocupa tal cual una tabla
SELECT 
	 [fnpo].[Proveedor]
    ,[fnpo].[Nombre]
    ,[fnpo].[Mes]
    ,[fnpo].[Total]
    ,[fnpo].[Status]
    ,[fnpo].[OrderDate]
FROM
	[dbo].[ufnGetPurchaseOrderTotalByVendor](2014) AS [fnpo]
	INNER JOIN [Purchasing].[Vendor] AS [v]
		ON [v].[BusinessEntityID] = [fnpo].[Proveedor]
WHERE 
	[v].[ActiveFlag] = 1






--Segunda
-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andrés Díaz>
-- Create date: <04.05.2024>
-- Description:	<Retornar datos de Invetory>
-- =============================================
CREATE FUNCTION ufnGetInventory 
(	
	-- Add the parameters for the function here
	@productID	AS INT = 0
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 
		 [LocationID]		AS [LocationID]
		,[ProductID]
		,SUM([Quantity])	AS [TotalStockQuantity]
	FROM
		[Production].[ProductInventory]
	WHERE 
		[ProductID] = @productID
	GROUP BY
		 [ProductID]
		,[LocationID]


	UNION ALL

	SELECT
		 1000				AS [LocationID]
		,[ProductID]
		,SUM([Quantity])	AS [TotalStockQuantity]
	FROM
		[Production].[ProductInventory]
	WHERE 
		[ProductID] = @productID
	GROUP BY
		[ProductID]
)	
GO





    --Interesante
    DECLARE @productID			AS INT =937
DECLARE @qty				AS INT = 0
DECLARE @bod				AS INT = 6

SELECT @qty= SUM(sod.OrderQty)FROM [Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
		ON [soh].[SalesOrderID] = [sod].[SalesOrderID]
WHERE 
	[sod].[ProductID] = @productID 
	AND OrderDate >= '2013-05-30'
GROUP BY 
 sod.ProductID

--SELECT @qty

 IF (@qty <= (SELECT TotalStockQuantity FROM [dbo].[Inventory](@productID) WHERE LocationID= @bod))
 BEGIN
	PRINT 'DISPONIBLE'
END
ELSE
BEGIN
	PRINT 'NO DISPONIBLE'
END




--SELECT * FROM [dbo].[Inventory](937)  
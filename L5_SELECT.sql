/*
	Lección 5 - SELECT
*/
	
	
SELECT * FROM [MundoBinario].[dbo].[Orders]
WHERE order_id = 1;



SELECT * FROM [dbo].[OrderDetails]
WHERE order_id = 1;


SELECT * FROM [dbo].[Products]
WHERE product_id = 3;
SELECT * FROM [dbo].[Measures];


SELECT [orderDetail_number],[orderDetail_quantity],[orderDetail_price] 
	FROM [dbo].[OrderDetails]
WHERE orderDetail_price < 25;


SELECT 
	 [o].order_number
	,[o].order_date
	,[od].orderDetail_number
	,p.product_description
	,m.measure_description
	,od.orderDetail_quantity
	,od.orderDetail_price
FROM [dbo].[Orders] AS [o]
	INNER JOIN [dbo].[OrderDetails] AS [od]
		ON [o].order_id = [od].order_id
	INNER JOIN dbo.Products AS p
		ON od.product_id = p.product_id
	INNER JOIN dbo.Measures AS m
		ON od.measure_id = m.measure_id
WHERE [o].order_id = 2;
/*
	Lesson 6 - UPDATE
*/
SELECT * FROM dbo.Products
WHERE product_id = 4;


UPDATE [dbo].[Products]
SET product_description = 'L�piz de puntillas finas'
WHERE product_id = 4;


SELECT * FROM dbo.OrderDetails;


UPDATE dbo.OrderDetails
SET orderDetail_price = 5;

SELECT * FROM [dbo].[Orders];

UPDATE [dbo].[Orders]
SET [order_date] = GETDATE()
WHERE [order_id] = 2;
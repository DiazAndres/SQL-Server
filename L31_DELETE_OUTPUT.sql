/*
	Lesson #31 - DELETE with OUTPUT
*/

--Es forzoso realizar un select antes, hacia el campo que se desea hacer la eliminación

DELETE 
FROM [dbo].[Brands]
	OUTPUT deleted.brand_id
WHERE [brand_name] = 'HP';

SELECT 
	*
FROM 
	[dbo].[Brands]
WHERE 
	[brand_name] = 'HP'

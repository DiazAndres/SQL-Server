/*
	Lesson #30 - UPDATE with OUTPUT 
*/
UPDATE [dbo].[Brands]
	SET [brand_name] = 'LENOVO NEW'
		,[brand_status] = 1
	OUTPUT 
		inserted.brand_id
		,deleted.brand_name
		,inserted.brand_name
		,deleted.brand_status
		,inserted.brand_status
WHERE [brand_name]='LENOVO'


select * from [dbo].[Brands]

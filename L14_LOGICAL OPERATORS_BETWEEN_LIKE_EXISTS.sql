/*
    Lesson #14 - Logical Operators BETWEEN, LIKE, EXISTS
*/

SELECT 
	 [e].[employee_name]
	,[e].[employee_lastname]
	,[e].[employee_birthday]
	,[e].[employee_gender]
	,[e].[employee_salary]
	,[e].[employee_positionName]
	,[e].[employee_createdDate]
FROM
	[dbo].[Employees] AS [e]
WHERE
	[e].[employee_birthday] BETWEEN '01-01-1990' AND '12-31-1993';
	--[e].[employee_salary] BETWEEN 500 AND 600;


SELECT 
	 [e].[employee_name]
	,[e].[employee_lastname]
	,[e].[employee_birthday]
	,[e].[employee_gender]
	,[e].[employee_salary]
	,[e].[employee_positionName]
	,[e].[employee_createdDate]
FROM
	[dbo].[Employees] AS [e]
WHERE
	--[e].[employee_lastname] LIKE 'M%';
	--[e].[employee_lastname] LIKE '%A';
	--[e].[employee_name] LIKE '%A%'
	--[e].[employee_lastname] LIKE '%_i_%';
	--[e].[employee_lastname] LIKE '[ER]%';
	--[e].[employee_lastname] LIKE '[A-R]%';
	--[e].[employee_lastname] LIKE '[SZ]avaleta';
	--[e].[employee_lastname] LIKE '[^gmlrpa]%'; Descarta que empiece por esas letras
	--[e].[employee_lastname] LIKE '%[^aeiou]'; 
	--[e].[employee_lastname] LIKE '?_%' ESCAPE '?'
	
	
SELECT 
	 [e].[employee_name]
	,[e].[employee_lastname]
	,[e].[employee_birthday]
	,[e].[employee_gender]
	,[e].[employee_salary]
	,[e].[employee_positionName]
	,[e].[employee_createdDate]
	,[e].[department_id]
FROM
	[dbo].[Employees] AS [e]
WHERE
	(EXISTS
		(
			SELECT 
				[d].[department_id]
			FROM
				[dbo].[Departments] AS [d]
			WHERE
				[d].[department_id] = [e].[department_id]
				AND
				[d].[department_id] IN (2,3)
		)
	);
	
	
	
SELECT 
	 [e].[employee_name]
	,[e].[employee_lastname]
	,[e].[employee_birthday]
	,[e].[employee_gender]
	,[e].[employee_salary]
	,[e].[employee_positionName]
	,[e].[employee_createdDate]
	,[e].[department_id]
	,[d].[department_name]
FROM
	[dbo].[Employees] AS [e]
	INNER JOIN [dbo].[Departments] AS [d]
	ON [e].[department_id] = [d].[department_id]
WHERE
	[e].[department_id]
	IN
	(
		SELECT 
			[d].[department_id]
		FROM
			[dbo].[Departments] AS [d]	
		WHERE 
			[d].[department_name] LIKE '%as'
	);



SELECT
	*
FROM
	[dbo].[OrderDetails]
WHERE [order_id] = ANY/SOME (SELECT [order_id] FROM [dbo].[Orders]);


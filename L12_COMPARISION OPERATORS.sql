/*
	Lesson #12 - Comparison Operators
*/
-- =, >, <, >=, <=, <>

SELECT 
	*
FROM 
	[dbo].[Employees] AS [e]
WHERE
	[e].[employee_salary] = 750;


SELECT 
	*
FROM 
	[dbo].[Employees] AS [e]
WHERE
	[e].[employee_name] = 'Axel';


SELECT 
	*
FROM 
	[dbo].[Employees] AS [e]
WHERE
	[e].[employee_salary] > 500;
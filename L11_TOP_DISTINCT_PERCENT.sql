/*
	Lesson 11 - TOP, DISTINCT, PERCENT
*/
SELECT
	TOP(5) *
FROM
	[dbo].[Employees] AS [e]
ORDER BY
	[e].[employee_createdDate];


SELECT
	TOP 20 PERCENT *
FROM
	[dbo].[Employees] AS [e]
ORDER BY
	[e].[employee_createdDate];


SELECT
	DISTINCT [e].[employee_salary]
FROM
	[dbo].[Employees] AS [e];


SELECT
	DISTINCT [d].[department_name]
FROM
	[dbo].[Employees] AS [e]
	INNER JOIN [dbo].[Departments] AS [d]
	ON [e].[department_id] = [d].[department_id];
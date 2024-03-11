/*
	Lesson 10 - CONCAT AND ALIAS
*/
SELECT 
	 [e].[employee_name] 
	,[e].[employee_lastname]
	,[e].[employee_name] + N' ' + [e].[employee_lastname]		AS [employee_fullName]
	,CONCAT([e].[employee_name], N' ', [e].[employee_lastname])	AS [employee_fullName2]
	,[e].[employee_salary]
	,[e].[employee_createdDate]
	,[d].[department_name]
	,[d].[department_name]
	+ '/' + [e].[employee_positionName]
	+ '/' + CAST([e].[employee_salary] AS NVARCHAR(100))		AS [employee_fullinfo]	
FROM 
	[dbo].[Employees] AS [e]
	INNER JOIN [dbo].[Departments] AS [d]
	ON [e].[department_id] = [d].[department_id]
ORDER BY 
		 [employee_fullinfo];
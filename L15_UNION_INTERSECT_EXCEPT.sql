/*
	Lección 15 - UNION, UNION ALL, INTERSECT, EXCEPT
*/ 
/*
UNION ALL	--> APARECEN TODAS LAS FILAS (REPETIDAS)
UNION		--> DEVUELVE FILAS DISTINTAS O UNICAS (NO REPETIDAS)
INTERSECT	--> DEVUELVE FILAS QUE EN AMBAS CONSULTAS SON DEVUELTAS
EXCEPT		--> DEVUELVE FILAS ENCONTRADAS EN EL PRIMER QUERY Y ADEMÁS DESCARTA LAS FILAS ENCONTRADAS EN EL SEGUNDO QUERY
*/


SELECT 
	 [e].[employee_name]
	,[e].[employee_lastname]
	,[e].[employee_salary]
	,[e].[employee_positionName]
FROM 
	[dbo].[Employees] AS [e]
WHERE 
	[e].[employee_positionName] LIKE '%Ventas%'
EXCEPT
SELECT 
	 [e].[employee_name]
	,[e].[employee_lastname]
	,[e].[employee_salary]
	,[e].[employee_positionName]
FROM 
	[dbo].[Employees] AS [e]
WHERE 
	[e].[employee_salary] <= 500
/*
	Lesson #13 - Logical Operators
	ALL, ANY, AND, BETWEEN, EXISTS, IN, LIKE, NOT, OR, SOME
*/

INSERT INTO [dbo].[Employees]
	(
		 [employee_name]
		,[employee_lastname]
		,[employee_birthday]
		,[employee_gender]
		,[employee_salary]
		,[employee_positionName]
		,[department_id]
	)
VALUES
 ('Manuel', 'Santos', '1991-01-27', 1, 635.50, 'Comprador Jr.', 5)
,('Luis', 'Carranza', '1995-05-30', 1, 782, 'Comprador Sr.', 5)
,('Mariana', 'Garza', '1993-07-15', 0, 750, 'Supervisor', 3)
,('Ismael', 'Perez', '1993-06-22', 1, 600, 'Supervisor de Calidad', 3)
,('Miguel', 'Rios', '1996-02-10', 1, 350, 'Ayudante General', 3)
,('Emmanuel', 'Lara', '1996-03-20', 1, 350, 'Ayudante General', 3)
,('Luis', 'Barrera', '1994-08-12', 1, 350, 'Ayudante General', 3)
,('Veronica', 'Montes', '1993-07-08', 0, 350, 'Ayudante General', 3)
,('Martha', 'Rojas', '1995-09-28', 0, 350, 'Desarrollador Web', 1)
,('Merida', 'Rios', '1994-07-21', 0, 500, 'Nomina', 2);


-- AND, OR, NOT, IN
SELECT 
	*
FROM
	[dbo].[Employees] AS [e]
WHERE 
	[e].[employee_salary] >= 300
AND [e].[employee_salary] <= 500
AND [e].department_id = 3
AND [e].employee_gender = 1
ORDER BY [e].[employee_salary]


SELECT 
	*
FROM
	[dbo].[Employees] AS [e]
WHERE 
	[e].[department_id] NOT IN (1,2,3)
ORDER BY
	[e].[department_id];


SELECT 
	*
FROM
	[dbo].[Employees] AS [e]
WHERE 
	(
		[e].[employee_salary] >= 500
		AND
		[e].[employee_gender] = 1
	)
	OR
	[e].[department_id] IN (4,5)
ORDER BY
	[e].[department_id];



SELECT 
	*
FROM
	[dbo].[Employees] AS [e]
WHERE 
	[e].[employee_gender] = 1
	AND
	(
		[e].[employee_salary] <= 500
		OR
		[e].[department_id] IN (4,5)	
	)
	
ORDER BY
	[e].[department_id];
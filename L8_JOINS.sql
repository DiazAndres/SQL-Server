/*
	Lesson #8 - INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN
*/
CREATE TABLE [dbo].[Employees]
(
  [employee_id]			INT				NOT NULL IDENTITY (1,1) PRIMARY KEY
 ,[employee_name]		VARCHAR(100)	NULL
 ,[department_id]		INT				NULL
);


CREATE TABLE [dbo].[Departments]
(
  [department_id]			INT				NOT NULL IDENTITY (1,1) PRIMARY KEY
 ,[department_name]		VARCHAR(100)	NULL
);


INSERT INTO [dbo].[Employees]
([employee_name], [department_id])
VALUES 
 ('Axel Romero', 1)
,('Roberto Mujica', 1)
,('Alondra Rosas', 2)
,('Rodrigo Lara', 3)
,('Monica Galindo', 4)
,('Rosario Galicia', null)
,('Fernando Roa', 6)
,('Paola Leon', null);


INSERT INTO [dbo].[Departments]
([department_name])
VALUES 
 ('Sistemas')
,('Recursos Humanos')
,('Producci�n')
,('Ventas')
,('Compras');



SELECT * FROM [dbo].[Departments];
SELECT * FROM [dbo].[Employees];


SELECT [e].[employee_name], [d].department_name 
	FROM [dbo].[Employees] AS [e]
	INNER JOIN [dbo].[Departments] AS [d]
	ON [e].department_id = [d].department_id;

SELECT [e].[employee_name], [d].department_name 
	FROM [dbo].[Employees] AS [e]
	LEFT JOIN [dbo].[Departments] AS [d]
	ON [e].department_id = [d].department_id;

SELECT [e].[employee_name], [d].department_name 
	FROM [dbo].[Employees] AS [e]
	LEFT JOIN [dbo].[Departments] AS [d]
	ON [e].[department_id] = [d].[department_id]
	WHERE [d].[department_id] IS NULL;

SELECT [e].[employee_name], [d].department_name 
	FROM [dbo].[Employees] AS [e]
	LEFT JOIN [dbo].[Departments] AS [d]
	ON [e].[department_id] = [d].[department_id]
	WHERE [d].[department_id] IS NOT NULL;

SELECT [e].[employee_name], [d].department_name 
	FROM [dbo].[Employees] AS [e]
	RIGHT JOIN [dbo].[Departments] AS [d]
	ON [e].department_id = [d].department_id;

SELECT [e].[employee_name], [d].department_name 
	FROM [dbo].[Employees] AS [e]
	FULL OUTER JOIN [dbo].[Departments] AS [d]
	ON [e].department_id = [d].department_id;
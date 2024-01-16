/*
		LESSON #2 - CREATE DATABASE
*/

--CREATE DB
CREATE DATABASE MUNDOBINARIO;

--MODIFY DB
ALTER DATABASE MUNDOBINARIO MODIFY NAME=MB;

--DELETE DB
DROP DATABASE MB;




/*
	Lesson #3 - CREATE TABLE
*/
USE MundoBinario;

CREATE TABLE [dbo].[Orders]
(
 order_id		INT			NOT NULL IDENTITY(1,1) PRIMARY KEY
,order_number	INT			NOT NULL 
,order_date		DATETIME	NOT NULL
,order_status	INT			NOT NULL
);


CREATE TABLE [dbo].[Orders]
(
 order_id		INT			NOT NULL IDENTITY(1,1) PRIMARY KEY
,order_number	INT			NOT NULL 
,order_date		DATETIME	NOT NULL
,order_status	INT			NOT NULL
);


CREATE TABLE [dbo].[Products]
(
 product_id				INT				NOT NULL IDENTITY(1,1) PRIMARY KEY
,product_code			VARCHAR(10)		NOT NULL 
,product_description	VARCHAR(100)	NOT NULL
);

CREATE TABLE [dbo].[OrderDetails]
(
 orderDetail_id			INT 			NOT NULL 	IDENTITY(1,1) PRIMARY KEY
,order_id            	INT 			NOT NULL
,orderDetail_number		INT             NOT NULL	
,product_id             INT             NOT NULL
,orderDetail_quantity	DECIMAL(18,2)	NOT NULL
,orderDetail_price		DECIMAL(18,2)	NOT NULL 
,measure_id             INT 			NOT NULL
,notes					VARCHAR(MAX)	NULL    
,CONSTRAINT fk_Orders FOREIGN KEY (order_id) REFERENCES Orders (order_id)
,CONSTRAINT fk_Products FOREIGN KEY (product_id) REFERENCES Products (product_id)
,CONSTRAINT fk_Measures FOREIGN KEY (measure_id) REFERENCES Measures (measure_id)
);

DROP TABLE [dbo].[Test];

-- It's a procedure with two parameters Rename table por medio de un procedimiento y con dos parametros
EXEC sp_rename 'Test', 'Test2';

-- ADD COLUMN, it's necessary column name and data type
ALTER TABLE [dbo].[Test2]
ADD [Status] INT;

-- Drop column
ALTER TABLE [dbo].[Test2]
DROP COLUMN [Status];




/*
	Lesson #4 - INSERT
*/

INSERT INTO [dbo].[Measures]
	(
	 [measure_code]
	,[measure_description]
	)
VALUES
	 ('H87','Pieza')
	,('EA','Elemento')
	,('Kg','Kilogramo')
	,('Lt','Litro');


INSERT INTO [dbo].[Products] 
	(
	  [product_code]
	 ,[product_description]
	)
VALUES
	 ('LPR', 'Libreta profesional con rayas')
	,('LPC', 'Libreta profesional a cuadros')
	,('GM', 'Goma bicolor azul-rojo')
	,('LPP', 'Lápiz profesional de puntillas')
	,('HBC', 'Hoja blanca tamaño carta');


INSERT INTO [dbo].[Orders]
	(
	 [order_number]
	,[order_date]
	,[order_status]
	)
VALUES 
	(
	 1001
	,GETDATE()
	,1
	);

INSERT INTO [dbo].[OrderDetails]
	(
	 [order_id]
	,[orderDetail_number]
	,[product_id]
	,[orderDetail_quantity]
	,[orderDetail_price]
	,[measure_id]
	)
VALUES 
	 (1,1,1,10,40,1)
	,(1,2,3,10,10,1)
	,(1,3,4,10,25,1)
	,(1,4,5,10,1,1);

INSERT INTO [dbo].[Orders]
	(
	 [order_number]
	,[order_date]
	,[order_status]
	)
OUTPUT INSERTED.order_id
VALUES 
	(
	 1002
	,GETDATE()
	,1
	);


INSERT INTO [dbo].[OrderDetails]
	(
	 [order_id]
	,[orderDetail_number]
	,[product_id]
	,[orderDetail_quantity]
	,[orderDetail_price]
	,[measure_id]
	,[notes]
	)
OUTPUT INSERTED.orderDetail_id
VALUES 
	 (2,1,2,5,40,1,'Prueba de que esto es una nota')
	,(2,2,3,2,10,1, null);
	


/*
	Lesson #6 - SELECT
*/
	
	
SELECT * FROM [MundoBinario].[dbo].[Orders]
WHERE order_id = 1;



SELECT * FROM [dbo].[OrderDetails]
WHERE order_id = 1;


SELECT * FROM [dbo].[Products]
WHERE product_id = 3;
SELECT * FROM [dbo].[Measures];


SELECT [orderDetail_number],[orderDetail_quantity],[orderDetail_price] 
	FROM [dbo].[OrderDetails]
WHERE orderDetail_price < 25;


SELECT 
	 [o].order_number
	,[o].order_date
	,[od].orderDetail_number
	,p.product_description
	,m.measure_description
	,od.orderDetail_quantity
	,od.orderDetail_price
FROM [dbo].[Orders] AS [o]
	INNER JOIN [dbo].[OrderDetails] AS [od]
		ON [o].order_id = [od].order_id
	INNER JOIN dbo.Products AS p
		ON od.product_id = p.product_id
	INNER JOIN dbo.Measures AS m
		ON od.measure_id = m.measure_id
WHERE [o].order_id = 2;





/*
	Lesson 6 - UPDATE
*/
SELECT * FROM dbo.Products
WHERE product_id = 4;


UPDATE [dbo].[Products]
SET product_description = 'Lápiz de puntillas finas'
WHERE product_id = 4;


SELECT * FROM dbo.OrderDetails;


UPDATE dbo.OrderDetails
SET orderDetail_price = 5;

SELECT * FROM [dbo].[Orders];

UPDATE [dbo].[Orders]
SET [order_date] = GETDATE()
WHERE [order_id] = 2;



/*
	Lesson 7 - DELETE
*/


SELECT * FROM [dbo].[Measures]
WHERE measure_code = 'Lt';


DELETE FROM [dbo].[Measures]
WHERE measure_code = 'Lt';


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
,('Producción')
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
	
	

/*
	Lesson 9 - ORDER BY
*/
DROP TABLE [dbo].[Employees];


CREATE TABLE [dbo].[Employees]
(
	 [employee_id]				INT				NOT NULL	IDENTITY(1,1) PRIMARY KEY
	,[employee_name]			VARCHAR(100)	NOT NULL
	,[employee_lastname]		VARCHAR(100)	NOT NULL
	,[employee_birthday]		DATE			NULL
	,[employee_gender]			BIT				NULL
	,[employee_salary]			DECIMAL(18,2)	NOT NULL
	,[employee_positionName]	VARCHAR(100)	NOT NULL
	,[employee_createdDate]		DATE			NOT NULL DEFAULT GETDATE()
	,[department_id]			INT				NOT NULL
);


INSERT INTO [dbo].[Employees]
([employee_name], [employee_lastname], [employee_birthday], [employee_gender], [employee_salary], [employee_positionName], [employee_createdDate], [department_id])
VALUES
 ('Axel', 'Romero', '1990-03-22', 1, 550.20, 'Programador Sr.', '2020-10-01', 1)
,('Roberto', 'Mujica', '1995-03-22', 1, 250, 'Analista', '2019-05-05', 1)
,('Alondra', 'Rosas', '1985-05-20', 0, 400, 'Generalista', '2018-11-01', 2)
,('Rodrigo', 'Lara', '1985-05-20', 1, 355, 'Supervisor', '2020-01-01', 3)
,('Monica', 'Galindo', '1996-02-05', 0, 211, 'Ventas Mayoreo', '2020-03-03', 4)
,('Rosario', 'Galicia', '1994-01-21', 0, 650, 'Ventas Autoservicio', '2020-03-03', 4)
,('Fernando', 'Roa', '1988-01-29', 1, 750, 'Gerente de compras', '2017-06-18', 5)
,('Paola', 'Leon', '1993-09-12', 0, 750, 'Ventas Menudeo', '2021-01-12', 4)
,('Diego', 'Zavaleta', '1991-11-12', 1, 433.50, 'Ventas Menudeo', '2021-01-12', 4)
,('Marisol', 'Paez', '1992-12-07', 0, 558.30, 'Gerente RRHH', '2018-03-17', 2);


SELECT 
	 [e].[employee_name] 
	,[e].[employee_lastname]
	,[e].[employee_salary]
	,[e].[employee_createdDate]
	,[d].[department_name]
FROM 
	[dbo].[Employees] AS [e]
	INNER JOIN [dbo].[Departments] AS [d]
	ON [e].[department_id] = [d].[department_id]
ORDER BY 
		 [d].[department_name]
		,[e].[employee_salary];
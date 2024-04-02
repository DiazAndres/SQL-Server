/*
	Lesson #26 - INSERT SELECT, INSERT EXEC y SELECT INTO en SQL Server
*/

-- INSERT INTO

CREATE TABLE [Sales].[SalesOrderHeaderBackup]
	(
		[SalesOrderID]	INT			NOT NULL	PRIMARY KEY
		,[OrderDate]	DATETIME	NOT NULL
		,[ShipDate]		DATETIME	NULL
		,[CustomerID]	INT			NOT NULL
		,[Status]		TINYINT		NOT NULL
		,[TotalDue]		MONEY		NOT NULL
		,[TaxAmt]		MONEY		NOT NULL
	)


INSERT INTO [Sales].[SalesOrderHeaderBackup]
	([SalesOrderID], [OrderDate], [ShipDate], [CustomerID], [Status], [TotalDue])
SELECT 
	[SalesOrderID], [OrderDate], [ShipDate], [CustomerID], [Status], [TotalDue]
FROM 
	[Sales].[SalesOrderHeader]
WHERE
	[TotalDue] >= 500


DELETE FROM [Sales].[SalesOrderHeaderBackup]
DROP TABLE [Sales].[SalesOrderHeaderBackup]



-- INSERT EXEC
INSERT INTO [Sales].[SalesOrderHeaderBackup]
	EXEC Sales.SalesOrderByCustomerID @CustomerID = 29825


SELECT * FROM [Sales].[SalesOrderHeaderBackup]

SELECT * FROM [Sales].[SalesOrderHeader]
WHERE CustomerID=29825 AND TaxAmt >= 2500



-- SELECT INTO 
-- Es mejor porque no necesitas crear la tabla antes de, la crea en el mismo SELECT INTO
DROP TABLE IF EXISTS [Sales].[SalesOrderHeaderBackup]; 

SELECT 
	[SalesOrderID], [OrderDate], [ShipDate], [CustomerID], [Status], [TotalDue], [TaxAmt]
INTO
	[Sales].[SalesOrderHeaderBackup]
FROM 
	[Sales].[SalesOrderHeader]
WHERE
	[TotalDue] >= 150000;

--Solo copia el tipo de dato de las columnas, en dado caso de que exista una pk no la creara en la nueva tabla, tampoco constraints



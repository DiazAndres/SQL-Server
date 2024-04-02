/*
	Lesson #28 - MERGE
	El MERGE es un comando para sincronizar dos tablas, Insert, Update y Delete en un solo query, 
	esto ayuda a tener un performance adecuado para el manejo de información masiva.
*/

CREATE TABLE StudentsC1(
    StudentID		INT
    ,StudentName	VARCHAR(50)
    ,StudentStatus	BIT
);

SELECT * FROM [dbo].[StudentsC1];
SELECT * FROM [dbo].[StudentsC2];

INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero',1)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora',1)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(3,'Rogelio Rojas',0)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(4,'Mariana Rosas',1)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(5,'Roman Zavaleta',1)

CREATE TABLE StudentsC2(
    StudentID		INT
    ,StudentName	VARCHAR(50)
    ,StudentStatus	BIT
);

INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero Rendón',1)
INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora Ríos',0)
INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(6,'Mario Gonzalez Pae',1)
INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(7,'Alberto García Morales',1)



SELECT * FROM StudentsC1
SELECT * FROM StudentsC2


MERGE StudentsC1 AS [tgt]
USING
(
	SELECT
		[s].[StudentID]
		,[s].[StudentName]
		,[s].[StudentStatus]
	FROM 
		StudentsC2 AS [s]
) AS [src]
ON
(
	[src].[StudentID] = [tgt].[StudentID]
)
-- For updates
WHEN MATCHED THEN
	UPDATE 
		SET
			[tgt].[StudentName] = [src].[StudentName]
			,[tgt].[StudentStatus] = [src].[StudentStatus]
-- For Inserts
WHEN NOT MATCHED THEN
	INSERT
	(
		[StudentID], [StudentName], [StudentStatus]
	)
	VALUES
	(
		[src].[StudentID], [src].[StudentName], [src].[StudentStatus]

	);
	

/*
MERGE INTO <target table> AS TGT 
USING <SOURCE TABLE> AS SRC   
	ON <merge predicate> 
WHEN MATCHED [AND <predicate>] -- two clauses allowed:   
	THEN <action> -- one with UPDATE one with DELETE 
WHEN NOT MATCHED [BY TARGET] [AND <predicate>] -- one clause allowed:   
	THEN INSERT... –- if indicated, action must be INSERT 
WHEN NOT MATCHED BY SOURCE [AND <predicate>] -- two clauses allowed:   
	THEN <action>; -- one with UPDATE one with DELETE
*/

CREATE TABLE Purchasing.Vendor_Temp
(
	[BusinessEntityID]		INT				NOT NULL
	,[AccountNumber]		NVARCHAR(15)	NOT NULL
	,[Name]					NVARCHAR(50)	NOT NULL
	,[CreditRating]			TINYINT			NOT NULL
	,[PreferredVendorStatus]BIT				NOT NULL
	,[ActiveFlag]			BIT				NOT NULL
)

SELECT MAX([BusinessEntityID]) FROM [Purchasing].[Vendor]

SELECT * FROM [Purchasing].[Vendor]

INSERT INTO Purchasing.Vendor_Temp
	([BusinessEntityID],[AccountNumber], [Name], [CreditRating], [PreferredVendorStatus], [ActiveFlag])
VALUES
	(1699, 'ADVANCED0001', 'Advanced Bicycles', 5, 1, 0)
	,(1700,'MORGANB0001', 'Morgan Bike Accessories', 5, 1, 0)
	,(1701,'MBMEX001', 'Mundo Binario México', 1, 1, 1)
	,(1702,'MBCOL001', 'Mundo Binario Colombia', 1, 1, 1)
	,(1703,'MBARG001', 'Mundo Binario Argentina', 1, 1, 1)
	,(1704,'MBPER001', 'Mundo Binario Perú', 1, 1, 1)


SELECT * FROM Purchasing.Vendor_Temp
SELECT * FROM Purchasing.Vendor





MERGE [Purchasing].[Vendor] AS [tgt]
USING
(
	SELECT
		[vt].[BusinessEntityID]
		,[vt].[AccountNumber]
		,[vt].[Name]
		,[vt].[CreditRating]
		,[vt].[PreferredVendorStatus]
		,[vt].[ActiveFlag]
	FROM 
		Purchasing.Vendor_Temp AS [vt]
) AS [src]
ON
(
	[src].[AccountNumber] = [tgt].[AccountNumber]
)
WHEN MATCHED THEN
	UPDATE 
		SET
			[tgt].[Name] = [src].[Name]
			,[tgt].[CreditRating] = [src].[CreditRating]
			,[tgt].[PreferredVendorStatus] = [src].[PreferredVendorStatus]
			,[tgt].[ActiveFlag] = [src].[ActiveFlag]
			,[tgt].[ModifiedDate] = GETDATE()
WHEN NOT MATCHED THEN
	INSERT
	(
		[BusinessEntityID]
		,[AccountNumber]
		,[Name]
		,[CreditRating]
		,[PreferredVendorStatus]
		,[ActiveFlag]
		,[PurchasingWebServiceURL]
		,[ModifiedDate]
	)
	VALUES
	(
		[src].[BusinessEntityID]
		,[src].[AccountNumber]
		,[src].[Name]
		,[src].[CreditRating]
		,[src].[PreferredVendorStatus]
		,[src].[ActiveFlag]
		,NULL
		,GETDATE()
	);

SELECT * FROM [Purchasing].[Vendor]
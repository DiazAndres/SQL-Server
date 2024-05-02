/*
	Lesson #36 - Global and Local Tables
*/

--Local se crea con un #
--Global con doble ##

IF OBJECT_ID('tempdb..#Location_temp') IS NOT NULL
	BEGIN 
		DROP TABLE #Location_temp
	END


CREATE TABLE #Location_temp
(
	[LocationID]			SMALLINT		NOT NULL
	,[Name]					NVARCHAR(50)	NOT NULL
	,[CostRate]				SMALLMONEY		NOT NULL
	,[Availability]			DECIMAL(8,2)	NOT NULL
	,[ModifiedDate]			DATETIME		NOT NULL
);


INSERT INTO #Location_temp
SELECT 
	 [LocationID]
	,[NAME]
	,[CostRate]
	,[Availability]
	,[ModifiedDate]
FROM 
	[Production].[Location]
WHERE
	[CostRate] = 0



SELECT * FROM [Production].[Location]
SELECT * FROM #Location_temp

-- Se puden hacer delete, update a la tabla local
UPDATE #Location_temp
SET CostRate = 5
WHERE LocationID IN (6,7)

DELETE FROM #Location_temp
WHERE LocationID = 4
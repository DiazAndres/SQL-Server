/*
	Lesson #43 - ROW_NUMBER, RANK, DENSE_RANK, NTILE
*/

-- ROW_NUMBER incremental consecutivo que sirve para saber el número de la fila
-- RANK le pone un número consecutivo ordenando el campo, en dado caso de que haya iguales, se salta el siguiente número
-- Ejemplo: 1, 2, 3, 4, 5, 6, 6, 8
-- DENSE_RANK es lo mismo que rank solo que no se salta numeros, mantiene la numeración 
-- Ejemplo: 1, 2, 3, 4, 5, 6, 6, 7
-- NTILE(<number>) particiona dependiendo del parametro

SELECT
	 [SalesOrderID]
	,[CustomerID]
	,[TaxAmt]
	,ROW_NUMBER()	OVER(ORDER BY TaxAmt ASC)	AS RowNumber
	,RANK()			OVER(ORDER BY TaxAmt ASC)	AS rnk
	,DENSE_RANK()	OVER(ORDER BY TaxAmt ASC)	AS densernk
	,NTILE(2)		OVER(ORDER BY TaxAmt ASC)	AS [ntile]
FROM
	[Sales].[SalesOrderHeader]
WHERE
	CustomerID = 29869



SELECT
	 BusinessEntityID
	,LoginID
	,Gender
	,VacationHours
	,NTILE(2)	OVER(ORDER BY VacationHours)	AS [ntile]
FROM
	[HumanResources].[Employee]




;WITH CTEVacations
AS
(
	SELECT 
		 BusinessEntityID
		,LoginID
		,JobTitle
		,OrganizationLevel
		,VacationHours
		,DENSE_RANK()	OVER(ORDER BY OrgatizationLevel ASC) AS [Group]
		,DENSE_RANK()	OVER(PARTITION BY OrganizationLevel ORDER BY VacationsHours DESC) AS [Position]
	FROM
		[HumanResources].[Employee]
	WHERE
		[Gender] = 'M' AND [VacationHours] > 0
)

SELECT *
FROM CTEVacations
WHERE [Position] = 3
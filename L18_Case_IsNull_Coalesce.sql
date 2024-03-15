/*
	Lesson #18 - CASE, ISNULL, COALESCE en SQL Server
*/

--CASE
--	WHEN <EXP1> IS NOT NULL THEN
--		<EXP1>
--	WHEN <EXP2> IS NOT NULL THEN
--		<EXP2>
--	...
--	WHEN <EXPn> IS NOT NULL THEN
--		<EXPn>
--	ELSE
--		NULL
--END

SELECT 
	CASE
		WHEN (1=2) THEN
			'TRUE'
		ELSE
			'FALSE'
	END AS 'CASE';



SELECT 
	 [pod].[ProductID]
	,[pod].[UnitPrice]
	,CASE
		WHEN [pod].[UnitPrice] <= 25 THEN
			'LOWER'
		WHEN [pod].[UnitPrice] > 25 AND [pod].[UnitPrice] <= 40 THEN
			'MEDIUM'
		WHEN [pod].[UnitPrice] > 40 AND [pod].[UnitPrice] <= 60 THEN
			'HIGH'
		ELSE
			'OUT RANGE'
	END AS 'Status'
FROM 
	[Purchasing].[PurchaseOrderDetail] AS [pod];


-- IS NULL ES COMO UN NVL DE ORACLE
SELECT 
	 [v].[AccountNumber]
	,[v].[Name]
	,ISNULL([v].[PurchasingWebServiceURL], 'NO URL') AS 'ISNULL'
FROM
	[Purchasing].[Vendor] AS [v]


/*
COALESCE DE ACUERDO CON LOS PARAMETROS, VALIDA SI LOS VALORES SON NULL
SI EL PRIMERO ES NULL, VA CON EL SEGUNDO Y ASÍ SUCESIVAMENTE HASTA
ENCONTRAR UNO QUE NO LO SEA, EN DADO CASO QUE TODOS SEAN NULOS Y 
EXISTA UN CASO BASE, PONE EL CASO BASE, DE LO CONTRARIO SI NO EXISTE 
CASO BASE, IMPRIME UN NULL
*/

DECLARE @x AS VARCHAR(3) = NULL
		,@y AS VARCHAR(10) = '1234567890';

SELECT COALESCE(@x,@y) AS [COALESCE]
		,ISNULL(@x,@y) AS [ISNULL]

/*
    COALESCE IMPRIME @y, de forma completa
    Mientras que ISNULL imprime la cantidad de caracteres que esta declarado en la variable @x, es decir imprime 123
*/

SELECT 
	 [p].[ProductID]
	,[p].[Name]
	,[p].[Size]
	,[p].[SizeUnitMeasureCode]
	,[p].[WeightUnitMeasureCode]
	,[p].[Weight]
	,COALESCE([p].[Size], 'EMPTY') AS SIZE
	,COALESCE([p].[Size], [p].[SizeUnitMeasureCode], [p].[WeightUnitMeasureCode]) AS SIZE
FROM
	[Production].[Product] AS [p]
WHERE
	[p].[ProductID] IN (827,830) 

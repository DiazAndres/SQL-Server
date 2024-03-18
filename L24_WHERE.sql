/*
	Lesson #24 - WHERE
*/
--Cláusula WHERE to filter rows

--A. Finding a row by using a simple equality
SELECT 
	*
FROM
	[Sales].[Store]
WHERE
	[BusinessEntityID] = 304


--B. Finding rows that contain a value as part of a string
SELECT 
	*
FROM
	[Sales].[Store]
WHERE
	[Name] LIKE '%Bikes%'



--C. Finding rows by using a comparison operator
SELECT
	*
FROM
	[Purchasing].[PurchaseOrderHeader]
WHERE
	[TaxAmt] >= 1000 AND YEAR([OrderDate]) = 2011


--D. Finding rows that meet any of three conditions
SELECT
	*
FROM
	[Purchasing].[Vendor]
WHERE
	   [CreditRating] = 1 
	OR [ActiveFlag] = 1 
	OR [AccountNumber] LIKE 'W%'



--E. Finding rows that must meet several conditions
SELECT
	*
FROM
	[Purchasing].[Vendor]
WHERE
	    [CreditRating] = 1 
	AND [ActiveFlag] = 1 
	AND [AccountNumber] LIKE 'W%'


--F. Finding rows that are in a list of values
SELECT 
	*
FROM
	[Person].[Person]
WHERE
	    [FirstName] IN ('Ken','Michael','Gail')
	AND [LastName] IN ('Martinez','Patten')



--G. Finding rows that have a value between two values
SELECT 
	*
FROM 
	[Sales].[SalesOrderDetail]
WHERE
	[UnitPrice] BETWEEN 500 AND 600


--H. Finding rows of multiple JOINS
SELECT
	 [soh].[SalesOrderNumber]
	,[soh].[OrderDate]
	,[soh].[TerritoryID]
	,[st].[Name]
	,[st].[CountryRegionCode]
	,[cr].[Name]
	,[soh].[ShipMethodID]
	,[sm].[Name]
	,[sm].[ShipRate]
	,[soh].[TotalDue]
FROM
	[Sales].[SalesOrderHeader] AS [soh]
	INNER JOIN [Sales].[SalesTerritory] AS [st]
		ON [st].[TerritoryID] = [soh].[TerritoryID]
	INNER JOIN [Person].[CountryRegion] AS [cr]
		ON [st].CountryRegionCode = [cr].[CountryRegionCode]
	INNER JOIN [Purchasing].[ShipMethod] AS [sm]
		ON [soh].[ShipMethodID] = [sm].[ShipMethodID]
WHERE
	(
		    [sm].[ShipRate] >= 1.49
		AND [st].[CountryRegionCode] = 'CA'
		AND [soh].[TotalDue] BETWEEN 1000 AND 5000
		AND [soh].[OrderDate] >= '2014-01-01'
	)
	OR
	(
		    [st].[CountryRegionCode] = 'US'
		AND [soh].[TerritoryID] NOT IN (4,3)
	)
ORDER BY
	[st].[CountryRegionCode] ASC


--I. Filtering rows by using condition to update rows
SELECT 
	 ListPrice + (ListPrice *.010)	AS 'New Price'
	,ListPrice						AS 'Old Price'
FROM
	[Production].[Product]
WHERE
	[ProductNumber] LIKE 'BK-%'

UPDATE [Production].[Product]
SET ListPrice = ListPrice + (ListPrice *.010)
WHERE [ProductNumber] LIKE 'BK-%'



--J. Filtering rows by using condition to delete rows
SELECT 
	*
FROM
	[Sales].[Currency]
WHERE
	[CurrencyCode] IN ('AED','AFA')


DELETE FROM 
	[Sales].[Currency]
WHERE 
	[CurrencyCode] IN ('AED','AFA')
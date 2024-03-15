/*
	Lesson #20 - RowCount, Compress, Decompress y Session Context en SQL Server
*/

/*
1.- The @@ROWCOUNT and ROWCOUNT_BIG functions
The @@ROWCOUNT function is a very popular function that returns the number of rows affected
by the last statement that you executed. It´s very common to use it to check if the previous
statement affected any rows by checking	that the function´s result is zero or greater than zero.
For example, the following code queries the input employee row, and prints a message if the 
requested employee was not found:
ROWCOUNT_BIG
*/

SELECT
	*
FROM
	[Production].[Product]
WHERE
	[Name] LIKE '%chaQW%'

--SELECT @@ROWCOUNT


IF @@ROWCOUNT >= 1
BEGIN
	SELECT
		*
	FROM
		[Production].[Product]
	WHERE
		[Name] LIKE '%cha%' AND [Color] = 'Silver'

	SELECT @@ROWCOUNT
END
ELSE
BEGIN
	SELECT 'NO DATA'
END

SELECT * FROM [Production].[Location]

UPDATE [Production].[Location]
SET
	[Availability] = 10
WHERE
	[LocationID] IN (1,2,100)

SELECT @@ROWCOUNT
-- RESULT 3 BECAUSE LOCATION_ID 100 DOESN´T EXIST


--2.- Compression function
SELECT COMPRESS('SQL Server') AS Compressed_Value

SELECT DECOMPRESS(0x1F8B08000000000004000B0EF451084E2D2A4B2D0200559F0C890A000000) AS Decompressed_Value

SELECT CAST(DECOMPRESS(0x1F8B08000000000004000B0EF451084E2D2A4B2D0200559F0C890A000000)
AS VARCHAR(MAX)) AS Decompressed_cast_value

/*
3.- SESSION_CONTEXT

Returns the value of the specified key in the current session context
The value is set by using the sp_set_session_context

sp_set_session_context [@key= ] N'key', [@value= ] 'value',
[@read_only = ] {0 | 1 }

	@key: It is the key that we set. It is of SYSNAME type and can be up to 256 bytes
	@value: It is a value for the specified key. Its type is sql_variant. Its maximum size is 8,000 bytes
	@read_only: We can specify value for this flag as 0,1
		1: We cannot change the key in the logical connection
		0: We can change the key value if read_onlu is set to zero
*/

EXEC SP_SET_SESSION_CONTEXT 'BusinessEntityID', 15

SELECT SESSION_CONTEXT(N'BusinessEntityID') AS BusinessEntityID

SELECT 
	* 
FROM 
	[Person].[Person]
WHERE [BusinessEntityID] = SESSION_CONTEXT(N'BusinessEntityID')


DECLARE @BusinessEntityID AS INT = 15

SELECT 
	* 
FROM 
	[Person].[Person]
WHERE [BusinessEntityID] = @BusinessEntityID


EXEC SP_SET_SESSION_CONTEXT 'CustomerID', 2
SELECT SESSION_CONTEXT(N'CustomerID') AS CustomerID
/*
It clearly shows that the SQL Server session context function SESSION_CONTEXT()
function requires a NVARCHAR data type for its key
*/


EXEC SP_SET_SESSION_CONTEXT @key='EmployeeID', @value=10

SELECT SESSION_CONTEXT(N'CustomerID') AS CustomerID
SELECT SESSION_CONTEXT(N'BusinessEntityID') AS BusinessEntityID


SELECT 
	* 
FROM 
	[Sales].[Customer]
WHERE [CustomerID] = SESSION_CONTEXT(N'CustomerID')


/*Only works in the current session - SESSION_CONTEXT*/
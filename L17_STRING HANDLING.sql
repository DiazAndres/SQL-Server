/*
	Lección 17 - Manejo de cadenas LEN, LEFT, RIGHT, UPPER, LOWER, ETC
*/

--1. LENGHT

SELECT SUBSTRING('SQL SERVER DESDE CERO',	5,	6)	AS 'EXTRACCIÓN';


SELECT 
	SUBSTRING([employee_positionName], 1, 5) AS 'EXTRACCIÓN'
FROM
	[dbo].[Employees];

SELECT LEFT('123456ASD789', 5);

SELECT RIGHT('123456ASD789', 3);

SELECT LEN('SQL SERVER') AS 'SIZE';
SELECT LEN(123456789) AS 'SIZE';


--2. ALTERATION
SELECT REPLACE('SQL SERVER','SQL', 'ORACLE') AS 'REPLACE FUNCTION';

SELECT REPLACE([measure_description],'Pieza', 'Nueva medida') FROM [dbo].[Measures];

SELECT REPLICATE('ANDRES ', 3)	AS 'REPLICATE FUNCTION';

SELECT CHARINDEX('@', 'mundobinario@gmail.com'/*,14*/);

SELECT STUFF('mundobinario@gmail.com', 1, CHARINDEX('@', 'mundobinario@gmail.com') -1, 'confidencial')


-- 3. Formating
SELECT LOWER([employee_name]) AS 'MINUSCULAS' FROM [dbo].[Employees];

SELECT UPPER([employee_name]) AS 'MAYUSCULAS' FROM [dbo].[Employees];

SELECT LTRIM('  ANDRES DIAZ')	AS 'LEFT TRIM';
SELECT RTRIM('  ANDRES DIAZ')	AS 'RIGHT TRIM';
SELECT TRIM('  ANDRES DIAZ')	AS 'TRIM';

SELECT '*' + LTRIM('  ANDRES DIAZ  ') + '*';
SELECT '*' + RTRIM('  ANDRES DIAZ  ') + '*';
SELECT '*' + TRIM('  ANDRES DIAZ  ') + '*';
SELECT '*' + REPLACE('  ANDRES DIAZ  ', ' ', '') + '*';


SELECT FORMAT([employee_id], 'D5') AS 'FORMAT FUNCTION'FROM [dbo].[Employees] 


-- 4. SPLITTING
-- ARRAY DE COSAS, SEPARADOR
SELECT VALUE AS 'RETURN LIST' FROM string_split('PIÑA,MANZANA,PERA,UVA,SANDIA', ',');

SELECT compatibility_level 
FROM SYS.databases WHERE name = 'MundoBinario';

--CAMBIAR COMPATIBILIDAD 
ALTER DATABASE <DB_NAME>
SET COMPABILITY_LEVEL = 130
GO
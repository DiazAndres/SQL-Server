/*
	Lesson #21 - GUID
*/

/*
GUID and identity functions
Esta herramienta denominada GUID es un tipo de datos binarios de SQL Server de 16 bytes
que es globalmente único en tablas, bases de datos y servidores. El término GUID significa 
Globally Unique Identifier y se usa indistintamente con UNIQUEIDENTIFIER
*/


SELECT NEWID() AS myguid
--FD3EEFDE-5D90-45F7-AA44-343339831ED5
--BB1BAD4C-7DA1-49E4-A7C8-247C21CDF1CC
--Siempre trae uno diferente

DECLARE @Identifier UNIQUEIDENTIFIER
SET @Identifier = NEWID()

SELECT @Identifier




--AdventureWorks2017
CREATE TABLE Courses
(
	 CourseID	UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID()
	,CourseName	VARCHAR(50)
)


INSERT INTO Courses VALUES (default,'SQL Server')
INSERT INTO Courses VALUES (default,'App Sheet')


SELECT * FROM Courses

INSERT INTO Courses (CourseName) VALUES ('Arduino')

--En el insert es necesario indicar el default o en dado caso, indicar la columna a afectar
--sin indicar el UniqueIdentifier


CREATE TABLE Courses2
(
	 CourseID	UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID()
	,CourseName	VARCHAR(50)
)


INSERT INTO Courses2 VALUES (default,'SQL Server')
INSERT INTO Courses2 (CourseName) VALUES ('App Sheet')
INSERT INTO Courses2 (CourseName) VALUES ('App Inventor')

SELECT * FROM Courses2



INSERT INTO Measures VALUES ('T','Test')
SELECT SCOPE_IDENTITY()

INSERT INTO Measures VALUES ('T','Test')
SELECT @@IDENTITY

/*
@@IDENTITY: devuelve el último ID en la misma conexión

Scope_identity(): la que recomendamos, devuelve el último ID creado en la misma conexión 
y el mismo contexto (de ahí su nombre). En este caso el contexto se refiere a la consulta
o procedimiento almacenado actual

*/
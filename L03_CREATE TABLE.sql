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
USE ICSIT;

IF OBJECT_ID('dbo.Basket', 'U') IS NOT NULL
BEGIN
	ALTER TABLE dbo.Basket
		DROP CONSTRAINT FK_SKU, CONSTRAINT FK_Family;
	DROP TABLE dbo.Basket;
END;
IF OBJECT_ID('dbo.SKU', 'U') IS NOT NULL DROP TABLE dbo.SKU;
IF OBJECT_ID('dbo.Family', 'U') IS NOT NULL DROP TABLE dbo.Family;

CREATE TABLE dbo.SKU
(
	ID		INT				NOT NULL 
		IDENTITY(1, 1) 
		CONSTRAINT PK_SKU  PRIMARY KEY,
	Code AS 's' + CAST(ID AS VARCHAR) 
		CONSTRAINT UNQ_Code UNIQUE(Code),
	Name	VARCHAR(255)	NOT NULL
);

CREATE TABLE dbo.Family
(
	ID			INT				NOT NULL 
		IDENTITY(1, 1) 
		CONSTRAINT PK_Family  PRIMARY KEY,
	SurName		VARCHAR(255)	NOT NULL,
	BudgetValue DECIMAL(18, 2)	NOT NULL
);

CREATE TABLE dbo.Basket
(
	ID				INT				NOT NULL 
		IDENTITY(1, 1) 
		CONSTRAINT PK_Basket  PRIMARY KEY,
	ID_SKU			INT				NOT NULL 
		CONSTRAINT FK_SKU FOREIGN KEY(ID_SKU) 
		REFERENCES dbo.SKU(ID),
	ID_Family		INT				NOT NULL 
		CONSTRAINT FK_Family FOREIGN KEY(ID_Family) 
		REFERENCES dbo.Family(ID),
	Quantity		INT				NOT NULL 
		CONSTRAINT CHK_Quantity CHECK(Quantity >= 0),
	Value			DECIMAL(10, 2)	NOT NULL 
		CONSTRAINT CHK_Value CHECK(Value >= 0),
	PurchaseDate	DATETIME		NOT NULL 
		CONSTRAINT DFT_PurchaseDate DEFAULT(GETDATE()),
	DiscountValue	DECIMAL(10, 2)	NOT NULL
		CONSTRAINT DFT_DiscountValue DEFAULT 0
);


INSERT INTO dbo.Family(SurName, BudgetValue)
VALUES
	('�������', 50000),
	('������', 100000),
	('��������', 100000),
	('������', 87500),
	('�������', 1000000);

INSERT INTO dbo.SKU(Name)
VALUES
	('product1'),
	('product2'),
	('product3');
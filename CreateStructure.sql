use ICSIT;

if object_id('dbo.Basket') is null
begin
	-- Продукт
	create table dbo.SKU
	(
		ID int not null identity(1, 1),
		Code as 's' + cast(ID as varchar(5)),
		[Name]	varchar(255) not null,
		constraint PK_SKU primary key (ID),
		constraint UK_SKU_Code unique (Code)
	)

	-- Семья
	create table dbo.Family
	(
		ID int not null identity(1, 1),
		SurName varchar(255) not null,
		BudgetValue decimal(18, 2) not null,
		constraint PK_Family primary key (ID)
	)

	-- Продуктовая корзина семьи
	create table dbo.Basket
	(
		ID int not null identity(1, 1),
		ID_SKU int not null,
		ID_Family int not null,
		Quantity int not null,
		[Value]	decimal(10, 2) not null,
		PurchaseDate datetime not null,
		DiscountValue decimal(10, 2) not null,
		constraint PK_Basket primary key (ID),
		constraint FK_Basket_ID_SKU_SKU foreign key (ID_SKU) references dbo.SKU(ID),
		constraint FK_Basket_ID_Famliy_Family foreign key (ID_Family) references dbo.Family(ID),
		constraint CK_Basket_Quantity check (Quantity >= 0),
		constraint CK_Basket_Value check ([Value] >= 0),
		constraint DF_Basket_PurchaseDate default getdate() for PurchaseDate,
		constraint DF_Basket_DiscountValue default 0 for DiscountValue
	)

	insert into dbo.Family (SurName, BudgetValue)
	values
		('Ивановы', 50000)
		,('Речныш', 100000)
		,('Даниловы', 100000)
		,('Пушины', 87500)
		,('Пентины', 1000000)

	insert into dbo.SKU ([Name])
	values
		('product1')
		,('product2')
		,('product3')
end
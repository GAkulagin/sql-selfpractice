use ICSIT;

if object_id('dbo.Basket') is not null
begin
	insert into dbo.Basket (ID_SKU, ID_Family, Quantity, [Value])
	values
		(1, 1, 3, 100)
		,(2, 1, 10, 566.32)
		,(1, 3, 1, 33)
end
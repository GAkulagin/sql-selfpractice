create or alter view SKUPrice_VW 
as
	select 
		ID
		,Code
		,[Name]
		,ICSIT.dbo.GetSKUPrice(ID) as Price
	from ICSIT.dbo.SKU
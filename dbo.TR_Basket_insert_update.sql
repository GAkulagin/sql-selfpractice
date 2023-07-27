create or alter trigger Basket_INS_UPD on ICSIT.dbo.Basket
after insert, update
as
	update ICSIT.dbo.Basket
	set DiscountValue = [Value] * 0.05
	where ID_SKU in (
		select ID_SKU
		from inserted
		group by ID_SKU
		having count(ID_SKU) >= 2
	)
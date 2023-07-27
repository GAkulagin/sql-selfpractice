use ICSIT;

go

create or alter procedure usp_MakeFamilyPurchase 
	@FamilySurName varchar(255)
as
	update dbo.Family
	set BudgetValue -= (select sum(Value)
						from dbo.Basket as b
						inner join dbo.Family as f on f.ID = b.ID_Family
						where f.SurName = @FamilySurName)
	where SurName = @FamilySurName
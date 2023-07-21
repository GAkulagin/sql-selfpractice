USE ICSIT;

GO

CREATE PROCEDURE usp_MakeFamilyPurchase
	@FamilySurName VARCHAR(255)
AS
UPDATE dbo.Family
SET BudgetValue -= (SELECT SUM(Value)
					FROM dbo.Basket AS B
					JOIN dbo.Family AS F ON F.ID = B.ID_Family
					WHERE F.SurName = @FamilySurName)
WHERE SurName = @FamilySurName;
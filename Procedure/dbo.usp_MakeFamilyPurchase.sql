-- Создание процедуры "dbo.usp_MakeFamilyPurchase"
create procedure dbo.usp_MakeFamilyPurchase(
    @FamilySurName varchar(255)
    ,@FamilyID int
    ,@PurchaseAmount decimal(18, 2)
)
as
begin
    if @FamilyID is null
    begin
        raiseerror('Такой семьи не существует', 16, 1)

        return
    end

    if @PurchaseAmount is null
    begin
        raiseerror('Сумма покупок для данной семьи не может быть рассчитана', 16, 1)

        return
    end

    update f
    set BudgetValue = BudgetValue - @PurchaseAmount
    where ID = @FamilyID
        and BudgetValue - @PurchaseAmount >= 0
end
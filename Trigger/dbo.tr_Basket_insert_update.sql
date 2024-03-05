-- Создание триггера "dbo.tr_Basket_insert_update"
create trigger dbo.tr_Basket_insert_update
on dbo.Basket
after insert, update
as
begin
    update b
    set DiscountValue =
        case
            when qty.count >= 2
                    and coalesce(b.DiscountValue, 0) = 0
                then value * 0.05
            else coalesce(b.DiscountValue, 0)
        end
        from dbo.Basket as b
            inner join (
                select
                    ID_SKU
                    ,count(*) as count
                from inserted
                group by ID_SKU
            ) as qty on b.ID_SKU = qty.ID_SKU
end
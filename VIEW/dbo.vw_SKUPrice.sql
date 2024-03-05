-- Создание представления "dbo.vw_SKUPrice"
create view dbo.vw_SKUPrice
as
select
    s.*
    ,dbo.udf_GetSKUPrice(SKU.ID) as UnitPrice
from dbo.SKU as s
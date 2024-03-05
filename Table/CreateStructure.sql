-- Создание таблиц "dbo.SKU"
if object_id('dbo.SKU') is null
begin
    create table dbo.SKU (
        ID int identity primary key,
        Code as 's' + cast(ID as varchar(10)) not null,
        Name varchar(255) not null,
        MDT_DateCreate datetime not null default getdate(),
        MDT_ID_PrincipalCreatedBy int not null,
        constraint UQ_Code unique (Code)
    )
    alter table dbo.SKU add constraint UQ_Code unique (Code)
end

-- Создание таблиц "dbo.Family"
if object_id('dbo.Family') is null
    begin
    create table dbo.Family (
        ID int identity primary key,
        SurName varchar(255) not null,
        BudgetValue decimal(18, 2),
        MDT_DateCreate datetime not null default getdate(),
        MDT_ID_PrincipalCreatedBy int not null
    )
end

-- Создание таблиц "dbo.Basket"
if object_id('dbo.Basket') is null
begin
    create table dbo.Basket (
        ID int identity primary key,
        ID_SKU int foreign key references dbo.SKU(ID),
        ID_Family int foreign key references dbo.Family(ID),
        Quantity int not null,
        value decimal(18, 2),
        PurchaseDate date default getdate(),
        DiscountValue decimal(18, 2),
        constraint CK_Quantity check (Quantity >= 0),
        constraint CK_Value check (value >= 0),
        MDT_DateCreate datetime not null default getdate(),
        MDT_ID_PrincipalCreatedBy int not null
    )
end
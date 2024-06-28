-- (1)

CREATE VIEW View_CustomerWithoutMaritalStatus
AS
SELECT 
    CustomerKey, 
    FirstName, 
    LastName, 
    MiddleName, 
    NameStyle, 
    BirthDate, 
    Gender, 
    EmailAddress, 
    YearlyIncome, 
    TotalChildren, 
    NumberChildrenAtHome, 
    EnglishEducation, 
    EnglishOccupation, 
    HouseOwnerFlag, 
    NumberCarsOwned
FROM 
    DimCustomer;

-- (2)

CREATE VIEW View_ProductAndSubcategory
AS
SELECT p.ProductKey,
       p.ProductAlternateKey,
       p.ProductSubcategoryKey,
       p.ProductName,
       p.Color,
       p.Size,
       p.Weight,
       p.ListPrice,
       p.DiscontinuedDate,
       ps.ProductSubcategoryName
FROM DimProduct p
JOIN DimProductSubcategory ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey;

-- (3)

CREATE VIEW View_SalesSummaryByCustomer
AS
SELECT 
    CustomerKey,
    COUNT(*) AS TotalOrders,
    SUM(SalesAmount) AS TotalSalesAmount
FROM 
    FactResellerSales
GROUP BY 
    CustomerKey;

-- (4)
CREATE VIEW View_SalesSummaryByDate
AS
SELECT 
    OrderDateKey,
    COUNT(*) AS TotalOrders,
    SUM(SalesAmount) AS TotalSalesAmount
FROM 
    FactResellerSales
GROUP BY 
    OrderDateKey;


-- (5)

CREATE VIEW View_SalesOrderInfo
AS
SELECT 
    SalesOrderNumber,
    OrderDate,
    DueDate,
    ShipDate
FROM 
    FactResellerSales;

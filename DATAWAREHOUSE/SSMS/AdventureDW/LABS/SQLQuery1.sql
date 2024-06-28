-- (1)
select * from DimCustomer;

-- (2)
select (FirstName + ' ' + MiddleName + ' ' + LastName) as "CustomerName", Gender, MaritalStatus 
from DimCustomer;

select 
	ISNULL(FirstName + ' ', ' ') + ISNULL(MiddleName + ' ', ' ') + ISNULL(LastName + ' ', ' ') as "CustomerName",
	Gender, MaritalStatus
from 
	DimCustomer;

-- (3)
select YEAR(OrderDate) as OrderYear, SUM(SalesAmount) as TotalSales
from FactInternetSales
Group BY YEAR(OrderDate);

-- (4)
select TOP 10 ProductKey, SUM(SalesAmount) AS TotalSales
from FactInternetSales
Group By ProductKey
Order By TotalSales DESC;

-- (5)
select top 10 FirstName, LastName, SUM(SalesAmount) as TotalSalesAmount
from FactInternetSales
INNER JOIN DimCustomer ON FactInternetSales.Customerkey = DimCustomer.CustomerKey
GROUP BY FirstName, LastName 
ORDER BY TotalSalesAmount DESC;

-- (6) 
select DATEPART(YEAR, OrderDate) as SalesYear, DATEPART(QUARTER, OrderDate) as SalesQuarter, COUNT(*) AS NumTransactions
from FactInternetSales
Group By DatePart(YEAR, OrderDate), DATEPART(QUARTER, OrderDate);


-- (7)

SELECT dc.EnglishProductCategoryName, SUM(fs.SalesAmount)
AS TotalSales
FROM dbo.FactInternetSales AS fs
INNER JOIN dbo.DimProduct AS dp ON fs.ProductKey =
dp.ProductKey
INNER JOIN dbo.DimProductSubcategory AS dsc ON
dp.ProductSubcategoryKey = dsc.ProductSubcategoryKey
INNER JOIN dbo.DimProductCategory AS dc ON
dsc.ProductCategoryKey = dc.ProductCategoryKey
GROUP BY dc.EnglishProductCategoryName
ORDER BY TotalSales DESC;

-- (8)
SELECT TOP 10 dc.FirstName, dc.LastName, SUM(fs.SalesAmount) AS TotalSales
FROM dbo.FactInternetSales AS fs
INNER JOIN dbo.DimCustomer AS dc ON fs.CustomerKey = dc.CustomerKey
GROUP BY dc.FirstName, dc.LastName
ORDER BY TotalSales DESC;

-- (9)
SELECT st.SalesTerritoryAlternateKey, SUM(rs.SalesAmount) AS TotalSales
FROM dbo.FactResellerSales AS rs
INNER JOIN dbo.DimSalesTerritory AS st ON rs.SalesTerritoryKey =
st.SalesTerritoryKey
GROUP BY st.SalesTerritoryAlternateKey
ORDER BY TotalSales DESC;

-- (10)
SELECT dp.EnglishProductName, SUM(fs.SalesAmount) AS TotalSales
FROM dbo.FactInternetSales AS fs
INNER JOIN dbo.DimProduct AS dp ON fs.ProductKey = dp.ProductKey
GROUP BY dp.EnglishProductName
ORDER BY TotalSales DESC;




--                            Lab Tasks

select 
	DATEPART(YEAR, OrderDate) as SalesYear, DATEPART(QUARTER, OrderDate) as QuarterSales, SUM(SalesAmount) as TotalSales
from 
	FactInternetSales
group by 
	DATEPART(YEAR, OrderDate),
	DATEPART(QUARTER, OrderDate);


select * from FactInternetSales;

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

select * from DimGeography;
select * from FactInternetSales;
select * from DimSalesTerritory;

-- (2)
select S.SalesTerritoryRegion, SUM(I.SalesAmount) 
from DimSalesTerritory S
INNER JOIN FactInternetSales I ON S.SalesTerritoryKey = I.SalesTerritoryKey 
Group By S.SalesTerritoryRegion;

-- (3)
select G.EnglishCountryRegionName, SUM(I.SalesAmount)  as "TotalSales"
from DimGeography G
INNER JOIN FactInternetSales I ON G.SalesTerritoryKey  = I.SalesTerritoryKey 
Group By G.EnglishCountryRegionName;

-- (4)
select * from DimProduct;
select * from DimProductCategory;

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

select EnglishProductName, ListPrice
from DimProduct;


select COUNT(DISTINCT CustomerKey)  as "Customer"
from DimCustomer;


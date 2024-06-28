SELECT * FROM "DimDate" LIMIT 5;

SELECT * FROM "DimCategory" LIMIT 5;

SELECT * FROM "DimCountry" LIMIT 5;

SELECT * FROM "FactSales" LIMIT 5;



-- (1)

rollback;

SELECT 
    d."year", 
    ct."category", 
    co."country", 
    SUM(fa."amount") AS "Total_Sales",
    GROUPING(d."year") AS "year_grouping",
    GROUPING(ct."category") AS "category_grouping",
    GROUPING(co."country") AS "country_grouping"
FROM 
    public."FactSales" AS fa
JOIN 
    public."DimDate" AS d ON fa."dateid" = d."dateid"
JOIN 
    public."DimCategory" AS ct ON fa."categoryid" = ct."categoryid"
JOIN 
    public."DimCountry" AS co ON fa."countryid" = co."countryid"
GROUP BY 
    GROUPING SETS ((d."year"), (ct."category"), (co."country"))
ORDER BY 
    "year_grouping", "category_grouping", "country_grouping";
	
-- (2)
	
SELECT
    d."year", ct."category", co."country", SUM(fa."amount") AS "Total_Sales",
    GROUPING(d."year") AS "year_grouping",
    GROUPING(ct."category") AS "category_grouping",
    GROUPING(co."country") AS "country_grouping"
FROM
    public."FactSales" as fa
JOIN
    public."DimDate" d ON fa."dateid" = d."dateid"
JOIN
    public."DimCategory" ct on fa."categoryid" = ct."categoryid"
JOIN
    public."DimCountry" co on fa."countryid" = co."countryid"
GROUP BY GROUPING SETS ((d."year"), (ct."category"), (co."country"), (d."year"), (ct."category"), (co."country"))
ORDER BY 1, 2, 3;



-- (3)

WITH Sales_Summary AS (
    SELECT
        d."year",
        ct."category",
        co."country",
        SUM(fa."amount") AS "Total_Sales",
        GROUPING(d."year") AS "year_grouping",
        GROUPING(ct."category") AS "category_grouping",
        GROUPING(co."country") AS "country_grouping",
        AVG(fa."amount") AS "Average_Order_Value"
    FROM
        public."FactSales" as fa
    JOIN
        public."DimDate" d ON fa."dateid" = d."dateid"
    JOIN
        public."DimCategory" ct on fa."categoryid" = ct."categoryid"
    JOIN
        public."DimCountry" co on fa."countryid" = co."countryid"
    GROUP BY GROUPING SETS ((d."year"), (ct."category"), (co."country"), (d."year"), (ct."category"), (co."country"))
)

SELECT *
FROM Sales_Summary
ORDER BY 1, 2, 3;







--- rollup query 

SELECT
    d."year",
    co."country",
    SUM(fa."amount") AS "Total_Sales"
FROM
    public."FactSales" fa
JOIN
    public."DimDate" d ON fa."dateid" = d."dateid"
JOIN
    public."DimCountry" co ON fa."countryid" = co."countryid"
GROUP BY ROLLUP (d."year", co."country")
ORDER BY d."year", co."country";


--- Materialized query view
rollback;
CREATE MATERIALIZED VIEW total_sales_per_country AS
SELECT
    co."country",
    SUM(fa."amount") AS "total_sales"
FROM
    public."FactSales" fa
JOIN
    public."DimCountry" co ON fa."countryid" = co."countryid"
GROUP BY
    co."country"
ORDER BY total_sales DESC;

select * from total_sales_per_country;
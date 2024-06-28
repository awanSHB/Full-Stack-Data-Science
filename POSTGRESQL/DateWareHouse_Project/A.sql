select * from public."DimDate";
-- dateid, date, Year, Quarter, QuarterName, Month, Monthname, Day, Weekday, WeekdayName
select * from public."DimStation";
-- Stationid, City
select * from public."dimTruck";
-- Truckid, TruckType
select * from public."FactTrips";
-- Tripid, Dateid, Stationid, Truckid, Wastecollected

-- Grouping sets

SELECT
    f."Stationid",
    t."TruckType",
    SUM(f."Wastecollected") AS "TotalWasteCollected"
FROM
    public."FactTrips" f
JOIN
    "dimTruck" t ON f."Truckid" = t."Truckid"
GROUP BY
    GROUPING SETS (
        (f."Stationid", t."TruckType"),
        (f."Stationid"),
        (t."TruckType"),
        ()
    );





-- ROLLUP 

SELECT D."Year", S."City", F."Stationid", SUM(F."Wastecollected") as "Total Waste collected"
from public."FactTrips" F 
JOIN public."DimDate" D on F."Dateid" = D."dateid"
JOIN public."DimStation" S on F."Stationid" = S."Stationid"
Group By 
	ROLLUP (D."Year", S."City", F."Stationid");

SELECT 
    D."Year",
    S."City",
    F."Stationid",
    SUM(F."Wastecollected") AS "TotalWasteCollected"
FROM 
    public."FactTrips" F 
JOIN 
    public."DimDate" D ON F."Dateid" = D."dateid"
JOIN 
    public."DimStation" S ON F."Stationid" = S."Stationid"
GROUP BY 
    ROLLUP (D."Year", S."City", F."Stationid");


-- CUBE Query

SELECT
	D."Year",
	S."City",
	F."Stationid",
	AVG(F."Wastecollected") as "AverageWasteCollected"
FROM public."FactTrips" F 
JOIN public."DimDate" D on F."Dateid" = D."dateid"
JOIN public."DimStation" S on F."Stationid" = S."Stationid"
Group By
	CUBE (D."Year", S."City", F."Stationid");



-- MQT (Materialized Query Table)

rollback;
Create MATERIALIZED VIEW max_waste_state AS
SELECT
	S."City",
	F."Stationid",
	dT."TruckType",
	MAX(F."Wastecollected") AS "MaxWasteCollected"
FROM
	public."FactTrips" F
JOIN public."DimStation" S ON F."Stationid" = S."Stationid"
JOIN public."dimTruck" dT ON F."Truckid" = dT."Truckid" 
Group By
	S."City", F."Stationid", dT."TruckType";


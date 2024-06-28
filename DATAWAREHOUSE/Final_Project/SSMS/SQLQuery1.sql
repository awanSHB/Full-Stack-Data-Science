BEGIN TRANSACTION;

CREATE TABLE dbo.DimCustomer
(
    customer_id VARCHAR(10) NOT NULL PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    customer_name VARCHAR(50),
    gender VARCHAR(25)
);

CREATE TABLE dbo.DimCustomerProfile
(
    profile_id VARCHAR(10) NOT NULL PRIMARY KEY,
    month_as_member INT,
    education VARCHAR(25),
    marital_status VARCHAR(25)
);

CREATE TABLE dbo.DimLocation
(
    location_id VARCHAR(10) NOT NULL PRIMARY KEY,
    country VARCHAR(25),
    province_or_state VARCHAR(25),
    city VARCHAR(25),
    location_code VARCHAR(25)
);

CREATE TABLE dbo.DimGeoLocation
(
    geo_loc_id VARCHAR(10) NOT NULL PRIMARY KEY,
    latitude DECIMAL(8, 6),
    longitude DECIMAL(9, 6),
    postal_code VARCHAR(25)
);

CREATE TABLE dbo.DimLoyalty
(
    loyalty_id VARCHAR(10) NOT NULL PRIMARY KEY,
    loyalty_number BIGINT,
    loyalty_status VARCHAR(25),
    loyalty_count BIT
);

CREATE TABLE dbo.DimProduct
(
    product_id VARCHAR(10) NOT NULL PRIMARY KEY,
    product_line VARCHAR(50),
    coupon_response VARCHAR(25)
);

CREATE TABLE dbo.DimTime
(
    time_id VARCHAR(10) NOT NULL PRIMARY KEY,
    order_year INT,
    quarter VARCHAR(3)
);

CREATE TABLE dbo.FactSales
(
    sales_id VARCHAR(10) NOT NULL PRIMARY KEY,
    customer_id VARCHAR(10),
    location_id VARCHAR(10),
    geo_loc_id VARCHAR(10),
    profile_id VARCHAR(10),
    time_id VARCHAR(10),
    product_id VARCHAR(10),
    loyalty_id VARCHAR(10),
    income BIGINT,
    quantity INT,
    unit_sale_price BIGINT,
    unit_cost BIGINT,
    revenue BIGINT,
    customer_lifetime_value DECIMAL(10, 3),
    FOREIGN KEY (customer_id) REFERENCES dbo.DimCustomer(customer_id),
    FOREIGN KEY (location_id) REFERENCES dbo.DimLocation(location_id),
    FOREIGN KEY (geo_loc_id) REFERENCES dbo.DimGeoLocation(geo_loc_id),
    FOREIGN KEY (profile_id) REFERENCES dbo.DimCustomerProfile(profile_id),
    FOREIGN KEY (time_id) REFERENCES dbo.DimTime(time_id),
    FOREIGN KEY (product_id) REFERENCES dbo.DimProduct(product_id),
    FOREIGN KEY (loyalty_id) REFERENCES dbo.DimLoyalty(loyalty_id)
);


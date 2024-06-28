SELECT current_database();

CREATE TABLE IF NOT EXISTS sales_data (
    rowid SERIAL PRIMARY KEY,
    product_id INT,
    customer_id INT,
    price NUMERIC,
    quantity INT,
    timestamp TIMESTAMP
);

commit;


CREATE TABLE Product_Information (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(255),
    Product_Description VARCHAR(255),
    Price DECIMAL(10, 2),
    Quantity_in_Stock INT,
    Manufacturer VARCHAR(255)
);

CREATE TABLE Customer_Information (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Phone_Number VARCHAR(20),
    Email_Address VARCHAR(255),
    Payment_Information VARCHAR(255),
    Shipping_Address VARCHAR(255)
);

CREATE TABLE Order_Information (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Order_Status VARCHAR(255),
    Payment_Status VARCHAR(255),
    Shipping_Method VARCHAR(255),
    Shipping_Address VARCHAR(255),
    Shipping_Cost DECIMAL(10, 2),
    Tax DECIMAL(10, 2),
    Total_Cost DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Information(Customer_ID)
);

CREATE TABLE Order_Item (
    Order_Item_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Unit_Price DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES Order_Information(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product_Information(Product_ID)
);


CREATE TABLE Product_Review (
    Review_ID INT,
    Product_ID INT,
    Customer_ID INT,
    Rating INT,
    Review_Text VARCHAR(255),
    Review_Date DATE,
    FOREIGN KEY (Product_ID) REFERENCES Product_Information(Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Information(Customer_ID)
);





INSERT INTO Product_Information (Product_ID, Product_Name, Product_Description, Price, Quantity_in_Stock, Manufacturer)
VALUES
    (1, 'Product 1', 'Description 1', 10.99, 50, 'Manufacturer A');

INSERT INTO Product_Information (Product_ID, Product_Name, Product_Description, Price, Quantity_in_Stock, Manufacturer)
VALUES
    (2, 'Product 2', 'Description 2', 19.99, 100, 'Manufacturer B');

INSERT INTO Product_Information (Product_ID, Product_Name, Product_Description, Price, Quantity_in_Stock, Manufacturer)
VALUES
    (3, 'Product 3', 'Description 3', 8.99, 30, 'Manufacturer C');

INSERT INTO Product_Information (Product_ID, Product_Name, Product_Description, Price, Quantity_in_Stock, Manufacturer)
VALUES
    (4, 'Product 4', 'Description 4', 15.99, 75, 'Manufacturer A');

INSERT INTO Product_Information (Product_ID, Product_Name, Product_Description, Price, Quantity_in_Stock, Manufacturer)
VALUES
    (5, 'Product 5', 'Description 5', 12.99, 60, 'Manufacturer B');

INSERT INTO Product_Information (Product_ID, Product_Name, Product_Description, Price, Quantity_in_Stock, Manufacturer)
VALUES
    (6, 'Product 6', 'Description 6', 9.99, 45, 'Manufacturer C');

INSERT INTO Product_Information (Product_ID, Product_Name, Product_Description, Price, Quantity_in_Stock, Manufacturer)
VALUES
    (7, 'Product 7', 'Description 7', 14.99, 80, 'Manufacturer A');

INSERT INTO Product_Information (Product_ID, Product_Name, Product_Description, Price, Quantity_in_Stock, Manufacturer)
VALUES
    (8, 'Product 8', 'Description 8', 11.99, 55, 'Manufacturer B');

INSERT INTO Product_Information (Product_ID, Product_Name, Product_Description, Price, Quantity_in_Stock, Manufacturer)
VALUES
    (9, 'Product 9', 'Description 9', 7.99, 40, 'Manufacturer C');

INSERT INTO Product_Information (Product_ID, Product_Name, Product_Description, Price, Quantity_in_Stock, Manufacturer)
VALUES
    (10, 'Product 10', 'Description 10', 13.99, 70, 'Manufacturer A');

-------------Customer_Information

INSERT INTO Customer_Information (Customer_ID, Name, Address, Phone_Number, Email_Address, Payment_Information, Shipping_Address)
VALUES (1, 'John Doe', '123 Main St', '123-456-7890', 'john@example.com', 'Credit Card', '456 Elm St');

INSERT INTO Customer_Information (Customer_ID, Name, Address, Phone_Number, Email_Address, Payment_Information, Shipping_Address)
VALUES (2, 'Jane Smith', '456 Oak Ave', '987-654-3210', 'jane@example.com', 'PayPal', '789 Maple Rd');

INSERT INTO Customer_Information (Customer_ID, Name, Address, Phone_Number, Email_Address, Payment_Information, Shipping_Address)
VALUES (3, 'Michael Johnson', '789 Pine Ln', '555-123-4567', 'michael@example.com', 'Credit Card', '321 Cedar Dr');

INSERT INTO Customer_Information (Customer_ID, Name, Address, Phone_Number, Email_Address, Payment_Information, Shipping_Address)
VALUES (4, 'Emily Davis', '222 Elm St', '555-999-8888', 'emily@example.com', 'Cash', '999 Oak Ave');

INSERT INTO Customer_Information (Customer_ID, Name, Address, Phone_Number, Email_Address, Payment_Information, Shipping_Address)
VALUES (5, 'David Wilson', '789 Maple Rd', '444-777-2222', 'david@example.com', 'PayPal', '123 Pine Ln');

INSERT INTO Customer_Information (Customer_ID, Name, Address, Phone_Number, Email_Address, Payment_Information, Shipping_Address)
VALUES (6, 'Sophia Martinez', '321 Cedar Dr', '888-555-4444', 'sophia@example.com', 'Credit Card', '789 Oak Ave');

INSERT INTO Customer_Information (Customer_ID, Name, Address, Phone_Number, Email_Address, Payment_Information, Shipping_Address)
VALUES (7, 'Jacob Anderson', '555 Pine Ln', '333-666-1111', 'jacob@example.com', 'Cash', '456 Elm St');

INSERT INTO Customer_Information (Customer_ID, Name, Address, Phone_Number, Email_Address, Payment_Information, Shipping_Address)
VALUES (8, 'Olivia Thompson', '999 Oak Ave', '222-333-5555', 'olivia@example.com', 'Credit Card', '789 Maple Rd');

INSERT INTO Customer_Information (Customer_ID, Name, Address, Phone_Number, Email_Address, Payment_Information, Shipping_Address)
VALUES (9, 'William Rodriguez', '123 Main St', '777-999-3333', 'william@example.com', 'PayPal', '321 Cedar Dr');

INSERT INTO Customer_Information (Customer_ID, Name, Address, Phone_Number, Email_Address, Payment_Information, Shipping_Address)
VALUES (10, 'Emma Lee', '456 Oak Ave', '111-444-7777', 'emma@example.com', 'Cash', '555 Pine Ln');

----------------Order_Information

INSERT INTO Order_Information VALUES (1, 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'Pending', 'Unpaid', 'Standard', '123 Main St, City', 10.99, 2.5, 113.49);
INSERT INTO Order_Information VALUES (2, 2, TO_DATE('2023-05-02', 'YYYY-MM-DD'), 'Shipped', 'Paid', 'Express', '456 Elm St, City', 15.99, 3.75, 142.24);
INSERT INTO Order_Information VALUES (3, 3, TO_DATE('2023-05-03', 'YYYY-MM-DD'), 'Delivered', 'Paid', 'Standard', '789 Oak St, City', 8.99, 1.75, 94.74);
INSERT INTO Order_Information VALUES (4, 4, TO_DATE('2023-05-04', 'YYYY-MM-DD'), 'Pending', 'Unpaid', 'Standard', '567 Pine St, City', 12.99, 2.25, 129.74);
INSERT INTO Order_Information VALUES (5, 5, TO_DATE('2023-05-05', 'YYYY-MM-DD'), 'Shipped', 'Paid', 'Express', '789 Maple St, City', 9.99, 1.5, 105.49);
INSERT INTO Order_Information VALUES (6, 6, TO_DATE('2023-05-06', 'YYYY-MM-DD'), 'Delivered', 'Paid', 'Standard', '890 Oak St, City', 11.99, 2.0, 121.99);
INSERT INTO Order_Information VALUES (7, 7, TO_DATE('2023-05-07', 'YYYY-MM-DD'), 'Pending', 'Unpaid', 'Standard', '123 Elm St, City', 14.99, 2.75, 153.24);
INSERT INTO Order_Information VALUES (8, 8, TO_DATE('2023-05-08', 'YYYY-MM-DD'), 'Shipped', 'Paid', 'Express', '456 Pine St, City', 13.99, 2.5, 139.49);
INSERT INTO Order_Information VALUES (9, 9, TO_DATE('2023-05-09', 'YYYY-MM-DD'), 'Delivered', 'Paid', 'Standard', '567 Maple St, City', 10.99, 1.75, 115.74);
INSERT INTO Order_Information VALUES (10, 10, TO_DATE('2023-05-10', 'YYYY-MM-DD'), 'Pending', 'Unpaid', 'Standard', '789 Elm St, City', 16.99, 3.0, 170.99);

------------Product_Review

INSERT INTO Product_Review VALUES (1, 1, 1, 4, 'Great product!', TO_DATE('2023-05-01', 'YYYY-MM-DD'));
INSERT INTO Product_Review VALUES (2, 2, 2, 5, 'Excellent service!', TO_DATE('2023-05-02', 'YYYY-MM-DD'));
INSERT INTO Product_Review VALUES (3, 3, 3, 3, 'Average product.', TO_DATE('2023-05-03', 'YYYY-MM-DD'));
INSERT INTO Product_Review VALUES (4, 4, 4, 4, 'Good value for money.', TO_DATE('2023-05-04', 'YYYY-MM-DD'));
INSERT INTO Product_Review VALUES (5, 1, 5, 5, 'Highly recommended!', TO_DATE('2023-05-05', 'YYYY-MM-DD'));
INSERT INTO Product_Review VALUES (6, 2, 6, 4, 'Fast shipping.', TO_DATE('2023-05-06', 'YYYY-MM-DD'));
INSERT INTO Product_Review VALUES (7, 3, 7, 2, 'Disappointed with the quality.', TO_DATE('2023-05-07', 'YYYY-MM-DD'));
INSERT INTO Product_Review VALUES (8, 4, 8, 3, 'Could be better.', TO_DATE('2023-05-08', 'YYYY-MM-DD'));
INSERT INTO Product_Review VALUES (9, 1, 9, 5, 'Amazing product!', TO_DATE('2023-05-09', 'YYYY-MM-DD'));
INSERT INTO Product_Review VALUES (10, 2, 10, 4, 'Satisfied with the purchase.', TO_DATE('2023-05-10', 'YYYY-MM-DD'));






Select * from Product_Information;

select * from Customer_Information;

select * from Order_Information;

Select * from Product_Review;

Select * from Order_Item;

--select * from Supplier_Information;

--select * from Return_Management;

--select * from Payment_Information;

--select * from Order_History;

update Product_Information
Set Product_Name = 'iPhone'
where Product_Name = 'Product 1';

update Product_Information
Set Product_Name = 'watches'
where Product_Name = 'Product 2';

update Product_Information
Set Product_Name = 'glasses'
where Product_Name = 'Product 3';

update Product_Information
Set Product_Name = 'pcs'
where Product_Name = 'Product 4';

update Product_Information
Set Product_Name = 'shirts'
where Product_Name = 'Product 5';

update Product_Information
Set Product_Name = 'speaker'
where Product_Name = 'Product 6';

update Product_Information
Set Product_Name = 'rings'
where Product_Name = 'Product 7';

update Product_Information
Set Product_Name = 'led'
where Product_Name = 'Product 8';

update Product_Information
Set Product_Name = 'shoes'
where Product_Name = 'Product 9';

update Product_Information
Set Product_Name = 'covers'
where Product_Name = 'Product 10';

Select * from Product_Information;

update Product_Information
Set Manufacturer = 'Apple'
where Manufacturer = 'Manufacturer A';

update Product_Information
Set Manufacturer = 'Apple'
where Manufacturer = 'Manufacturer B';

update Product_Information
Set Manufacturer = 'Apple'
where Manufacturer = 'Manufacturer C';



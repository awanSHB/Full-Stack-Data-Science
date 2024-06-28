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


CREATE TABLE Inventory_Management (
    Purchase_Orders INT,
    Inventory_Levels INT,
    Reorder_Point INT,
    Supplier_Information VARCHAR(255),
    Shipping_Information VARCHAR(255)
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

CREATE TABLE Supplier_Information (
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(255),
    Supplier_Address VARCHAR(255),
    Supplier_Phone_Number VARCHAR(20),
    Supplier_Email_Address VARCHAR(255)
);

CREATE TABLE Return_Management (
    Return_ID INT PRIMARY KEY,
    Order_ID INT,
    Customer_ID INT,
    Return_Reason VARCHAR(255),
    Return_Date DATE,
    Refund_Amount DECIMAL(10, 2),
    Return_Status VARCHAR(255),
    FOREIGN KEY (Order_ID) REFERENCES Order_Information(Order_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Information(Customer_ID)
);


CREATE TABLE Payment_Information (
    Payment_ID INT PRIMARY KEY,
    Customer_ID INT,
    Payment_Method VARCHAR(255),
    Card_Number VARCHAR(16),
    Expiration_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Information(Customer_ID)
);


CREATE TABLE Order_History (
    History_ID INT PRIMARY KEY,
    Order_ID INT,
    Customer_ID INT,
    Order_Date DATE,
    Order_Status VARCHAR(255),
    Payment_Status VARCHAR(255),
    Shipping_Method VARCHAR(255),
    Shipping_Address VARCHAR(255),
    Shipping_Cost DECIMAL(10, 2),
    Tax DECIMAL(10, 2),
    Total_Cost DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES Order_Information(Order_ID),
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

-----------------------Inventory_management

INSERT INTO Inventory_Management VALUES (1001, 50, 20, 'Supplier A', 'Standard Shipping');
INSERT INTO Inventory_Management VALUES (1002, 75, 30, 'Supplier B', 'Express Shipping');
INSERT INTO Inventory_Management VALUES (1003, 40, 15, 'Supplier C', 'Standard Shipping');
INSERT INTO Inventory_Management VALUES (1004, 60, 25, 'Supplier A', 'Express Shipping');
INSERT INTO Inventory_Management VALUES (1005, 55, 22, 'Supplier B', 'Standard Shipping');
INSERT INTO Inventory_Management VALUES (1006, 80, 35, 'Supplier C', 'Express Shipping');
INSERT INTO Inventory_Management VALUES (1007, 45, 18, 'Supplier A', 'Standard Shipping');
INSERT INTO Inventory_Management VALUES (1008, 65, 28, 'Supplier B', 'Express Shipping');
INSERT INTO Inventory_Management VALUES (1009, 70, 32, 'Supplier C', 'Standard Shipping');
INSERT INTO Inventory_Management VALUES (1010, 50, 20, 'Supplier A', 'Express Shipping');


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

----------------Order_Item

INSERT INTO Order_Item VALUES (1, 1, 1, 2, 9.99, 19.98);

INSERT INTO Order_Item VALUES (2, 1, 2, 1, 14.99, 14.99);

INSERT INTO Order_Item VALUES (3, 2, 3, 3, 7.99, 23.97);

INSERT INTO Order_Item VALUES (4, 2, 4, 2, 12.49, 24.98);

INSERT INTO Order_Item VALUES (5, 3, 1, 1, 9.99, 9.99);

INSERT INTO Order_Item VALUES (6, 3, 5, 4, 5.99, 23.96);

INSERT INTO Order_Item VALUES (7, 4, 2, 3, 14.99, 44.97);

INSERT INTO Order_Item VALUES (8, 4, 3, 2, 7.99, 15.98);

INSERT INTO Order_Item VALUES (9, 5, 4, 1, 12.49, 12.49);

INSERT INTO Order_Item VALUES (10, 5, 6, 2, 8.99, 17.98);

------------------Supplier_Information

INSERT INTO Supplier_Information VALUES (1, 'Supplier 1', '123 Main St, City', '1234567890', 'supplier1@example.com');

INSERT INTO Supplier_Information VALUES (2, 'Supplier 2', '456 Elm St, City', '9876543210', 'supplier2@example.com');

INSERT INTO Supplier_Information VALUES (3, 'Supplier 3', '789 Oak St, City', '5551234567', 'supplier3@example.com');

INSERT INTO Supplier_Information VALUES (4, 'Supplier 4', '321 Pine St, City', '4449876543', 'supplier4@example.com');

INSERT INTO Supplier_Information VALUES (5, 'Supplier 5', '678 Maple St, City', '1112223334', 'supplier5@example.com');

INSERT INTO Supplier_Information VALUES (6, 'Supplier 6', '987 Oak St, City', '9998887776', 'supplier6@example.com');

INSERT INTO Supplier_Information VALUES (7, 'Supplier 7', '543 Pine St, City', '2224446668', 'supplier7@example.com');

INSERT INTO Supplier_Information VALUES (8, 'Supplier 8', '876 Elm St, City', '7776665552', 'supplier8@example.com');

INSERT INTO Supplier_Information VALUES (9, 'Supplier 9', '234 Main St, City', '8887776661', 'supplier9@example.com');

INSERT INTO Supplier_Information VALUES (10, 'Supplier 10', '567 Oak St, City', '3335557779', 'supplier10@example.com');


------------Return_Management

INSERT INTO Return_Management VALUES (1, 1, 1, 'Product damaged', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 20.50, 'Pending');

INSERT INTO Return_Management VALUES (2, 2, 2, 'Wrong product delivered', TO_DATE('2023-05-02', 'YYYY-MM-DD'), 15.00, 'Approved');

INSERT INTO Return_Management VALUES (3, 3, 3, 'Item not as described', TO_DATE('2023-05-03', 'YYYY-MM-DD'), 30.75, 'Pending');

INSERT INTO Return_Management VALUES (4, 4, 4, 'Size does not fit', TO_DATE('2023-05-04', 'YYYY-MM-DD'), 10.99, 'Approved');

INSERT INTO Return_Management VALUES (5, 3, 1, 'Received duplicate item', TO_DATE('2023-05-05', 'YYYY-MM-DD'), 25.50, 'Pending');

INSERT INTO Return_Management VALUES (6, 7, 6, 'Product not functioning', TO_DATE('2023-05-06', 'YYYY-MM-DD'), 40.00, 'Approved');

INSERT INTO Return_Management VALUES (7, 9, 3, 'Changed my mind', TO_DATE('2023-05-07', 'YYYY-MM-DD'), 15.75, 'Pending');

INSERT INTO Return_Management VALUES (8, 1, 8, 'Product arrived late', TO_DATE('2023-05-08', 'YYYY-MM-DD'), 18.99, 'Approved');

INSERT INTO Return_Management VALUES (9, 2, 5, 'Received incorrect color', TO_DATE('2023-05-09', 'YYYY-MM-DD'), 12.50, 'Pending');

INSERT INTO Return_Management VALUES (10, 5, 4, 'Product not suitable', TO_DATE('2023-05-10', 'YYYY-MM-DD'), 22.25, 'Approved');

----------Payment_Information

INSERT INTO Payment_Information VALUES (1, 1, 'Credit Card', '1234567890123456', TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO Payment_Information VALUES (2, 2, 'Debit Card', '9876543210987654', TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO Payment_Information VALUES (3, 3, 'PayPal', '4567890123456789', TO_DATE('2023-08-28', 'YYYY-MM-DD'));
INSERT INTO Payment_Information VALUES (4, 4, 'Credit Card', '5678901234567890', TO_DATE('2024-05-19', 'YYYY-MM-DD'));
INSERT INTO Payment_Information VALUES (5, 5, 'Debit Card', '0123456789012345', TO_DATE('2023-12-10', 'YYYY-MM-DD'));
INSERT INTO Payment_Information VALUES (6, 6, 'PayPal', '7890123456789012', TO_DATE('2024-03-05', 'YYYY-MM-DD'));
INSERT INTO Payment_Information VALUES (7, 7, 'Credit Card', '2345678901234567', TO_DATE('2023-11-22', 'YYYY-MM-DD'));
INSERT INTO Payment_Information VALUES (8, 2, 'Debit Card', '9012345678901234', TO_DATE('2024-07-17', 'YYYY-MM-DD'));
INSERT INTO Payment_Information VALUES (9, 3, 'PayPal', '3456789012345678', TO_DATE('2023-09-02', 'YYYY-MM-DD'));
INSERT INTO Payment_Information VALUES (10, 4, 'Credit Card', '6789012345678901', TO_DATE('2024-01-14', 'YYYY-MM-DD'));

--------------Order_History

INSERT INTO Order_History VALUES (1, 1, 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'Shipped', 'Paid', 'Express', '123 Main St, City', 10.99, 2.5, 113.49);
INSERT INTO Order_History VALUES (2, 2, 2, TO_DATE('2023-05-02', 'YYYY-MM-DD'), 'Pending', 'Unpaid', 'Standard', '456 Elm St, City', 15.99, 3.75, 142.24);
INSERT INTO Order_History VALUES (3, 3, 3, TO_DATE('2023-05-03', 'YYYY-MM-DD'), 'Shipped', 'Paid', 'Express', '789 Oak St, City', 8.99, 1.75, 95.49);
INSERT INTO Order_History VALUES (4, 4, 4, TO_DATE('2023-05-04', 'YYYY-MM-DD'), 'Pending', 'Unpaid', 'Standard', '321 Pine St, City', 12.99, 2.25, 127.74);
INSERT INTO Order_History VALUES (5, 5, 5, TO_DATE('2023-05-05', 'YYYY-MM-DD'), 'Shipped', 'Paid', 'Express', '654 Maple St, City', 11.99, 2.0, 118.49);
INSERT INTO Order_History VALUES (6, 6, 6, TO_DATE('2023-05-06', 'YYYY-MM-DD'), 'Pending', 'Unpaid', 'Standard', '987 Cedar St, City', 13.99, 2.5, 136.24);
INSERT INTO Order_History VALUES (7, 7, 7, TO_DATE('2023-05-07', 'YYYY-MM-DD'), 'Shipped', 'Paid', 'Express', '246 Birch St, City', 9.99, 1.75, 101.49);
INSERT INTO Order_History VALUES (8, 8, 8, TO_DATE('2023-05-08', 'YYYY-MM-DD'), 'Pending', 'Unpaid', 'Standard', '579 Willow St, City', 14.99, 2.25, 147.74);
INSERT INTO Order_History VALUES (9, 9, 9, TO_DATE('2023-05-09', 'YYYY-MM-DD'), 'Shipped', 'Paid', 'Express', '802 Oak St, City', 10.99, 2.0, 123.49);
INSERT INTO Order_History VALUES (10, 10, 10, TO_DATE('2023-05-10', 'YYYY-MM-DD'), 'Pending', 'Unpaid', 'Standard', '135 Elm St, City', 12.99, 2.5, 135.24);







Select * from Product_Information;

select * from Customer_Information;

select * from Order_Information;

Select * from Inventory_Management;

Select * from Product_Review;

Select * from Order_Item;

select * from Supplier_Information;

select * from Return_Management;

select * from Payment_Information;

select * from Order_History;












--1) SELECT - to specify the columns to be retrieved
--2) FROM - to specify the table(s) to retrieve the data from
--3) WHERE - to filter the rows based on certain conditions
--4) GROUP BY - to group the data based on certain columns
--5) HAVING - to filter the groups based on certain conditions
--6) ORDER BY - to sort the result set based on one or more columns


CREATE TABLE Employee_Info
(
    Employee_ID INT,
    First_name VARCHAR(255),
    Last_name VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    Country VARCHAR(255),
    Phone_no INT,
    Hire_Date DATE
);

INSERT INTO Employee_Info VALUES(
    1001, 'AB', 'CD', 'Street 14', 'Lahore', 'Pakistan', 0311-0000000, TO_DATE('2022-01-01', 'YYYY-MM-DD')
);

INSERT INTO Employee_Info VALUES(
    1002, 'CD', 'EF', 'Street 15', 'ISL', 'Pakistan', 0312-0000000, TO_DATE('2022-01-02', 'YYYY-MM-DD')
);

INSERT INTO Employee_Info VALUES(
    1003, 'EF', 'GH', 'Street 16', 'RWP', 'Pakistan', 0313-0000000, TO_DATE('2022-01-03', 'YYYY-MM-DD')
);

INSERT INTO Employee_Info VALUES(
    1004, 'GH', 'IJ', 'Street 16', 'Lahore', 'Pakistan', 0314-0000000, TO_DATE('2022-01-04', 'YYYY-MM-DD')
);

INSERT INTO Employee_Info VALUES(
    1005, 'IJ', 'KL', 'Street 16', 'ISL', 'Pakistan', 0315-0000000, TO_DATE('2022-01-05', 'YYYY-MM-DD')
);

INSERT INTO Employee_Info VALUES(
    1006, 'KL', 'MN', 'Street 17', 'ISL', 'Pakistan', 0316-0000000, TO_DATE('2022-01-06', 'YYYY-MM-DD')
);

INSERT INTO Employee_Info VALUES(
    1007, 'AB', 'EF', 'Street 17', 'RWP', 'Pakistan', 0314-0000000, TO_DATE('2022-01-03', 'YYYY-MM-DD')
);

INSERT INTO Employee_Info VALUES(
    1008, 'GH', 'KL', 'Street 18', 'Multan', 'Pakistan', 0312-0000000, TO_DATE('2022-01-04', 'YYYY-MM-DD')
);

INSERT INTO Employee_Info VALUES(
    1009, 'MN', 'OP', 'Street 19', 'RWP', 'Pakistan', 0317-0000000, TO_DATE('2022-01-07', 'YYYY-MM-DD')
);

INSERT INTO Employee_Info VALUES(
    1010, 'MN', 'OP', 'Street 20', 'ISL', 'Pakistan', 0318-0000000, TO_DATE('2022-01-08', 'YYYY-MM-DD')
);

SELECT * FROM employee_info;

SELECT * FROM employee_info WHERE City = 'ISL';
SELECT * FROM employee_info WHERE City = 'Lahore';

SELECT * FROM employee_info ORDER BY Employee_ID DESC;

DELETE FROM employee_info WHERE Employee_ID = 1006;


SELECT
    Employee_ID, Last_name, City
FROM
    Employee_Info
Where
    Hire_Date = (SELECT MAX(Hire_Date) FROM employee_info);


--------------------------DISTINT-----> To remove duplicates rows
SELECT 
    Distinct Phone_no
From
    employee_info
Order by
    Phone_no DESC;

--------------------------FETCH------> To limit the number of rows returned by SELECT

SELECT 
    Employee_ID, City, Hire_Date
FROM
    employee_info
Order BY
    Hire_Date
FETCH NEXT 5 ROWS ONLY;
    
------------------------

SELECT 
    Employee_ID, First_name, Last_name, Phone_no, Address
from
    employee_info
Where 
    Employee_ID >= ALL(SELECT
                        Employee_ID
                    From
                        employee_info
                    WHERE
                        Employee_ID = 1008);


----------------------------------------

ALTER TABLE Employee_Info RENAME TO Employeesinfo;

select * from Employeesinfo;

ALTER TABLE Employeesinfo
    RENAME COLUMN Employee_ID TO employeeID;
    
    
SELECT COUNT(*) FROM Employeesinfo;

ALTER TABLE Employeesinfo
ADD Email varchar(255);

UPDATE Employeesinfo
SET Email = 'abc123@gmail.com'
WHERE Employeeid = 1003;

SELECT * FROM Employeesinfo WHERE Last_name LIKE 'O_';
SELECT * FROM Employeesinfo WHERE First_name LIKE '%H';


select * from employeesinfo where first_name <> 'GH';

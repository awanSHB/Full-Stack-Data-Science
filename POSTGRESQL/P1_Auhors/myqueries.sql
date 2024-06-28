select * from public."Author";
SELECT * from public."Book";
-- COPY public."Book" FROM 'D:\PROGRAMMING\POSTGRESQL\P1_Auhors\Book.csv' 
--	DELIMITER ',' CSV HEADER ;
SELECT * from public."Borrower";
SELECT * from public."Author List";
SELECT * from public."Copy";
SELECT * from public."Loan";

SELECT * FROM public."Borrower" WHERE first_name LIKE 'J%';
SELECT * FROM public."Borrower" WHERE last_name LIKE 'J%';

select * from public."Book" ORDER BY "Pages";
select * from public."Book" order by "Price";
SELECT * FROM public."Author List";

SELECT * FROM public."Book";







	











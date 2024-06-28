select * from employees;

select
    employee_id,
    first_name,
    last_name,
    hire_date
from
    employees;
    

select 
    first_name,
    last_name,
    salary,
    salary * 1.6
from
    employees;


SELECT
    first_name,
    last_name,
    salary,
    salary * 1.6 AS new_salary
FROM
    employees;

--------------------------------------SQL ORDER BY
--Order By will order the table according to given condition
--By default it is in ascending
SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
ORDER BY
    first_name;

SELECT
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary
FROM
    employees
ORDER BY
    first_name,
    last_name DESC;


SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
ORDER BY
    salary DESC;

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    hire_date
FROM
    employees
ORDER BY
    hire_date DESC;



-------------------------------------SQL DISTINCT
--It removes the duplicate values in the resulting
--Not in the whole dataset


SELECT
    DISTINCT salary
FROM
    employees
ORDER BY
    salary DESC;


SELECT DISTINCT
    job_id,
    salary
FROM
    employees
ORDER BY
    job_id,
    salary DESC;
    

    












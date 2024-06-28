use `monitoring_optimization`;
use customersales;
SELECT * from departments;
SELECT * from dept_emp;
SELECT * from dept_manager;
SELECT * from employees;
SELECT * from salaries;
SELECT * from titles;
EXPLAIN SELECT * FROM departments;

EXPLAIN SELECT * FROM employees;
show DATABASES;
use monitoring_optimization;
select database();

show INDEX FROM employees;

SELECT * FROM employees WHERE hire_date >= '2019-01-01';
EXPLAIN SELECT * FROM employees WHERE hire_date >= '2019-01-01';


CREATE INDEX hire_date ON employees(hire_date);

show INDEX FROM employees;

SELECT * FROM employees WHERE hire_date >= '2019-01-01';
EXPLAIN SELECT * FROM employees WHERE hire_date >= '2019-01-01';
ALTER TABLE employees DROP INDEX hire_date;












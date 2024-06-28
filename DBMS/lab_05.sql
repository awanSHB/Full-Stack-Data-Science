-----------------------------------------Activity 1

select
    max(salary), avg(salary), min(salary), max(salary)
from
    employees
where 
    job_id like '%REP%';
    
-----------------------------------------Activity 2

select
    count(*)
from
    employees
where
    department_id = 50;

select
    count(commission_pct)
from
    employees
where
    department_id = 50;

-----------------------------------------Activity 3

select
    count(distinct department_id)  --non null values
from
    employees;

-----------------------------------------Activity 4

select
    avg(commission_pct)     --Ignores all null vals
from
    employees;

select
    avg(NVL(commission_pct, 0)) --NVl forces to includ null vals
from
    employees;

-----------------------------------------Activity 5

select
    department_id, avg(salary)
from
    employees
group by
    department_id;

-----------------------------------------Activity 6

select
    department_id, job_id, sum(salary)
from
    employees
group by
    department_id, job_id
order by
    job_id;


-----------------------------------------Task 1

select
    round(max(salary)) Highest, round(min(salary)) Lowest, round(sum(salary)) SUM, 
    round(avg(salary)) Average
from
    employees;
    

-----------------------------------------Task 2

SELECT 
    job_id, COUNT(*) AS num_people
FROM 
    employees
GROUP BY 
    job_id;

-----------------------------------------Task 3

select
    count(manager_id) as no_of_managers
from
    employees;

-----------------------------------------Task 4

select
    max(salary) - min(salary) as Difference
from
    employees;

SELECT * FROM employees;

-----------------------------------------Task 5

SELECT manager_id, MIN(salary) AS lowest_salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY lowest_salary DESC;


-----------------------------------------Task 6

SELECT job_id AS "Job",SUM(DECODE(department_id , 20, salary)) AS "Dept 20",SUM(DECODE(department_id , 50, salary)) "Dept 50",SUM(DECODE(department_id , 80, salary)) "Dept 80",SUM(DECODE(department_id , 90, salary)) AS "Dept 90",SUM(salary) AS "Total"
FROM employees
GROUP BY job_id;






















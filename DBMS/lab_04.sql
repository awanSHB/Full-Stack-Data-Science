SELECT 
    'The Job id for '||UPPER(last_name)||' is '||LOWER(job_id) AS "EMPLOYEE_DETAIL"
FROM
    employees;
    
SELECT 
    employee_id, last_name, department_id
FROM
    employees
WHERE
    INITCAP(last_name) = 'Higgins';

SELECT
    employee_id, CONCAT(first_name, last_name) NAME, job_id, LENGTH(last_name),
    INSTR(last_name, 'a') "Contains 'a'?"
FROM
    employees
where
    substr(job_id, 4) = 'REP';


----------------------------------ACTIVITY 2

select
    last_name, salary, mod(salary, 5000) 
from
    employees
where
    job_id = 'SA_REP';
    
---------------------------------ACTIVITY 3

select
    last_name, TRUNC((sysdate-hire_date)/7, 3) AS WEEKS
from
    employees
where
    department_id = 90;

select
    employee_id, hire_date, months_between(sysdate, hire_date) TENURE, add_months(hire_date, 6)
    REVIEW, next_day(hire_date, 'FRIDAY'), last_day(hire_date)
from
    employees
where
    months_between(sysdate, hire_date) < 150;

select
    employee_id, hire_date, round(hire_date, 'MONTH'), trunc(hire_date, 'MONTH')
from
    employees
where
    hire_date like '%7';
    
---------------------------------ACTIVITY 4

select
    employee_id, to_char(hire_date, 'MM/YY') month_hired
from
    employees
where
    last_name = 'Higgins';

select 
    last_name, to_char(hire_date, 'DD-MM-YYYY')
from
    employees
where
    hire_date < to_date('01-jan-2003', 'DD-MM-RR');


---------------------------------ACTIVITY 5

select 
    to_char(next_day(add_months(hire_date, 6), 'FRIDAY'), 'fmDay, month ddth, YYYY') 
    "Next 6 Months Review"
from
    employees
order by
    hire_date;

---------------------------------ACTIVITY 6

SELECT
    last_name, salary, nvl(commission_pct, 0), (salary*12) + (salary*12*nvl(commission_pct, 0)) AN_SAL
from
    employees;

select
    last_name, department_id, salary, nvl2(commission_pct, 'SAL+COMM', 'SAl') income
from
    employees
where
    department_id IN(50, 80);

select
    first_name, length(first_name) "exp1", last_name, length(last_name) "exp2", 
    NULLIF(length(first_name), length(last_name)) result
from
    employees;


---------------------------------LAB TASKS--------------------------------------------
---------------------------------TASK 1

select
    employee_id, last_name, salary, (salary + salary*(15.5/100)) new_salary
from
    employees;
    
---------------------------------TASK 2

select
    initcap(last_name) last_name, length(last_name) name_length
from
    employees
where
    last_name like'J%' OR last_name like'A%' OR last_name like'M%'
order by
    last_name;


---------------------------------TASK 3

select
    last_name, trunc(months_between(sysdate, hire_date), 4) MONTHS_WORKED
from 
    employees
order by
    MONTHS_WORKED;


---------------------------------TASK 4

select
    last_name, nvl2(commission_pct, to_char(commission_pct), 'NULL') COMM
from
    employees;









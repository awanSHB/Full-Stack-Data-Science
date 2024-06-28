--SELECT 'The job id for ' || UPPER(last_name)||' is ' || LOWER(job_id) AS "Employee DeTAIL"
--FROM employees
--
--SELECT employee_id, last_name, department_id
--FROM employees
--where INITCAP(last_name) = 'Higgins'
--
--SELECT employee_id, CONCAT(first_name, last_name) NAME, job_id, LENGTH(last_name), INSTR(last_name, 'a') "Contains 'a'?"
--FROM   employees
--WHERE  SUBSTR(job_id, 4) = 'REP';



--SELECT last_name, salary, MOD(salary, 5000) FROM employees
--WHERE job_id = 'SA_REP';
--
--SELECT TRUNC(45.923,2),TRUNC(45.923,TRUNC(45.923,-1)
--FROM DUAL;
--
--SELECT ROUND(45.923,2), ROUND(45.923, 0), ROUND(45.923,-1)
--FROM DUAL;





--SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS 
--FROM   employees
--WHERE  department_id = 90;
--
SELECT employee_id,hire_date,MONTHS_BETWEEN (SYSDATE,hire_date) TENURE, 
       ADD_MONTHS (hire_date, 6) REVIEW,NEXT_DAY (hire_date, 'FRIDAY'), 
       LAST_DAY(hire_date)
FROM   employees 
WHERE  MONTHS_BETWEEN (SYSDATE, hire_date) < 150;
--
--SELECT employee_id, hire_date, ROUND(hire_date,'MONTH'), 
--       TRUNC(hire_date, 'MONTH') 
--FROM employees
--WHERE hire_date LIKE '%03'






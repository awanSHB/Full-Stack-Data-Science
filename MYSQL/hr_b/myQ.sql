-- Active: 1694013193065@@127.0.0.1@3306@hr_b
SELECT * FROM employees;
SELECT * FROM job_history;
SELECT * FROM jobs;

SELECT * FROM employees WHERE job_id IN (SELECT jobs_id FROM job_history);

SELECT * FROM employees WHERE job_id IN (SELECT jobs_id FROM job_history WHERE job_title LIKE "Jr.%");

SELECT * FROM job_history WHERE jobs_id IN (SELECT job_id FROM employees WHERE YEAR(b_date) > 1972);

SELECT * FROM job_history WHERE jobs_id IN (SELECT job_id FROM employees WHERE YEAR(b_date) >= 1972 and sex='F');

-- Cross JOIN
SELECT * FROM employees, job_history;

SELECT * FROM employees, job_history WHERE employees.job_id = job_history.jobs_id;
SELECT * FROM employees E, job_history J WHERE E.job_id = J.jobs_id;    -- Using Aliases

SELECT E.emp_id, E.f_name, E.l_name, J.job_title FROM employees E, job_history J
    WHERE E.job_id = J.jobs_id;

UPDATE jobs
    SET jobs_id = 100 
    WHERE job_title = "Sr. Architect";
UPDATE jobs
    SET jobs_id = 200 
    WHERE job_title = "Sr. Software Developer";

SELECT * FROM jobs;

INSERT INTO jobs VALUES(
    300, "Sr. Data Scientist", 80000, 120000
);

UPDATE jobs
    SET job_title = "Jr. Software Developer"
    WHERE jobs_id = 300;


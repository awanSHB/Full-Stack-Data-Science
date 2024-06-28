SELECT LOCATIONS.LOCATION_ID, LOCATIONS.STREET_ADDRESS, LOCATIONS.CITY, LOCATIONS.STATE_PROVINCE, COUNTRIES.COUNTRY_NAME
FROM LOCATIONS 
NATURAL JOIN COUNTRIES;

-------------------------------------TASK 2

SELECT e.last_name, d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

---------------------------------TASK 3

SELECT first_name, last_name, country_name
FROM employees JOIN departments
USING (department_id)
JOIN locations
USING (location_id)
JOIN countries
USING (country_id)

WHERE country_name = 'Africa' AND department_name LIKE 'SA%';

----------------------------TASK 4

SELECT 
    first_name, last_name, first_name || ' ' || last_name AS "Full_name", 
    employees.manager_id, city
FROM employees
JOIN departments
USING (department_id)
JOIN locations
USING (location_id);

-------------------------------------TASK 5
SELECT first_name || last_name AS "Name", hire_date, department_name ,job_title
FROM employees JOIN departments
ON employees.department_id = departments.department_id
JOIN jobs
ON employees.job_id = jobs.job_id

WHERE hire_date > '30-DEC-00';

-------------------------------------TASK 6

SELECT last_name, job_title, department_id, department_name
FROM employees NATURAL JOIN departments
NATURAL JOIN locations
NATURAL JOIN countries
JOIN jobs
ON employees.job_id = jobs.job_id

WHERE country_name = 'Canada';




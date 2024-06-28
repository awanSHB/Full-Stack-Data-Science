-- Insert data into departments table
INSERT INTO `monitoring_optimization`.`departments` (`dep_no`, `dept_name`) VALUES
    ('D001', 'HR'),
    ('D002', 'Finance'),
    ('D003', 'Engineering'),
    ('D004', 'Marketing'),
    ('D005', 'IT'),
    ('D006', 'Sales'),
    ('D007', 'Research'),
    ('D008', 'Customer Service'),
    ('D009', 'Production'),
    ('D010', 'Legal');

-- Insert data into employees table
INSERT INTO `monitoring_optimization`.`employees` (`emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date`) VALUES
    (1, '1990-01-15', 'John', 'Doe', 'M', '2020-05-01'),
    (2, '1985-03-22', 'Jane', 'Smith', 'F', '2018-11-10'),
    (3, '1992-08-10', 'Michael', 'Johnson', 'M', '2022-02-15'),
    (4, '1988-05-05', 'Emily', 'Williams', 'F', '2019-07-20'),
    (5, '1995-11-30', 'Robert', 'Brown', 'M', '2021-03-12'),
    (6, '1987-04-18', 'Sophia', 'Davis', 'F', '2017-09-08'),
    (7, '1993-09-25', 'Daniel', 'Miller', 'M', '2022-11-01'),
    (8, '1991-12-08', 'Olivia', 'Martinez', 'F', '2016-06-14'),
    (9, '1986-06-03', 'Ethan', 'Anderson', 'M', '2018-04-05'),
    (10, '1994-02-20', 'Ava', 'Garcia', 'F', '2020-09-30');

-- Insert data into dept_emp table
INSERT INTO `monitoring_optimization`.`dept_emp` (`from_date`, `to_date`, `departments_dep_no`, `employees_emp_no`) VALUES
    ('2020-05-01', '2022-01-01', 'D001', 1),
    ('2018-11-10', '2023-02-28', 'D002', 2),
    ('2022-02-15', '2023-12-31', 'D003', 3),
    ('2019-07-20', '2022-10-01', 'D004', 4),
    ('2021-03-12', '2023-06-30', 'D005', 5),
    ('2017-09-08', '2023-02-15', 'D006', 6),
    ('2022-11-01', '2023-11-30', 'D007', 7),
    ('2016-06-14', '2023-04-15', 'D008', 8),
    ('2018-04-05', '2022-09-01', 'D009', 9),
    ('2020-09-30', '2023-03-31', 'D010', 10);

-- Insert data into salaries table
INSERT INTO `monitoring_optimization`.`salaries` (`salary`, `from_date`, `to_date`, `employees_emp_no`) VALUES
    (60000, '2020-05-01', '2021-04-30', 1),
    (75000, '2018-11-10', '2019-12-31', 2),
    (80000, '2022-02-15', '2022-12-31', 3),
    (65000, '2019-07-20', '2022-10-01', 4),
    (70000, '2021-03-12', '2023-06-30', 5),
    (90000, '2017-09-08', '2023-02-15', 6),
    (72000, '2022-11-01', '2023-11-30', 7),
    (85000, '2016-06-14', '2023-04-15', 8),
    (78000, '2018-04-05', '2022-09-01', 9),
    (95000, '2020-09-30', '2023-03-31', 10);

-- Insert data into titles table
INSERT INTO `monitoring_optimization`.`titles` (`title`, `from_date`, `to_date`, `employees_emp_no`) VALUES
    ('Software Engineer', '2020-05-01', '2022-01-01', 1),
    ('Financial Analyst', '2018-11-10', '2023-02-28', 2),
    ('Senior Engineer', '2022-02-15', '2023-12-31', 3),
    ('Marketing Specialist', '2019-07-20', '2022-10-01', 4),
    ('IT Manager', '2021-03-12', '2023-06-30', 5),
    ('Senior Sales Representative', '2017-09-08', '2023-02-15', 6),
    ('Research Scientist', '2022-11-01', '2023-11-30', 7),
    ('Customer Service Supervisor', '2016-06-14', '2023-04-15', 8),
    ('Production Manager', '2018-04-05', '2022-09-01', 9),
    ('Legal Counsel', '2020-09-30', '2023-03-31', 10);

-- Insert data into dept_manager table
INSERT INTO `monitoring_optimization`.`dept_manager` (`from_date`, `to_date`, `employees_emp_no`, `departments_dep_no`) VALUES
    ('2020-05-01', '2022-01-01', 1, 'D001'),
    ('2018-11-10', '2023-02-28', 2, 'D002'),
    ('2022-02-15', '2023-12-31', 3, 'D003'),
    ('2019-07-20', '2022-10-01', 4, 'D004'),
    ('2021-03-12', '2023-06-30', 5, 'D005'),
    ('2017-09-08', '2023-02-15', 6, 'D006'),
    ('2022-11-01', '2023-11-30', 7, 'D007'),
    ('2016-06-14', '2023-04-15', 8, 'D008'),
    ('2018-04-05', '2022-09-01', 9, 'D009'),
    ('2020-09-30', '2023-03-31', 10, 'D010');

















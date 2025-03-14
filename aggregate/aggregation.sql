-- 1. Count the number of employees in each department
-- This query groups employees by department_id and counts how many employees exist in each.
SELECT department_id, COUNT(*) AS total_employees
FROM hr.EMPLOYEES
GROUP BY department_id;

--2. Find the average salary in each department
SELECT department_id, 
COUNT(*) AS avg_salary
FROM HR.EMPLOYEES
GROUP BY department_id;
-- This query calculates the averahge salary for the employees in each department.

--3. Find the maximum and minimum salary in each department
SELECT department_id, 
MAX(salary) AS max_salary, 
MIN(salary) AS min_salary
FROM HR.EMPLOYEES
GROUP BY department_id;
--This query finds the highest and the lowest salaries for each department

--4.Find the total salary paid in each department
SELECT department_id, 
SUM(salary) AS total_salary
FROM HR.EMPLOYEES
GROUP BY department_id;
--This query sums up all emloyee salaries in each department,

--5.Count the number of employees in each job role
SELECT job_id, 
COUNT (*) AS total_employees
FROM HR.EMPLOYEES 
GROUP BY job_id;
-- This query counts the number of employees who have the same job role.

-- 6. Find the average salary for each job role
SELECT job_id,
AVG(salary) AS avg_salary
FROM HR.EMPLOYEES
GROUP BY job_id;
-- This query calculates the average salary for employees in each job role.

-- 7. Find the maximum salary for each job role
-- This query finds the highest salary assigned to employees for each job role.
SELECT job_id,
MAX(salary) AS max_salary
FROM HR.EMPLOYEES
GROUP BY job_id;

-- 8. Find the minimum salary for each job role
-- This query finds the lowest salary assigned to employees for each job role.
SELECT job_id,
MIN(salary) AS min_salary
FROM HR.EMPLOYEES
GROUP BY job_id;

-- 9. Find the total salary paid for each job role
-- This query calculates the total salary payout for employees in each job role.
SELECT job_id,
SUM(salary) AS total_salary
FROM HR.EMPLOYEES
GROUP BY job_id;

-- 10. Count the number of employees hired in each year
-- This query extracts the year from the hire_date and counts employees hired in each year.
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, 
COUNT(*) AS total_employees
FROM HR.EMPLOYEES
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;

-- 11. Find the total salary paid in each location
-- This query sums up the total salary per location by joining employees with department locations.
SELECT d.location_id,
SUM(e.salary) AS total_salary
FROM HR.EMPLOYEES e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.location_id;

-- 12. Find the number of employees in each manager's team
-- This query counts the employees who report to each manager.
SELECT manager_id,
COUNT(*) AS team_size
FROM HR.EMPLOYEES
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- 13. Find the highest salary for each manager
-- This query finds the highest salary among employees reporting to each manager.
SELECT manager_id,
MAX(salary) AS max_salary
FROM HR.EMPLOYEES
WHERE manager_id IS NOT NULL
GROUP BY manager_id;





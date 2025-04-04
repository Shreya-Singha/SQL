-- 1. Count the number of employees in each department
-- This query groups employees by department_id and counts how many employees exist in each.
SELECT department_id, COUNT(*) AS total_employees
FROM HR.EMPLOYEES
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
JOIN hr.departments d ON e.department_id = d.department_id
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

-- 14. Find the average salary for each manager's team
-- This query calculates the average salary of employees reporting to each manager.
SELECT manager_id,
AVG(salary) AS avg_salary
FROM HR.EMPLOYEES
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- 15. Count the number of employees hired in each month of the year
-- This query extracts the month from hire_date and counts how many employees were hired in each month.
SELECT EXTRACT( MONTH FROM hire_date) AS hire_month,
COUNT(*) AS total_hired
FROM HR.EMPLOYEES
GROUP BY EXTRACT(MONTH FROM hire_date)
ORDER BY hire_month;

-- 16. Find the department with the highest total salary
-- This query finds the department that pays the highest total salary by sorting in descending order.

SELECT department_id, 
SUM(salary) AS total_salary
FROM HR.EMPLOYEES
GROUP BY department_id
ORDER BY total_salary DESC
FETCH FIRST 1 ROW ONLY;

-- 17. Find the job role with the highest average salary
-- This query finds the job role with the highest average salary by sorting in descending order.
SELECT job_id, 
AVG(salary) AS avg_salary
FROM HR.EMPLOYEES
GROUP BY job_id
ORDER BY avg_salary DESC
FETCH FIRST 1 ROW ONLY;

-- 18. Find the number of employees in each city
-- This query counts the number of employees per city, assuming departments are linked to locations.
SELECT l.city,
COUNT(*) AS total_employees
FROM HR.EMPLOYEES e
JOIN hr.departments d ON e.department_id = d.department_id
JOIN hr.locations l ON d.location_id = l.location_id
GROUP BY l.city;

-- 19. Find the number of employees who have a commission, grouped by department
-- This query counts employees who receive a commission, grouped by department.
SELECT department_id,
COUNT(*) AS employees_with_commission
FROM HR.EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
GROUP BY DEPARTMENT_ID;

-- 20. Find the sum of salaries for employees who have a commission, grouped by department
-- This query sums up the salaries of employees who receive a commission, grouped by department.
SELECT department_id,
SUM(salary) AS total_salary_with_commission
FROM HR.EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
GROUP BY DEPARTMENT_ID;

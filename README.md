# SQL
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

-- # Oracle SQL Aggregation Questions for Sales History Table
-- 1. Count the number of sales transactions for each product.  
SELECT PROD_ID,
COUNT(*) AS transaction_count
FROM SH.SALES
GROUP BY PROD_ID
ORDER BY transaction_count DESC;
-- This query groups sales transactions by product_id and counts how many transactions exist for each product.

-- 2. Find the average sale amount for each product.
SELECT PROD_ID,
AVG(AMOUNT_SOLD) AS avg_sale_amount
FROM SH.SALES
GROUP BY PROD_ID;
-- This query groups sales transactions by prod_id and calculates the average sale amount for each product.

-- 3. Find the maximum and minimum sale amount for each product.  
SELECT PROD_ID,  
MAX(AMOUNT_SOLD) AS max_sale_amount,  
MIN(AMOUNT_SOLD) AS min_sale_amount  
FROM SH.SALES  
GROUP BY PROD_ID;  
-- This query finds the highest (MAX) and lowest (MIN) sale amounts for each product.

-- 4. Find the total revenue generated by each product. 
SELECT PROD_ID, SUM(AMOUNT_SOLD) AS total_revenue  
FROM SH.SALES
GROUP BY PROD_ID;
-- This query calculates the total revenue for each product by summing up all sale amounts.

-- 5. Count the number of sales transactions for each customer.  
SELECT CUST_ID, COUNT(*) AS transaction_count  
FROM SH.SALES 
GROUP BY CUST_ID;  
-- This query counts the number of transactions made by each customer.

-- 6. Find the average sale amount per customer. 
SELECT CUST_ID, AVG(AMOUNT_SOLD) AS avg_sale_amount  
FROM SH.SALES
GROUP BY CUST_ID;
-- This query calculates the average sale amount for each customer.

-- 7. Find the highest purchase amount for each customer.
SELECT CUST_ID, MAX(AMOUNT_SOLD) AS max_purchase_amount  
FROM SH.SALES
GROUP BY CUST_ID; 
-- This query finds the maximum (MAX) purchase amount for each customer.

-- 8. Find the lowest purchase amount for each customer. 
SELECT CUST_ID,
MIN(AMOUNT_SOLD) AS min_purchase_amount  
FROM SH.SALES
GROUP BY CUST_ID; 
-- This query finds the minimum (MIN) purchase amount for each customer.

--Oracle SQL Analytical and Window Function Queries for Employee Table
--RANK
-- 7. Find the top 3 highest-paid employees in each department.
-- Uses RANK() to rank employees based on salary and filters top 3.
SELECT department_id, employee_id, salary
FROM(
    SELECT department_id, employee_id, salary,
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM hr.employees
) WHERE salary_rank <=3;

-- 8. Identify the second highest salary in each department using DENSE_RANK().
-- Uses DENSE_RANK() to identify employees with the second-highest salary per department.
SELECT department_id, employee_id, salary
FROM(
    SELECT department_id, employee_id, salary,
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM hr.employees
) WHERE salary_rank =2;

-- 20. Rank employees within their department based on experience.
-- Uses RANK() to order employees by hire date per department.
    SELECT department_id, employee_id, HIRE_DATE,
           RANK() OVER (PARTITION BY department_id ORDER BY HIRE_DATE ASC) AS experience_rank
    FROM hr.employees

--LAG function
-- Calculate the previous month’s salary for each employee using LAG().
-- Uses LAG() to get the previous salary entry for each employee.
SELECT employee_id, salary, hire_date, 
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary
FROM hr.employees;

-- Identify employees whose salaries increased over time.
-- Uses LAG() to compare an employee's current and previous salaries.
SELECT employee_id, hire_date, salary,
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS  prev_salary,
       CASE WHEN salary > LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date)
            THEN 'Increased' ELSE 'Decreased' END AS salary_trend
FROM hr.employees;

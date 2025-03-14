--RAANK()
-- Find the top 3 highest-paid employees in each department.
-- Uses RANK() to rank employees based on salary and filters top 3.
SELECT department_id, employee_id, salary
FROM(
    SELECT department_id, employee_id, salary,
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM hr.employees
) WHERE salary_rank <=3;

-- Identify the second highest salary in each department using DENSE_RANK().
-- Uses DENSE_RANK() to identify employees with the second-highest salary per department.
SELECT department_id, employee_id, salary
FROM(
    SELECT department_id, employee_id, salary,
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM hr.employees
) WHERE salary_rank =2;

-- Rank employees within their department based on experience.
-- Uses RANK() to order employees by hire date per department.
    SELECT department_id, employee_id, HIRE_DATE,
           RANK() OVER (PARTITION BY department_id ORDER BY HIRE_DATE ASC) AS experience_rank
    FROM hr.employees

--LAG FUNCTION
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

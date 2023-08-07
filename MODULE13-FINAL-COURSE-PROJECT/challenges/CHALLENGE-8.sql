-- Task 8

-- Difficulty: Advanced



-- Task 8.1

-- Write a query that returns the following:

-- emp_id,

-- first_name,

-- last_name,

-- position_title,

-- salary

-- and a column that returns the average salary for every job_position.



-- Order the results by the emp_id.





SELECT
emp_id,
first_name,
last_name,
position_title,
salary,
ROUND(AVG(salary) OVER(PARTITION BY position_title ORDER BY emp_id), 2) AS avg_salary_for_this_position
FROM employees
ORDER BY emp_id;
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








-- Task 8.2

-- Difficulty: Advanced to Pro



-- How many people earn less than the avg_position_salary?

-- Write a query that answers that question.

-- Ideally, the output just shows that number directly.



QUERY:



SELECT 
COUNT(*)
FROM (
SELECT
emp_id,
salary,
ROUND(AVG(salary) OVER(PARTITION BY position_title), 2) AS avg_salary_for_this_position
FROM employees
GROUP BY emp_id 
) AS result_set
WHERE salary < avg_salary_for_this_position;





Answer:

9

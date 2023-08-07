-- Task 4

-- Difficulty: Moderate



-- Task 4.1

-- Jack Franklin gets promoted to 'Senior SQL Analyst' and the salary raises to 7200.

-- Update the values accordingly.











UPDATE employees
SET position_title='Senior SQL Analyst',
salary=7200.00
WHERE first_name='Jack'
AND last_name='Franklin';







-- Task 4.2

-- The responsible people decided
--  to rename the position_title Customer Support to Customer Specialist.

-- Update the values accordingly.





-- preventive
SELECT
* FROM employees 
WHERE position_title='Customer Support';


UPDATE employees 
SET position_title='Customer Specialist'
WHERE position_title='Customer Support';







-- Task 4.3

-- All SQL Analysts including Senior SQL Analysts get a raise of 6%.

-- Upate the salaries accordingly.



-- preventive.
SELECT * FROM employees
WHERE position_title LIKE '%SQL Analyst%';



--update 
UPDATE employees
SET salary=salary * 1.06
WHERE position_title LIKE '%SQL Analyst';



-------------------------------------------------





-- Task 4.4

-- Question:

-- What is the average salary
--  of a SQL Analyst in the company
--   (excluding Senior SQL Analyst)?




ANSWER:

SELECT
AVG(salary)
FROM employee
WHERE position_title LIKE '%SQL Analyst';
AND job_position != 'Senior SQL Analyst';



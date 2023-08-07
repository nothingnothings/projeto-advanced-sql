-- Task 6

-- Difficulty: Moderate



-- Write a query that returns 
-- the average salaries for each positions
--  with appropriate roundings.



-- Question:

-- What is the average salary 

-- for a Software Engineer in the company.



-- Answer:

-- 6028.00






-- ANSWER:




SELECT 
position_title,
ROUND(AVG(salary) OVER (PARTITION BY position_title), 2) AS avg_salary
FROM employees
ORDER BY avg_salary DESC;





OUTPUT:





"position_title"	"avg_salary"
"CTO"	21268.94
"Head of BI"	14614.00
"Head of Sales"	12587.00
"Team Lead Analytics"	12564.00
"Senior SQL Analyst"	9535.76
"Senior SQL Analyst"	9535.76
"Senior SQL Analyst"	9535.76
"SQL Analyst"	8834.75
"SQL Analyst"	8834.75
"SQL Analyst"	8834.75
"SQL Analyst"	8834.75
"SQL Analyst"	8834.75
"SQL Analyst"	8834.75
"BI Consultant"	7718.50
"BI Consultant"	7718.50
"Software Engineer"	6028.00
"Software Engineer"	6028.00
"Project Manager"	5463.00
"Marketing Specialist"	4877.00
"Marketing Specialist"	4877.00
"Web Developper"	4753.00
"Web Developper"	4753.00
"Customer Specialist"	2707.50
"Customer Specialist"	2707.50
"Working Student"	1280.50
"Working Student"	1280.50







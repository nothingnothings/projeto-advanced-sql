Task 11

Difficulty: Advanced to Pro



Task 11.1

Write a query that
 outputs only the top 
 earner per position_title 
 including first_name and position_title
  and their salary.






QUERY:

SELECT 
*
FROM 
(
    SELECT 
    first_name,
    position_title,
    RANK() OVER(PARTITION BY position_title ORDER BY salary DESC) AS person_rank
    FROM employees
) AS result_set
WHERE person_rank=1;








OUTPUT:










"first_name"	"position_title"	"person_rank"
"Guendolen"	"BI Consultant"	1
"Morrie"	"CTO"	1
"Carlyn"	"Customer Specialist"	1
"Miller"	"Head of BI"	1
"Christalle"	"Head of Sales"	1
"Jordanna"	"Marketing Specialist"	1
"Cort"	"Project Manager"	1
"Clywd"	"Senior SQL Analyst"	1
"Reuben"	"Software Engineer"	1
"Sumner"	"SQL Analyst"	1
"Ely"	"Team Lead Analytics"	1
"Lowe"	"Web Developper"	1
"Zaneta"	"Working Student"	1







Task 11.2

Add also the average salary per position_title.





QUERY:






SELECT 
*
FROM 
(
    SELECT 
    first_name,
    position_title,
    RANK() OVER(PARTITION BY position_title ORDER BY salary DESC) AS person_rank,
	ROUND(AVG(salary) OVER (PARTITION BY position_title), 2) AS avg_salary
    FROM employees
) AS result_set
WHERE person_rank=1;









OUTPUT:






"first_name"	"position_title"	"person_rank"	"avg_salary"
"Guendolen"	"BI Consultant"	1	7718.50
"Morrie"	"CTO"	1	21268.94
"Carlyn"	"Customer Specialist"	1	2707.50
"Miller"	"Head of BI"	1	14614.00
"Christalle"	"Head of Sales"	1	12587.00
"Jordanna"	"Marketing Specialist"	1	4877.00
"Cort"	"Project Manager"	1	5463.00
"Clywd"	"Senior SQL Analyst"	1	9535.76
"Reuben"	"Software Engineer"	1	6028.00
"Sumner"	"SQL Analyst"	1	8834.75
"Ely"	"Team Lead Analytics"	1	12564.00
"Lowe"	"Web Developper"	1	4753.00
"Zaneta"	"Working Student"	1	1280.50







-- Remove those employees 
-- from the output of the previous query that 
-- has the same salary as the average of their position_title.

-- These are the people that 
-- are the only ones with their position_title.











QUERY (Talvez assim):






SELECT 
*
FROM 
(
    SELECT 
    first_name,
    position_title,
	salary,
    RANK() OVER(PARTITION BY position_title ORDER BY salary DESC) AS person_rank,
	ROUND(AVG(salary) OVER (PARTITION BY position_title), 2) AS avg_salary
    FROM employees
) AS result_set
WHERE person_rank=1
AND salary != avg_salary;
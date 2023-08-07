Difficulty: Pro



Write a query that returns only the top earner of each department including

their emp_id, position_title, department, and their salary.











QUERY:



SELECT * FROM 
(
	
SELECT 
e.emp_id,
e.position_title,
de.department,
e.salary,
RANK() OVER(PARTITION BY de.department ORDER BY salary DESC) AS salary_rank
FROM employees AS e
LEFT JOIN departments AS de 
ON e.department_id=de.department_id
) AS result_set
WHERE salary_rank=1;
















output:








"emp_id"	"position_title"	"department"	"salary"	"salary_rank"
1	"CTO"	"Analytics"	21268.94	1
12	"Software Engineer"	"Back Office"	7119.00	1
8	"SQL Analyst"	"Finance"	9993.68	1
3	"Head of Sales"	"Sales"	12587.00	1
24	"Web Developper"	"Website"	6418.00	1















Question:

Which employee (emp_id) is the top earner in the department Finance?



Answer:

emp_id 8












Question:

Which employee (emp_id) is the top earner in the department Finance?



Answer:

emp_id 8





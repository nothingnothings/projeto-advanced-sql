Difficulty: Advanced to Pro



Write a query that
 returns all employees (emp_id)
  including their position_title,
 department, their salary, and the rank
  of that salary partitioned by department.

The highest salary per division 
should have rank 1.









QUERY:

SELECT 
e.emp_id,
e.position_title,
de.department,
e.salary,
RANK() OVER(PARTITION BY de.department ORDER BY salary DESC) AS salary_rank
FROM employees AS e
LEFT JOIN departments AS de 
ON e.department_id=de.department_id;









OUTPUT:








"emp_id"	"position_title"	"department"	"salary"	"salary_rank"
1	"CTO"	"Analytics"	21268.94	1
2	"Head of BI"	"Analytics"	14614.00	2
6	"Team Lead Analytics"	"Analytics"	12564.00	3
7	"Senior SQL Analyst"	"Analytics"	11140.60	4
4	"SQL Analyst"	"Analytics"	10085.90	5
16	"Senior SQL Analyst"	"Analytics"	9834.68	6
26	"SQL Analyst"	"Analytics"	9079.96	7
5	"BI Consultant"	"Analytics"	7107.00	8
18	"SQL Analyst"	"Analytics"	6335.62	9
12	"Software Engineer"	"Back Office"	7119.00	1
17	"Project Manager"	"Back Office"	5463.00	2
11	"Customer Specialist"	"Back Office"	3060.00	3
10	"Customer Specialist"	"Back Office"	2355.00	4
8	"SQL Analyst"	"Finance"	9993.68	1
19	"SQL Analyst"	"Finance"	7993.46	2
25	"Senior SQL Analyst"	"Finance"	7632.00	3
3	"Head of Sales"	"Sales"	12587.00	1
20	"SQL Analyst"	"Sales"	9519.86	2
15	"BI Consultant"	"Sales"	8330.00	3
14	"Marketing Specialist"	"Sales"	5844.00	4
13	"Marketing Specialist"	"Sales"	3910.00	5
21	"Working Student"	"Sales"	1525.00	6
22	"Working Student"	"Sales"	1036.00	7
24	"Web Developper"	"Website"	6418.00	1
9	"Software Engineer"	"Website"	4937.00	2
23	"Web Developper"	"Website"	3088.00	3










Question:

Which employee (emp_id) is in rank 7 in the department Analytics?



Answer:

emp_id 26











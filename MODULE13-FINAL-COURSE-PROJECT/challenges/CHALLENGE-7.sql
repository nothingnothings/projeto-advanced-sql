-- Task 7

-- Difficulty: Moderate



-- Write a query that returns the average salaries per division.



-- Question:

-- What is the average salary in the Sales department?





Answer:

6107.41








-- QUERY:



SELECT
de.division,
ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees AS e
LEFT JOIN departments AS de 
ON e.department_id=de.department_id
GROUP BY de.division
ORDER BY avg_salary;





OUTPUT:


"division"	"avg_salary"
"Sales"	6107.41
"Administration"	6230.88
"IT"	9706.14
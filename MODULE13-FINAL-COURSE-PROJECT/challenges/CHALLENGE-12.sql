Difficulty: Pro



Write a query that returns all meaningful aggregations of

- sum of salary,

- number of employees,

- average salary

grouped by all meaningful combinations of

- division,

- department,

- position_title.



Consider the levels of hierarchies in a meaningful way.




(USO DE "ROLLUP"):









SELECT 
division,
de.department,
position_title,
  SUM(salary) AS sum,
 COUNT(emp_id)  AS count,
 ROUND(AVG(salary), 2) AS round
FROM employees AS e
LEFT JOIN departments AS de 
ON e.department_id=de.department_id
    GROUP BY 
        ROLLUP(de.division, de.department, position_title)
ORDER BY division;





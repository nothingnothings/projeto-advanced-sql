Task 9:

Difficulty: Advanced

Write a query that
 returns a running total
  of the salary development 
  ordered by the start_date.

In your calculation, you can assume their salary
 has not changed over time, and you can disregard
  the fact that people have left the company 
  (write the query as if they were still working for the company).





QUERY: 



 SELECT 
 	start_date,
    SUM(salary) OVER(ORDER BY start_date)
    FROM employees;



Question:

What was the total salary after 2018-12-31?




Answer:

180202.70




-- Level: Difficult to very difficult

-- Topic: EXTRACT + Uncorrelated subquery

-- Task: Create a query that shows average daily revenue of all Sundays.

-- Question: What is the daily average revenue of all Sundays?




-- QUERY:


-- SELECT 
-- AVG(result_set.all_revenue)
-- FROM (
-- 	SELECT
--  	SUM(amount) / COUNT(DISTINCT TO_CHAR(payment_date, 'YYYY-MM-DD')) AS all_revenue
-- 	FROM payment
-- 	WHERE EXTRACT(DOW FROM payment_date) = 0
-- ) AS result_set;




-- OUTPUT:


-- "all_revenue"
-- 1410.6528571428571429







-- Answer: 1410.65













MINHA VERSAO:









 SELECT 
 AVG(result_set.all_revenue)
 FROM (
 	SELECT
  	SUM(amount) / COUNT(DISTINCT TO_CHAR(payment_date, 'YYYY-MM-DD')) AS all_revenue
 	FROM payment
 	WHERE EXTRACT(DOW FROM payment_date) = 0
 ) AS result_set;









 VERSAO DO PROFESSOR:









SELECT 
ROUND(AVG(total), 2)
FROM
(
 SELECT 
 DATE(payment_date),
 EXTRACT(DOW FROM payment_date),
 SUM(amount) AS total
 FROM payment
 WHERE EXTRACT(DOW FROM payment_date) = 0 
 GROUP BY DATE(payment_date), EXTRACT(DOW FROM payment_date)
) AS sub








-------------------------------
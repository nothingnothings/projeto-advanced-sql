-- Question 2:

-- Level: Moderate

-- Topic: CASE + GROUP BY

-- Task: Write a query that gives an overview of how many films have replacements costs in the following cost ranges

-- low: 9.99 - 19.99

-- medium: 20.00 - 24.99

-- high: 25.00 - 29.99


-- QUERY WITH GROUP BY AND CASE:


SELECT
CASE 
	WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low'
	WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium'
	WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'high'
END AS replacement_type,
COUNT(film) AS movie_amount_per_replacement_cost
FROM film
GROUP BY replacement_type;





OUTPUT:

"replacement_type"	"movie_amount_per_replacement_cost"
"medium"							250
"high"								236
"low"								514




-- QUERY WITH CASE AND SUM:


SELECT 
SUM(
	CASE 
		WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 1
		ELSE 0
	END
) AS low,
SUM(
	CASE 
		WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 1
		ELSE 0
	END
) AS medium,
SUM(
	CASE 
		WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 1
		ELSE 0
	END
) AS high
FROM film;



OUTPUT:




"low"	"medium"	"high"
514		  250		  236























-- Question: How many films have a replacement cost in the "low" group?





Answer: 514
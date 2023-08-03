Level: Very difficult

Topic: Uncorrelated subquery

Task: Create a list that shows all payments including the payment_id, amount, and the film category (name) plus the total amount that was made in this category. Order the results ascendingly by the category (name) and as second order criterion by the payment_id ascendingly.

Question: What is the total revenue of the category 'Action' and what is the lowest payment_id in that category 'Action'?

Answer: Total revenue in the category 'Action' is 4375.85 and the lowest payment_id in that category is 16055.















Consegui... com um pouco de ajuda do chatgpt:











WITH category_amounts AS (
    SELECT
        ca.category_id,
        SUM(p.amount) AS category_sum
    FROM payment AS p
    LEFT JOIN rental AS r ON p.rental_id = r.rental_id
    JOIN inventory AS i ON r.inventory_id = i.inventory_id
    JOIN film AS f ON f.film_id = i.film_id
    JOIN film_category AS fc ON fc.film_id = f.film_id
    JOIN category AS ca ON ca.category_id = fc.category_id
    GROUP BY ca.category_id
)
SELECT
    p.payment_id AS payment_id,
    p.amount AS amount,
    ca.name AS category_name,
    ca_sum.category_sum AS category_sum
FROM payment AS p
LEFT JOIN rental AS r ON p.rental_id = r.rental_id
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON f.film_id = i.film_id
JOIN film_category AS fc ON fc.film_id = f.film_id
JOIN category AS ca ON ca.category_id = fc.category_id
LEFT JOIN category_amounts AS ca_sum ON ca.category_id = ca_sum.category_id;




The WITH clause, also known as a
 Common Table Expression (CTE), is a powerful feature in SQL that allows
  you to define temporary result sets that can be referenced within the context of a single SQL statement. 
  It provides a way to break down complex queries into more manageable, readable, and reusable parts.














--------------------------------










minha versao:







WITH category_amounts AS (
    SELECT
        ca.category_id,
        SUM(p.amount) AS category_sum
    FROM payment AS p
    LEFT JOIN rental AS r ON p.rental_id = r.rental_id
    JOIN inventory AS i ON r.inventory_id = i.inventory_id
    JOIN film AS f ON f.film_id = i.film_id
    JOIN film_category AS fc ON fc.film_id = f.film_id
    JOIN category AS ca ON ca.category_id = fc.category_id
    GROUP BY ca.category_id
)
SELECT
    p.payment_id AS payment_id,
    p.amount AS amount,
    ca.name AS category_name,
    ca_sum.category_sum AS category_sum
FROM payment AS p
LEFT JOIN rental AS r ON p.rental_id = r.rental_id
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON f.film_id = i.film_id
JOIN film_category AS fc ON fc.film_id = f.film_id
JOIN category AS ca ON ca.category_id = fc.category_id
LEFT JOIN category_amounts AS ca_sum ON ca.category_id = ca_sum.category_id;















VERSAO DO PROFESSOR:











SELECT 
title,
amount,
payment_id,
name 
(
    SELECT 
    SUM(amount)
    FROM payment AS p 
    LEFT JOIN rental AS r 
    ON r.rental_id=p.rental_id
    LEFT JOIN inventory AS i
    ON i.inventory_id=r.inventory_id 
    LEFT JOIN film AS f 
    ON f.film_id=i.film_id 
    LEFT JOIN film_category AS fc 
    ON fc.film_id=c.film_id 
    LEFT JOIN category AS c2
    ON c1.category_id=fc.category_id
    WHERE c1.name=c2.name --- HERE WE CREATE A CORRELATED SUBQUERY.
) 
FROM payment AS p 
LEFT JOIN rental AS r 
ON r.rental_id=p.rental_id
LEFT JOIN inventory AS i
ON i.inventory_id=r.inventory_id 
LEFT JOIN film AS f 
ON f.film_id=i.film_id 
LEFT JOIN film_category AS fc 
ON fc.film_id=c.film_id 
LEFT JOIN category AS c1
ON c.category_id=fc.category_id
ORDER BY name, payment_id ASC























SELECT
title,
amount,
name,
payment_id,
(SELECT SUM(amount) FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c1
ON c1.category_id=fc.category_id
WHERE c1.name=c.name)
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
ORDER BY name











-- OBS: ESSA QUERY DEMORA BASTANTE TEMPO PARA RODAR.












A CHALLENGE:











WRITE A QUERY THAT RETURNS THE LIST OF MOVIES INCLUDING:


- film_id
- title 
- length 
- category (name)
- average length of movies in that same category 


-- THE RESULTS SHOULD BE ORDERED BY FILM_ID...










--> ACHO QUE A QUERY FICA ASSIM:



SELECT 
f.film_id,
f.title,
f.length,
ca.name,
ROUND(AVG(f.length) OVER(PARTITION BY ca.name), 2)
FROM film AS f
LEFT JOIN film_category AS fc
ON f.film_id = fc.film_id
JOIN category AS ca
ON fc.category_id = ca.category_id
ORDER BY film_id;











MAS TEMOS UMA SEGUNDA CHALLENGE:










WRITE A QUERY THAT RETURNS ALL PAYMENT DETAILS,

INCLUDING:


- THE NUMBER OF PAYMENTS THAT WERE MADE BY THIS 
CUSTOMER (customer_id) AND THAT AMOUNT.


- ORDER THE RESULTS BY PAYMENT_ID....







ACHO QUE FICA TIPO ASSIM:



SELECT 
*,
COUNT(*) OVER(PARTITION BY customer_id, amount) AS n_of_payments_with_that_amount
FROM payment
ORDER BY payment_id;












SOLUCAO DO PROFESSOR:













SELECT 
f.film_id,
title,
name AS category,
length AS length_of_movie,
ROUND(AVG(length) OVER (partition BY name), 2) AS avg_length_in_that_category
FROM film as f
LEFT JOIN film_category AS fc 
ON f.film_id=fc.film_id
JOIN category AS c
ON fc.category_id=c.category_id 
ORDER BY 1;
















AGORA TEMOS A SEGUNDA CHALLENGE:













SELECT
*,
COUNT(*) OVER (PARTITION BY amount, customer_id) 
FROM payment
ORDER BY customer_id;

Level: Extremely difficult

Topic: Correlated and uncorrelated subqueries (nested)

Task: Create a list with the top overall revenue of a film title (sum of amount per title) for each category (name).

Question: Which is the top-performing film in the animation category?

Answer: DOGMA FAMILY with 178.70.








melhor ver a aula do professor...











QUERY EXTREMAMENTE DIFÍCIL...








--> Task: Create a list with the top overall
 revenue of a film title (sum of amount per title) for each category (name).










RESOLUCAO:






INÍCIO:




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
ORDER BY name, title












AGORA QUEREMOS LIMITAR OS RESULTADOS A APENAS 


OS TOP PERFORMING MOVIES DE ACDA 



CATEGORIA...







---> VAMOS USAR O HAVING, PARA FILTRAR O RESULTADO 

DA COLUMN DE "TOTAL", que é um aggregate...






ESCREVEMOS ASSIM:






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
GROUP BY name, title
HAVING sum(amount) = ( SELECT MAX(total)
                        FROM (

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
GROUP BY name, title) AS sub
WHERE c.name=sub.name
)






ok... muito difícil... mas fazível
Write a query that 
returns all grouping sets in 
all combinations of customer_id, date and title
 with the aggregation of the payment amount.

The desired result looks like this:







customer_id  date    title          total 
1                     exemplo
1                     null 
1                     exemplo
1                     null
1
1








A RESPOSTA FICOU ASSIM:









SELECT 
p.customer_id,
DATE(payment_date),
f.title,
SUM(amount)
FROM payment AS p
LEFT JOIN rental AS r 
ON r.rental_id=p.rental_id
JOIN inventory AS i
ON i.inventory_id=r.inventory_id
JOIN film AS f
ON f.film_id=i.film_id
GROUP BY 
CUBE(p.customer_id, DATE(payment_date), title)
ORDER BY p.customer_id, DATE(payment_date), title;


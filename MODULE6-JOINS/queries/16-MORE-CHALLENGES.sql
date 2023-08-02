




Question 1:

Which passenger (passenger_name) has spent most amount in their bookings (total_amount)?

Answer: ALEKSANDR IVANOV with 80964000.





QUERY:

SELECT 
t.passenger_name,
SUM(br.total_amount) as passenger_total_spent
FROM tickets AS t
LEFT JOIN bookings AS br
ON t.book_ref = br.book_ref
GROUP BY t.passenger_name
ORDER BY passenger_total_spent DESC;





Question 2:

Which fare_condition has ALEKSANDR IVANOV used the most?

Answer: Economy 2131 times.



RESPOSTA:


SELECT
tf.fare_conditions,
COUNT(tf) AS number_used
FROM tickets AS t
INNER JOIN ticket_flights AS tf
ON t.ticket_no = tf.ticket_no
WHERE t.passenger_name = 'ALEKSANDR IVANOV'
GROUP BY tf.fare_conditions
ORDER BY number_used DESC;






Question 3:

Which title has GEORGE LINTON rented the most often?

Answer: CADDYSHACK JEDI - 3 times.




RESPOSTA:





SELECT
f.title,
COUNT(f.title) AS n_of_rentals
FROM customer AS c
LEFT JOIN rental AS r
ON r.customer_id = c.customer_id
INNER JOIN inventory AS i
ON i.inventory_id = r.inventory_id
INNER JOIN film AS f
ON i.film_id = f.film_id
WHERE c.first_name = 'GEORGE' AND c.last_name = 'LINTON'
GROUP BY f.title
ORDER BY n_of_rentals DESC;






OK... TERMINEI AS 3...

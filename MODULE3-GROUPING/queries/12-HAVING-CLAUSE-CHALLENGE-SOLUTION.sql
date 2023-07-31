






MINHA QUERY HAVIA FICADO ASSIM:





SELECT
customer_id,
ROUND(AVG(amount), 2) AS average_paid,
COUNT(amount) AS num_of_payments,
DATE(payment_date)
FROM payment
WHERE DATE(payment_date) BETWEEN '2020-04-28' AND '2020-05-01'
GROUP BY customer_id, DATE(payment_date)
HAVING COUNT(amount) > 1
ORDER BY average_paid DESC;






o professor comeca assim:





SELECT 
customer_id,
DATE(payment_date),
ROUND(AVG(amount,2)) AS average_paid,
COUNT(amount) AS num_of_payments
FROM payment 
WHERE DATE(payment_date) BETWEEN '2020-04-28' AND '2020-05-01' -- dias 28,29 e 30.
GROUP BY customer_id, DATE(payment_date)
HAVING COUNT(amount) > 1
ORDER BY average_paid DESC;














ok... acertei....






vimos 1 monte das coisas aprendidas nas últimas liçoẽs...





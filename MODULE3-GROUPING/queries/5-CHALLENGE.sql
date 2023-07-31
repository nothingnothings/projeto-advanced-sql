







A CHALLENGE É:








-- ""YOUR MANAGER WANTS TO KNOW WHICH OF THE TWO EMPLOYEES (staff_id)
-- IS RESPONSIBLE FOR MORE PAYMENTS""...





TAMBÉM:



-- ""WHICH OF THE TWO IS RESPONSIBLE FOR A HIGHER OVERALL
-- PAYMENT AMOUNT""






TAMBÉM 




-- ""HOW DO THESE AMOUNTS CHANGE IF WE DON'T CONSIDER 
-- AMOUNTS EQUAL TO 0"" (um pouco mais complicado...)...






-----------------------------









COMECAMOS PELA 1:




-- ""YOUR MANAGER WANTS TO KNOW WHICH OF THE TWO EMPLOYEES (staff_id)
-- IS RESPONSIBLE FOR MORE PAYMENTS""...





SELECT
staff_id,
COUNT(*) AS num_of_payments
FROM payment
GROUP BY staff_id
ORDER BY num_of_payments DESC;




-- ok... isso resultou em 8057 payments para o staff_id 1, e 7992 payments para o staff_id 2...





-- agora este aqui: -- ""WHICH OF THE TWO IS RESPONSIBLE FOR A HIGHER OVERALL
-- PAYMENT AMOUNT""





-- fica tipo assim:


SELECT
staff_id,
SUM(amount) AS total_payment_received
FROM payment
GROUP BY staff_id
ORDER BY total_payment_received DESC;




-- recebido pelo staff_id 2 --> 33927.04 (total)

-- recebido pelo staff_id 1 --> 33489.47 (total)







-- se quisermos saber o AVERAGE amount recebido por esses customers, escrevemos:



SELECT
staff_id,
ROUND(AVG(amount), 4) AS avg_payment_received
FROM payment
GROUP BY staff_id
ORDER BY avg_payment_received DESC;




-- staff_id 2 === conseguia geralmente 4.2451 por payment 
-- staff_id 1 === conseguia 4.1566 por payment 







-- AGORA O ÚLTIMO CASE:





-- ""HOW DO THESE AMOUNTS CHANGE IF WE DON'T CONSIDER 
-- AMOUNTS EQUAL TO 0"" (um pouco mais complicado...)...





SELECT
staff_id,
ROUND(AVG(amount), 4) AS avg_payment_received
FROM payment
WHERE amount != 0
GROUP BY staff_id
ORDER BY avg_payment_received DESC;




-- mudou, ficou:

-- staff_id 2 === 4.2499
-- staff_id 1 === 4.1643








--> mas pelo visto, a query que o professor queria era esta:





SELECT
staff_id,
COUNT(*) AS total_orders,
SUM(amount) AS total_payment_received
FROM payment
WHERE amount != 0
GROUP BY staff_id
ORDER BY total_payment_received DESC;


-- e o resultado ficou assim:

id  total_orders  total_payment_received
2	7983	33927.04
1	8042	33489.47
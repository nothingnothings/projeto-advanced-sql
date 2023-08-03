












TEMOS ALGUMAS CHALLENGES, MAIS DIFÍCEIS:












1) SHOW ALL THE PAYMENTS,

PLUS THE TOTAL AMOUNT FOR EVERY CUSTOMER, 

AS WELL AS THE NUMBER OF PAYMENTS OF EACH CUSTOMER....











A QUERY FICOU TIPO ASSIM:










SELECT 
*,
(
	SELECT 
	SUM(amount)
	FROM payment AS p2
	WHERE p1.customer_id = p2.customer_id
) AS total_amount_per_customer,
(
	SELECT 
	COUNT(payment_id)
	FROM payment AS p3
	WHERE p3.customer_id = p1.customer_id
) AS number_of_payments
FROM payment AS p1
ORDER BY customer_id;






agora a segunda challenge...













------------------------------------------







2) SHOW ONLY THOSE FILMS WITH THE HIGHEST 
REPLACEMENT COSTS IN THEIR RATING CATEGORY...

PLUS, SHOW THE AVERAGE REPLACEMENT COST IN THEIR 
RATING CATEGORY...












FICOU ASSIM:








SELECT
*,
ROUND((
	SELECT 
	AVG(replacement_cost)
	FROM film AS f3 
	WHERE f3.rating = f1.rating
), 2) AS average_replacement_cost_for_rating
FROM film AS f1 
WHERE replacement_cost = (
	SELECT 
	MAX(replacement_cost)
	FROM film AS f2
	WHERE f1.rating = f2.rating
);














3) SHOW ONLY THOSE PAYMENTS 

WITH _ THE_ HIGHEST __ PAYMENT_ AMOUNT _ 

FOR __ EACH CUSTOMER'S FIRST NAME...



INCLUDING THE PAYMENT_ID OF THAT PAYMENT...
















A QUERY INICIAL FICOU ASSIM:







SELECT
c.first_name,
payment_id,
amount
FROM payment AS p1
INNER JOIN customer AS c
ON p1.customer_id = c.customer_id
WHERE amount = (
	SELECT
	MAX(amount)
	FROM payment AS p2 
	WHERE p1.customer_id=p2.customer_id
)
ORDER BY c.first_name;














mas aí temos a segunda parte:





"""HOW WOULD YOU SOULVE IT IF YOU 
WOULD NOT NEED TO SEE THE PAYMENT_ID"""...









ué, acho que 



basta tirar o payment_id da column,
tipo assim:








SELECT
c.first_name,
amount
FROM payment AS p1
INNER JOIN customer AS c
ON p1.customer_id = c.customer_id
WHERE amount = (
	SELECT
	MAX(amount)
	FROM payment AS p2 
	WHERE p1.customer_id=p2.customer_id
)
ORDER BY c.first_name;




















OK, MAS COMO FICARAM AS SOLUCOES?








O PROFESSOR ESCREVEU ASSIM:













SELECT 
payment_id,
customer_id,
staff_id,
amount
(SELECT SUM(amount) AS sum_amount
FROM payment AS p2
WHERE p1.customer_id=p2.customer_id
),
(SELECT COUNT(amount) AS count_payments
FROM payment AS p2
WHERE p1.customer_id=p2.customer_id
)
FROM payment p1
ORDER BY customer_id, amount DESC;















OK... ISSO FEITO,


TEMOS A SEGUNDA QUERY...












HIGHEST REPLACEMENT COST FOR EACH RATING...









ex:





SELECT
title,
replacement_cost,
rating,
(
    SELECT AVG(replacement_cost) FROM film f2 
    WHERE f1.rating=f2.rating
)
FROM film f1 
WHERE replacement_cost = (
    SELECT MAX(replacement_cost) FROM film 
    WHERE f1.rating=f3.rating
);










ISSO QUER DIZER QUE AGRUPAMOS POR RATING, E QUE 
QUEREMOS VER O HIGHEST REPLACEMENT COST PARA 

CADA RATING...












certo...














POR FIM, A ÚLTIMA QUERY...








-- NA ÚLTIMA QUERY, PROF USOU 1 JOIN:









SELECT 
first_name,
amount,
payment_id
FROM payment p1
INNER JOIN customer AS c 
ON p1.customer_id = c.customer_id 
WHERE amount = (
    SELECT MAX(amount)
    FROM payment p2 
    WHERE p1.customer_id=p2.customer_id
);

















CERTO... FOI EXATAMENTE O QUE EU FIZ....






AGORA TEREMOS UM COURSE PROJECT...

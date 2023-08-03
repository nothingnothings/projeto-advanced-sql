questao BEM difícil.


RESULTADO:






Level: Difficult

Topic: Uncorrelated subquery

Task: Create a list with the average of the sales amount each staff_id has per customer.

Question: Which staff_id makes on average more revenue per customer?


QUERY:



SELECT 
staff_id, 
AVG(revenue_per_customer)
FROM (
	SELECT 
p.staff_id,
c.customer_id,
ROUND(SUM(p.amount), 5) AS revenue_per_customer
FROM payment AS p 
LEFT JOIN customer AS c
ON c.customer_id = p.customer_id
GROUP BY p.staff_id, c.customer_id
ORDER BY p.staff_id
) AS result_set
GROUP BY staff_id;



OUTPUT:


"staff_id"	"avg"
1	55.9089649415692821
2	56.6394657762938230



Answer: staff_id 2 with an average revenue of 56.64 per customer.


























CORRECAO:















minha versao:











SELECT 
staff_id, 
AVG(revenue_per_customer)
FROM (
	SELECT 
p.staff_id,
c.customer_id,
ROUND(SUM(p.amount), 5) AS revenue_per_customer
FROM payment AS p 
LEFT JOIN customer AS c
ON c.customer_id = p.customer_id
GROUP BY p.staff_id, c.customer_id
ORDER BY p.staff_id
) AS result_set
GROUP BY staff_id;









VERSAO DO PROFESSOR:







SELECT
staff_id,
ROUND(AVG(total), 2)

FROM (
    SELECT 
    staff_id,
    customer_id,
    SUM(amount) AS total
    FROM payment 
    GROUP BY staff_id, customer_id
    ORDER BY 2
) AS sub 
GROUP BY staff_id



EIS A CHALLENGE:










WRITE A QUERY THAT RETURNS THE SUM OF THE AMOUNT 
FOR EACH CUSTOMER (first_name and last_name) AND 
EACH STAFF_ID.... ALSO ADD THE OVERALL REVENUE 

PER CUSTOMER...













ACHO QUE COMECAMOS ASSIM:










SELECT
CONCAT(first_name, ' ', last_name) AS name,
staff_id,
SUM(amount) 
FROM payment AS p
LEFT JOIN customer AS c
ON p.customer_id=c.customer_id
GROUP BY 
    GROUPING SETS (
        (name, staff_id),
        (name)
    );







bem simples, e funciona....










SOLUCAO DO PROFESSOR:










SELECT
first_name,
last_name,
staff_id,
SUM(amount)
FROM customer AS c 
LEFT JOIN payment AS p
ON c.customer_id=p.customer_id
GROUP BY 
    GROUPING SETS (
        (first_name, last_name),
        (first_name, last_name, staff_id)
    );





A CHALLENGE:










WRITE A QUERY THAT RETURNS THE CUSTOMER'S NAME,
THE COUNTRY AND HOW MANY PAYMENTS THEY HAVE...





FOR THAT, USE THE EXISTING VIEW 'customer_list'...






THE VIEW'S FORMAT:





name     country      count 










ACHO QUE A QUERY FICA ASSIM:








SELECT
*
FROM customer_list;















ASSIM QUE TIVERMOS ESSE RESULT SET,




DEVEMOS:








"AFTERWARDS CREATE A RANKING OF THE TOP CUSTOMERS 
WITH MOST SALES FOR EACH COUNTRY. FILTER THE RESULTS 
TO ONLY THE TOP 3 CUSTOMERS PER COUNTRY"....









A VIEW ESTAVA ESTRAGADA,


POR ISSO A RECRIEI,

COM ESTE CÓDIGO:











SELECT
* FROM customer_list
ORDER BY name;



DROP VIEW customer_list;

CREATE OR REPLACE VIEW customer_list
AS 
SELECT 
CONCAT(first_name, ' ', last_name) AS name,
country,
-- COUNT(p.payment_id) OVER(PARTITION BY c.customer_id) AS count
COUNT(p.payment_id) AS count
FROM customer AS c
LEFT JOIN payment AS p
ON c.customer_id=p.customer_id
JOIN address AS a
ON c.address_id=a.address_id
JOIN city AS ci 
ON ci.city_id=a.city_id 
JOIN country AS co 
ON co.country_id=ci.country_id
GROUP BY c.customer_id, country;
















JÁ A QUERY DA CHALLENGE,
ACHO QUE VAI FICAR ASSIM:



SELECT 
name,
rank
FROM 
(
SELECT
*,
RANK() OVER(PARTITION BY country ORDER BY count DESC) AS rank
FROM customer_list
) AS result_set
WHERE rank IN (1,2,3);

















O PROFESSOR RESOLVEU ASSIM:











SELECT
name,
country,
COUNT(*),
RANK() OVER(PARTITION BY country ORDER BY count(*) DESC)
FROM customer_list
LEFT JOIN payment
ON id=customer_id
GROUP BY name, country;











MAS SE QUEREMOS FILTRAR, COMO O PROFESSOR 

NOS EXPLICOU, PRECISAMOS TRANSFORMAR ISSO EM 
1 SUBQUERY:






SELECT * FROM 
(
SELECT
name,
country,
COUNT(*),
RANK() OVER(PARTITION BY country ORDER BY count(*) DESC)
FROM customer_list
LEFT JOIN payment
ON id=customer_id
GROUP BY name, country
) AS result_set
WHERE rank IN (1,2,3)


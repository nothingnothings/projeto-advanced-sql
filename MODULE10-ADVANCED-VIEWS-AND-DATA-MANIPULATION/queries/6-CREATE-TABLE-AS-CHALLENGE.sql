













NESSA CHALLENGE, PRECISAMOS 


CRIAR 1 TABLE ASSIM:




1) o nome da table deve ser customer_spendings 




2) deve conter o FIRST_NAME E LAST_NAME DO CUSTOMER,

EM 1 COLUMN DE "NAME" 




3) DEVEMOS TER 



1 COLUMN DE "TOTAL AMOUNT",



QUE SERÁ OS TOTAL SPENDINGS QUE CADA CUSTOMER FEZ,
 

 NA TABLE DE 

 PAYMENT...











 -> É MELHOR CRIAR A QUERY PRIMEIRO,PARA 
 SÓ DEPOIS CRIAR A TABLE...





 ESCREVEMOS ASSIM:




 















1) o nome da table deve ser customer_spendings 




2) deve conter o FIRST_NAME E LAST_NAME DO CUSTOMER,

EM 1 COLUMN DE "NAME" 




3) DEVEMOS TER 



1 COLUMN DE "TOTAL AMOUNT",



QUE SERÁ OS TOTAL SPENDINGS QUE CADA CUSTOMER FEZ,
 

 NA TABLE DE 

 PAYMENT...










QUERY:



CREATE TABLE customer_spendings
AS
SELECT 
CONCAT(c.first_name, ' ', c.last_name) AS name,
SUM(p.amount) AS total_amount
FROM customer AS c
LEFT JOIN payment AS p  
ON p.customer_id = c.customer_id
GROUP BY name;


SELECT * FROM customer_spendings;











CERTO... FUNCIONOU...
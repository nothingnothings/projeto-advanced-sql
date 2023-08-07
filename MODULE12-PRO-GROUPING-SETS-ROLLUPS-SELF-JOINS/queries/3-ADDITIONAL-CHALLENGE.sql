


OUTRA CHALLENGE:









WRITE A QUERY THAT CALCULATES 

THE SHARE OF REVENUE THAT EACH OF THE CUSTOMERS 


MAKES PER STAFF_ID...




O RESULTADO DEVE FICAR ASSIM:









first_name  last_name   staff_id  total  percentage_shares 












acho que fica assim:











SELECT
CONCAT(first_name, ' ', last_name) AS name,
staff_id,
SUM(amount) AS total,
ROUND(100 * SUM(amount) 
/
FIRST_VALUE(SUM(amount)) OVER (PARTITION BY CONCAT(first_name, ' ', last_name) ORDER BY SUM(amount) DESC), 2) AS percentage
FROM payment AS p1
LEFT JOIN customer AS c
ON p1.customer_id=c.customer_id
GROUP BY 
    GROUPING SETS (
		        (name),
        (name, staff_id)

    );







USAMOS O "FIRST_VALUE" para pegar o MAIOR 

VALUE 



em cada partition... para entao 



conseguirmos USAR O "CURRENT_VALUE" 


do total 


com esse maior value, para pegarmos a percentage...









BEM GRANDE...











AGORA QUE JÁ APRENDEMOS


A USAR 



SUBQUERIES 



COM WHERE,


TIPO 








SELECT * 
FROM 
<TABLE_NAME>
WHERE customer_id IN (
    SELECT ... (retornando múltiplos values)
)









E 






SELECT *
FROM
<table_name>
WHERE <count/condition> = (
    SELECT ... (retornando 1 value único)
),















AGORA ESTAMOS PREPARADOS PARA 


APRENDER MAIS 2 APLICACOES 

DAS SUBQUERIES...
















1) A PRIMEIRA APLICACAO É NA CLAUSE DE "FROM"...











PQ EM VEZ DE QUERIARMOS EM CIMA DE 1 TABLE,


PODEMOS FAZER QUERY EM CIMA 



DE UM RESULT SET,


CRIADO 



DENTRO DE "()"....












TIPO ASSIM:














SELECT * 
FROM (
    SELECT <col> 
    FROM <table_name> 
);

















--> QUEREM QUE 

DESCUBRAMOS 
O 

"AVERAGE LIFETIME SPENT"



POR CUSTOMER...









PODEMOS COMECAR ASSIM:












SELECT * FROM payment;










-- TEMOS VÁRIOS CUSTOMER_IDs 

nessa table..








-> PODEMOS SOMAR O AMOUNT 

POR TODOS 
CUSTOMER IDS...







ex:













SELECT
customer_id,
SUM(amount)
FROM payment 
GROUP BY customer_id;














--> OK... AÍ FICAMOS COM OS LIFETIME SPENDINGS 

DE CADA CUSTOMER...












--> OK, MAS COMO PODEMOS CALCULAR 




O ""AVERAGE DE TODAS ESSAS SUMS?""











bem, aí o ideal é 
usar uma subquery, tipo assim:






SELECT
customer_id,
SUM(amount)
FROM payment 
GROUP BY customer_id;







SELECT 
ROUND(AVG(result_set.sum), 2)
FROM (
    SELECT
    customer_id,
    SUM(amount) AS sum
    FROM payment 
    GROUP by customer_id
) as result_set;















COM ISSO,



FICAMOS COM 1 VALUE DE 


'112.55',


QUE É O AVERAGE 


DO LIFETIME SPENT POR CADA 1 DESSES CUSTOMERS....





O CÓDIGO DO PROFESSOR, POR SUA VEZ,
FICOU ASSIM:










SELECT ROUND(AVG(result_set.total_amount), 2)
FROM (
SELECT
customer_id,
SUM(amount) AS total_amount
FROM customer
GROUP BY customer_id
) AS result_set;















OK... ESSE É O EXEMPLO DE COMO PODEMOS USAR 

SUBQUERIES DENTRO DO "FROM"...








devemos aplicar esse conhecimento, na seguinte challenge:





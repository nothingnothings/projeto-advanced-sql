














TEMOS A ÚLTIMA CHALLENGE DO DIA...










--> PARA A PRIMEIRA TASK,



TEMOS:







How many movies are there that contain 'Saga' 

in the description and WHERE THE TITLE 
STARTS 

EITHER WITH 'A' or ENDS with 'R'...?

ALSO USE THE ALIAS 'no_of_movies' FOR THE RESULT...








--> OK, ESSA É UMA TASK UM POUCO MAIS COMPLEXA...






COMECAMOS ASSIM:




SELECT COUNT(*) AS no_of_movies 
FROM film 
WHERE (title LIKE 'A%'
OR title LIKE '%R')
AND description LIKE '%Saga%';












OK... CONSEGUIMOS 14 MOVIES...










O QUE MAIS?











2) CREATE A LIST OF ALL CUSTOMERS 
WHERE THE FIRST NAME CONTAINS "ER" and has an "A" 
as the second letter.... 

ORDER THE RESULTS BY THE LAST NAME, DESCENDINGLY...








VAI FICANDO ASSIM:




SELECT
* 
FROM CUSTOMER
WHERE (first_name LIKE '_A%'
AND first_name LIKE '%ER%')
ORDER BY last_name DESC;









-> OK... ISSO RETRIEVOU UMA LISTA COM 

5 CUSTOMERS...
















POR FIM,






TEMOS 


ESTA TASK:









3) HOW MANY PAYMENTS ARE THERE WHERE THE AMOUNT IS EITHER
0 OR IS BETWEEN 3.99 AND 7.99 AND AT THE SAME 
TIME HAS HAPPENED ON 2020-05-01...







PARA ISSO, ESCREVEMOS:



SELECT COUNT(*)
FROM PAYMENT 
WHERE (AMOUNT = 0 OR 
    AMOUNT BETWEEN 3.99 AND 7.99)
    AND PAYMENT_DATE = '2020-05-01';




--> CONSEGUI 0 RESULTS... --> está errado,

pq deveria 

ser 27, e nao 0...








agora entendi....


é pq eu coloquei '2020-05-01',


E NAO UM TIMESTAMP..





PQ O FORMATO DE "PAYMENT_DATE' É UM TIMESTAMP...






precisamos escrever assim:





SELECT COUNT(*)
FROM PAYMENT 
WHERE (AMOUNT = 0 OR 
    AMOUNT BETWEEN 3.99 AND 7.99)
    AND PAYMENT_DATE BETWEEN '2020-05-01 00:00:00' AND '2020-05-01 23:59:59'; 







CERTO, AGORA FUNCIONOU, CONSEGUI 27....
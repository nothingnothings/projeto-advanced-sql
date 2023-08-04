










JÁ VIMOS COMO PODEMOS 

CRIAR 


TABLES E INSERIR 

DATA NESSAS TABLES...












--> MAS MTAS VEZES PODEMOS FACILITAR NOSSAS VIDAS,

COM O USO DA EXPRESSAO 



"CREATE TABLE AS"...
















--> MTAS VEZES USAMOS ESSE COMANDO...











--> SIGNIFICA QUE CRIAMOS 1 TABLE 

A PARTIR 

DE 
1


EXISTING QUERY...












TIPO ASSIM:













CREATE TABLE exemplo 
AS 
SELECT * FROM customer;












--> COM ISSO, BASICAMENTE COPIARÍAMOS 

ESSA PRIMEIRA TABLE,

DE customer...













MAS TAMBÉM PODEMOS FAZER COISAS DIFERENTES,


COMO ISTo:










CREATE TABLE customer_anonymous 
AS 
SELECT customer_id, initials 
FROM customer 
WHERE first_name LIKE 'C%';












ISSO É BEM COMUM,

PQ 

A PARTIR DE 1 QUERY, PODEMOS CRIAR 1 NOVA TABLE...













--> DEVEMOS VER ISSO EM PRÁTICA...













--> DIGAMOS QUE QUEREMOS CRIAR 1 NOVO TABLE,


A PARTIR DE CUSTOMER,



COM 



1) first_name 


2) last_name 



3) email 



4) address da pessoa...










BASTA ESCREVER ASSIM:







CREATE TABLE custom_customers 
AS 
SELECT
first_name,
last_name,
email,
a.address,
ci.city_id
FROM customer AS c
LEFT JOIN address AS a 
ON a.address_id = c.address_id
INNER JOIN city AS ci
ON ci.city_id = a.city_id;











OK....






ISSO DEU CERTO...
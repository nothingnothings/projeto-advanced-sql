









AGORA NOS É REQUISITADA 1 QUERY MEIO COMPLEXA...














--> PEDEM:







1) RETURN ALL OF THE PAYMENTS WHERE THE 

PAYMENT AMOUNT IS GREATER THAN 


THE __ AVERAGE__ PAYMENT AMOUNT....













PARA ISSO, PRECISAREMOS DE 

 ___sUBQUERIES___...






 podemos escrever assim:




SELECT 
*
FROM payment 
WHERE amount >      (
                SELECT AVG(amount)
                FROM payment
                    );













E ISSO __fUNCIONOU__...











O PROFESSOR ESCREVEU ASSIM:










SELECT 
AVG(AMOUNT) 
FROM payment
WHERE amount > '420421094012941090';










-> OU SEJA,

PODERÍAMOS USAR O VALUE DESCOBERTO 

EM UMA QUERY SIMPLES DE 


''''
SELECT AVG(AMOUNT) FROM PAYMENT;
''''












MAS DIGAMOS QUE 


NOSSA DATABASE ESTÁ CONSTANTEMENTE AUMENTANDO,


RECEBEMOS NOVA DATA,

OS VALUES MUDAM,



E POR ISSO QUEREMOS 




1 


APPROACH MAIS FLEXÍVEL E DINAMICO,



QUE SEMPRE VAI NOS DAR 

O RESULTADO CORRETO...











--> PARA ISSO, USAREMOS "SUBQUERIES"...










SUBQUERY --> É UMA QUERY DENTRO 


DE UMA QUERY...










O PROFESSOR ESCREVE EXATAMENTE COMO EU ESCREVI:








SELECT 
*
FROM payment 
WHERE amount > (
    SELECT AVG(amount) FROM payment
);





O VALUE NO INTERIOR DA SUBQUERY É 

OBTIDO ANTES 


DO 

VALUE/RESULT SET 

EXTERIOR...









COMO RESULTADO, FICAMOS COM 7746...










É ASSIM QUE QUERIES FUNCIONAM...



















OK, MAS DIGAMOS QUE QUEREMOS


VER TODOS OS 


PAYMENTS DO CUSTOMER 

CHAMADO 

"ADAM"...






PARA ISSO, PODEMOS ESCREVER ASSIM:









SELECT *
FROM payment 
WHERE customer_id = (
    SELECT customer_id FROM customer
    WHERE 'first_name' = 'ADAM' 
);












OK... ISSO TAMBÉM FUNCIONA...






--> COM ISSO, 


CONSEGUIREMOS APENAS OS PAYMENTS 

FEITOS PELO 
CUSTOMER 

COM ID DE 


367....







-> E ESSE É EXATAMENTE O SINGLE CUSTOMER ID 
DO ADAM... (Que 

cosnseguimos se rodamos A SUBQUERY...)















OBS::: SUBQUERIES DEVEM RETORNAR 

APENAS 1 ÚNICA COLUMN,



E 
1 único id (nesse caso,

pq estamos usando o operator de '=')...











MAS PODERÍAMOS USAR O IN OPERATOR,

e aí usar o IN Operator com o LIKE NA SUBQUERY,

PARA 



PEGAR TODOS OS CUSTOMERS QUE COMECEM COM 'A',

POR EXEMPLO:










SELECT *
FROM payment 
WHERE customer_id IN (
    SELECT customer_id FROM customer
    WHERE 'first_name' LIKE 'A%' 
);











CERTO... É ASSIM QUE PODEMOS USAR 1 SUBQUERY 



NA CLAUSE DE 

"WHERE"...














--> PODEMOS USAR "=" SE TEMOS 

1 ÚNICO VALUE,

OU ENTAO 

"LIKE",

SE TIVERMOS MÚLTIPLOS VALUES...










--> OK, AGORA É HORA DE APLICARMOS 

ESSE CONHECIMENTO, COM 1 CHALLENGE...
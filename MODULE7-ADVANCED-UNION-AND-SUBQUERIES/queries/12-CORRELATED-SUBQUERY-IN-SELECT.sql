

















O USO __ COMUM__ DAS CORRELATED SUBQUERIES É ASSIM:





SELECT first_name, sales FROM employees e1 
WHERE sales > (
    SELECT AVG(sales) FROM employees e2
    WHERE e1.city = e2.city
);
















SIMILARMENTE A ESSAS STANDARD SUBQUERIES,




PODEMOS USAR AS CORRELATED 

SUBQUERIES 



DENTRO 


DA CLAUSE DE "SELECT"...











--> NAO PODEMOS USAR 

AS CORRELATED SUBQUERIES NO "FROM",




MAS PODEMOS USAR 




NO "WHERE" E "SELECT" CLAUSES...



















OK... 








--> PARA ESTE EXEMPLO,


TEMOS ESTA TABLE:






name    sales  city   min
Sunita  600  Delhi    100
Anil    400  Delhi    100
Tex     200  Delhi    100
Soo     300  Gret     200
Xi      400  Gret     200
Tex     200  Gret     200
Sun     400  Ny        50
Cha     300  Ny        50
Teq     100  Ny        50















COM ISSO, TEMOS UMA COLUMN ADICIONAL,

COM AS MINIMUM SALES 

PARA CADA CITY...















A PERGUNTA É,






""COMO PODERÍAMOS CRIAR 1 COLUMN DESSAS,
COM O __MINIMUM__ AMOUNT __ PARA CADA CITY"",



em nosso result set?














---> O PROFESSOR DIZ QUE PODERÍAMOS FAZER 

ISSO COM 



1 CORRELATED SUBQUERY NO PRÓPRIO SELECT,


TIPO ASSIM:









SELECT 
name,
sales,
city
(
    SELECT MIN(sales) FROM employees e3 -- esta parte aqui
    WHERE e1.city=e3.city -- esta parte aqui
) 
FROM employees e1 
WHERE sales > (
    SELECT AVG(sales) FROM employees e2
    WHERE e1.city=e2.city
);






-------------------------

















OK... ISSO NOS DARIA ESSE OUTPUT...







OK.... AGORA DEVEMOS VER UM EXEMPLO 


DISSO, NO PGADMIN...













assim:











--- Correlated subquery in SELECT 

--- Show the MAXIMUM AMOUNT for EVERY CUSTOMER...










A QUERY FICOU TIPO ASSIM:










SELECT
customer_id,
(
	SELECT MAX(amount) FROM payment as p3
	WHERE p1.customer_id=p3.customer_id
) AS max_amount_of_this_customer
FROM payment AS p1 
WHERE amount = (
	SELECT MAX(amount)
	FROM payment AS p2 
	WHERE p2.customer_id = p1.customer_id
);
















TIPO ASSIM:











SELECT
DISTINCT customer_id,
(
	SELECT MAX(amount) FROM payment as p3
	WHERE p1.customer_id=p3.customer_id
) AS max_amount_of_this_customer
FROM payment AS p1 
WHERE amount = (
	SELECT MAX(amount)
	FROM payment AS p2 
	WHERE p2.customer_id = p1.customer_id
)
ORDER BY customer_id;












MAS A QUERY DO PROFESSOR FICOU MAIS SIMPLES,

PQ ELE QUERIA VER TODOS OS PAYMENTS

FEITOS POR CADA CUSTOMER,
E AO MESMO TEMPO TER 1 COLUMN COM "max_amount_of_this_customer",


tipo assim:














SELECT
*,
(
	SELECT MAX(amount) FROM payment as p2
	WHERE p1.customer_id=p2.customer_id
) AS max_amount_of_this_customer
FROM payment AS p1 
ORDER BY customer_id;















OK... É ASSIM QUE PODEMOS USAR CORRELATED SUBQUERIES 

NO SELECT...


AGORA É HORA DE APLICARMOS ESSA KNOWLEDGE 

EM ALGUMAS CHALLENGES...




DEVEMOS:










1) CREATE A FUNCTION THAT EXPECTS 
THE CUSTOMER'S FIRST AND LAST NAME....








2) THIS FUNCTION SHOULD RETURN THE TOTAL 
AMOUNT OF PAYMENTS THIS CUSTOMER 
HAS MADE...











QUER DIZER QUE O FORMATO DO CALL DA FUNCTION 
SERÁ ESTE:








SELECT name_search('AMY', 'LOPEZ');






resultado:

name_search 
numeric 

127.71










ok....







PARA ISSO, BASTA ESCREVER ASSIM:







CREATE OR REPLACE FUNCTION name_search (
    first_name_arg VARCHAR, last_name_arg VARCHAR
)
    RETURNS numeric(10,2)
    LANGUAGE plpgsql
    AS 
    $$
    DECLARE
        total_payment numeric(10,2);
    BEGIN 

    SELECT
    SUM(amount)
    FROM customer AS c
    LEFT JOIN payment AS p
    ON c.customer_id=p.customer_id
    AND c.first_name=first_name_arg
    AND c.last_name=last_name_arg
    
    INTO total_payment;
    RETURN total_payment;
    END;
    $$
	
	



SELECT name_search('AMY', 'LOPEZ');






OK, FUNCIONOU...














O PROFESSOR ESCREVEU ASSIM:














CREATE FUNCTION name_search (
    first_name_arg VARCHAR(20),
    last_name_arg VARCHAR(20)
)
RETURNS decimal(6, 2)
LANGUAGE plpgsql
AS 

$$

    DECLARE 
    total_payment decimal(6,2);

    BEGIN
    SELECT SUM(amount)
    FROM payment AS p
    NATURAL LEFT JOIN customer
    WHERE first_name=first_name_arg
    AND last_name=last_name_arg

    INTO total_payment;
    RETURN total_payment;
    END;


$$















OK...










O PROFESSOR COMPLEMENTA:




A PARTE LEGAL 




DESSAS FUNCTIONS É QUE 

PODEMOS AS UTILIZAR 


DENTRO 


DE OUTROS SELECTS,








tipo assim:












SELECT 
first_name,
last_name,
name_search(first_name, last_name)
FROM customer;














OK... ESSE É O BÁSICO SOBRE FUNCTIONS...







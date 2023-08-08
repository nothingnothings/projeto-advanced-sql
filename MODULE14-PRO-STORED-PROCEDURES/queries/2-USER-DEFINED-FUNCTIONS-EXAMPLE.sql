















AGORA VEREMOS 1 EXEMPLO DE COMO CRIAR 1 USER-DEFINED 

FUNCTION...












--> O QUE QUEREMOS FAZER, AQUI,

É CRIAR 1 FUNCTION QUE

CALCULA/CONTA 


A QUANTIDADE 




DE FILMS QUE CONSTEM DENTRO DE 1 RANGE 

DE 


"RENTAL_RATE"....














-> QUER DIZER QUE QUEREMOS 


DEFINIR 2 PARAMETERS:




1) MIN RENTAL_RATE



2) MAX RENTAL_RATE...












--> E, ENTAO, A FUNCTION VAI CONTAR O NÚMERO 


DE FILMS ENTRE 

ESSE MIN E MAX...







PARA ISSO, PODEMOS ESCREVER ASSIM:















CREATE OR REPLACE FUNCTION film_count (
    min_cost NUMERIC(4,2), max_cost NUMERIC(4,2)
)
    RETURNS INT
    LANGUAGE plpgsql
    AS
    $$
    DECLARE
        counted_films INT;
    BEGIN
        SELECT 
        COUNT(*)
        FROM film
        WHERE rental_rate BETWEEN min_cost AND max_cost

        INTO counted_films;

        RETURN counted_films;
    END;
    $$
        








OK... FUNCIONOU... É EXATAMENTE ASSIM QUE FAZEMOS, NA VERDADE...













OK, E COMO PODEMOS CHAMAR ESSA FUNCTION?









--> ASSIM:






CREATE OR REPLACE FUNCTION film_count (
    min_cost NUMERIC(4,2), max_cost NUMERIC(4,2)
)
    RETURNS INT
    LANGUAGE plpgsql
    AS
    $$
    DECLARE
        counted_films INT;
    BEGIN
        SELECT 
        COUNT(*)
        FROM film
        WHERE rental_rate BETWEEN min_cost AND max_cost

        INTO counted_films;

        RETURN counted_films;
    END;
    $$
        
		
		
		



SELECT film_count(1, 4);

















--> NO CASO,



ESSA FUNCTION RETORNOU 1 COLUMN DE 

"film_count",




COM 664.... (é o count retornado 
por essa function)...



















--> O DECLARE DE UMA VARIABLE, DENTRO 

DA FUNCTION,


É UMA BEST PRACTICE... -_> SE VC DEFINE 

1


VARIABLE E RETORNA ESSA VARIABLE COMO RESULTADO 

DA FUNCTION,

ISSO AJUDA COM A READABILITY E USABILITY 


DA FUNCTION...












OK... O PROFESSOR ESCREVEU EXATAMENTE 

COMO EU ESCREVI:











CREATE OR REPLACE FUNCTION film_count (
    min_cost NUMERIC(4,2), max_cost NUMERIC(4,2)
)
    RETURNS INT
    LANGUAGE plpgsql
    AS
    $$
    DECLARE
        counted_films INT;
    BEGIN
        SELECT 
        COUNT(*)
        FROM film
        WHERE rental_rate BETWEEN min_cost AND max_cost

        INTO counted_films;

        RETURN counted_films;
    END;
    $$
        
		
		
		



SELECT film_count(1, 4);








SELECT film_count(0,6);


SELECT film_count(3,6);




















ok.... É ASSIM QUE PODEMOS CRIAR USER-DEFINED FUNCTIONS...




AGORA DEVEMOS TESTAR TUDO ISSO, COM 1 CHALLENGE...








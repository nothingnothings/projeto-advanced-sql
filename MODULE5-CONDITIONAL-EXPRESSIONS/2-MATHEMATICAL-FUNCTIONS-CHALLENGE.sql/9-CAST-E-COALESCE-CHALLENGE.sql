






OK.. AGORA DEVEMOS PRATICAR COALESCE E CAST...












--> A DATABASE DE "GREENCYCLES"...







--> query tool --> 


PODEMOS QUERIAR DA TABLE DE RENTAL...








TIPO ASSIM:





SELECT 
    rental_date,
    return_date
FROM rental 
ORDER BY rental_date DESC;









AO SELECIONAR DESSA TABLE,


podemos perceber que ficamos com muitos nulls na table de "return_date"....






COMO TEMOS MTOS NULLS,


GOSTARÍAMOS DE SUBSTITUIR ESSES NULLS 

POR 1 VALUE DE 'not yet returned' (Que é um VARCHAR)...










--> COMO 'not yet returned' é um varchar,


isso significa que 


COALESCE() NAO VAI FUNCIONAR, out of the box,

com esse  value (
    pq TIMESTAMPS e STRINGS nao sao compatíveis....
)







ISSO QUER DIZER QUE TEREMOS DE CONVERTER 

A DATE DE 

'rental_date'



ANTES DE PODERMOS A UTILIZAR COM 'not yet returned'....














OK... A QUERY INICIAL:






SELECT 
    rental_date,
    return_date
FROM rental 
ORDER BY rental_date DESC;












FICOU TIPO ALGO ASSIM:





SELECT
	COALESCE(CAST(return_date - rental_date AS VARCHAR), 'not yet returned') AS is_returned
FROM rental 
ORDER BY return_date DESC;




---------------------------





solucao do professor:












SELECT 
rental_date,
COALESCE(CAST(return_date AS VARCHAR), 'not returned')
FROM rental 
ORDER BY rental_date DESC;













OK, ALGUNS CASOS 



RETORNARAM 



'not returned',



E OUTROS RETORNARAM 


A DATE EM 1 FORMATO VARCHAR..












OK.... ESSA FOI UMA CHALLENGE BOA,

MAS 



AGORA QUEREMOS "DEAL" COM PROBLEMAS QUE PODEM 

ACONTECER SE 

NAO PODEMOS 


CAST UM VALUE (


    pq a estrutura dos values pode 

    nao estar tao clean
),






CASOS EM QUE 


SOMOS OBRIGADOS A USAR A FUNCTION DE 




"REPLACE()"...








PQ A PRINCIPAL UTILIZACAO 


DESSA FUNCTION É A DE "CLEAN" AS NOSSAS COLUMNS...
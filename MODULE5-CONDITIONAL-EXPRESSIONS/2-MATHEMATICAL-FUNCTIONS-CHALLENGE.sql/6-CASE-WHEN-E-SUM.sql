






NESSA LICAO,

O PROFESSOR QUER NOS MOSTRAR 



UMA __ APLICACAO MT ESPECIAL PRÁTICA 



DO 



STATEMENT DE "CASE WHEN",




UMA 



APLICACAO QUE É MT USADA,


UM SPECIAL USE-CASE...






-----------------------------






PARA ISSO, TEMOS ESTE CÓDIGO:










SELECT * FROM film;










NA TABLE DE "film",


temos uma column chamada de "rating"..








AGORA IMAGINE QUE AS 2 MELHORES RATINGS 

SAO 

"PG" 

E 


"G"....







--> É POR ISSO QUE QUEREMOS COUNT 




""QUANTOS DESSES RATINGS TEMOS, NA NOSSA DATABASE""...










--> PARA ISSO, ESCREVEMOS ASSIM:





SELECT 
COUNT(*),
rating
FROM film
WHERE rating IN ('PG', 'G')
GROUP BY rating
ORDER BY rating;











OK, E ISSO NOS DEU ESTE OUTPUT:


"count"	"rating"
178	"G"
194	"PG"
















--> OK... MAS DIGAMOS QUE 

QUEREMOS __ RESOLVER _ISSO __ 


COM O __ 



STATEMENT 




DE "CASE WHEN"...












--> NA VERDADE, É MT COMUM UTILIZAR O "CASE"



PARA ____ CONTAR__ COISAS EM NOSSAS TABLES...















OK, MAS COMO FAZEMOS ISSO?














--> o CASE

nos deixa COMBINAR MÚLTIPLAS CONDITIONS,


MÚLTIPLOS VALUES...















--> primeiramente, o professor escreve assim:











SELECT 
rating,
CASE
    WHEN rating IN ('PG', 'G') THEN 











OK... AGORA TEMOS A TRICK, O TRUQUE....







--> COMO RESULT DISSO,



PODEMOS _ DAR AO VALUE '1'...







--> FAZEMOS ISSO PARA QUE, MAIS TARDE,


CONSIGAMOS CONTAR 


""QUANTOS 1 TEMOS""...







EX:








SELECT 
rating,
CASE
    WHEN rating IN ('PG', 'G') THEN 1
    ELSE 0
END
FROM film;




-> OK... MAS COMO PODEMOS FAZER ISSO?











---> OK, AGORA SEMPRE QUE TEMOS PG OU G,



O VALUE DE 'case' fica como 1...








--> MAS A COISA LEGAL, AGORA,




É QUE 




PODEMOS __ CRIAR 1 


AGGREGATION DE "SUM()"



EM VOLTA DA COLUMN INTEIRA DE "case",


TIPO ASSIM:






SELECT 
rating,
SUM(CASE
    WHEN rating IN ('PG', 'G') THEN 1
    ELSE 0
END)
FROM film;










COM ISSO, FICAMOS COM UM "SUPER SUM" 


em volta 



da column que foi criada usando CASE,


o que vai fazer com que 


REALMENTE SEJA RETORNADO O COUNT DE 


MOVIES COM PG OU G...




EX:





SELECT 
SUM(CASE
    WHEN rating IN ('PG', 'G') THEN 1
    ELSE 0
END)
FROM film;













--> COM ISSO, FICAMOS COM 372...







--> também podemos dar 1 alias:





SELECT 
SUM(CASE
    WHEN rating IN ('PG', 'G') THEN 1
    ELSE 0
END) AS no_of_ratings_with_p_or_pg
FROM film;













OK... ESSE ERA O PEQUENO TRUQUE 





COM O CASE...









--> PARA PRATICAR ISSO,

O PROFESSOR QUER 



QUE 


USEMOS O CASE ASSIM..











--> TEMOS ESTE CÓDIGO;








SELECT 
rating,
COUNT(*)
FROM film
GROUP BY rating;















--> CERTO, MAS O QUE O PROFESSOR QUER, AGORA,

É QUE 





FAÇAMOS """PIVOT""" DESSA TABLE....









OK, MAS O QUE É ISSO...?








SIGNIFICA QUE 

O OUTPUT RESULT 



DEVE 

SE PARECER 

ASSIM:




G  R   NC-17   PG-13    PG 
1  178  195     223      194










PARA CADA COLUMN, QUEREMOS CONTAR 

QUANTOS MOVIES TEM AQUELE given RATING...





DEVEMOS PRATICAR ESSE USE-CASE...










- OUTRO DETALHE -- NO POSTGRESQL,


SE VC QUER CONFERIR 



1 

ALIAS A UMA COLUMN __ COM MAIUSCULO,

VC É OBRIGADO A COLOCAR "" em volta do nome,

tipo "G"...















-> ok, vou tentar escrever..










SELECT 
SUM(CASE 
    WHEN rating = 'G' THEN 1
    ELSE 0
END) AS "G",
SUM(CASE 
    WHEN rating = 'R' THEN 1
    ELSE 0
END) AS "R",
SUM(CASE 
    WHEN rating = 'NC-17' THEN 1
    ELSE 0
END) AS "NC-17",
SUM(CASE 
    WHEN rating = 'PG-13' THEN 1
    ELSE 0
END) AS "PG-13",
SUM(CASE 
    WHEN rating = 'PG' THEN 1
    ELSE 0
END)AS "PG"
FROM film;




OK... FUNCIONOU... MAS ACHEI ESSA SINTAXE VERBOSA DEMAIS,




Muitas e muitas linhas...




É ASSIM QUE PODEMOS USAR 

O CASE 

COM 




"SUM()",


COM ESSE TIPO DE AGGREGATION,





QUE É UM USE-CASE MT ÚTIL PARA 



OS CASE STATEMENTS...



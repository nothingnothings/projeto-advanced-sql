










NESSA LECTURE, QUEREMOS VER COMO PODEMOS 

FAZER 

""GROUP BY""






POR MEIO DE DIFERENTES SETS DE COLUMNS...












-- O QUE QUEREMOS CONSEGUIR,

COM ISSO,



É FAZER UMA ANÁLISE DE 



NOSSOS STAFF_IDS....









--> OU SEJA, QUEREMOS 



CONSEGUIR 



UMA ANÁLISE DOS STAFF_IDS 


___POR __MES...










--> QUEREMOS FICAR COM 1 QUERY 

QUE 


RETORNE 



"""A REVENUE FEITA EM CADA MES,


POR CONSUMIDOR"""...












mas o que queremos adicionar, nessa query aí,



É O __OVERALL REVENUE _ 



DE CADA MES...









--> e o que queremos ver,

TAMBÉM,



É O __ OVERALL _ _rEVENUE__ 






DOS STAFF_ID, EM TOTAL.... (staff_id 1 e staff_id 2)...














--> E TUDO ISSO DEVE SER COMBINADO 




EM 1 ÚNICA QUERY...

















-> O QUE JÁ PODEMOS FAZER, APONTA O PROFESSOR,


É CRIAR 


OS GROUPINGS INDIVIDUAIS,

TIPO ASSIM:














GROUPING 1:



SELECT 
staff_id,
SUM(amount)
FROM payment 
GROUP BY staff_id;





ELE AGRUPA os amounts/revenue POR "STAFF_ID", nada de mais...










GROUPING 2:




SELECT 
TO_CHAR(payment_date, 'Month'),
SUM(amount)
FROM payment
GROUP BY TO_CHAR(payment_date, 'Month')





ELE AGRUPA O REVENUE PELOS MONTHS, TAMBÉM NADA DE MAIS.










GROUPING 3:



SELECT TO_CHAR(payment_date, 'Month'),
staff_id,
SUM(amount)
FROM payment 
GROUP BY TO_CHAR(payment_date, 'Month'), staff_id;






ESSE GROUPING, MAIS COMPLEXO,

AGRUPA POR AMBAS AS columns,

POR MONTH E POR STAFF_ID...




















MAS AGORA A PERGUNTA É:



"""COMO PODEMOS REUNIR ESSES DIFERENTES 

GROUPINGS EM 1 SINGLE QUERY?"""















--> já aprendemos sobre UNION...











--> EXISTE 1 MANEIRA DE FAZER ISSO USANDO UNION,


UNION ENTRE 

OS 


3 RESULT SETS.....

















--> PODERÍAMOS FAZER UNION ENTRE 


AS 2 
PRIMEIRAS QUERIES,



JUSTAMENTE PQ 

ELE TEM O MESMO NÚMERO DE COLUMNS...








PODERÍAMOS FAZER 1 UNION ENTRE ESSAS 2 QUERIES,




MAS TERÍAMOS DE COLOCAR 1 NULL 





NO LUGAR DO MONTH,

LÁ 




NA QUERY QUE TEM OS MONTHS,






PQ CASO CONTRÁRIO FICARÍAMOS COM 1 ERRO....


TAMBÉM PRECISAMOS FAZER A MESMA COISA COM "Staff_Id",

PELO MESMO MOTIVO:








SELECT
NULL AS month,
staff_id,
SUM(amount)
FROM payment 
GROUP BY staff_id

UNION

SELECT TO_CHAR(payment_date, 'Month') AS month,
NULL AS staff_id ,
SUM(amount)
FROM payment 
GROUP BY TO_CHAR(payment_date, 'Month'), staff_id;














OK... ISSO NOS DÁ A COMBINACAO ENTRE AS 2 QUERIES,


MAS VAI DEIXAR AS COLUMNS COM VALUE DE "NULL"

QUANDO 

OS VALUES NAO EXISTIREM NAS TABLES ORIGINÁRIAS... (staff_id
 na query em que temos o month, por exemplo.... e month 
 na query em que só temos o staff_Id, por exemplo...)


















 PODEMOS TAMBÉM JUNTAR A ÚLTIMA QUERY:






 SELECT
NULL AS month,
staff_id,
SUM(amount)
FROM payment 
GROUP BY staff_id

UNION

SELECT TO_CHAR(payment_date, 'Month') AS month,
NULL AS staff_id ,
SUM(amount)
FROM payment 
GROUP BY TO_CHAR(payment_date, 'Month'), staff_id;

UNION


SELECT TO_CHAR(payment_date, 'Month') AS month
staff_id,
SUM(amount)
FROM payment 
GROUP BY TO_CHAR(payment_date, 'Month'), staff_id;

















MAS O RESULTADO NAO É NICE....












NAO É NICE DE:




1) DEVELOPAR 




2) NAO É NICE DE LER 



3) EM TERMOS DE PERFORMANCE,

É VERY BAD.... -> PQ O GROUPING 
TEM DE SER FEITO 


VÁRIAS E VÁRIAS VEZES, CONSECUTIVAMENTE...













--> MAS COMO PODEMOS 


PODEMOS  MELHORAR ESSA SITUACAO?













PODEMOS MELHORÁ-LA COM A AJUDA DOS "GROUPING SETS"...















--> pq isso É ALGO QUE JÁ FIZEMOS...












--> JÁ AGRUPAMOS POR:

1) staff_id 




2) month 



3) staff_id E month...












QUER DIZER QUE TEMOS 3 DIFERENTES GROUPING SETS...








AGORA DEVEMOS VER COMO PODEMOS CRIAR 1 QUERY 

MAIS FÁCIL/LEGÍVEL,

COM A AJUDA DOS 

GROUPING SETS...



















COMECAMOS ASSIM:










SELECT
TO_CHAR(payment_date, 'Month'),
staff_id,
SUM(amount)
FROM payment 
GROUP BY 









OK... VAMOS AGRUPAR POR ALGO, SIM...










NO CASO, VAMOS AGRUPAR """POR GROUPING SETS""" em si...









PARA ISSO, TEMOS ESTA SINTAXE:









SELECT
TO_CHAR(payment_date, 'Month'),
staff_id,
SUM(amount)
FROM payment 
GROUP BY
    GROUPING SETS 











-> AÍ ABRIMOS PARENTESES:









SELECT
TO_CHAR(payment_date, 'Month'),
staff_id,
SUM(amount)
FROM payment 
GROUP BY
    GROUPING SETS (

    )








--> AÍ DEVEMOS DIZER __ " O QUE SAO ESSES GROUPING SETS"..









--> O PRIMEIRO GROUPING SET É 

O STAFF_ID EM SI...



--> O SEGUNDO É O MONTH...






--> JÁ O TERCEIRO É __ A COMBINACAO 

ENTRE "staff_id" e "payment_date"...








ESCREVEMOS ASSIM:



SELECT
TO_CHAR(payment_date, 'Month') AS month,
staff_id,
SUM(amount)
FROM payment 
GROUP BY
    GROUPING SETS (

        (staff_id),
        (TO_CHAR(payment_date, 'Month')),
        (staff_id, month)
    );








OK.... 


E AÍ RODAMOS ISSO..







FUNCIONOU...








FICAMOS COM O MESMO RESULTADO DAQUELA COMBINACAO 

DE UNIONS MALUCA,

MAS COM BEM MENOS CÓDIGO...











agora podmos ver COMO CADA 1 DOS STAFFS 



SE COMPORTOU, EM CADA 1 DOS MONTHS....






SELECT
TO_CHAR(payment_date, 'Month') AS month,
staff_id,
SUM(amount)
FROM payment 
GROUP BY
    GROUPING SETS (

        (staff_id),
        (TO_CHAR(payment_date, 'Month')),
        (staff_id, month)
    )
ORDER BY month;





















BEM MELHOR DO QUE USAR UNIONS EM SERIE...






AGORA É HORA DE PRATICARMOS OS GROUPING SETS...





NA ÚLTIMA AULA,
VIMOS 

COMO PODEMOS 

USAR 





GROUPING SETS 





NA CLAUSE DE "GROUP BY"...













--> AGORA PODEMOS USAR "CUBE" 

E 

"ROLLUP"




NA CLAUSE DE "GROUP BY",

TUDO PARA CRIAR 

"PREDEFINED GROUPING SETS"...












-> A SINTAXE DE ROLLUP É ASSIM:








GROUP BY
ROLLUP(col1, col2, col3);













--> SE USAMOS O "ROLLUP"



E USAMOS ESSAS 3 COLUMNS,



__ SERÁ CRIADA _ 1 HIERARQUIA 

ENTRE 

ESSAS 3 COLUMNS...





A HIERARQUIA FICARÁ ASSIM:





1) col1 


2) col2 



3) col3











--> PODE SER A HIERARQUIA ENTRE 


"YEAR", "QUARTER", "MONTH"...













-> O RESULT DESSA EXPRESSAO, PORTANTO, SERIA ESTE:










GROUP BY 
ROLLUP (column1, column2, column3) 






VIRA 






GROUP BY 
GROUPING SETS (
    (col1, col2, col3),
    (col1, col2),
    (col1),
    ()
);










() --> o overall de tudo...




(column1) --> O NÍVEL MAIS ALTO DA HIERARQUIA, YEAR...





(col1, col2) --> UM COMBO ENTRE O MAIS ALTO DA HIERARQUIA E SEGUNDO MAIS ALTO (year e quarter)



(col1, col2, col3) --> NÍVEL MAIS BAIXO DA HIERARQUIA, EVERY INDIVIDUAL DAY (year, quarter, month/day)...
















É POR ISSO QUE 

É BEM COMUM 


USAR O ROLLUP EM CENÁRIOS DE DIAS,




YEARS, QUARTERS E MONTHS,




 E AÍ 


 1 QUERY QUE CALCULE/RETORNE 

 TODOS OS 

 INDIVIDUAL GROUPING VALUES + OS SUB-TOTALS + 

 o overall total...











 --> DEVEMOS VER ISSO NO PGADMIN...









 --> dEVEMOS VER COMO PODEMOS USAR ESSA FUNCTION 

 PRATICAMENTE...











 --> QUEREMOS CRIAR 1 HIERARQUIA NA TABLE 

 DE PAYMENT..



 -----------------








 NOSSA HIERARQUIA SERÁ ASSIM:







 1) quarter 






 2) month 





 3) day 












 PRIMEIRAMENTE PRECISAMOS CRIAR OS DIFERENTES 
 NÍVEIS DESSA HIERARQUIA...









 -> ESCREVEMOS ASSIM:









 SELECT
 TO_CHAR(payment_date, 'Q')
 










 O 'Q', usado com 'TO_CHAR',

 NOS DÁ O QUARTER DAQUELE ANO,

 DAQUELE TIMESTAMP/DATE...




PODEMOS CONCATENAR ESSE VALUE COM 'Q',

para ter 1 formato mais nice:




 ex:











 SELECT
 'Q' || TO_CHAR(payment_date, 'Q') AS quarter,
 EXTRACT(month from payment_date) AS month,
 DATE(payment_date) AS day 
 FROM payment;









 ----------------------












 OK, AGORA TEMOS O QUARTER, O MONTH 
 E O DATE...










--> MAS AGORA QUEREMOS TER 1 AGGREGATION DOS 

VALUES,

para 


cada 1 desses subgroups...




comecamos com a aggregation, tipo assim:











 SELECT
 'Q' || TO_CHAR(payment_date, 'Q') AS quarter,
 EXTRACT(month from payment_date) AS month,
 DATE(payment_date) AS day,
 SUM(amount)
 FROM payment
 GROUP BY













PODERÍAMOS CRIAR NOSSOS PRÓPRIOS GROUPING SETS,

SIM,


MAS ISSO PODERIA SER 1 BOCADO MAIS COMPLICADO 


E BOTHERSOME..









--> se queremos ter todos os subtotals 

e o overall total,

é bem mais comodo usar 


a function de rollup...









É POR ISSO QUE COPIAMOS AS COLUMNS 



LÁ DE CIMA E COLOCAMOS NA FUNCTION DE ROLLUP..




NA ORDEM CORRETA, CLARO (primeiro nível 
de hierarquia, segundo, terceiro, etc)...







EX:











 SELECT
 'Q' || TO_CHAR(payment_date, 'Q') AS quarter,
 EXTRACT(month from payment_date) AS month,
 DATE(payment_date) AS day,
 SUM(amount)
 FROM payment
 GROUP BY 
    ROLLUP(
 'Q' || TO_CHAR(payment_date, 'Q') AS quarter,
 EXTRACT(month from payment_date) AS month,
 DATE(payment_date) AS day
    )





















TIPICAMENTE, SE USAMOS 

O ROLLUP, ORDENAMOS 


POR EXATAMENTE A MESMA ORDEM QUE 

TEMOS NA HIERARQUIA...






--. TIPO ASSIM:



SELECT 
CONCAT('Q', TO_CHAR(book_date, 'Q')) AS quarter,
EXTRACT('Month' from book_date) AS month,
TO_CHAR(book_date, 'W') AS week_in_month,
DATE(book_date) AS day,
SUM(total_amount)
FROM bookings 
GROUP BY 
    ROLLUP(quarter, month, week_in_month, day)
ORDER BY 1, 2, 3, 4;









OK....
 


 COM ISSO,



 GANHAMOS 1 OUTPUT BEM DETALHADO..






 ganhamos vários e vários totals...











 --> ISSO É USADO GERALMENTE QUANDO TEMOS 

 1 HIERARQUIA NATURAL (quarters, months, days, etc)...


(ex: 1 DIA SÓ PODE ACONTECER DENTRO DE 1 MES...)















MAS SE NAO TEMOS UMA DESSAS "HIERARQUIAS NATURAIS",


O QUE DEVEMOS USAR É A FUNCTION DE "CUBE()",

QUE 
ESTUDAREMOS NA PRÓXIMA AULA...
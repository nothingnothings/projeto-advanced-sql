













ÀS VEZES É NECESSÁRIO ESCREVER MÚLTIPLAS 

JOIN CONDITIONS...










ISSO ACONTECE __ QUANDO __ TEMOS 


MÚLTIPLAS 



COLUMNS _ QUE FAZEM O "JOIN"


ENTRE TABLES...
















--> PQ ATÉ AGORA SÓ VIMOS QUE PODEMOS CRIAR 

1 JOIN USANDO "1 COMMON COLUMN"...












MAS DIGAMOS QUE TEMOS 2 TABLES 






EM QUE __ TEMOS 


2 COLUMNS QUE COMPOEM 1 JOIN....





ex:









TABLE SALES:



FIRST_NAME    LAST_NAME   CITY         SALES 
SANDRA         JONES      FRANKFURT    500













TABLE BONUS:




FIRST_NAME   LAST_NAME      BONUS
SANDRA          JONES        YES 
SANDRA          WILLIAMS     NO













--> COMO VC PODE VER,



TEMOS 2 COLUMNS 



QUE SAO IGUAIS 



NAS 2 



TABLES...







e apenas 1 delas sendo usada como join 

NAO É O SUFICIENTE...












--> MAS PODEMOS FAZER JOIN COM 2 COLUMNS,

SIM,

ISSO 


NAO É PROBLEMA,

NO SQL...














--> PARA FAZER O JOIN COM 2 COLUMNS AO MESMO TEMPO 
(fundir as columns, como sendo 1 identifier só),




BASTA ESCREVER ASSIM:









SELECT * FROM TableA AS tab_a 
INNER JOIN TableB AS tab_b 
ON a.first_name = b.first_name
AND a.last_name = b.last_name;

















--> BASTA USAR UM "aND"


E ENTAO COLOCAR A SEGUNDA CONDITION...















--> PODEMOS COLOCAR 2 OU MAIS CONDITIONS..





ISSO É INCOMUM, MAS É POSSÍVEL....















MAIS UM TIP:














PODEMOS TAMBÉM 



USAR UMA __ sEGUNDA___ CONDITION 





TAMBÉM PARA OUTRAS FINALIDADES,



COMO TAMBÉM PARA "FILTER" A DATA,



SEM USAR O WHERE...








TIPO ASSIM:













SELECT * FROM TableA AS tab_a 
INNER JOIN TableB AS tab_b 
ON a.first_name = b.first_name
AND a.last_name = 'Jones';

















--> QUAL É A DIFERENCA DISSO 

PARA 

1 


FILTER NORMAL DE "WHERE"?






pq é claro que, nesse caso,


O RESULT SERIA O MESMO...













SELECT * FROM TableA AS tab_a 
INNER JOIN TableB AS tab_b 
ON a.first_name = b.first_name
WHERE a.last_name = 'Jones';




---------------------------------------

















OK... PODE PARECER A MESMA COISA,


MAS __ ISSO É UM EXPERT TIP...








----> É UM EXPERT TIP PQ 




"""ASSIM QUE VC TIVER QUERIES 

QUE DEMOREM 1 LONGO TEMPO PARA SEREM 

EXECUTADAS, vc pode SE BENEFICIAR 

DE ESSE FILTERING DO "AND""",



pq ele é 

BEM MAIS EFICIENTE 

DO QUE 



ESCREVER A CONDITION NO WHERE...









--> ok... faz sentido, isso é executado 

mais rápido...














--> QUER DIZER QUE ISSO DÁ MAIS PERFORMANCE,

EM JOINS,

DO QUE 

SIMPLESMENTE 

COLOCAR 


ESSA 

WHERE CONDITION ADICIONAL....












MAS AGORA DEVEMOS VER ISSO APLICADO 


NA PRÁTICA,

NO PGADMIN...













TEMOS A TABLE DE "ticket_flights",



em que 



vemos 


QUANTO CUSTOU 


1 TICKET 

PARA 1 FLIGHT ESPECÍFICA...







É UM POUCO DIFERENTE DA TABLE DE "BOOKINGS",


PQ EM BOOKINGS PODEMOS 

TER MÚLTIPLOS TICKETS POR 


BOOKING...


















--> queremos saber, por meio dessa 

table de 

"ticket_flights",



quanto 

1 GIVEN SEAT 




ESTÁ CUSTANDO..
















-- QUEREMOS DESCOBRIR QUANTO 

É O 

"average"


de 1 given seat...










-> PARA ISSO, PRECISAMOS USAR 


TANTO A TABLE DE "ticket_flights"


como a table de "boarding_passes",




pq é nessa table em que temos as SEATS...
















TIPO ASSIM:











SELECT * FROM ticket_flights

























NAS NOSSAS TABLES, PODEMOS ENCONTRAR 

"PK" EM COLUMNS --> isso significa 

PRIMARY KEY...








SE TEMOS 2 COLUMNS COMO "PRIMARY KEY",


ISSO SIGNIFICA QUE 







A PRIMARY KEY É UMA __ COMPOSITE PRIMARY 


KEY 

(composta por 2 ou mais columns)...







PODEMOS ENCONTRAR ISSO NA TABLE DE "BOOKINGS"...









(

    as columns de TICKET_NO e FLIGHT_Id...
)


-------------------------







PK --> UNIQUELY IDENTIFIES EACH ROW IN 

A TABLE...


















--> no 'boarding_passes',



o ticket_no NAO É UNIQUE,


ele repete...






QUER DIZER QUE a primary key 

desse negócio é 



realmente 



a combinacao entre "ticket_no" 

e 

"flight_id"..















É POR ISSO QUE NOSSA QUERY DEVE SER 

REFINADA,

DEVE 

FICAR ASSIM:







SELECT
bp.seat_no,
ROUND(AVG(tf.amount), 2)
FROM boarding_passes AS bp
JOIN ticket_flights AS tf
ON tf.ticket_no = bp.ticket_no
AND tf.flight_id = bp.flight_id
GROUP BY bp.seat_no;





DEVEMOS VER SE ISSO ESTÁ CERTO, 

NA PRÓXIMA AULA...


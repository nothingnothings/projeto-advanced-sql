


NESSE EXEMPLO, CRIARAMOS UMA QUERY 

DE:







1) PARA CADA SINGLE TICKET,




DA TABLE DE TICKETS,



INCLUINDO O PASSENGER_NAME,




A COLUMN DO "SCHEDULED DEPARTURE"...












--> SE OLHARMOS A TABLE DE "fLIGHTS",




percebemos que, PARA CADA FLIGHT,


HÁ UM 
 
 "SCHEDULED DEPARTURE"...








 --> MAS NA TABLE DE "TICKETS",

 NAO TEMOS CONEXAO 

 DIRETA à TABLE DE FLIGHTS....











--> A ÚNICA COISA QUE TEMOS, NA TABLE DE TICKETS,

É O TICKET_NO E "BOOK_REF"...













--> NOVAMENTE,

A QUERY É:





""UMA QUERY PARA PEGAR,

PARA CADA SINGLE TICKET NUMBER,

INCLUINDO O PASSENGER_NAME,


TAMBÉM A "SCHEDULED DEPARTURE"....










devemos tentar fazer isso por conta própria...




FICOU ASSIM:


SELECT 
t.ticket_no,
t.passenger_name,
f.scheduled_departure
FROM tickets AS t 
INNER JOIN ticket_flights AS tf
ON tf.ticket_no = t.ticket_no
INNER JOIN flights AS f
ON tf.flight_id = f.flight_id;














COMO FORAM INNER JOINS,


A ORDEM  DOS JOINS NAO É RELEVANTE/NAO FOI RELEVANTE...




AGORA TEMOS 1 CHALLENGE...

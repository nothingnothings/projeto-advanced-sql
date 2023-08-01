







AGORA VAMOS APLICAR PRATICAMENTE 


OS INNER JOINS...










QUEREMOS QUE 

TODOS OS PAYMENTS

CONTENHAM 



INFO SOBRE O CUSTOMER QUE PARTICIPOU NO PAYMENT...











PARA ISSO,

TEMOS AS TABLES:



1) CUSTOMER



2) PAYMENT...










ACHO QUE A QUERY FICARÁ ASSIM:







SELECT * 
FROM payment as p
INNER JOIN customers AS c
ON p.customer_id = c.id;









EX:







SELECT * 
FROM payment as p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id;












COM ISSO, CONSEGUIMOS O FIRST_NAME 

E LAST_NAME, também...







a common colummn é "customer_id", claro...





mas podemos pegar apenas algumas columns.. --_> 





BASTA COLOCAR 

p.* (para conseguir todas as columns de apenas UMA DAS TABLES)...


(todas as columns apenas de "payment" table):





ex:






SELECT p.*,
first_name,
last_name
FROM payment as p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id;






---------------------






sempre use aliases...














MAS AGORA DEVEMOS VER OUTRO EXEMPLO...





na table de "Payment",


também 

TEMOS

references À table de "staff_id"...










SE QUEREMOS JUNTAR 




AS INFOS,

PODEMOS ESCREVER ASSIM:










SELECT 
p.*,
first_name,
last_name
FROM payment AS p 
INNER JOIN staff AS s
ON p.staff_id = s.staff_id;












ok... isso funcionou.







TAMBÉM PODEMOS "FILTER" A NOSSA DATA...







---_> queremos filtrar por "apenas os rows em que 

o staff_Id é igual a 1"





SE QUEREMOS ISSO, ESCREVEMOS:




SELECT 
p.*,
first_name,
last_name
FROM payment AS p 
INNER JOIN staff AS s
ON p.staff_id = s.staff_id
WHERE p.staff_id = 1;















É ASSIM QUE PODEMOS COMBINAR INFO 

DE MÚLTIPLAS TABLES...
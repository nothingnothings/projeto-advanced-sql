








THE COMPANY WANTS TO RUN A PHONE CALL CAMPAIGN 


ON ALL CUSTOMERS 


IN THE TEXAS DISTRICT...






A PERGUNTA É:



""WHAT ARE THE CUSTOMERS (first_name, last_name,
phone_number and district) 

From texas?""












--> PODEMOS RESOLVER 
ESSA CHALLENGE USANDO QUAISQUER JOINS...






--> 2) ARE THERE ANY (OLD) ADDRESSES 
THAT ARE NOT RELATED TO ANY CUSTOMER?












OK... VAMOS COMECAR...






a query ficou assim:




SELECT 
c.first_name,
c.last_name,
a.phone,
a.address
FROM customer AS c 
INNER JOIN address AS a
ON a.address_id = c.address_id
WHERE c.address_id IN (10, 122, 310, 405, 567);











A RESPOSTA FOI ESTA:









"first_name"	"last_name"	"phone"	"address"
"JENNIFER"	"DAVIS"	"860452626434"	"1795 Santiago de Compostela Way"
"KIM"	"CRUZ"	"909029256431"	"333 Goinia Way"
"RICHARD"	"MCCRARY"	"262088367001"	"913 Coacalco de Berriozbal Loop"
"BRYAN"	"HARDISON"	"775235029633"	"530 Lausanne Lane"
"IAN"	"STILL"	"239357986667"	"1894 Boa Vista Way"


















AGORA A SEGUNDA PERGUNTA...











--> 2) ARE THERE ANY (OLD) ADDRESSES 
THAT ARE NOT RELATED TO ANY CUSTOMER?



resposta:




SELECT
a.address
FROM address AS a
LEFT JOIN customer AS c
ON c.address_id = a.address_id
WHERE c.first_name IS NULL;









RESULTADO:


"address"
"28 MySQL Boulevard"
"1411 Lillydale Drive"
"47 MySakila Drive"
"23 Workhaven Lane"



















A SOLUCAO DO PROFESSOR:










SELECT 
*
 FROM address AS a
 LEFT JOIN customer AS c
ON c.address_id = a.address_id
WHERE c.customer_id IS NULL;









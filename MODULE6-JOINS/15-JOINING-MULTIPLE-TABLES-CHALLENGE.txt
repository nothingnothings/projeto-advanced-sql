

ESTA É A CHALLENGE..









THE COMPANY WANTS TO CUSTOMIZE THEIR 

CAMPAIGNS 


TO CUSTOMERS DEPENDING ON THE COUNTRY 

THEY ARE FROM...













--> YOU NEED TO FIND:





1) WHICH CUSTOMERS ARE FROM BRAZIL






2) WRITE A QUERY TO GET FIRST_NAME,
LAST_NAME,

EMAIL AND THE COUNTRY 

FROM ALL CUSTOMERS FROM BRAZIL...







VAMOS TENTAR ESCREVER ISSO...











FICOU TIPO ASSIM:







SELECT
c.first_name,
c.last_name,
c.email,
co.country
FROM customer AS c
INNER JOIN address AS a
ON c.address_id = a.address_id
INNER JOIN city AS ci
ON ci.city_id = a.city_id
INNER JOIN country AS co
ON co.country_id = ci.country_id
AND co.country = 'Brazil';











E O RESULTADO FICOU ASSIM:








"first_name"	"last_name"	"email"	"country"
"CLAYTON"	"BARBEE"	"CLAYTON.BARBEE@sakilacustomer.org"	"Brazil"
"JOSEPH"	"JOY"	"JOSEPH.JOY@sakilacustomer.org"	"Brazil"
"TAMARA"	"NGUYEN"	"TAMARA.NGUYEN@sakilacustomer.org"	"Brazil"
"NATALIE"	"MEYER"	"NATALIE.MEYER@sakilacustomer.org"	"Brazil"
"JANE"	"BENNETT"	"JANE.BENNETT@sakilacustomer.org"	"Brazil"
"ANTONIO"	"MEEK"	"ANTONIO.MEEK@sakilacustomer.org"	"Brazil"
"NICHOLAS"	"BARFIELD"	"NICHOLAS.BARFIELD@sakilacustomer.org"	"Brazil"
"TERRI"	"VASQUEZ"	"TERRI.VASQUEZ@sakilacustomer.org"	"Brazil"
"HAROLD"	"MARTINO"	"HAROLD.MARTINO@sakilacustomer.org"	"Brazil"
"TIMOTHY"	"BUNN"	"TIMOTHY.BUNN@sakilacustomer.org"	"Brazil"
"TINA"	"SIMMONS"	"TINA.SIMMONS@sakilacustomer.org"	"Brazil"
"JESUS"	"MCCARTNEY"	"JESUS.MCCARTNEY@sakilacustomer.org"	"Brazil"
"CHARLOTTE"	"HUNTER"	"CHARLOTTE.HUNTER@sakilacustomer.org"	"Brazil"
"DANIEL"	"CABRAL"	"DANIEL.CABRAL@sakilacustomer.org"	"Brazil"
"FRANCES"	"PARKER"	"FRANCES.PARKER@sakilacustomer.org"	"Brazil"
"KENT"	"ARSENAULT"	"KENT.ARSENAULT@sakilacustomer.org"	"Brazil"
"IDA"	"ANDREWS"	"IDA.ANDREWS@sakilacustomer.org"	"Brazil"
"MARIAN"	"MENDOZA"	"MARIAN.MENDOZA@sakilacustomer.org"	"Brazil"
"ELLEN"	"SIMPSON"	"ELLEN.SIMPSON@sakilacustomer.org"	"Brazil"
"MAXINE"	"SILVA"	"MAXINE.SILVA@sakilacustomer.org"	"Brazil"
"DENISE"	"KELLY"	"DENISE.KELLY@sakilacustomer.org"	"Brazil"
"MARION"	"SNYDER"	"MARION.SNYDER@sakilacustomer.org"	"Brazil"
"JUSTIN"	"NGO"	"JUSTIN.NGO@sakilacustomer.org"	"Brazil"
"CODY"	"NOLEN"	"CODY.NOLEN@sakilacustomer.org"	"Brazil"
"FRANCISCO"	"SKIDMORE"	"FRANCISCO.SKIDMORE@sakilacustomer.org"	"Brazil"
"GEORGE"	"LINTON"	"GEORGE.LINTON@sakilacustomer.org"	"Brazil"
"DEBRA"	"NELSON"	"DEBRA.NELSON@sakilacustomer.org"	"Brazil"
"JEREMY"	"HURTADO"	"JEREMY.HURTADO@sakilacustomer.org"	"Brazil"















OK... ACERTEI...














QUAL FOI A SOLUCAO DO PROFESSOR?









FOI ASSIM:














SELECT * FROM customer;






SELECT
first_name,
last_name,
email
FROM customer AS c
LEFT JOIN address AS a
ON c.address_id = a.address_id
INNER JOIN city AS ci 
ON ci.city_id = a.city_id
INNER JOIN country AS co 
ON co.country_id = ci.country_id
WHERE country='Brazil';

















OK... ISSO É SUPER IMPORTANTE,

JOINS E ETC..









AGORA TEMOS A POSSIBILIDADE DE APLICAR 



MAIS NAS FOLLOWING CHALLENGES...












COMECAMOS COM AS STRING FUNCTIONS...









--> UMAS DAS FUNCTIONS 


MAIS BÁSICAS E 

ÚTEIS SAO 

"LOWER()"


e 


"UPPER()"....







--> POR EXEMPLO, NO NOSSO CASO,




OS EMAIL ADDRESSES ESTAO 


NESTE FORMATO:






MARY.SMITH@balalaika.com 












--> PODEMOS _ MANIPULAR___ 




ESSA PRIMEIRA PARTE DO EMAIL,


TRANSFORMAR ELA EM LOWERCASE,

POR EXEMPLO...











--> PARA ISSO,

ESCREVEMOS ASSIM:










SELECT
customer_id,
store_id,
first_name,
last_name,
LOWER(email),
address_id,
activebool,
create_date 
FROM customer;

















--> PODERÍAMOS USAR A FUNCTION CONTRÁRIA,

"UPPER()",



PARA PEGAR TUDO EM CAPS,

TIPO ASSIM:






SELECT
customer_id,
store_id,
first_name,
last_name,
UPPER(email),
address_id,
activebool,
create_date 
FROM customer;







--------------------------








PODEMOS COLOCAR 1 ALIAS, É CLARO,
 
TIPO ASSIM:








SELECT
customer_id,
store_id,
first_name,
last_name,
UPPER(email) AS upper_email,
address_id,
activebool,
create_date 
FROM customer;




















OK...




ATÉ AÍ, TUDO BEM...





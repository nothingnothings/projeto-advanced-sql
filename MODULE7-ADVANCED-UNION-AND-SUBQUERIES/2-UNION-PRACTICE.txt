












OK... AGORA DEVEMOS VER COMO ESSE COMANDO DE UNION FUNCIONA 

NO MUNDO REAL...










DIGAMOS QUE QUEREMOS COMBINAR 


MÚLTIPLOS ROWS...





TEMOS A TABLE DE "actors",


tipo assim:
















SELECT first_name FROM actor 
ORDER BY first_name;













SE RODAMOS ISSO, PERCEBEMOS QUE TEMOS ALGUMAS DUPLICATES...









PODEMOS COLOCAR TAMBÉM O LAST_NAME:







SELECT first_name, last_name FROM actor 
ORDER BY first_name;














MAS CONTINUAMOS ASSIM:


SELECT first_name FROM actor 
ORDER BY first_name;






--> SE TENTARMOS RODAR 1 UNION DESSA TABLE 


COM A TABLE 

DE CUSTOMERS,

PERDERÍAMOS TODOS OS NAMES DUPLICADOS 
(nao interessa de que table
esses nomes venham)...









ex:






SELECT first_name FROM actor 
UNION 
SELECT first_name FROM customer 
ORDER BY first_name;










COM ISSO, PERCEBEMOS QUE VÁRIOS NOMES,

COMO "ADAM",

ocorrem apenas 1 única vez...













--> NAO É EXATAMENTE ISSO QUE QUEREMOS,

POR ISSO USAMOS "UNION ALL",


PARA 



FAZER OS NOMES DUPLICADOS APARECEREM NO RESULT SET:







SELECT first_name FROM actor 
UNION ALL
SELECT first_name FROM customer 
ORDER BY first_name;





--------------------------------















OK... MAS O PROBLEMA É QUE AGORA NAO 

SABEMOS 





""QUANTOS ADAMS VÊM DA 

TABLE DE ACTORS, 
QUANTOS ADAMS VÊM DA TABLE DE CUSTOMERS""....










--> É POR ISSO QUE PODEMOS USAR 

UM PEQUENO TRUQUE...







--> PQ MUITAS VEZES QUANDO USAMOS UNIONS,

QUEREMOS SABER 

DE QUE 

LUGAR/TABLE ESSES VALUES ESTAO VINDO...









--> É POR ISSO QUE, EM TODOS 

OS SELECTS ORIGINAIS,


PODEMOS COLOCAR 1  "FIXED VALUE",




como 'actor' ou qualquer outra coisa... 






--> ISSO FARÁ COM QUE 

ESSE VALUE SEJA ADICIONADO 



A 1 SEGUNDA COLUMN...








TIPO ASSIM:








SELECT first_name, 'actor' FROM actor 
UNION ALL
SELECT first_name, 'customer' FROM customer 
ORDER BY first_name;















COM ISSO, O OUTPUT FICA TIPO ASSIM:




SELECT first_name, 'actor' FROM actor 
UNION ALL
SELECT first_name, 'customer' FROM customer 
ORDER BY first_name;








EX:








"AARON"	"customer"
"ADAM"	"customer"
"ADAM"	"actor"
"ADAM"	"actor"
"ADRIAN"	"customer"
"AGNES"	"customer"
"AL"	"actor"
"ALAN"	"actor"
"ALAN"	"customer"
"ALBERT"	"customer"












ISSO PODE SER MT ÚTIL, A DEPENDER DO CASO...


















--> e, na verdade, nem precisamos mais usar 

"union all",


podemos usar apenas "union",



PQ 



JÁ EXISTIRÁ 


1 DIFERENCA ENTRE CADA ROW (

    como 'ADAM customer' 

    e 'ADAM actor'..
)



EX:









SELECT first_name, 'actor' FROM actor 
UNION
SELECT first_name, 'customer' FROM customer 
ORDER BY first_name;




















OUTRA COISA QUE PODEMOS FAZER, NO CASO,


É 



RODAR OUTRAS UNIONS...




RODAR 1 UNION COM A TABLE DE "STAFF", POR EXEMPLO...








EX:




SELECT first_name, 'actor' FROM actor 
UNION
SELECT first_name, 'customer' FROM customer
UNION
SELECT first_name, 'staff' FROM staff
ORDER BY first_name;














COM ISSO, TEREMOS COMBINADOS 


TODAS ESSAS TABLES...










--> PODEMOS ORDENAR PELA SEGUNDA COLUMN,
TAMBÉM:




SELECT first_name, 'actor' FROM actor 
UNION
SELECT first_name, 'customer' FROM customer
UNION
SELECT first_name, 'staff' FROM staff
ORDER BY 2;














PODEMOS USAR OUTRAS FUNCTIONS PARA MANIPULAR O RESULT 
SET,
TIPO ASSIM:




SELECT first_name AS first_name, 'actor' FROM actor 
UNION
SELECT first_name, 'customer' FROM customer
UNION
SELECT UPPER(first_name), 'staff' FROM staff
ORDER BY 2;

















OK, HÁ ALGUNS DETALHES, SIM,


MAS NA PRÁTICA O UNION É UM COMANDO SUPER SIMPLES...








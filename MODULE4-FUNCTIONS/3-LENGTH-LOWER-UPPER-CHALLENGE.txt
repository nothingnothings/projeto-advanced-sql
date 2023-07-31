









TEMOS ESTA CHALLENGE:










--> PROBLEMA NO SISTEMA DE EMAILS 

DA COMPANHIA...







PROBLEMA:


1) SE O PRIMEIRO OU ÚLTIMO NOME 


DE 1 

PESSOA 
TEM MAIS DE 10 CARACTERES,

ELE NAO É ENVIADO...







2) SUA TAREFA É ENCONTRAR ESSES CUSTOMERS 


E __ OUTPUTTAR_ 1 LISTA 


DESSES FIRST _e LAST NAMES,


TODOS EM LOWER CASE....








-> PARA ISSO, ACHO QUE PODEMOS RODAR UMA QUERY ASSIM:






SELECT 
LOWER(email),
LOWER(first_name),
LOWER(last_name)
FROM customer
WHERE LENGTH(first_name) > 10 OR 
      LENGTH(last_name) > 10;










OK... DEU CERTO,

ENCONTREI 8 PESSOAS....








-----------------------------------









A SOLUCAO FOI...









SELECT 
LOWER(first_name),
LOWER(last_name),
LOWER(email)
FROM customer 
WHERE LENGTH(first_name) > 10 OR 
      LENGTH(last_name) > 10
ORDER BY first_name;












--> COM ISSO, TEMOS 1 LISTA EM ORDEM ALFABÉTICA 
DESSES USERS...




---------------------






OK, MAS DIGAMOS QUE 


"""QUEREMOS VER APENAS 1 PARTE DA STRING"" (como o EMAIL PROVIDER,


ou APENAS A PRIMEIRA LETRA DO __ PRIMEIRO NOME....
)












-> PARA CONSEGUIRMOS FAZER ISSO, PRECISAMOS CONHECER 

AS FUNCTIONS DE:






1) LEFT()



2) RIGHT()



3) alguma function de SPLIT,



alguma coisa que SPLITTE 


STRINGS EM SUBSTRINGS...


provavelmente a function "STRING_SPLIT()" (mas isso divide em 2 columns, por exemplo)...




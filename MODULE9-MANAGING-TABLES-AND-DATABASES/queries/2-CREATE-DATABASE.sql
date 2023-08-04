












O COMANDO DE CRIAR,


CREATE....














--> CREATE DATABASE 









--> CREATE DATABASE <database_name>;













CREATE OR REPLACE DATABASE <database_name>









---> TAMBÉM PODEMOS CRIAR 1 DATABASE 

POR MEIO DA INTERFACE,

MAS NAO É TAO BOM...


















--> PODEMOS USAR A INTERFACE,



MAS PODEMOS USAR 


SQL COMMANDS:












CREATE DATABASE <database_name>









CREATE DATABASE company;

















--> NUNCA USE ESPACOS 



DENTRO DOS NOMES DAS DATABASES,




SEMPRE USE "_" para espacar 

suas palavras...











--> TAMBÉM É INCOMUM MISTURAR 



UPPER E LOWER CASE LETTERS...





----------------------------------













MAS TAMBÉM PODEMOS ADICIONAR MAIS PARAMETERS
 



AO CREATE DATABASE....
















--> FAZEMOS O ADD DE PARAMETERS ADICIONAIS 


COM "WITH"...










EX:











CREATE DATABASE company_x 
    WITH ...




-------------------------------











COM ISSO, PODEMOS DEFINIR DIFERENTES 

COISAS, COMO __ENCODINGS ALTERNATIVOS 

PARA NOSSA DATABASE 
(
    encoding -> É SIMPLESMENTE COMO NOSSOS 
    CARACTERES SAO INTERPRETADOS... UTF-8, ETC...







    SE ESTIVERMOS EM 1 PAÍS DIFERENTE,

    PODEMOS USAR 1 ENCODING DIFERENTE...
)













TIPO ASSIM:






CREATE DATABASE company_x
    WITH encoding='UTF-8';


















--> COMO JÁ CRIAMOS UMA DATABASE COM ESSE NOME,


PODEMOS 



OU 


ESCREVER "CREATE OR REPLACE DATABASE company_x",

PARA 
DROPPAR A DATABASE ANTERIOR,


OU ENTAO CRIAR 1 DATABASE COM NOME DIFERENTE,


TIPO ASSIM:











CREATE DATABASE company_z
    WITH encoding='UTF-8';


















-> TAMBÉM ADICIONAR COMENTÁRIOS 



NAS DATABASES,



COM 





"COMMENT ON DATABASE company_x IS 'This is our database';
















-------_> COMMENT ON <object_type> <object_name> IS 'Your comment';


















--> OK... É ASSIM QUE PODEMOS 
CRIAR 1 DATABASE...







--> PARA DROPPAR 1 DATABASE, 



ESCREVEMOS 





DROP DATABASE <database_name>






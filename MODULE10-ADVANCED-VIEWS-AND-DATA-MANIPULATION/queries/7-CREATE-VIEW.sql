













VIMOS COMO PODEMOS 



CRIAR TABLES A PARTIR DE QUERIES JÁ EXISTENTES,


TIPO ASSIM:









CREATE TABLE customer_anonymous
AS 
SELECT customer_id, initials
FROM customer 
WHERE first_name LIKE 'C%';











isso mtas vezes deixa nossa vida mais fácil...












MAS A CRIACAO DE TABLES DESSA FORMA 

NOS TRAZ 2 PROBLEMAS:








1)  SE USARMOS ESSA QUERY COM MT FREQUENCIA,



E SE 

DECIDIRMOS 




ARMAZENAR ESSAS COPIAS/REPRODUCOES DA TABLE ORIGINÁRIA,



TEREMOS VÁRIAS COPIAS 


REDUNDANTES 



DE NOSSA TABLE ORIGINAL NA DATABASE...









2) OUTRO PROBLEMA É QUE 


__ A DATA __ NA UNDERLYING TABLE PODE EVENTUALMENTE 

MUDAR...






EX: FICAMOS COM NOVOS CUSTOMERS --> E ISSO, MESMO 

ASSIM,

NAO VAI ATUALIZAR A DATA DA TABLE "CÓPIA"



QUE CRIAMOS ANTERIORMENTE..









--> A DATA DA TABLE CÓPIA NAO SERÁ 

ATUALIZADA AUTOMATICAMENTE,

PQ 


A TABLE CÓPIA 

FOI CRIADA COMO "SNAPSHOT" 




DE COMO A DATA SE PARECIDA NO MOMENTO 


DE SUA CRIACAO...














----> OU SEJA,

QUEREMOS 


__EVITAR __ DATA STORAGE DESNECESSÁRIA,


E TAMBÉM 


QUEREMOS 

QUE 



NOSSA "TABLE" SEJA DINÂMICA,

MUDE JUNTO 


COM AS DATA CHANGES 

QUE ACONTECAM 



NA TABLE ORIGINÁRIA...














--> PARA CONSEGUIR RESOLVER ESSES PROBLEMAS ,



PODEMOS CRIAR E USAR VIEWS....
















VIEW --> """JUST CREATE A VIEW AND STORE THE STATEMENT ITSELF!""











UMA VIEW É BASICAMENTE 

1 

TABLE,
DE CERTA FORMA ---------> PODEMOS FAZER 


QUERY EM CIMA 

DELA,



VER 


TAL E TAL COLUMN,





RODAR TAL E TAL OPERACAO.---------> DA PERSPECTIVA
 

 DO USUÁRIO,




 UMA VIEW _ SE PARECE COMO UMA TABLE DE 

 VERDADE.... 














 --> PARECE UMA TABLE DE VERDADE,
 MAS HÁ 

 UMA GRANDE DIFERENCA... --> PQ 


 a __ DATA__ DA VIEW 



 NAO SERÁ ARMAZENADA FISICAMENTE,




 E SIM 




 APENAS ___  A LÓGICA___ 


 SEŔA ARMAZENADA 


 (


    a LÓGICA==== O STATEMENT QUE 

    ARMAZENAMOS,



    COMO 

    ESTe:


    "SELECT customer_id, initials
    FROM customer 
    WHERE first_name LIKE 'C%';
 )

















 --> CERTO... AÍ SEMPRE QUE FIZERMOS QUERY 

 DESSA VIEW,




 ESSA QUERY QUE ARMAZENAMOS SERÁ EXECUTADA...










-> isso também significa que 




se a underlying query é 


MT 


COMPLEXA E DEMORA MT TEMPO,




AÍ NESSE CASO,

SE FORMOS QUERIAR DESSA VIEW,



O TEMPO TAMBÉM SERÁ SUPER LONGO...











É IMPORTANTE ENTENDER QUE 




A VIEW APENAS ARMAZENA A LÓGICA,


E NADA MAIS DO QUE ISSO... --> A ACTUAL DATA 


DA TABLE NAO É 


ARMAZENADA,
E SIM 


APENAS A LÓGICA/STATEMENT DE SELECT...



















--> E A SINTAXE DAS VIEWS É SUPER SIMPLES,
É ASSIM:









CREATE VIEW example_view 
AS 
SELECT customer_id, initials
FROM CUSTOMER 
WHERE first_name LIKE 'C%';














DEPOIS PODEMOS QUERIAR DESSA VIEW,

COMO SE FOSSE 1 TABLE,

ASSIM:








SELECT * FROM example_view;













SE A QUERY ORIGINAL DEMORAVA 1 MONTE,

A VIEW AINDA VAI DEMORAR,

VAI DEMORAR O MESMO TEMPO...












O MAIN USE CASE PARA VIEWS 

É 

QUERIES QUE __ USAMOS COM MT FREQUENCIA,


MAS QUE 


NAO SAO ___TAO COMPLEXAS _ ASSIM....
















--> QUER DIZER QUE ELAS SAO UMA CONVENIENCIA,



SAO TIPO VARIABLES, mas no SQL..















--> IF THE QUERY IS SLOW, THE VIEW WILL BE SLOW...











--> AGORA DEVEMOS VER ISSO EM ACAO:
















TEMOS AQUELA MESMA QUERY DE CRIACAO DE TABLE A PARTIR 


DE 1


QUERY:










CREATE TABLE customer_spendings
AS
SELECT 
CONCAT(c.first_name, ' ', c.last_name) AS name,
SUM(p.amount) AS total_amount
FROM customer AS c
LEFT JOIN payment AS p  
ON p.customer_id = c.customer_id
GROUP BY name;


SELECT * FROM customer_spendings;
















AGORA DIGAMOS QUE QUEREMOS CRIAR 1 VIEW EM VEZ 


DE 
1 

ACTUAL TABLE..








BASTA ESCREVER ASSIM:


















  

CREATE VIEW customer_spendings_view
AS
SELECT 
CONCAT(c.first_name, ' ', c.last_name) AS name,
SUM(p.amount) AS total_amount
FROM customer AS c
LEFT JOIN payment AS p  
ON p.customer_id = c.customer_id
GROUP BY name;


SELECT * FROM customer_spendings_view;












MAS àS VEZES VIEWS NAO SAO IDEAIS...











isso pq __ PODEMOS TER QUERIES GIGANTES,


QUERIES QUE TOMAM MT TEMPO... NESSES CASOS,




TALVEZ SEJA MELHOR CRIAR 1 TABLE A PARTIR DA QUERY,


COMO ANTES....









ENTRETANTO, NESSES CASOS,


AINDA TEREMOS O PROBLEMA DE QUE 

""A UNDERLYING DATA, SE ATUALIZADA,

NAO VAI REFLETIR ESSAS CHANGES NA ""TABLE COPIA"" ""...















A SOLUCAO PARA ISSO 




É AS 'MATERIALIZED VIEWS",


EXATAMENTE COMO VIMOS NO SNOWFLAKE,
QUE VEREMOS NA PRÓXIMA AULA...



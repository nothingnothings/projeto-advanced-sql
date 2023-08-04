









NA ÚLTIMA AULA,

VIMOS QUE SE CRIAMOS UMA VIEW,


ESSA VIEW SEMPRE VAI TER PERFORMANCE IGUAL 

À QUERY QUE SALVAMOS 



NESSA VIEW.....








QUER DIZER QUE SE A QUERY FOR LENTA,
A VIEW TAMBÉM VAI SER LENTA..







COMO ALTERNATIVA, PODERÍAMOS CRIAR 

1  TABLE STANDALONE 

A PARTIR 

DESSA QUERY GIGANTE,

PARA 


QUE NO FUTURO 


AS QUERIES DEMORASSEM MENOS (
    pois seriam em cima dessa table-cópia,
    cópia da table original, mas considerando
    os detalhes/condicoes de nossa query...
)








MAS ESSA ALTERNATIVA É RUIM,


PQ 

SE 



NO FUTURO NOSSA TABLE ORIGINAL FOR ATUALIZADA,

SE ELA 

EVENTUALMENTE RECEBER NOVOS ROWS,

ESSAS CHANGES 

NAO SERAO REFLETIDAS NESSA "TABLE CÓPIA"
QUE CRIAMOS 

COM 

"CREATE TABLE AS <query>"...










A ALTERNATIVA A ISSO,

EXPLICA O PROFESSOR,



SAO 

"MATERIALIZED VIEWS"...














--> NO CURSO DO MAX,

ELE NAO EXPLICOU ESSE CONCEITO....









O QUE SAO?








--> SAO VIEWS CRIADAS COM ESTE COMANDO:













CREATE MATERIALIZED VIEW <view_name>
AS query 










É QUASE A MESMA SINTAXE DO 

"CREATE VIEW AS"...


















BEM, COM ESSAS MATERIALIZED VIEWS,


COMBINAMOS OS BENEFÍCIOS 




__ DE __ UMA PHYSICALLY AVAILABLE 

TABLE 

E 


UMA VIEW,

DE CERTA FORMA...












--> PQ, COM MATERIALIZED VIEWS,



A DATA _ REALMENTE É 


ARMAZENADA FISICAMENTE --------_> E ISSO 


GARANTE UMA PERFORMANCE MELHOR... --> É PERFEITO 

PARA 


CASOS EM QUE 


TEMOS 
VIEWS 



COM PERFORMANCE HORRÍVEL (
    pq a underlying query é mt complexa, no caso
)...













EM CASOS COMO ESSES, PODEMOS CRIAR 

MATERIALIZED VIEWS...














--> É CLARO QUE ESSAS VIEWS,

MATERIALIZED VIEWS,



DEVEM SER _ ATUALIZADAS,



E ISSO PODE SER FEITO COM 

O COMANDO 


"REFRESH MATERIALIZED VIEW <nome_da_view>"...














REFRESH MATERIALIZED VIEW customers_mat_view;





-------------------------------










SE RODARMOS ESSE COMANDO, A DATA 

DA MATERIALIZED VIEW REALMENTE FICARÁ UP-TO-DATE



com todas as mudancas da table atual...











E, DE FATO, PRECISAMOS 


ATUALIZAR 




ESSA MATERIALIZED VIEW DE ALGUMA FORMA....






2 OPCOES:






1) MANUALMENTE, 
escrevendo 

REFRESH MATERIALIZED VIEW, manualmente...







2) COM TRIGGERS (jobs, etc),




que aprenderemos mais tarde...











--> MAS O QUE INTERESSA'E QUE 
ESSA VIEW PRECISA SER ATUALIZADA....











-> ELA NAO É CAPAZ DE SER ATUALIZADA AUTOMATICAMNETE..













--> DEVEMOS VER COMO ISSO FUNCIONA NA PRÁTICA...










--> TEMOS ESTA QUERY, QUE CRIA 1 VIEW:









 CREATE VIEW films_category 
 AS
 SELECT
 title,
 length,
 ca.name AS category_name
 FROM film AS f
 LEFT JOIN film_category AS fc 
 ON fc.film_id=f.film_id
 INNER JOIN category AS ca 
 ON ca.category_id=fc.category_id
 WHERE ca.name='Action' OR ca.name='Comedy'
 ORDER BY length DESC;











AGORA DIGAMOS QUE QUEREMOS ARMAZENAR 



ESSE RESULT SET EM UMA __ MATERIALIZED VIEW...












--> É POR ISSO QUE VAMOS ESCREVER ASSIM:



















 CREATE VIEW v_films_category
 AS
 SELECT
 title,
 length,
 ca.name AS category_name
 FROM film AS f
 LEFT JOIN film_category AS fc 
 ON fc.film_id=f.film_id
 INNER JOIN category AS ca 
 ON ca.category_id=fc.category_id
 WHERE ca.name='Action' OR ca.name='Comedy'
 ORDER BY length DESC;








--------------------------
















UMA CONVENCAO,

QUANDO CRIAMOS UMA VIEW A PARTIR DE UMA TABLE,


É PREFIXAR A VIEW COM 
"v_nome_da_table",



ou 



"mv_nome_da_table" (para MATERIALIZED VIEWS)...






-------------------------------------












CRIADA ESSA MATERIALIZED VIEW,




PODEMOS FAZER 1 QUERY EM CIMA DELA...










 SELECT * FROM v_films_category;











--> OK... MAS SE UPDATARMOS ESSA TABLE ORIGINAL,

COM ESTE CÓDIGO:










UPDATE film 
SET length=192
WHERE title='SATURN NAME';






------__> SE FIZERMOS ESSE UPDATE,


A 

MATERIALIZED VIEW 



NAO 

TERÁ 

ATUALIZADO AUTOMATICAMENTE... --> PRECISAMOS 




REFRESHAR MANUALMENTE,


COM



REFRESH MATERIALIZED VIEW v_film_category;















OK... É ASSIM QUE PODEMOS CRIAR 1 MATERIALIZED 

VIEW,

E É ASSIM QUE PODEMOS REFRESH 1 MATERIALIZED 


VIEW...






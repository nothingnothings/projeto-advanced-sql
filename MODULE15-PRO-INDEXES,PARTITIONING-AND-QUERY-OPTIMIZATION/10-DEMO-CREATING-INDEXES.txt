






AGORA QUE APRENDEMOS SOBRE QUANDO DEVEMOS USAR INDEXES...















USAMOS QUANDO TEMOS:






1) TABLES LARGAS 








2) EM COLUMNS QUE NAO SAO ATUALIZADAS 

COM TANTA FREQUENCIA... (few update/insert operations)....









--> AGORA TEREMOS UM HANDS-ON DEMO 



DE COMO USAMOS 1 INDEX,


E DE COMO ISSO PODE AUMENTAR A PERFORMANCE DE NOSSAS QUERIES...















OK, MAS QUAL É A SINTAXE GERAL 




DE CRIACAO DE INDEX 
EM 1 COLUMN,

EM ALGUMA TABLE...











--> A SINTAXE É ESTA:












CREATE INDEX index_name 
ON table_name USING [index_method]
    (
        <col_name>,
        <col_name_2>,
        etc...
    );













--> E PODEMOS COLOCAR 



1 INDEX EM MÚLTIPLAS COLUMNS 

AO MESMO TEMPO,


CRIAR 


1 COMPOSITE INDEX...










-> O VERBO "USING" É OPCIONAL,

PQ O DEFAULT É REALMENTE O B-TREE INDEX.. --> NA GRANDE MAIORIA 

DOS CASOS 


É A MELHOR ALTERNATIVA....













--> OK... AÍ ESPECIFICAMOS AS COLUMNS EM QUE QUEREMOS COLOCAR 


O INDEX...













--> PODEMOS COLOCAR 


O INDEX EM MÚLTIPLAS COLUMNS AO MESMO TEMPO,



MAS 

É BEM MAIS COMUM COLOCAR O INDEX EM 1 ÚNICA COLUMN...






tipo assim:








CREATE INDEX index_name 
ON table_name 
    (
        column_name
    );













QUANDO DIABOS USARÍAMOS/CRIARÍAMOS 


UM INDEX COMPOSTO POR MÚLTIPLAS COLUMNS?






EM CASOS EM QUE NOSSO WHERE FILTER 


RODA EM CIMA DE MÚLTIPLAS COLUMNS (

    como "GENDER" e "DISTRICT",

    por exemplo....


    WHERE gender='F'
    AND district='Texas';

)













MAS AGORA DEVEMOS VER COMO ISSO FUNCIONA, NA PRÁTICA..















--> O PROFESSOR ABRE O PGADMIN,


 E ESCREVE ASSIM:















 SELECT * 
 FROM payment;











 --> A QUERY PERFORMANCE FOI RÁPIDA... 92 msec...








 --> MAS DIGAMOS QUE QUEREMOS USAR 1 SUBQUERY (
    que é meio cost-intensive
 ),


 TIPO ASSIM:











 SELECT,
 (SELECT AVG(amount)
 FROM payment AS p2
 WHERE p2.rental_id=p1.rental_id)
 FROM payment AS p1;








 24 SEGUNDOS...



 é mt tempo... --> ISSO PQ, DE NOVO E DE NOVO,


 FAZEMOS 1 
 FULL TABLE SCAN 

 PARA ENCONTRAR 

 TODOS 


 OS RENTAL_IDs


 CORRETOS..









 --> ESSA É UMA SITUACAO EM QUE PODEMOS 

 COLOCAR 1 INDEX 



 NAQUELE "rental_id",


 PARA EVITAR 



 ESSES FULL TABLE SCANS 
 E AUMENTAR 



 A PERFORMANCE 

 DESSA QUERY ESPECÍFICA (

    se temos 

    mtas queries desse tipo, em que usamos 
    o rental_id em 1 
    filter,

    A PERFORMANCE DESSA QUERY PODE 

    SER SIGNIFICATIVAMENTE MELHORADA...
 )












 PARA ISSO, ESCREVEMOS ASSIm:











CREATE INDEX index_rental_id_payment
ON payment
(rental_id);














--> ISSO VAI CRIAR ESSE INDEX 



NO NOSSO rental_id...








--> AGORA NOSSA QUERY VAI TOMAR MENOS DE 1 SEGUNDO...










MT MAIS RÁPIDO...









-> SE DROPPARMOS ESSE INDEX,

COM 







DROP INDEX index_rental_id_payment;











VEREMOS QUE A QUERY VAI NOVAMENTE 

TOMAR 1 TEMPO BEM GRANDE...






--> O INDEX AUMENTA BASTANTE NOSSA PERFORMANCE...
















--> PODEMOS USAR A TOOL DE "EXPLAIN" DO POSTGRESQL (e do snowflake)


PARA VER 



O QUANTO CADA 

COMPONENT 

TOMA DE TEMPO...








É UM GRÁFICO...











--> SE RODAMOS SEM O INDEX, ELE NAO APARECE NO GRÁFICO...






--> ESSE É O GRÁFICO QUE TENTAREMOS ENTENDER, NA PRÓXIMA AULA...
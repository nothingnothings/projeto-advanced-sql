









NESSA LICAO, ESTUDAREMOS O CROSS JOIN...
















-> ISSO BASICAMENTE CRIA 


O "PRODUTO CARTESIANO"




DE 1 TABLE/2 TABLES..












--> ISSO NOS DÁ TODAS AS COMBINACOES POSSÍVEIS ENTRE 

ROWS...













VEJA ESTE EXEMPLO:














TABLE 1:





LETTER 
A 
B 










TABLE 2:






NUMBER 
1 
2 
3

















--> SE RODARMOS O CROSS JOIN ENTRE ESSAS 2 TABLES,



FICAMOS COM 1 TABLE ASSIM:










NUMBER     LETTER 
1           A 
2           A
3           A
1           B
2           B
3           B














OU SEJA,

ficamos com 6 rows....





MÚLTIPLICAMOS O NÚMERO DE 

ROWS 


DA TABLE 1 COM O NÚMERO DE ROWS DA TABLE 2...






E ISSO SEMPRE ACONTECE,

ATÉ MESMO QUANDO TEMOS DUPLICATE VALUES...



















----------> ISSO ACONTECE PQ 

O CROSS JOIN EXECUTA 1 COMBINATION DE ROWS,

E NAO DE VALUES... -------> VEJA 

ESTE EXEMPLO:













LETTER 
A 
B 










TABLE 2:






NUMBER 
1 
1
3













RESULTADO:









NUMBER     LETTER 
1           A 
1           A
3           A
1           B
1           B
3           B







---------------------------











A SINTAXE É ESTA:










SELECT 
t1.column1,
t2.column1,
FROM table1 t1 
CROSS JOIN table2 t2;












NAO PRECISAMOS ESPECIFICAR "ON' 

para criar 1 vínculo/relation entre as tables,



PQ AS TABLES NAO PRECISAM TER RELACAO ALGUMA 

ENTRE SI....
















-> PARA DEMONSTRAR ISSO, O PROFESSOR RODA:






SELECT
staff_id
FROM staff;









SELECT
store_id 
FROM store;















AGORA DIGAMOS QUE QUEREMOS PEGAR 

TODAS AS COMBINACOES POSSÍVEIS 

ENTRE 
STORE_ID E STAFF_ID...









-- PARA ISSO, RODAMOS ASSIM:








SELECT
staff_id,
store.store_id
FROM staff
CROSS JOIN store;












--> COMO NAS 2 TABLES TEMOS 2  ROWS,


GANHAREMOS 


4 ROWS,


COM TODAS AS COMBINACOES POSSÍVEIS entre essas tables...














--> ok... é a combinacao DE ROWS,
E NAO 
DE VALUES...








MUITAS VEZES,
É ÚTIL


SER CAPAZ 


DE __ MUDAR _ O DATA TYPE_ 







DE 1 COLUMN ESPECÍFICA...





TEMOS ESTE CÓDIGO:









SELECT 
COALESCE(actual_arrival - scheduled_arrival, 'not yet arrived')
FROM flights;













NESSE EXEMPLO DE CÓDIGO,


O PROFESSOR EXPLICA QUE "COALESCE()" é uma 

function CUJOS 


PARAMETROS 


DEVEM OBRIGATORIAMENTE 


POSSUIR O MESMO DATA TYPE... 





--> AQUI, NO CASO, estamos com 

1 value que é uma date (actual_arrival - scheduled_arrival )


E OUTRO VALUE QUE 

É UMA STRING...









--> ISSO É RUIM, PQ QUER DIZER QUE TEMOS QUE CONVERTER 


ESSES VALUES, NO CASO O VALUE DA DATE,


ANTES DE 

PODERMOS O UTILIZAR 

COM "COALESCE"....

























ISSO TAMBÉM ACONTECE EM OUTROS CASES,




COMO CASES EM QUE ""uMA FUNCTION SÓ FUNCIONA 

COM 1 CERTO DATA TYPE"" ---> nesses casos,



é mt bom saber como __ TROCAR _ O DATA TYPE DE 1 COLUMN/VALUE...

















é por isso que agora falamos da FUNCTION DE 


'CAST',



QUE É USADA 

PARA SIMPLESMENTE 



TROCAR O DATA TYPE DE 1 GIVEN VALUE..








--> digamos que temos 


esta column:






scheduled_arrival
2017-09-10 13:55:00+02 
2017-08-25 16:35:00+02 















AÍ, GOSTARÍAMOS DE CONVERTER 

OS VALUES DESSA COLUMN EM STRINGS... (pq sao TIMESTAMPS WITH TIMEZONE, originalmente)













PODEMOS USAR O CAST,








PARA QUE 


ENTAO 


ELES FIQUEM COMO TEXT VALUES... (character varying)...
















ok, mas qual é A SINTAXE?












É ASSIM:









CAST(value/column AS <data type>)













BASTA ESCOLHERMOS A COLUMN CUJO DATA TYPE QUEREMOS 


ALTERAR,

E AÍ 




ESCREVER "AS" e entao o NOME DO DATATYPE..








tipo assim:






CAST(scheduled_arrival AS VARCHAR)


















ESSE É O DATA TYPE MAIS APROPRIADO PARA TEXT...











--> O RESULT SERÁ 1 COLUMN DE DATA TYPE 

'character varying'...













--> CERTO...






E É CLARO QUE TAMBÉM PODEMOS FAZER,
AQUI,






É 


CASTAR 1 DATA TYPE DIFERENTE PARA O TIMESTAMP,







TIPO ASSIM:






CAST (scheduled_arrival AS DATE);











ISSO VAI TRANSFORMAR ESSE TIMESTAMP EM UMA DATE (o que quer 
dizer que VAMOS __PERDER __ AS HORAS CONTIDAS NO TIMESTAMP).












O OUTPUT ANTERIOR É ESTE:






SELECT scheduled_arrival FROM flight;





2017-09-10 13:55:00+02
2017-08-25 16:35:00+02 











E 


O OUTPUT 



COM "CAST" FICA ASSIM, nesse exemplo:







CAST (scheduled_arrival AS DATE);








2017-09-10 
2017-08-25 




--------------------------






NEM TUDO É CAPAZ DE SER CASTADO, É CLARO (

    nao podemos castar ABC como 1 number, por exemplo....
)






--------------------------------


























OK... AGORA VEREMOS, NO PGADMIN,


SE É POSSÍVEL USAR 




A FUNCTION DE "CAST" PARA RESOLVER O 

PROBLEMA DE INCOMPATIBILIDADE DE DATA TYPES 

DOS ARGUMENTOS 



DA FUNCTION DE COALESCE...










BEM, TEMOS AQUELA FUNCTION, NOVAEMNTE:





SELECT 
COALESCE(CAST(actual_arrival - scheduled_arrival AS VARCHAR), 'not yet arrived')
FROM flight;






---------------------------------------




EX:



SELECT 
COALESCE(CAST(actual_arrival - scheduled_arrival AS VARCHAR), 'not yet arrived')
FROM flights;













OK... FUNCIONOU....





FICOU ASSIM:






"not yet arrived"
"not yet arrived"
"not yet arrived"
"not yet arrived"
"not yet arrived"
"not yet arrived"
"00:04:00"
"not yet arrived"
"not yet arrived"
"not yet arrived"
"00:00:00"
"00:02:00"
"not yet arrived"













----------------------------------------








COM ESSA O DATA TYPE DE VARCHAR, O PROFESSOR NOS EXPLICA QUE PODEMOS 

TAMBÉM 

RODAR FUNCTIONS EM CIMA DISSO,





POR EXEMPLO ASSIM:










SELECT 
LENGTH(CAST(actual_arrival AS VARCHAR))
FROM flights;
















com isso, PODEMOS CONSEGUIR A LENGTH DESSE VALUE,

PQ ELE 

SE TORNARÁ UMA STRING...











RESUMINDO:




àS VEZES, CASO SEJA NECESSÁRIO,


TALVEZ 


PQ 

QUEREMOS USAR UMA FUNCTION 


E O DATA TYPE DO PARAMETER NAO 

ENCAIXA,

PODEMOS USAR 



A FUNCTION DE "CAST()" PARA 





TRANSFORMAR O VALUE 



DA COLUMN EM OUTRA COISA...




















--> OUTRA COISA QUE PODE ACONTECER.... SE VISUALIZARMOS 

A TABLE DE TICKET,



PERCEBEMOS QUE 


TEMOS A COLUMN DE 

"TICKET",


QUE TEM ESTE FORMATO:











000054320000000492






--> MAS ISSO NAO É UM NUMBER,

É UM VARCHAR...






É UM VARCHAR(13)...













--> PODEMOS USAR A FUNCTION DE CAST COM ISSO, PARA 

TROCAR O 'ticket_no' 

EM UM INT,

ou um BIGINT..




EX:





SELECT
    CAST(ticket_no AS BIGINT)
FROM tickets;





----------------------------



mas as vezes o cast nao é possível...










EX: TEMOS A COLUMN DE "passenger_id",


com este formato 






1242 301203








NAO  É POSSÍVEL 


CONVERTER 


ISSO EM BIGINT,




PQ 




TEMOS O WHITE SPACE 

NO MEIO ....--> O QUE QUER DIZER QUE 


MUITAS VEZES PRECISAMOS SUBSTITUIR VALUES EM STRINGS,


TUDO PARA QUE CONSIGAMOS REALMENTE "CLEAN" A DATA,


ALTERAR A DATA TYPE 

DE NOSSA DATA....








--> NA PRÓXIMA LECTURE,


VEREMOS A FUNCTION DE "REPLACE()"....














--> ANTES DISSO, 


VAMOS 

PRATICAR A FUNCTION DE "COALESCE()"...
















UM PROBLEMA COM QUE FREQUENTEMENTE PODEMOS 


NOS DEPARAR 

É 



"NULL VALUES"...









FREQUENTEMENTE 


QUEREMOS 


RODAR CALCULOS,

COMO ESTES:














SELECT 
    actual_arrival - scheduled_arrival
FROM flights;











PODEMOS QUERER RODAR ISSO, PARA VER O QUAO 

ATRASADOS 

NOSSOS FLIGHTS 

ESTAO SENDO..















--> RODANDO ESSE CALCULO,



PODEMOS FICAR COM RESULTADOS PROBLEMÁTICOS,


PQ FICAREMOS COM VÁRIOS "NULLS"



na column de resposta...















--> MUITAS VEZES VAMOS QUERER 




QUE ESSES VALUES 'NULL'


SEJAM SUBSTITUÍDOS,


OU ENTAO 




TER VALUES ALTERNATIVOS, NO LUGAR DESSES NULLS...













--> EM SITUACOES COMO ESSAS, PODEMOS 


TRABALHAR COM A FUNCTION DE 




"COALESCE"...












--> COALESCE:






1) É UMA FUNCTION QUE __ RETORNA __ 

O __ PRIMEIRO VALUE___ DE 1 LISTA __ DE VALUES 


___ QUE __ NAO SEJAM _ NULL...









OK... QUER DIZER QUE 



SE TEMOS 1 LISTA DE VALUES ASSIM:









"actual_arrival"    "scheduled_arrival" 
1                         2
3                      4
null                    7










agora rodamos 'COALESCE(actual_arrival, scheduled_arrival)'






E O RESULTADO FICA ASSIM:






"coalesce"
    1 
    3
    7









    OU SEJA, FORAM "MISTURADOS" 


    OS VALUES DAS 2 COLUMNS 

    (da primeira column, "actual_arrival", com a column de "scheduled_arrival")...












mas por que isso aconteceu?








é pq o coalesce vai da esquerda para a direita,

nos params,


tentando encontrar o PRIMEIRO VALUE QUE NAO SEJA NULL (

    como no terceiro row 

    temos 1 VALUE NULL na primeira column,

    o value que acabou sendo selecionado 

    foi o segundo,
    em 'scheduled_arrival'...
)











no caso,











nossa sintaxe ficou como 



COALESCE(actual_arrival, scheduled_arrival);








PERCEBA QUE PODEMOS COLOCAR QUANTAS COLUMNS 

DESEJAMOS, DENTRO DESSE COALESCE....












--> PODEMOS COLOCAR TAMBÉM HARDCODED VALUES...






COALESCE(actual_arrival, '1970-01-01 0:00:00');








MAS SE UTILIZARMOS A VERSAO DESSA SINTAXE PASSANDO 



1 HARDCODED VALUE,

TEMOS QUE NOS CERTIFICAR 


DE QUE 



ESTAMOS USANDO 



2 PARAMETERS COM MESMO DATA TYPE (date, no caso)...







OK...





AGORA 





DEVEMOS VER 


SE 


_ _PODEMOS __ USAR ESSA FUNCTION DE 



"COALESCE()"


PARA __ CONSEGUIRMOS UM 


RESULT SET 




SEM ESSES VALUES DE "NULL"...



















--> É POR ISSO QUE ESCREVEMOS ASSIM:











SELECT 
COALESCE(actual_arrival - scheduled_arrival)
FROM flights;













--> SE ESSE PRIMEIRO VALUE FICAR COMO "NULL", QUEREMOS 

COLOCAR 1 SEGUNDO VALUE,
 
 QUE SERÁ 

 USADO NO LUGAR DO PRIMEIRO VALUE (tipo um FALLBACK)...









--> MAS É CLARO QUE __ NAO PODEMOS __ COLOCAR 


ALGO COMO 'not arrived yet',

uma string,




JUSTAMENTE PQ STRINGS SAO DIFERENTES 


DE 

DATES (

    e o 'actual_arrival' É UMA DATE,

    o que quer dizer que 

    É INCOMPATÍVEL COM ESSE 'not arrived yet'...
)













--> QUER DIZER QUE PRECISAMOS USAR ALGO COMO 

'0:00' OU QUALQUER OUTRO DUMMY VALUE,


QUALQUER COISA PARA QUE  O VALUE FINAL DESSA COLUMN,

NOS 'NULL',

NAO FIQUE COMO 'NULL',

E SIM 


ESSE DUMMY VALUE...










TIPO ASSIM:







SELECT 
COALESCE(actual_arrival - scheduled_arrival, '0:00')
FROM flights;














NOSSO OUTPUT FICA ASSIM:



"00:00:00"
"00:00:00"
"00:00:00"
"00:00:00"
"00:00:00"
"00:00:00"



















OK... MAS DIGAMOS QUE 


QUEREMOS __ rEALMENTE__ USAR _ UMA STRING__ NO 
LUGAR 

DESSE DATA TYPE ORIGINAL;;



DIGAMOS QUE __ REALMENTE QUEREMOS 


USAR 

'not yet arrived'... O QUE PODEMOS FAZER?







--> SE QUEREMOS FAZER ISSO, TERÍAMOS DE __ MUDAR __ 

O 

DATA TYPE DE 'actual_arrival',




TALVEZ COM O USO DE 


'TO_CHAR()'



OU ALGUMA OUTRA FUNCTION QUE 


CONSIGA 

CONVERTER AQUELE FORMATO DE 'Date'


EM STRING....









VEREMOS ISSO NA PRÓXIMA AULA.....












EM BANCOS SQL,



NAO É RARO PRECISARMOS FAZER "REPLACE" DE VALUES....








ISSO É USADO PRINCIPALMENTE 


PARA 


"CLEAN" OS VALUES EM 1 GIVEN COLUMN,




DEIXÁ-LAS EM 1 FORMATO PROCESSÁVEL...






------------------------








É POR ISSO QUE NESSA LECTURE FALAREMOS SOBRE A FUNCTION DE 

"REPLACE()"...






-----------------------





                        REPLACE...









-- É UMA FUNCTION QUE SIMPLESMENTE 

FAZ REPLACE DE __ TEXT, EM 1 STRING, EM 1 COLUMN,



COM __ OUTRO TEXT...








POR EXEMPLO,


TEMOS ESTA COLUMN:











flight_no 

PG0134 
PG0052 
PG0561 








PODEMOS USAR REPLACE PARA SUBSTITUIR O 'PG',

POR EXEMPLO...



EX:





REPLACE(<col_name>, 'PG', 'FL');













--> É CLARO QUE O QUE PODEMOS FAZER É SUBSTITUIR 


"PG" COM NADA (""),

O QUE 

VAI 


__ SUMIR COM ESSE "PG"...







AO "SUMIRMOS" COM PG,



OS VALUES FICARAO TIPO ASSIM:



0203

0412


0521







COMO ESSAS STRINGS CONTÊM APENAS NÚMEROS,




SEŔA POSSÍVEL/É POSSÍVEL FAZER CAST 


DAS MESMAS 





EM DATA TYPES DE NUMBERS, COMO INT E BIGINT...




-----------------------------






OK, MAS COMO DEVEMOS USAR ESSA FUNCTION?









É ASSIM:










REPLACE(<col_name>, old_text, new_text);








EX:









REPLACE(flight_no, 'PG', 'FL');
















OUTRO:







REPLACE(flight_no, 'PG', '');












------------------------------





OK... AGORA USAREMOS 



ESSA FUNCTION DE "REPLACE()"



PARA 



___LIMPAR A COLUMN DE "passenger_id",




PARA QUE 

CONSIGAMOS TROCAR 




O DATA TYPE DESSA COLUMN 


EM "BIGINT", EM VEZ DE STRING...








PARA ISSO, ACHO QUE PODEMOS ESCREVER ASSIM:










SELECT 
    CAST(
        REPLACE(passenger_id, ' ', '' ) AS BIGINT
    ) as passenger_id
FROM tickets;









OK... FUNCIONOU...





O OUTPUT FICOU ASSIM:





"passenger_id"
8149604011
8499420203
1011752484
4849400049
6615976589
2021652719
817363231
2883989356
3097995546
6866920231












AQUELA QUERY, MAS PRETTIFADA:





SELECT 
    CAST(REPLACE(passenger_id, ' ', '' ) AS BIGINT) as passenger_id
FROM tickets;





PODEMOS FAZER A MESMA COISA COM O flight_no,



TIPO ASSIM:








SELECT 
    CAST(REPLACE(flight_no, 'PG', '') AS INT) as flight_no
FROM flights;



------------------------------





ok... FUNCIONOU...




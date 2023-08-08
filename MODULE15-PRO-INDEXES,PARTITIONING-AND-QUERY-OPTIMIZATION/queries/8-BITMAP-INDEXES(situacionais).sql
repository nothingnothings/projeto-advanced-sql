











na última aula aprendemos sobre o b-tree index,

que é o index mais famoso/padrao....
















MAS AGORA VEREMOS O BITMAP INDEX,

QUE É UM INDEX 

QUE 

PODE 


SER 





____ESPECIALMENTE__ ÚTIL _ SE ESTAMOS 


TRABALHANDO COM 



__DATA__ WAREHOUSES __ (como o SNOWFLAKE)...



















--> É UM TIPO DE INDEX BENÉFICO ESPECIALMENTE 





"""LARGAS QUANTIDADES DE DATA,

COM __BAIXA__ CARDINALIDADE""""...












--> POR EXEMPLO,

SE TEMOS 


APENAS 
ALGUNS  DIFERENTES 

VALUES EM 1 COLUMN (
    a column só pode aceitar 2 ou 3 diferentes values,

    como "true/false/null"...
)









--> SE TEMOS 1 COLUMN DESSAS,

E SE TEMOS UMA QUANTIDADE __ ABSURDA__ DE DATA,




AÍ UM BITMAP INDEX É UMA 

BOA CHOICE NA NOSSA DATA WAREHOUSE...










NO CASO DO AUDIENCELAB, O QUE SERIA?









BEM, NAQUELA TABLE, SERIAM:



1) EMAIL_VALIDITY




2) CELL_PHONE_1_DNC_FLAG 


3) CELL_PHONE_2_DNC_FLAG (Y, N)




4) GENDER (M, F)





5) ADDRESS_TYPE (S, H, P)




6) HOMEOWNER (R, H, -)



7) SENIORITY_LEVEL (Cxo, Vp, Staff, DIrector) (TALVEZ)






8) BUSINESS_EMAIL_VALIDATION_STATUS (valid, -, valid(catch-all))





9) DWELL_TYPE (S, M, -)
















OK... NESSES CASOS,

OS BITMAP INDEXES SAO BOAS ESCOLHAS...








PQ SAO BOAS ESCOLHAS?










PQ COMO A DATA É ARMAZENADA 

EM "BITS",


ELA É MT STORAGE-EFFICIENT...











--> MAS ELA NAO É TAO EFETIVA PARA 


DATA MANIPULATION (para data insertion 

e manipulation, DML, data manipulation language )
















--> RESUMO:





1) PARTICULARLY GOOD FOR DATA WAREHOUSES... (locais de onde EXTRAÍMOS 
MT DATA, MAS NAO FAZEMOS TANTO WRITE ASSIM)




2) LARGAS QUANTIDADES DE DATA, MAS BAIXA CARDINALIDADE (pouca variacao
de values em 1 column, 2-3 values possíveis, tipo "true/false/null")



3) VERY STORAGE EFFICIENT (CHEAP)



4) more optimized for READ AND 
FEW 
DML-operations... (poucas operations de DATA MANIPULATION,
INSERT, UPDATE, DELETE)





--------------------------












OK, MAS COMO FUNCIONA ESSE BITMAP INDEX?
















--> BEM, 

DIGAMOS QUE TEMOS ESTA TABLE:




transaction_id      product_id      customer_id    payment         price 
1                   PG1231             4            visa            18.29
2                   PG4112              5           visa            1.49
3                   PG5121              5           visa            5.89
4                   PG5151              8           mastercard      11.59
5                   PG2313              5           mastercard      12.39





AGORA DIGAMOS QUE QUEREMOS CRIAR 1 ESTRUTURA 


QUE 

EVITE O RUN 

DE FULL-TABLE SCANS (scans no seco, sem indexes, basicamente)...
















PARA ISSO, USAREMOS BITMAP INDEX,






QUE É UM INDEX QUE __ CRIA __ BITS,

E NAO __ POINTERS...







NESSE CASO, DO EXEMPLO,

TEMOS AQUELES DIFERENTES PAYMENT TYPES (mastercard e visa)....













ESSES VALUES SAO CONVERTIDOS, EM UMA TABLE SEPARADA,
TIPO ASSIM:










row_id  Value               BIT 
1        Visa               11100
4       Mastercard          00011






(OU SEJA,


11100 ---> quer dizer que ENCONTRAMOS ESSE VALUE NOS ROWS 1,2 E 3...  1 1 1 0 0

00011 --> QUER DIZER QUE ENCONTRAMOS ESSE VALUE NOS ROWS 4 E 5... 0 0 0 1 1
)











ok.... FAZ SENTIDO...









É ASSIM QUE É CRIADO ESSE "BITMAP",






QUE NOS AJUDA A ___DESCOBRIR

EM QUAIS ROWS ENCONTRAMOS CADA VALUE...












TIPO ASSIM:






VALUE           1 2 3 4 5 6 7 8

MASTERCARD            X X X

VISA            X X X



















--> e essa é uma EXCELENTE ESTRATÉGIA SE TEMOS 



MTOS VALUES 


REPETIDOS EM 1 MESMA COLUMN...












MAS PARECE QUE O SNOWFLAKE NAO USA ESSE TIPO DE INDEXES,

é tudo manageado pelo snowflake em si...


















OK... AGORA QUE ESTUDAMOS 



RAPIDAMENTE OS B-TREE INDEXES E BITMAP INDEXES,


QUEREMOS TER 

1 POUCO DE GUIDELINES 



DE COMO PODEMOS USAR 


ESSES INDEXES... PARA QUAIS COLUMNS,


PARA QUAIS TABLES,

EM QUAIS SITUACOES...










VEREMOS ISSO NA PRÓXIMA AULA...

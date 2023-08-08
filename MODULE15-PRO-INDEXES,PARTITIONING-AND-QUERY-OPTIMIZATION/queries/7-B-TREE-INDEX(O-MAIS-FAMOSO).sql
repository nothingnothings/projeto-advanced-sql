



NA ÚLTIMA AULA,

O PROFESSOR FALOU SOBRE O CONCEITO GERAL DE INDEXES..







--> AGORA QUEREMOS FALAR MAIS SOBRE 

OS DIFERENTES TIPOS DE INDEXES...



--> PQ EXISTEM DIFERENTES INDEXES, ADEQUADOS 

PARA DIFERENTES TIPOS DE SITUACOES...















QUANDO DIZEMOS "INDEXES",






GERALMENTE O QUE 


QUEREMOS DIZER É UM "B-TREE INDEX"...










TAMBÉM EXISTEM OS BITMAP INDEXES,



QUE SAO MENOS USADOS, E QUE ESTUDAREMOS NA PRÓXIMA AULA...


















--. MAS AGORA FVEREMOS O QUE SAO B-TREE INDEXES...














--> COMO FUNCIONAM?









-> O NOME DE "B-TREE"







VEM 



DE COMO ESSE INDEX É ESTRUTURADO...










SUA ESTRUTURA 



É COMO SE FOSSE A DE UMA TREE...










CARACTERÍSTICAS:




1) MULTI-LEVEL TREE STRUCTURE...





2) BREAKS DATA DOWN INTO PAGES OR BLOCKS...








        EX:


                A 

        AB          AD
        AC          AE
ABA      ...       ...    ....
ABB 
ACA 
ACB 

















digamos que 


TEMOS 1 TEXT COLUMN..





TALVEZ NOMES...











--> AÍ PODERÍAMOS BREAK DOWN ESSES NOMES...





1o value -- pode ser A 




2o value -->> segundo caracter pode ser B, ou C (AB ou AC)....





3o value --> pode ser A, B, C, etc...















---------------------
















CADA 1 DESSAS COMBINACOES GANHA 1 NÚMERO...







AB
AC --> pode ganhar número/row de número 1 









AD 
AE --> pode ganhar número/row de número 20...















->  E USAMOS ESSA ESTRUTURA DE TREE 

PARA __ DIVIDIR __ NOSSA DATA 


EM DIFERENTES __ BUCKETS-__...












--> MAS AGORA A MAIN QUESTION É:


""QUANDO QUEREMOS USAR ESSE B-TREE INDEX?""
















O USE-CASE É ESTE:









1) QUANDO TIVERMOS UMA 

__ALTA__ CARDINALIDADE__ EM 1 COLUMN 

(
    OU SEJA,

    QUANDO TEMOS _____MUUUUUITOS___ VALUES 

    UNIQUE em 1 mesma column...
)








--> TIPICAMENTE 1 PRIMARY KEY
TEM ALTA CARDINALIDADE... -->  QUER DIZER QUE 

INDEXES B-TREE
 

 EM __ PRIMARY KEYS __ É ALGO BEM COMUM,



 JUSTAMENTE POR CONTA DISSO...











---> NO POSTGRESQL,

AS COLUMNS DE TIPO "PRIMARY KEY"

JÁ RECEBEM 1 INDEX DE tipo b-tree,

POR __ DEFAULT_...














MAS AQUI TEMOS 1 RESSALVA:






__NAO __ DEVEMOS_ _ COLOCAR INDEXES/B-TREE INDEXES 



NA NOSSA TABLE __ INTEIRA__.... --> PQ ISSO CUSTA 


MUUUUUITO em termos de storage...









--> TAMBÉM NAO DEVEMOS FAZER ISSO 

PQ __ OS WRITES FICAM BEM MAIS LENTOS...

















--> OK... AGORA ESTUDAREMOS O BITMAP INDEX,

para entao 

ESTUDARMOS 


AS "PRACTICAL GUIDELINES"

DO USO DE INDEXES...











TAMBÉM UM HANDS-ON DEMO DE COMO SETTAR INDEXES 


NAS NOSSAS DATABASES...



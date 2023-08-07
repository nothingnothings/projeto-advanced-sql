






AGORA VEREMOS UMAS FUNCTIONS SUPER 


POWERFUL,


QUE PODEMOS USAR 

PARA ANÁLISES 

MAIS DEEP...







IMAGINE O SEGUINTE EXEMPLO:

















TEMOS 1 TABLE, DE PAYMENT:










transaction_id    payment_type    customer_id    price_in_transaction
1                   visa                4           18.29
2                   visa                5           1.49
3                   visa                5           5.89
4                   mastercard          8           11.59









1 row por transaction...











--> AGORA, O QUE GOSTARÍAMOS DE FAZER,




É CONSEGUIR O MESMO RESULT SET,


MAS COM 1 COLUMN ADICIONAL,

AGREGANDO 



O 
"TOTAL SPENT BY CUSTOMER",







para cada 1 dos customer id,

para a table inteira..













--> OK... --> QUER DIZER QUE:






1) NAO QUEREMOS AFETAR O NÚMERO DE ROWS;
QUEREMOS TER O MESMO NÍVEL DE DETALHE,

TUDO DEVE SER A MESMA COISA,


MAS



2) QUEREMOS AO MESMO TEMPO TER 1 AGGREGATED 
COLUMN,


1 COLUMN QUE CONTENHA AGGREGATED DATA...




3) MAS AO MESMO TEMPO NAO QUEREMOS 

FAZER 

GROUP DA DATA 

DO RESULT SET,
PQ ISSO SE LIVRARIA 


DO NÍVEL DE DETALHES QUE TEMOS AGORA,

E DO NÚMERO DE COLUMNS QUE TEMOS AGORA...

















-> NA VERDADE,

JÁ VIMOS 1 APPROACH 



QUE _ RESOLVE ESSE PROBLEMA.... -> É O USO 

DE 


__CORRELATED__ SUBQUERIES 



NO __ SELECT STATEMENT,




TIPO ASSIM:










SELECT 
transaction_id,
payment_type,
customer_id,
price_in_transaction
(SELECT SUM(price_in_transaction) FROM sales AS s2
WHERE s2.customer_id=s1.customer_id
)
FROM sales s1;









O OUTPUT:






transaction_id    payment_type    customer_id    price_in_transaction     total_spent_by_customer
1                   visa                4           18.29                           6182.79
2                   visa                5           1.49                            8762.30
3                   visa                5           5.89                            8762.30
4                   mastercard          8           11.59                           5779.96






MAS ISSO É ACTUALLY BEM COMPLICADO 


DE DEVELOPAR, E DE ESCREVER....










---> ALÉM DE SER DIFÍCIL DE ESCREVER,



ESSE TIPO DE QUERY É MT COST-INTENSIVE,


PQ 

A QUERY 


É EXECUTADA 

__ PARA __ cADA __ 

ROW __ DE 


NOSSA TABLE...



(diminui mt a nossa performance... --> pq precisamos 
ITERATE 

por dentro de cada row, e isso é MT RUIM, em questao 
de performance...)















HÁ UMA MANEIRA BEM MELHOR DE FAZER ISSO,


QUE É 

POR MEIO 

DO USO 


DE __ WINDOW __ FUNCTIONS....















TIPO ASSIM:








SELECT
transaction_id,
payment_type,
customer_id,
price_in_transaction,
SUM(price_in_transaction) OVER(PARTITION BY customer_id) -- esta linha.
FROM sales s;









OK, MAS O QUE ACONTECE NESSA LINHA?







1) USAMOS UMA AGGREGATE FUNCTION




2) USAMOS A CLAUSE DE "OVER()"




3) PARTITION BY xxxxx 

(
    isso AGRUPA AS aggregations 
    por essa coisa aí,

    no caso o CUSTOMER_ID...

)












MESMO USANDO ESSA(s) WINDOW FUNCTION(s),


O NÚMERO DE ROWS NAO É AFETADO,



NEM O NÚMERO DE COLUMNS iniciial,




MAS AO MESMO TEMPO FICAMOS COM ESSA 

COLUMN DE TIPO "AGGREGATION"











O OUTPUT FICA EXATAMENTE COMO ANTES,

ASSIM:








transaction_id    payment_type    customer_id    price_in_transaction     total_spent_by_customer
1                   visa                4           18.29                           6182.79
2                   visa                5           1.49                            8762.30
3                   visa                5           5.89                            8762.30
4                   mastercard          8           11.59                           5779.96









MAS AGORA COM BEM MAIS PERFORMANCE...













o interessante é que, no select,



NAO USAMOS NENHUM "GROUP BY"...








--> parece que o "OVER()" 

junto com o "partition by" 


ACABAM AFASTANDO A NECESSIDADE 



DE 


ESCREVERMOS 

"GROUP BY" junto com SUM() e outras aggregation functions....









------_> e é ISSO QUE CONSEGUIMOS FAZER,



COM O USO DE WINDOW FUNCTIONS...














--> e, em vez de SUM(),




PODERÍAMOS USAR OUTRA  AGGREGATE FUNCTION,


como "COUNT()",



SEM MAOIRES PROBLEMAS...




EX:







SELECT
transaction_id,
payment_type,
customer_id,
price_in_transaction,
COUNT(*) OVER(PARTITION BY customer_id) as n_of_transactions_per_customer
FROM sales s;








COM ISSO, FICARÍAMOS COM O NÚMERO 
DE TRANSACTIONS POR CUSTOMER, POR EXEMPLO...









TAMBÉM PODEMOS PARTICIONAR 


POR OUTRO TIPO DE COLUMN,




COMO "payment_type",



o que nos daria 



1 resultado completamente diferente....














RESUMINDO, WINDOW FUNCTIONS:






1) FÁCEIS DE MODIFICAR 


2) FÁCEIS DE DEVELOP


3) MT EFICIENTES..










--> NOVAMENTE:




O NÚMERO DE ROWS NAO É AFETADO,
 


E  MESMO ASSIM PODEMOS TER 


1 


AGGREGATION COLUMN,

QUE 


É AGREGADA POR 1 CERTA PARTITION/PARTITIONS...















O ACESSO A WINDOW FUNCTIONS É FEITO 


ATRAVÉS 



DA  clause DE "OVER()"...














E NÓS PODEMOS COMBINAR TODAS AS AGGREGATIONS CONHECIDAS 

POR NÓS (sum, count, max, min) COM 



O 


OVER()... 



















ENTRETANTO,






O "OVER()" 


TAMBÉM NOS FORNECE ALGUMAS 

OUTRAS 

AGGREGATION FUNCTIONS,


COMO:









1) RANK() 



2) LEAD() 



3) LAG() 



4) FIRST_VALUE()...









VEREMOS ESSAS AGGREG FUNCTIONS NAS PRÓXIMAS 

LICOES...















MAS ANTES DE ESTUDARMOS ESSAS FUNCTIONS,


DEVEMOS ESTUDAR A SINTAXE BÁSICA 

DAS WINDOW FUNCTIONS...












A SINTAXE É ASSIM:












AGREG_FUNCTION(agg_column) OVER(PARTITION BY partition_column);










É A FUNCTION DE "OVER()"

que abre a chamada "window"...









-> dentro de over,


colocamos 
"PARTITION BY",

e entao 


COLOCAMOS 


O NOME DA COLUMN 


QUE QUEREMOS USAR PARA AGRUPAR/particionar....











NA VERDADE, NÓS NAO AGRUPAMOS A DATA....






O QUE FAZEMOS, NA VERDADE,

É 


""ABRIR UMA WINDOW PARA OUTRA QUERY""...











-> NO CASO,



A PARTE DA WINDOW É ESTA:








AGREG_FUNCTION(agg_column) OVER (PARTITION BY partition_column)
                                
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                ESTA É A WINDOW ABERTA PELO 
                                ''OVER''...





É ASSIM QUE AS WINDOW FUNCTIONS FUNCIONAM..













AGORA DEVEMOS VER ISSO NA PRÁTICA...













TEMOS ESTA QUERY:












SELECT * FROM payment;






ISSO VAI NOS DAR TODOS OS PAYMENTS....







AGORA O QUE QUEREMOS É 

A 

"SUM DO AMOUNT, PARA CADA CUSTOMER"...










SELECT 
* 
SUM(amount) OVER(PARTITION BY customer_id) AS amount_per_customer
FROM payment;













OK.... BEM MELHOR...







--> E PODEMOS 



trocar esse "SUM()",


colocar outra aggregation function 

no seu lugar...





-> QUEREMOS VER QUANTAS TRANSACTIONS CADA 

CUSTOMER TEVE:










SELECT 
*,
COUNT(*) OVER(PARTITION BY customer_id)
FROM payment 
ORDER BY 1;















ADICIONALMENTE,

PODEMOS AGRUPAR POR MAIS 


DE 1 

ÚNICA COLUMN,


particionar por MÚLTIPLAS COLUMNS...


                            











-> tipo assim:












SELECT 
*,
COUNT(*) OVER(PARTITION BY customer_id, staff_id)
FROM payment 
ORDER BY 1;










--> COM ISSO, SABEMOS 

"QUANTAS SALES EXISTIRAM 

PARA CADA STAFF_ID, PARA CADA CUSTOMER"...










------------> também podemos rodar o OVER()

sem o partition by... --> se fizermos isso,




VAMOS FICAR APENAS COM O TOTAL AMOUNT DE NOSSA QUERY EM 1 

COLUMN SEPARADA,


TIPO ASSIM:











SELECT 
*,
COUNT(*) OVER()
FROM payment 
ORDER BY 1;





-----------------















--> NÓS TAMBÉM PODEMOS USAR O "AVG()",

ISSO É TOTALMENTE POSSÍVEL, SIM...










--> MAS SE QUISERMOS FAZER ROUND DE 1 VALUE PRODUZIDO COM 


"OVER()",


DEVEMOS 




USAR A FUNCTION DE ROUND EM VOLTA DE TODA A EXPRESSAO,

TIPO ASSIM:






SELECT 
*,
ROUND(AVG(amount) OVER(), 2)
FROM payment 
ORDER BY 1;













é assim que window functions funcionam...




agora devemos praticar isso, com 1 challenge...
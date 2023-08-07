O CUBE TAMBÉM 

É USADO PARA 


CRIAR 

GROUPING SETS PRÉ-DEFINIDOS...









SUA SINTAXE É ASSIM:










GROUP BY 
CUBE (col1, col2, col3)...










A DIFERENCA DE "CUBE" PARA ROLLUP 

É QUE 





__ O CUBE__ NAO CRIA 1 HIERARQUIA... -----_> 









ALÉM DE NAO CRIAR 1 HIERARQUIA,

O 


CUBE 

NOS DÁ 

TODAS AS COMBINATIONS POSSÍVEIS 

ENTRE 


COLUMNS, nos grouping sets...









TIPO ASSIM:










GROUP BY 
CUBE (col1, col2, col3) 





FICA ASSIM:



GROUP BY 
GROUPING SETS (
    (col1, col2, col3),
    (col1, col2),
    (col1, col3),
    (col2, col3),
    (col1),
    (col2),
    (col3),
    ()

)











DEVEMOS VER COMO ISSO FUNCIONA NA PRÁTICA...












QUEREMOS 


VER:



1) TOTALS DOS CUSTOMERS,



2)  PER STAFF_ID 



3) PER DAY...











-> MAS NAO EXISTIRÁ 

HIERARQUIA,
PQ 



1 CUSTOMER PODE 



COMPRAR COM DIFERENTES STAFF_IDS... nao existe 


natural hierarchy...














--> OK..







COMECAMOS ASSIM:









SELECT 
customer_id,
staff_id,
DATE(payment_date),
SUM(amount)
FROM payment 
GROUP BY 
CUBE (customer_id, staff_id, DATE(payment_date));
ORDER BY 1, 2, 3;















OK.... QUER DIZER QUE TEMOS TODAS AS COMBINATIONS POSSÍVEIS....









-> NO FINAL, TEMOS O TOTAL AMOUNT...
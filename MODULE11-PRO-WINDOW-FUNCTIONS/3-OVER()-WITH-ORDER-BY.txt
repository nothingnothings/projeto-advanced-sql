







AGORA QUE VIMOS O FUNCIONAMENTO DAS WINDOW FUNCTIONS,







VIMOS COMO  FUNCIONA O OVER E PARTITION BY,









DEVEMOS ESTUDAR AS WINDOW FUNCTIONS 




COM MAIOR PROFUNDIDADE....













ISSO PQ TEMOS 1 OPTION ADICIONAL,




QUE É SUPER PODEROSA...















--> COM ESSA OPTION,


EM VEZ DE USARMOS "pARTITION BY",



USAMOS A CLAUSE DE "ORDER BY" 



COM O _"OVER()"...














--> OK, MAS O QUE ISSO FAZ?




ISSO NOS DÁ UM "RUNNING TOTAL"...














--> ISSO QUER DIZER QUE 



NA COLUMN DE SUM/QUALQUER OUTRA COISA,









OS VALUES SAO GRADUALMENTE AUMENTADOS, ETAPA-POR-ETAPA,




A PARTIR DE 1 COLUMN 




(
    ou seja,
    talvez queiramos conseguir o 


    "RUNNING TOTAL" DA COLUMN DE 
    AMOUNT,

    COM BASE NA ORDEM DA COLUMN DE "payment_date" (
        ou seja,

        ver o quanto fomos ganhando, por dia...
    )
)










QUER DIZER QUE NOSSO RESULT SET VAI FICANDO ASSIM:







payment_date    amount        sum 
DIA 1             2.99          2.99
DIA 2             2.99          5.98 
DIA 3             3.99          9.97
DIA 4             4.99          14.96 
DIA 5             6.99          21.95 
DIA 6             0.99          22.94






------------------------------------------









ex: 9.97 + 4.99 = 14.96


















OK, ESSE É O RUNNING TOTAL,






QUE É MT IMPORTANTE ---> EM MTAS ANÁLISES,


ESSE É UM NUMBER MT IMPORTANTE...

















--> PARA TER ESSA COLUMN,
PRECISAMOS DE WINDOW FUNCTIONS....
















-> PARA ISSO, ESCREVEMOS ASSIM:






SELECT 
*,
SUM(amount)
FROM payment;













DEPOIS DISSO, USAREMOS O "OVER()" exatamente 

como fazemos com window functions comuns,




MAS __ AÍ NAO VAMOS USAR "PARTITION BY <col_name>",


E SIM 

USAREMOS


"OVER(ORDER BY <col_name>)"..











TIPO ASSIM:









SELECT 
*,
SUM(amount) OVER (ORDER BY payment_date)
FROM payment;



















--> OK... E ESSE É O BEHAVIOR DO 
'ORDER BY"



NO INTERIOR DA CLAUSE DE "OVER()" --> FAZ COM QUE,

ETAPA-POR-ETAPA,


TODOS OS VALUES ANTERIORES, INCLUSIVE O 
DA CURRENT ROW,

SERÃO "ADDED UP"...









--> E É CLARO QUE, COM O USO DESSA CLAUSE INTERNA



DE 

"oRDER BY",


TODA A TABLE ACABA ORDENADA TAMBÉM POR ESSA 

COLUMN ESPECIFICADA....

(
    agora ordenamos por payment_date,e nao 

    por payment_id, por exemplo...
)



















-> SE __ORDENAMOS POR payment_id,


POR EXEMPLO,






ESSE STATEMENT VAI IR SOMANDO TODOS OS VALUES 



CONSIDERANDO A ORDEM DOS PAYMENT_ID..






ex:




SELECT 
*,
SUM(amount) OVER (ORDER BY payment_id)
FROM payment;























MAS A PARTE MAIS INTERESSANTE DISSO TUDO 

É QUE 


PODEMOS ATÉ MESMO 



USAR O "OVER(ORDER BY xxxx)"





CONJUNTAMENTE COM O "PARTITION BY yyyyy"....















--> E É EXATAMENTE ISSO QUE DEIXA ESSE RECURSO 

SUPER PODEROSO,

NAS NOSSAS ANÁLISES....














--> POR EXEMPLO,



PODERÍAMOS DIZER 


""PARTITION POR CUSTOMER,

E  ORDENE __ PELO __ PAYMENT_DATE, 
EM RESPEITO A CADA  CUSTOMER""......










--> PARA ISSO, NOSSA QUERY FICA/FICARIA ASSIM:









SELECT
*,
SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_date)
FROM payment;













TAMBÉM PODEMOS FAZER A MESMA COISA,



MAS COM "payment_id":







SELECT
*,
SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_id)
FROM payment;



















E É EXATAMENTE POR ISSO QUE 


"OVER()" (Window function),



"PARTITION BY xxx" 


e 



"ORDER BY yyy" 


SAO SUPER PODEROSOS PARA RODAR ANÁLISES....






















-> ESSE É O PRINCÍPIO...














--> E É CLARO QUE PODEMOS ORDENAR POR MÚLTIPLAS 

COLUMNS...





EX: ORDENAR POR PAYMENT_DATE, COMO PRIMEIRO CRITÉRIO,
E DEPOIS 

ORDENAR POR PAYMENT_id...




ex:





SELECT
*,
SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_date, payment_id)
FROM payment;


























--> E É CLARO QUE PODEMOS USAR "ASC" 

e 


"DESC" com esse order by ...












--> OK... É ASSIM QUE PODEMOS CRIAR RUNNING TOTALS 

COM O ORDER BY,

E COMO PODEMOS O COMBINAR COM "PARTITION BY"...











AGORA DEVEMOS VER 1 CHALLENGE....
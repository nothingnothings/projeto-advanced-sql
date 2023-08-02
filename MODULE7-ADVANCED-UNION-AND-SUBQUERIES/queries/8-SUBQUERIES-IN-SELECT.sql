


OK... NAS ÚLTIMAS LICOES,


VIMOS COMO PODEMOS 


TRABALHAR COM SUBQUERIES,



E SOBRE COMO 




PODEMOS AS UTILIZAR EM 2 LUGARES DIFERENTES:












1o LUGAR) LÁ 


NA WHERE CLAUSE,



COM "=" E "IN ()",



COM UM FORMATO TIPO ESTE:








SELECT * FROM 
<table_name>
WHERE <col_name> IN (
    SELECT ....
); 


(USADO QUANDO FICAMOS COM MÚLTIPLOS IDS/VALUES)




E 


SELECT * FROM 
<table_name>
WHERE <col_name> = (
    SELECT ....
); 




(USADO QUANDO FICAMOS COM 1 ÚNICO ID/VALUE)




















--> depois,
vimos:




2) PODEMOS USAR SUBQUERIES COM 


A CLAUSE DE "FROM",

BASTA 

COLOCAR 

1 ALIAS PARA ESSE RESULT SET,
TIPO ASSIM:










SELECT
result_set.some_col
FROM (
    SELECT <some_col> FROM 
    <some_table>
) AS result_set;

















OK... MAS AGORA HÁ 



1 ÚLTIMO LUGAR EM QUE PODEMOS USAR 

SUBQUERIES...










--> É DENTRO ____ DA CLAUSE _ DE SELECT EM SI...













--> É BEM PARECIDO COM O QUE JÁ VIMOS ATÉ AGORA...

















--> É TIPO ASSIM:












SELECT * FROM payment;










temos essa table de payment, sim...









SABEMOS QUE PODEMOS COLOCAR 

VALUES 



NAS COLUMNS,

TIPO ASSIM:












SELECT 
*, 'hello', '3'
FROM payment;











ISSO FUNCIONA,



E SEMPRE COLOCA 



ESSE VALUE EM TODOS OS ROWS 

DA 


COLUMN QUE É CRIADA...






tipo assim: 



payment_id  customer_id  ?column?  ?column? 
1               1           3       'hello'
2               2           3       'hello'
8               8           3       'hello'

















MAS É POSSÍVEL DEIXAR ISSO 

MAIS DINAMICO,


USANDO SUBQUERIES...








TIPO ASSIM:












SELECT 
*,
()
FROM payment;














--> OU SEJA, PODEMOS COLOCAR 1 SUBQUERY ALI...










--> MAS PARA QUE ISSO FUNCIONE,

O VALUE DESSA COLUMN/SUBQUERY 

DEVE 
SER 


"""A SINGLE VALUE"""...




POR EXEMPLO,
 
 PODEMOS ESCREVER ASSIM:









SELECT 
*,
( SELECT AVG(amount) FROM payment)
FROM payment;













OK... COM ISSO, ESSE VALUE SERÁ ADICIONADO 



EM TODOS OS ROWS...






( o mesmo value, esse 4.3212319102924109)





tipo assim:









"payment_id"	"customer_id"	"staff_id"	"rental_id"	"amount"	"payment_date"	"avg"
16050	269	2	7	1.99	"2020-01-24 22:40:19.996577+01"	4.2006673312979002
16051	269	1	98	0.99	"2020-01-25 16:16:50.996577+01"	4.2006673312979002
16052	269	2	678	6.99	"2020-01-28 22:44:14.996577+01"	4.2006673312979002
16053	269	2	703	0.99	"2020-01-29 01:58:02.996577+01"	4.2006673312979002
16054	269	1	750	4.99	"2020-01-29 09:10:06.996577+01"	4.2006673312979002
16055	269	2	1099	2.99	"2020-01-31 13:23:14.996577+01"	4.2006673312979002



















OK...












mas isso SÓ FUNCIONA 


SE


ESSA EXPRESSAO RETORNAR 1 ÚNICO VALUE...












--> ISSO NAO É MT ÚTIL,

NA VERDADE...


















--> PODEMOS USAR SUBQUERIES, COMO EXPRESSIONS,


NA SELECT CLAUSE (


    os use-cases nao sao mt comuns...
)












--> MAS O PROFESSOR VAI NOS DAR 1 CHALLENGE SOBRE ISSO...
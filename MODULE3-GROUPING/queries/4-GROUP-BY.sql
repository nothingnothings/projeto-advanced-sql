















certo.... AGORA, SE QUEREMOS 

AGGREGATE DATA,


NÓS GERALMENTE FAZEMOS GROUP DA DATA 




SEMPRE BY ALGUMA CATEGORIA ESPECÍFICA...










POR EXEMPLO,





TEMOS ESTE CÓDIGO:










SELECT 
SUM(amount)
FROM payment;










COM ESSE CÓDIGO, NÓS FAZEMOS AGGREGATE 

DO TOTAL AMOUNT,


DA TABLE INTEIRA,

E NAO AGRUPAMOS POR NADA... (sem group by)...
















--> MAS TALVEZ QUEIRAMOS 


VER "QUANTO CADA CUSTOMER GASTOU"....










--> OU SEJA,

QUEREMOS AGRUPAR POR CADA "CUSTOMER_ID",

PARA VER QUANTO CADA CUSTOMER GASTOU...









--> DEVEMOS COLOCAR A COLUMN DE CUSTOMER_ID 


NO SELECT,
E AÍ 


COLOCAR O CUSTOMER_ID COMO CRITEŔIO DO GROUP BY..






TIPO ASSIM:












SELECT 
SUM(AMOUNT) AS TOTAL_SPENT_BY_CUSTOMER,
CUSTOMER_ID
FROM payment
GROUP BY CUSTOMER_ID
ORDER BY TOTAL_SPENT_BY_CUSTOMER DESC;










CERTO....


funcionou...




------------------------------














AGORA O PROFESSOR DESCREVE BEM A CLAUSE DE 

GROUP BY...








ESSA CLAUSE É USADA PARA AGRUPAR NOSSAS 

AGGREGATIONS POR __ COLUMN___...



--> PARA CADA DIFERENTE VALUE 

NESSA COLUMN,

AGRUPAMOS


TODOS OS VALUES RELACIONADOS...












-->  SINTAXE:











SELECT 
customer_id,
SUM(amount)
FROM payment
GROUP BY CUSTOMER_ID;








--> GERALMENTE 

O 


GROUP BY VEM LOGO DEPOIS 

DA CLAUSE DE "FROM",


MAS É CLARO QUE 


PODEMOS FILTRAR NOSSA DATA ___ __ ANTES__ 

DE AGRUPAR...






tipo assim:







SELECT 
customer_id,
SUM(amount)
FROM payment 
WHERE customer_id > 3
GROUP BY customer_id;



------------------------------
















SELECT 
customer_id,
SUM(amount)
FROM CUSTOMER 
GROUP BY customer_id
ORDER BY amount DESC;









--> a column que "nao é usada na aggregate function" (ou seja,
que nao é usada com AVG, MIN, SUM, etc) 

SEMPRE É A COLUMN QUE É USADA NA "GROUP BY" CLAUSE..






-------------------------











TAMBÉM É POSSÍVEL __ FITLRAR_ _ A DATA ANTES 

DE A AGRUPAR,


BASTA RODAR O WHERE ANTES DO GROUP BY, TIPO ASSIM:








SELECT 
customer_id,
SUM(amount)
FROM CUSTOMER
WHERE customer_id > 3
GROUP BY customer_id
ORDER BY amount DESC;








---------------------------------------








-> O QUE DEVEMOS PERCEBER, 

SE USAMOS A CLAUSE DE "GROUP BY",


É QUE __ CADA__ cOLUMN




DEVE __ OU SER__ INCLUÍDA NA AGGREGATE FUNCTION (
    como amount, nesse caso
) OU INCLUÍDA 


NA CLAUSE DE "GROUP BY" (como o customer_id, nesse caso)...














--> E ISSO É OBRIGATÓRIO... --> É A COISA MAIS IMPORTANTE QUE 


DEVEMOS SABER SOBRE O GROUP BY: 


AS COLUMNS DEVEM FICAR OU NA AGGREGATE FUNCTION (ou a column 
deve ser AGREGADA) 

ou 



no group by clause... (ou deve ficar nessa clause)













CERTO...










agora devemos ver isso no PGADMIN....













o professor escreve assim:














QUEREMOS AGRUPAR PELO CUSTOMER_ID,

por isso escrevemos assim:







SELECT customer_id,
SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id
ORDER BY total_amount DESC;







--> TAMBÉM PODERÍAMOS COLOCAR A AGGREGATE FUNCTION DE "MAX(amount)",


que também nos mostrará o máximo gasto por cada consumer:







SELECT customer_id,
SUM(amount) AS total_amount,
MAX(amount)
FROM payment
GROUP BY customer_id
ORDER BY total_amount DESC;




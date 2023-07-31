











SE ESTAMOS AGRUPANDO NOSSA DATA,

COM GROUP BY,



TIPO ASSIM:




SELECT 
staff_id,
DATE(payment_date)
SUM(amount),
COUNT(*)
FROM payment
WHERE amount != 0
GROUP BY staff_id, DATE(payment_date)
ORDER BY COUNT(*) DESC;















SE ESTAMOS FAZENDO ISSO, OCASIONALMENTE 

VAMOS QUERER 


""LIMITAR O NÚMERO DE ROWS 

__ APENAS ÀQUELES ROWS QUE IMPORTAM 

PARA NÓS"" --. ou seja,




VAMOS QUERER, DE ALGUMA FORMA,
FILTRAR 


NOSSO OUTPUT --> E FAREMOS ISSO EM CIMA DE ALGUMA 


DAS "AGGREGATED COLUMNS"



(

    por exemplo, 

    a column de "day_amount",

    que é um 


    AGREGADO DE TODOS OS AMOUNTS DE CADA DIA...
)












--> PARA ISSO, PRECISAMOS DA CLAUSE DE "hAVING"...




--> é basicamente o WHERE,

mas é usado 


com columns criadas por meio de aggregate functions...








USAMOS TIPO ASSIM:





SELECT 
staff_id,
DATE(payment_date),
SUM(amount),
COUNT(*)
FROM payment
WHERE amount != 0
GROUP BY staff_id, DATE(payment_date)
HAVING COUNT(*) > 300
ORDER BY COUNT(*) DESC;






--------------------------------












A CLAUSE DE "hAVING" É USADA COM AGGREGATE FUNCTIONS...











HAVING --> É USADO EM GROUP BY STATEMENTS,



PARA __ "FILTER BY AGGREGATIONS"....















--> EX:



HAVING COUNT(*) > 300;





















--> COM ISSO, LIMITAMOS 

OS ROWS apenas àqueles superiores a 300...













E ISSO SOMENTE É POSSÍVEL SE ESTAMOS GROUPING 

NOSSA DATA...



---------> DEVEMOS USAR O HAVING (filtro das aggregation functions)

LOGO DEPOIS DO GROUP BY...


(SEMPRE)..


















--> MAS TEMOS 1 EXEMPLO DE COMO ISSO FUNCIONA:





DIGAMOS QUE QUEREMOS AGRUPAR 




NOSSOS ROWS POR MEIO DE "CUSTOMER_ID" 





E VER A SUM DE CADA 1... MAS QUEREMOS 

VER APENAS AQUELES CUSTOMERS QUE 

TENHAM GASTO MAIS DO QUE 200...












A SINTAXE FICA TIPO ASSIM:










SELECT 
customer_id,
SUM(amount)
FROM payment 
GROUP BY customer_id
HAVING SUM(amount) > 200;






---------------------------------













OK... AGORA QUEREMOS VER "COMO FILTRAR POR TODOS 
OS ROWS QUE TENHAM COUNT(*) maior do que 300"...




















EX:








GROUP BY STAFF_ID, DATE(payment_date)
HAVING COUNT(*) > 400
ORDER BY COUNT(*) DESC;









----------------------------










é claro que podemos quaisquer conditions dentro de "having"...










TAMBÉM PODEMOS USAR AND E OR COM 'HAVING"...








-> AGORA É HORA DE APLICARMOS 


ESSE CONHECIMENTO, EM 1 CHALLENGE...
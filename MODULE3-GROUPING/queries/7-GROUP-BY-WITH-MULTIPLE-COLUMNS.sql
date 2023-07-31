









É CLARO QUE ÀS VEZES É NECESSÁRIO, E IMPORTANTE,


SERMOS CAPAZES DE AGRUPAR/GROUP BY DATA 

__ COM MÚLTIPLAS COLUMNS AO MESMO TEMPO..











-> PARA ISSO, DEVEMOS 


VER NOSSA TABLE DE PAYMENT RAPIDAMENTE:














TEMOS AS COLUMNS DE:






PAYMENT_ID 



CUSTOMER_iD 


STAFF_ID 

RENTAL_ID 



AMOUNT 



E 


PAYMENT_dATE...










--> POR EXEMPLO, TALVEZ SEJA OPORTUNO 


PESQUISAR 


""O QUANTO CADA CUSTOMER GASTOU, COM CADA STAFF MEMBER"..









-> para isso,



provavelmente usaremos GROUP BY COM 2 COLUMN,

tipo assim:











SELECT 
staff_id, 
customer_id,
SUM(amount) AS total_spent 
FROM payment
GROUP BY customer_id, staff_id
ORDER BY staff_id;






------------------------











ISSO REALMENTE FUNCIONOU, E NOSSO OUTPUT FICOU ASSIM:




1	1	64.83
1	480	33.91
1	41	50.88
1	70	50.89
1	28	52.86















--> TALVEZ QUEIRAMOS SABER 

''QUAL DE NOSSOS EMPLOYEES TEVE A MAIOR QUANTIDADE 

DE PAYMENTS COM 1 CUSTOMER ESPECÍFICO''...










PARA ISSO, NOSSA QUERY PROVAVELMENTE VAI FICAR ASSIM:









SELECT 
staff_id, 
customer_id,
COUNT(amount) AS total_payments
FROM payment
GROUP BY customer_id, staff_id
ORDER BY staff_id;





ficou tipo assim, o output:




staff_id   customer_id    total_payments
1	            1	            17
1	            480         	9
1	            41          	12
1	            70          	11
1	            28	            14




------------------------------------










SE ESTAMOS FAZENDO GROUP BY DE NOSSA DATA,

GERALMNTE TAMBÉM FAZ SENTIDO 

ORDENARMOS NOSSA DATA....








-> PODEMOS ORDENAR POR COUNT, podemos fazer TIPO ASSIM:





SELECT 
staff_id, 
customer_id,
COUNT(amount) AS total_payments
FROM payment
GROUP BY customer_id, staff_id
ORDER BY total_payments DESC;














PODEMOS AGRUPAR POR QUANTAS COLUMNS QUISERMOS... --> 






MAS VC SEMPRE DEVE SE LEMBRAR QUE 'COLUMNS NAO INCLUÍDAS EM AGGREGATE FUNCTIONS,
NO SELECT, DEVEM SER INCLUÍDAS NA ORDER BY CLAUSE, NO FINAL DO STATEMENT"...
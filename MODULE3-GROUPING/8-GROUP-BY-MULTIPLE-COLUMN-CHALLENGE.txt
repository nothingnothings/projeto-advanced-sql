

ANTES DE PROSSEGUIRMOS COM A CHALLENGE,

O PROFESSOR QUER RAPIDAMENTE FALAR SOBRE 1 FUNCTION...













É A FUNCTION DE "DATE()"... --> O QUE ESSA FUNCTION 

FAZ, BASICAMENTE,



É ___ EXTRAIR _ APENAS __ A PARTE DA "DATE"



DE UMA TIMESTAMP COMPLETA..















--> ELA É EXECUTADA TIPO ASSIM:










SELECT DATE(PAYMENT_dATE) 
FROM payment;




QUER DIZER QUE ESTE FORMATO 





1922-01-01 0:00:00












FICA ASSIM:






1922-01-01 









------------------------













OK, MAS QUAL É A CHALLENGE DE HOJE?










1) WHICH EMPLOYEE HAD THE HIGHEST SALES AMOUNT 
IN A SINGLE DAY?








2) WHICH EMPLOYEE HAD THE MOST SALES IN A SINGLE DAY (
    not counting payments with amount = 0
)?







OK, DEVEMOS COMECAR...











1) WHICH EMPLOYEE HAD THE HIGHEST SALES AMOUNT 
IN A SINGLE DAY?





SELECT
staff_id,
SUM(amount) AS day_amount,
DATE(payment_date)
FROM payment 
GROUP BY staff_id, DATE(payment_date)
ORDER BY day_amount DESC;




--> a resposta é:


staff_id 2, com 


2866.42 VENDIDO NO DIA 30/04/2020.









E O OUTPUT FICOU ASSIM:



2	2866.42	"2020-04-30"
1	2736.75	"2020-04-30"
2	1505.52	"2020-03-21"
2	1455.76	"2020-03-20"
1	1433.58	"2020-03-01"
2	1408.73	"2020-04-29"
















    OK, AGORA A SEGUNDA QUERY:







2) WHICH EMPLOYEE HAD THE MOST SALES IN A SINGLE DAY (
    not counting payments with amount = 0
)?







SELECT 
staff_id,
COUNT(amount) AS sales_per_day,
DATE(payment_date) as date
FROM payment 
WHERE amount != 0
GROUP BY staff_id, date 
ORDER BY sales_per_day DESC;





--> o resultado foi O STAFF_ID 2,

com 658 sales no dia 30/04...
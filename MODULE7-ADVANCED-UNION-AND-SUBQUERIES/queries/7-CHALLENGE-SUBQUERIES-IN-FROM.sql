




NOSSA CHALLENGE É ESTA:









""WHAT IS THE AVERAGE TOTAL AMOUNT SPENT PER DAY 
(average daily revenue)"""








--> O AVERAGE DAILY REVENUE DE NOSSA COMPANHIA..






DEVEMOS TENTAR ESCREVER ESSA QUERY POR CONTA PRÓPRIA...











acho que pode ficar tipo assim:












""WHAT IS THE AVERAGE TOTAL AMOUNT SPENT PER DAY 
(average daily revenue)"""








SELECT AVG(x) FROM (



    SELECT
    EXTRACT(DOY from payment_date) as day,
    SUM(amount) AS amount_per_day
    FROM payment
    GROUP BY day


) AS result_set;














O CÓDIGO INTEIRO FICOU ASSIM:






SELECT AVG(result_set.amount_per_day) FROM (
 	SELECT
   	TO_CHAR(payment_date, 'YYYY-MM-DD') as day,
    SUM(amount) AS amount_per_day
    FROM payment
    GROUP BY day
) AS result_set;









E O RESULTADO:



"avg"
1644.3051219512195122











ou seja:









SELECT ROUND(AVG(result_set.amount_per_day), 2) FROM (
 	SELECT
   	TO_CHAR(payment_date, 'YYYY-MM-DD') as day,
    SUM(amount) AS amount_per_day
    FROM payment
    GROUP BY day
) AS result_set;







1644.31 ....









certo... acertei...









COMO FICOU A SOLUCAO DO PROFESSOR?

















----> assim:









SELECT 
SUM(amount),
DATE(payment_date)
FROM payment
GROUP BY DATE(payment_date)












DEOPIS ASSIM:







SELECT
AVG(result_set.amount_per_day)
FROM 
(
SELECT 
SUM(amount) AS amount_per_day,
DATE(payment_date)
FROM payment
GROUP BY DATE(payment_date)
) AS result_set;












certo... depois ele faz o round disso:








SELECT
ROUND(AVG(result_set.amount_per_day), 2)
FROM 
(
SELECT 
SUM(amount) AS amount_per_day,
DATE(payment_date)
FROM payment
GROUP BY DATE(payment_date)
) AS result_set;




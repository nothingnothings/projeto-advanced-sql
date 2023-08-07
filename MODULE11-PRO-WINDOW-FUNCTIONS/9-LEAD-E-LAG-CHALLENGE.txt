







ESTA CHALLENGE:






1) WRITE A QUERY THAT RETURNS THE REVENUE 

OF THE DAY (aggregate the value 
), AND THE REVENUE OF THE PREVIOUS DAY...







O FORMATO TEM DE FICAR ASSIM:




SUM         DAY             previous_day    difference
62.86       2020-01-24          null        null
563.64      2020-01-25          62.86       500.78
736.30      2020-01-26          536.64      172.66









FICOU ASSIM:












SELECT
SUM(amount) AS sum,
DATE(payment_date) AS day,
LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date)) AS previous_day,
SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date)) AS difference,
	ROUND(( SUM(amount) / LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date))) * 100, 2) - 100  AS percentage_growth
FROM payment
GROUP BY DATE(payment_date);







------------------------------------------------------





















O PRIMEIRO PASSO É AGREGAR A DATA...





--> É AGREGAR A DATA, PARA QUE CONSIGAMOS VER 

O SUM DOS AMOUNTS PARA 1 GIVEN DAY...












ex:











SELECT 
SUM(amount),
DATE(payment_date) AS day 
FROM payment 
GROUP BY DATE(payment_date);
















OK, MAS AGORA QUEREMOS PEGAR O 'PREVIOUS_VALUE",



por isso escrevemos assim:









SELECT 
SUM(amount),
DATE(payment_date) AS day,
LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS previous_day
FROM payment 
GROUP BY DATE(payment_date);















--> DEPOIS DISSO, QUEREMOS 



CONSEGUIR A DIFFERENCE 


ENTRE 1 VALUE E O OUTRO....





--> DEVEMOS SUBTRAIR 'O QUE TEMOS" 

DO 'QUE TINHAMOS ONTEM" (com o lag),


TIPO ASSIM:







SELECT 
SUM(amount),
DATE(payment_date) AS day,
LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS previous_day
SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS difference
FROM payment 
GROUP BY DATE(payment_date);













POR FIM, O PROFESSOR QUER A "PERCENTAGE GROWTH"




de 1 dia para o outro....




ex:




SELECT 
SUM(amount),
DATE(payment_date) AS day,
LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS previous_day
SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS difference,


SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) 

/ 

LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date))

FROM payment 
GROUP BY DATE(payment_date);












PEGAMOS A DIFFERENCE ("difference") 

E ENTAO DIVIDIMOS PELO 'previous_day'...










O CÓDIGO INTEIRO FICOU ASSIM:










SELECT 
SUM(amount),
DATE(payment_date) AS day,
LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS previous_day,
SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS difference,


ROUND(
(
(SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)))

/ 

LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date))) * 100, 2) AS percentage_growth

FROM payment 
GROUP BY DATE(payment_date);
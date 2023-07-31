






NOSSA CHALLENGE É:






YOU NEED TO ANALYZE THE PAYMENTS TABLE AND FIND OUT THE 
FOLLOWING:






1) WHATS THE MONTH WITH THE HIGHEST TOTAL PAYMENT AMOUNT....







2) WHATS THE DAY OF THE WEEK WITH 
THE HIGHEST TOTAL PAYMENT AMOUNT (0 is SUNDAY)...











A TABLE DE PAYMENTS TEM OS SEGUINTES FIELDS:








payment_id 
customer_id
staff_id 
amount 
payment_date
rental_id....







OK... PODEMOS COMECAR RODANDO ASSIM:









SELECT 
SUM(amount),
EXTRACT(MONTH from payment_date) AS month
FROM payment
GROUP BY EXTRACT(MONTH from payment_date)
ORDER BY SUM(amount) DESC;








O MES FOI ABRIL, CLARO....





28327.02	4
23886.56	3
9631.88	2
4824.43	1
746.62	5





















A SEGUNDA TAREFA:









2) WHATS THE DAY OF THE WEEK WITH 
THE HIGHEST TOTAL PAYMENT AMOUNT (0 is SUNDAY)...









PARA ISSO, RODAMOS:








SELECT
SUM(amount),
EXTRACT(DOW from payment_date) AS day_of_week
FROM PAYMENT 
GROUP BY EXTRACT(DOW from payment_date)
ORDER BY SUM(amount) DESC;













O RESULTADO FOI ESTE:





12796.08	4
12132.12	1
9874.57	0
9800.15	3
9278.84	2
6876.80	5










ou seja, o dia é QUINTA-FEIRA...









---------------------------------------------









TEMOS, POR FIM, UMA TERCEIRA TAREFA:










3) WHATS THE HIGHEST AMOUNT ONE CUSTOMER HAS SPENT 
IN A WEEK 

(um pouco mais difícil)...










SELECT
customer_id,
SUM(AMOUNT),
EXTRACT(WEEK FROM payment_date) AS week_number
FROM payment
GROUP BY customer_id, EXTRACT(WEEK FROM payment_date)
ORDER BY SUM(AMOUNT) DESC;








"customer_id"	"sum"	"week_number"
459	            73.88   	18
21	            72.86   	12
2	            65.88   	18
198	            65.86   	12
15	            62.87   	12
150	            62.86   	12






PARECE QUE FOI O CUSTOMER DE ID 459,


COM 73.88 dolares, 


na semana 18...






em um ano temos 52 semanas...






------------------------------------










COMO FICOU A SOLUCAO DO PROFESSOR?












--> ELE ESCREVEU ASSIM:





SELECT 
EXTRACT(MONTH from payment_date) as month_of_the_year,
SUM(amount) as total_payment_amount
FROM payment
GROUP BY month_of_the_year
ORDER BY total_payment_amount DESC;







-----------------------------------










PARA A SEGUNDA TASK,



COLOCAMOS "DOW", PQ QUEREMOS O DAY OF THE WEEK:









SELECT 
EXTRACT(DOW from payment_date) as day_of_the_week,
SUM(amount) as total_payment_amount
FROM payment
GROUP BY day_of_the_week
ORDER BY total_payment_amount DESC;




------------------------------------











POR FIM, TAMBÉM QUEREMOS SABER 


"O MAIOR VALOR GASTO POR 1 CUSTOMER, EM 1 WEEK"...







--> PARA ISSO, PRECISAMOS AGRUPAR POR 


day_of_the_week e customer_id...





EX:







SELECT 
customer_id,
EXTRACT(WEEK from payment_date) AS week,
SUM(amount) AS total_payment_amount
FROM payment 
GROUP BY week, customer_id
ORDER BY total_payment_amount DESC;












OK... ACABAMOS COM ESSA CHALLENGE...






------------------------








CERTO... MAS AQUI TEMOS 1 PROBLEMA...




SE TIVERMOS MÚLTIPLOS ANOS NA NOSSA DATABASE,






ESSE NUMBER DA WEEK SERIA NADA CONFIÁVEL,

PQ TODOS OS ANOS 

ACABARIAM 

"AGGREGATED"...


(

    nao conseguiríamos distinguir se o 
    número da week seria de 2020 ou 2019,

    por exemplo...
)









PARA CONSERTAR ISSO,

VEREMOS, NA PRÓXIMA LICAO,



1 MANEIRA DE FORMATAR 

NOSSAS DATES 


__ DE MANEIRA BEM CUSTOMIZÁVEL....






NESSA CHALLENGE, QUEREMOS COMBINAR 


MTOS DOS CONCEITOS QUE 

USAMOS NAS OUTRAS 

LESSONS...















--> É UMA CHALLENGE MAIS DIFÍCIL....













--> FOI DESCOBERTO QUE NOS DIAS 28, 29 E 30 DE ABRIL DE 2020,



HOUVE MT ALTA REVENUE...













--> QUEREMOS FOCAR APENAS NESSES 3 DIAS... --> DEVEMOS 
FILTRAR 
NOSSOS RESULTS, ACCORDINGLY,
A ESSES 

3 DIAS...















--> A CHALLENGE: DESCOBRIR "QUAL É O AVERAGE PAYMENT 
AMOUNT, GROUPED BY CUSTOMER AND DAY" ----> deve-se considerar 

APENAS 

OS DIAS/CUSTOMERS COM MAIS DE 1 PAYMENT (por customer 
e por dia)








--> ORDENE OS RESULTADOS 

PELO "AVERAGE AMOUNT",



EM 1 DESCENDING ORDER...




--> OK... É UMA CHALLENGE BEM MAIS DIFÍCIL...








SELECT
customer_id,
AVG(amount) AS average_paid,
COUNT(amount) AS num_of_payments,
DATE(payment_date)
FROM payment
WHERE DATE(payment_date) BETWEEN '2020-04-28' AND '2020-05-01'
GROUP BY customer_id, DATE(payment_date)
HAVING COUNT(amount) > 1
ORDER BY average_paid DESC;
















--> O PROFESSOR RECOMENDA QUE FACAMOS 1 ROUND DESSE AVERAGE,


E TAMBÉM DAR 1 ALIAS A ESSE AVERAGE..









FICOU TIPO ASSIM:







SELECT
customer_id,
ROUND(AVG(amount), 2) AS average_paid,
COUNT(amount) AS num_of_payments,
DATE(payment_date)
FROM payment
WHERE DATE(payment_date) BETWEEN '2020-04-28' AND '2020-05-01'
GROUP BY customer_id, DATE(payment_date)
HAVING COUNT(amount) > 1
ORDER BY average_paid DESC;



--------------------------------------









 O RESULTADO FOI:






459	10.49	2	"2020-04-29"
510	9.49	2	"2020-04-28"
443	9.49	2	"2020-04-28"
245	8.99	2	"2020-04-29"
11	8.49	2	"2020-04-30"










DEVEMOS VER A SOLUCAO, AGORA...









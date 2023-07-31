






NESSA CHALLENGE,


PEDEM:








1) YOU NEED TO SUM PAYMENTS AND GROUP IN THE 
FOLLOWING FORMATS:





a) sum the payment amount,
rename column as "total amount"...

--> you should group by DAY, 

and the format should 


be 

Fri, 24/01/2020
Fri, 14/02/2020







b) same thing,


but with 'month' as a column name,

and 
with a format 


of 


'May, 2020'....







c) same thing, 


but with a 'time' column,



and with format 


'Thu, 02:44'...














CERTO... DEVEMOS COMECAR:
















a) sum the payment amount,
rename column as "total amount"...

--> you should group by DAY, 

and the format should 


be 

Fri, 24/01/2020
Fri, 14/02/2020







SELECT
SUM(amount) as total_amount,
TO_CHAR(payment_date, 'Dy, DD/MM/YYYY') as day
FROM payment
GROUP BY day
ORDER BY total_amount DESC;







OK.... FUNCIONOU.











AGORA O SEGUNDO EXERCÍCIO...









b) same thing,


but with 'month' as a column name,

and 
with a format 


of 


'May, 2020'....







SELECT
SUM(amount) as total_amount,
TO_CHAR(payment_date, 'Mon, YYYY') as month
FROM payment
GROUP BY month
ORDER BY total_amount DESC;







------------










O exercício 3:







c) same thing, 


but with a 'time' column,



and with format 


'Thu, 02:44'...







SELECT
SUM(amount) as total_amount,
TO_CHAR(payment_date, 'Dy, HH:MM') as day
FROM payment
GROUP BY day
ORDER BY total_amount DESC;









certo... consegui os 3 exercícios...
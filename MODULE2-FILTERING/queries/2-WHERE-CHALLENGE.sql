











A CHALLENGE É ESTA:









1) HOW MANY PAYMENTS WERE MADE BY THE CUSTOMER 

WITH CUSTOMER_ID = 100;
















--> PARA ISSO, ESCREVO ASSIM:






SELECT COUNT(*) FROM payment 
WHERE CUSTOMER_ID = 100;






-----------------------









A SEGUNDA TASK É ASSIM:








2) WHAT IS THE LAST NAME OF OUR CUSTOMER
WITH FIRST NAME 'ERICA'...













ESCREVO ASSIM:




SELECT * FROM customer 
WHERE first_name='ERICA';


NOSSA CHALLENGE É ESTA:











HOW MANY MOVIES ARE THERE THAT CONTAIN THE 

'Documentary' word in the description..










PARA ISSO, ACHO QUE MINHA QUERY FICARÁ ASSIM:








SELECT
COUNT(*)
FROM film 
WHERE description LIKE '%Documentary%';















101 movies...








TEMOS UMA SEGUNDA CHALLENGE...














--> HOW MANY CUSTOMERS ARE THERE WITH A FIRST_NAME 

THAT IS 3 LETTERS LONG AND HAS EITHER AN 'X' OR 'Y'


AS THE LAST LATTER, IN THE LAST_NAME...







PARA ISSO, 

ESCREVEMOS ASSIM:



SELECT COUNT(*)
FROM CUSTOMER
WHERE first_name LIKE '___'
AND (last_name LIKE '%X' OR 
     last_name LIKE '%Y');
















     O RESULTADO FOI 3...
















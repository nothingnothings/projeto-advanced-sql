






AGORA TEMOS QUE PRATICAR O QUE APRENDEMOS 

SOBRE O WHERE E COMPARISON OPERATORS...








AS CHALLENGES SAO:








1) O INVENTORY MANAGER 

ASKS YOU HOW MANY RENTALS HAVE NOT BEEN RETURNED YET (
    return_date is NULL....
)





para isso, escrevemos:






SELECT COUNT(*)
FROM rental
WHERE return_date IS NULL;







CONSEGUI 183 rental com isso...













2) THE SALES MANAGER ASKS YOU FOR A LIST OF ALL 
THE PAYMENT_IDS WITH AN AMOUNT LESS THAN OR 
EQUAL TO 2 DOLLARES... YOU SHOULD INCLUDE 
THE PAYMENT_ID AND THE AMOUNT...




SELECT payment_id, amount FROM 
payment
WHERE AMOUNT <= 2;








FICAMOS COM 2000 IDS ROWS....






-> E CONSEGUI ESSE RESULTADO, E ORDENEI POR 

ORDER BY amount DESC:




SELECT payment_id, amount FROM 
payment
WHERE AMOUNT <= 2;










o professor ficou com estes statements:




SELECT * FROM CUSTOMER 
WHERE FIRST_NAME LIKE '___';













mas precisamos da segunda parte...






A SEGUNDA PARTE É 








SELECT * FROM CUSTOMER 
WHERE FIRST_NAME LIKE '___'
AND (LAST_NAME LIKE '%X'
OR LAST_NAME LIKE '%Y'
);








-----------------------






certo... faz sentido...









A PRIMEIRA CHALLENGE ERA ASSIM:






SELECT COUNT(*) FROM film
WHERE description LIKE '%Documentary%';
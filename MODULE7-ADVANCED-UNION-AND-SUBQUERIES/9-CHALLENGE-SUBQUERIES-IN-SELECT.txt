







A CHALLENGE É:






"""SHOW ALL THE PAYMENTS TOGETHER WITH HOW MUCH 
THE PAYMENT AMOUNT IS __bELOW__ THE 

MAXIUM PAYMENT AMOUNT"""....








(bem específico)...




-> PRECISAMOS USAR 1 SUBQUERY NO SELECT...







SELECT 
*,
(MAX(amount) - amount)  AS payment_difference
FROM payment;












--> ficou tipo assim:





SELECT 
*,
(SELECT MAX(amount) FROM payment) - amount AS difference
FROM payment;




funcionou, por alguma razao.












PROFESSOR COMECA ASSIM:












SELECT 
*,
(SELECT MAX(amount) FROM payment) - amount
FROM payment;











e isso funcionou...










MAS PODEMOS FICAR MAIS ELABORADOS DO QUE ISSO,

USANDO 

"CORRELATED SUBQUERIES"...














VEREMOS COMO ISSO FUNCIONA, E SEU PODER,


NA PRÓXIMA AULA....
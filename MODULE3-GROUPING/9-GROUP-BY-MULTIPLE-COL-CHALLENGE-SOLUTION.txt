






A SOLUCAO FICOU TIPO ASSIM:







SELECT 
staff_id,
DATE(payment_date)
SUM(amount),
COUNT(*)
FROM payment 
GROUP BY staff_id, DATE(payment_date)
ORDER BY SUM(amount) DESC;













-----> OU SEJA, USAMOS A DATE (com essa date function)


LÁ NO GROUP BY...





-------------------------------------










O STAFF_iD 2 É O VENCEDOR,



dia 30/04...














JÁ A SEGUNDA QUERY FICOU ASSIM:


SELECT 
staff_id,
DATE(payment_date)
SUM(amount),
COUNT(*)
FROM payment
WHERE amount != 0
GROUP BY staff_id, DATE(payment_date)
ORDER BY COUNT(*) DESC;




---------------------------------------



OK... 







JÁ VIMOS, NESSA CHALLENGE, QUE PODEMOS 

FILTRAR A "uNDERLYING DATA" (a data INICIAL),


USANDO A WHERE CLAUSE...













MAS O QUE ACONTECE SE __qUISERMOS -_ 

FILTRAR __ DEPOIS __dA AGGREGATE FUNCTION?










POR EXEMPLO,


"""QUEREMOS VER APENAS OS ROWS, NO OUTPUT,
EM QUE 


O _cOUNT__ É __ MAIOR __ DO QUE 300"".. --> para isso,


PRECISAMOS DA 


CLAUSE DE "hAVING",



e nao 



de 

"WHERE"...















TESTAREMOS AS FUNCTIONS DE POSITION() E CONCATENATE()...













DIGAMOS QUE TEMOS ESTA SITUACAO:








1) IN THIS CHALLENGE, YOU HAVE ONLY THE EMAIL 
AND THE LAST NAME OF THE CUSTOMERS...






NAO PODEMOS USAR NENHUMA OUTRA COLUMN, NESSA CHALLENGE...











2) YOU NEED TO EXTRACT THE FIRST NAME FROM THE EMAIL ADDRESS 
AND CONCATENATE IT WITH THE LAST NAME. It should 
BE IN THE FORMAT 
'Last name, First Name'....













FICOU TIPO ASSIM:








SELECT
CONCAT(
	last_name, ', ', LEFT(email, POSITION('.' IN email) - 1)
)
FROM customer;











CONSEGUI RETORNAR OS RESULTADOS DESEJADOS...







--> usei o '.' PARA SEPARAR O FIRST NAME DO LAST NAME,

NOS EMAILS...


















OK... MAS AGORA O PROFESSOR QUER MOSTRAR 



1 VERSAO MAIS 


UTILIZADA, QUE É A FUNCTION DE "SUBSTRING()",


QUE É MT PRÁTICA E ÚTIL...




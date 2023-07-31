









NESSA CHALLENGE,


DEVEMOS ANONIMIZE 




OS EMAIL ADDRESSES 

DE NOSSOS USERS....














--> TIPO UMA MASK...














--> PARA ISSO, QUEREMOS








1) QUE O PRIMEIRO CARACTER 


DA STRING DE EMAIL ADDRESS SEJA EXIBIDO,


SIM;
 

 ENTRETANTO,

 O RESTO DOS CARACTERES _ ANTES__ DO '@'


 DEVE SER SUBSTITUÍDO POR "*"











 CERTO....









3) OUTRA CONDICAO,


TODOS OS EMAIL ADDRESSES DEVEM ACABAR COM 

'@sakilacustomer.org'...








ok... 









ACHO QUE A QUERY VAI FICAR ASSIM:







SELECT 
CONCAT(LEFT(email, 1), '***', RIGHT(email, 19))AS masked_email
FROM customer 
WHERE RIGHT(email, 19) = '@sakilacustomer.org';
















OK.... FUNCIONOU.












OS EMAILS FICARAM COMO M***@sakilacustomer.org ...



















--. O PROFESSOR ESCREVE DE FORMA SIMILAR:










SELECT 
LEFT(email, 1) || '***' || RIGHT(email, 19) AS masked_email
FROM CUSTOMER
WHERE RIGHT(email, 19);













OK... ELE ESCREVEU EXATAMENTE COMO NÓS ESCREVEMOS....



















OK.... MAS O QUE ACONTECERIA SE TIVÉSSEMOS OUTRA 

ESTRUTURA,


DIFERENTES LENGTHS PARA OS EMAILS (
    diferentes 

    EMAIL PROVIDERS...
)








--> QUER DIZER QUE NAO PODERÍAMOS USAR LEFT()

e RIGHT(),

PRECISARÍAMOS 


DE OUTRA SOLUTION....





VEREMOS ESSA SOLUTION NA PRÓXIMA LICAO...
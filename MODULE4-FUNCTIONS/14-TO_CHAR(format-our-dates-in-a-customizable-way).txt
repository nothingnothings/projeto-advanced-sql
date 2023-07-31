





NA ÚLTIMA AULA,

VIMOS COMO PODEMOS 

__EXTRACT_ 


CERTAS PARTES 


DE 



1 COLUMN DE DATA TYPE 

DE 




DATE/TIMESTAMP,


COM A FUNCTION DE 




EXTRACT()....












tipo 






SELECT
*,
EXTRACT(month from payment_date)
FROM payment;













---------> MAS SE QUISERMOS IR ALÉM,




SE QUISERMOS 

CRIAR 


NOSSO FORMAT BEM ESPECÍFICO,





COMO POR 


EXEMPLO 




""""O ANO + A WEEK, NESSE ANO""",


dentro 

de 

1 column,




ISSO __ NAO 

É POSSÍVEL 




PURAMENTE COM A FUNCTION DE 



"EXTRACT()"...










NAO...








SE QUEREMOS MAIS CUSTOMIZACAO,






SOMOS OBRIGADOS A USAR 




A __ FUNCTION __ ESPECIAL 


DE 






"""

TO_CHAR()

"""






--------------------------------





ESSA É A FUNCTION QUE UTILIZAMOS 





PARA FAZER __GET__ DE 



FORMATOS CUSTOMIZADOS 



DE TIMESTAMP/DATE/NUMBERS...






------------------------











POR EXEMPLO, SE TEMOS A RENTAL_DATE:








rental_date 
(timestamp with TIMEZONE):









2005-05-24 23:54:33+02 









--> POR MEIO DE 'TO_CHAR()',




PODEMOS EXTRAIR UMA PARTE BEM ESPECÍFICA,

COMO 'YYYY-MM'...





PARA FICAR COM 


'2005-05'.... (no formato de TEXTO, claro)...











--> ALTERNATIVAMENTE,




PODERÍAMOS ESCREVER 



'TO_CHAR(MONTH)',


PARA 



FICAR



COM OUTPUTS 



COMO 




May
May
May
May
May




(
    mes escrito em PLAIN TEXT...
)








PERCEBA QUE O OUTPUT DE "TO_CHAR"



SEMPRE SERÁ PLAIN TEXT,


E NAO 


1 DATE...














--> MAS MAIS TARDE APRENDEREMOS QUE 

FORMATOS PODEMOS USAR,


E COMO TUDO ISSO FUNCIONA...






--------------------------








É CLARO QUE, ANTES DE MAIS NADA,



PRECISAMOS VER A SINTAXE DESSA FUNCTION...










TEMOS 2 ARGUMENTS, E A SINTAXE É ASSIM:








TO_CHAR(<DATE/INTERVAL/TIME>, <desired-format>)








DATE/INTERVAL/TIME --> COLOCAMOS NOSSA COLUMN NAME NESSE SLOT...




FORMAT --> colocamos o format desejado....














COMO EXEMPLO, PODEMOS ESCREVER ASSIM:









TO_CHAR(rental_date, 'MM-YYYY');







----------------------------------------








PODEMOS ESCREVER EXATAMENTE ASSIM...









MAIS TARDE VEREMOS COMO ISSO FUNCIONA EXATAMENTE,





mas o que interessa é que o output 


vai realmente ficar em um formato tipo 


05-2020...


-----------------------
















PARA TESTAR O "TO_CHAR()",


O PROFESSOR ESCREVE:










SELECT 
*,
EXTRACT(MONTH from PAYMENT_DATE),
TO_CHAR(PAYMENT_DATE, 'YYYY-MM')
FROM payment;










TAMBÉM PODEMOS ESCREVER NO SENTIDO INVERSO,

ASSIM:




SELECT 
*,
EXTRACT(MONTH from PAYMENT_DATE),
TO_CHAR(PAYMENT_DATE, 'MM-YYYY')
FROM payment;





------------------------------------






E ISSO VAI REALMENTE FORMATAR 




NOSSA DATE, nesse formato específico...








TAMBÉM PODERÍAMOS 


ESCREVER ASSIM:

'MM/YYYY'







------------------








OK, MAS COMO ISSO FUNCIONA, E O QUE PODEMOS ESCOLHER?












--> PODEMOS ESCOLHER "Day" em vez de 


"YYYY-MM",

para entao conseguirmos o 

WEEK DAY...





ex:




SELECT
*,
EXTRACT(MONTH from payment_date),
TO_CHAR(payment_date, 'Day')
FROM payment;










RESULTADO:






"to_char"
"Friday   "
"Saturday "
"Tuesday  "
"Wednesday"
"Wednesday"




---------








TEMOS MTOS FORMATOS DIFERENTES 



DE TO_CHAR()









SAO VISTOS NESSA URL:





https://www.postgresql.org/docs/current/functions-formatting.html







--------------








a function de "to_char()" 



é a mais importante...












to_date() TAMBÉM é importante,

é usada para CRIAR

1 date 

a partir 


de 

text...












TO_CHAR() ....











TO_CHAR() --> TEM MTOS PATTERNS DIFERENTES....







PODEMOS USAR TAMBÉM APENAS OS 2 ÚLTIMOS DIGITOS...









(com 'YY')...






--> PODEMOS USAR 




OS PATTERNS MOSTRADOS NAQUELE SITE,


OU ENTAO 


USAR PATTERNS 

CRIADOS POR NÓS MESMOS,


TIPO ASSIM:


























































ex:




SELECT
*,
EXTRACT(MONTH from payment_date),
TO_CHAR(payment_date, 'Day Month YYYY')
FROM payment;










COM ISSO, 



NOSSO TEXT FICA ASSIM:





Friday January 2020 
Saturday January 2020













COM O USO DE "TO_CHAR()",

FICAMOS COM GRANDE LIBERDADE 



EM RELACAO À FORMATACAO 




DE NOSSAS DATES (que ficam como TEXTO)..








E
 TAMBÉM PODEMOS FAZER GROUP BY 



 EM CIMA DESSA DATE..











 EX:





 SELECT 
 SUM(amount),
 TO_CHAR(payment_date, 'Dy, Month YYYY'')
 FROM payment 
 GROUP BY TO_CHAR(payment_date, 'Dy, Month YYYY');














 OK... É ASSIM QUE PODEMOS TRABALHAR COM NOSSOS CUSTOM 

 FORMATS, usando o TO_CHAR()....



 

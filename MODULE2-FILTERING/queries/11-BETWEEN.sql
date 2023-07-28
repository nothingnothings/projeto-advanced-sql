







AGORA SEU MANAGER ESTÁ PEDINDO POR 

1 

LISTA DE 

PAYMENTS 




EM QUE 





OS 




PAYMENT IDS 

FIQUEM 

ENTRE 

17000 E 18000...









---> PARA ISSO, TEMOS 2 OPTIONS:







1) construir 1 

query com 


WHERE XXX AND YYY (com esses ids sendo maiores do que x e MENORES do que y),










2) USAR BETWEEN XXX AND YYYY (mais simples e efetivo)..















--> PARA ISSO, ACHO QUE ESCREVEREMOS ASSIM:









SELECT * FROM payment 
WHERE payment_id BETWEEN 17000 AND 18000;













A VERSAO COM WHERE E AND FICA ASSIM:










SELECT * FROM payment 
WHERE PAYMENT_ID >= 17000 AND PAYMENT_ID <= 18000;








ESSA MANEIRA TAMBÉM FUNCIONA,

MAS A VERSAO 


COM BETWEEN AND 


É 

BEM MAIS ELEGANTE...

















--> PERCEBA QUE "BETWEEN" INCLUI O VALUE X E O VALUE Y,







tipo assim:









SELECT 
payment_id,
payment_date
FROM payment 
WHERE amount BETWEEN 1 AND 2;












--> ISSO VAI INCLUIR O 1 E O 2, NO CASO....










-_> PODEMOS USAR TAMBÉM 


"NOT BETWEEN X AND Y"...







--> ISSO VAI SELECIONAR _ TODOS OS VALUES 

EXCETO 
OS VALUES ESPECIFICADOS NESSA RANGE..















---_> MAS O QUE ACONTECE SE QUISERMOS 

FILTRAR 


POR 

"DATE"?














ISSO FUNCIONA COM BETWEEN AND,

SIM,






E O FORMATO É TIPO ASSIM:











SELECT payment_id,
amount 
FROM payment 
WHERE amount BETWEEN '2020-01-24' AND '2020-01-26';
















CERTO, MAS TENHA EM MENTE QUE O FORMATO DE DATE 

É 


'YYYY-MM-DD';














QUER DIZER QUE PODEMOS FILTRAR 

TANTO DAYS COMO 


TIMESTAMPS...











DETALHE -> SE COMPARARMOS 



TIMESTAMPS,






E SE TIVERMOS SÓ 1 DATE ESCRITA,




ESSA DATE VAI SER CONVERTIDA 


COMO 


"2020-01-24 0:00:00'












TIPO ASSIM:






SELECT payment_id,
amount 
FROM payment 
WHERE amount BETWEEN '2020-01-24 0:00:00' AND '2020-01-26 0:00:00';
















ISSO QUER DIZER QUE O DIA '26' inteiro (
    depois 
    da meia-noite
) NAO SERÁ CONTABILIZADO...







SE QUISERMOS QUE O DIA INTEIRO DE "26" SEJA CONTABILIZADO,

PRECISAMOS COLOCAR O END-DATE COMO "27",


E NAO 26...








--> alternativamente, podemos colocar 


1 HORA, COMO 

''2020-01-26 12:00:00..



















-> BEM AGORA QUEREMOS 





VER 1 EXEMPLO PRÁTICO...











--> QUEREMOS FILTRAR TODOS OS RENTALS 


QUE EXISTAM 





DESDE 24 ATÉ 26 DE MAIO...





POR ISSO ESCREVO ASSIM:









SELECT * FROM rental 
WHERE rental_date BETWEEN '2005-05-24' AND '2005-05-27'
ORDER BY rental_date DESC;











DEVEMOS PRÁTICAR ISSO, NA PRÓXIMA CHALLENGE...

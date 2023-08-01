






NESSA LECTURE, QUEREMOS MENCIONAR 

ALGUMAS DAS COISAS INTERESSANTES 

SOBRE TIMESTAMPS E INTERVALS....














--> PODEMOS RODAR COISAS COMO:








SELECT CURRENT_DATE; -- isso nos dará a CURRENT DATE da database.







SELECT CURRENT_TIMESTAMP -- isso nos dará o timestamp da database...
















CERTO... ISSO FUNCIONA...














OK... MAS DIGAMOS QUE QUEIRAMOS 


SUBTRAIR


A "RENTAL_DATE" (esse value)





DO VALUE DE NOSSA CURRENT_TIMESTAMP...











--> PARA ISSO, RODARÍAMOS ASSIM:








SELECT 
CURRENT_TIMESTAMP,
CURRENT_TIMESTAMP - RENTAL_DATE
FROM RENTAL;












O RESULTADO DISSO FOI:


"6642 days 15:46:40.429275"








--> ISSO É UM __INTERVAL__... --> É 

O DATA TYPE DE "INTERVAL"...









-------> INTERVAL... --> PODEMOS O UTILIZAR 



EM FUNCTIONS COMO "EXTRACT()"






E 




"TO_CHAR()"....









------------






PODEMOS SUBTRAIR A RENTAL_DATE


DA "RETURN_DATE"



DESSA TABLE, TIPO ASSIM:








SELECT 
RETURN_DATE - RENTAL_DATE 
FROM RENTAL;










ISSO NOS DARÁ _ o INTERVALO DE TEMPO 

QUE 

CADA 


CUSTOMER TEM PARA 


ENTREGAR CADA MOVIE...






EX:








"7 days 23:09:00"








"?column?"
"3 days 20:46:00"
"7 days 23:09:00"
"9 days 02:39:00"
"8 days 05:28:00"
"2 days 02:24:00"
"4 days 21:23:00"
"3 days 00:02:00"
"3 days 00:22:00"
"6 days 22:42:00"
"8 days 20:47:00"
"5 days 05:25:00"















--> PODEMOS EXTRAIR APENAS OS DIAS, POR EXEMPLO,



COM EXTRACT:












SELECT 
EXTRACT(DAY FROM RETURN_DATE)  - EXTRACT(DAY FROM RENTAL_DATE)
FROM RENTAL;













e isso nos dá este resultado:









"?column?"
4
-24
-22
-23
2
4
3
3
6
-23
5
5
1
-22
1
2
6
6
2
1
1
4
2
2
6
5
1
5
5
5
1
2
4
2
4
4
-24
6
3
-23
6
1
4
-23
-23
5
-23
5



















--> PODEMOS EXTRAIR AS HOURS, TAMBÉM...








SELECT 
EXTRACT(HOUR FROM RETURN_DATE)  - EXTRACT(DAY FROM RENTAL_DATE)
FROM RENTAL;


-------------------





SE DESEJAMOS 



TER O NÚMERO TOTAL DE HORAS, EM VEZ DISSO,









DEVEMOS EXTRAIR O NÚMERO 




DE DIAS E AÍ __ MULTIPLICAR 


POR 24 (cada dia é 24 horas),


TIPO ASSIM:









SELECT 
EXTRACT(DAY from RETURN_DATE - RENTAL_DATE) * 24
+
EXTRACT(HOUR FROM RETURN_DATE - RENTAL_DATE)
FROM RENTAL;














COM ISSO, TEREMOS O TOTAL DE HORAS 



ENTRE O DIA DA LOCACAO E O DIA 

DO RETORNO...








---> E PODEMOS CONCATENAR ESSE 

VALUE COM 
' hours',



PARA FICARMOS COM 


ESTE OUTPUT BONITO:










SELECT 
EXTRACT(DAY from RETURN_DATE - RENTAL_DATE) * 24
+
EXTRACT(HOUR FROM RETURN_DATE - RENTAL_DATE) || ' hours'
FROM RENTAL;









"?column?"
"92 hours"
"191 hours"
"218 hours"
"197 hours"
"50 hours"
"117 hours"
"72 hours"
"72 hours"
"166 hours"
"212 hours"
"125 hours"
"124 hours"
"26 hours"
"218 hours"
"27 hours"
"47 hours"
"149 hours"
"148 hours"
"48 hours"





-------------------------------






COM ISSO, TUDO SERÁ CONCATENADO 


E TRANSFORMADO EM "TEXT"... 


(
    ANTES ERA NUMERIC...
)



---------------------







PODEMOS FAZER A MESMA COISA COM 

"TO_CHAR()",


MANIPULAR ESSE OUTPUT (interval)

E TRANSFORMÁ-LO EM TEXT....










MAS O TO_CHAR() 


TAMBÉM 


NAO 




POSSUI MUITAS OPCOES 

COM INTERVALS...






----------------------------------------










O MAIS ÚTIL, COM INTERVALS,

É "EXTRACT()",


que nos deixa extrair values específicos 

deles (dates, hours, minutes)















NESSA LICAO, QUEREMOS FALAR SOBRE DATES E TIMESTAMPS,



E SOBRE COMO PODEMOS TRABALHAR COM ELAS...










PARA ISSO, PARA COMEÇARMOS,

O PROFESSOR SELECIONA TUDO DA TABLE DE "RENTALS"....













SELECT * FROM rental;










--> agora nosso manager pede que ANALISEMOS __ rENTALS...









--> TEMOS O FIELD DE "RENTAL_dATE"...







é um TIMESTAMP COM TIMEZONE...












--> AGORA DEVEMOS ANALISAR "QUANTOS RENTALS TIVEMOS 

EM CADA MES"..









--> OU, ENTAO,



ANALISAR "EM QUE HORA DO DIA TEMOS MAIS RENTALS"...












--> PARA CONSEGUIRMOS ANALISAR TUDO ISSO,





PRECISAMOS SER CAPAZES DE TRABALHAR COM 


TIMESTAMPS E DATES,



EM PARTICULAR
 

 PRECISAMOS SER CAPAZES DE __ EXTRAIR _ CERTOS 

 COMPONENTS/PARTES DE 



1 TIMESTAMP OU DATE...










--> É POR ISSO QUE NESSA LECTURE FALAREMOS DE:





1) DATES 


2) TIMESTAMPS 




3) EM PARTICULAR,


A FUNCTION DE "EXTRACT"...










--> ESSA FUNCTION É USADA 

PARA __ fAZER EXTRACT_ _ 

DE CERTAS 


PARTES 



DE TIMESTAMPS/DATES...








EM CERTOS CASOS,



ESSA FUNCTION TAMBÉM FAZ EXTRACT __ DE INTERVALS,






ALGO QUE VEREMOS EM BREVE...












POR EXEMPLO, TEMOS ESTES RENTAL_DATE:





2005-05-24 23:54:33+02 







--> ou seja, ele ESTÁ COM 




1 TIMESTAMP....









--> SE GOSTARÍAMOS DE 


EXTRAIR __ APENAS A 'DATE' DESSE TIMESTAMP,



PODERIAMOS RODAR 



DATE(rental_date)...











--> MAS SE DESEJAMOS __ EXTRAIR ____ APENAS O dia 
do mês DESSE TIMESTAMP,

APENAS ISSO,


DEVEMOS USAR ESSA FUNCTION ESPECIAL,



"EXTRACT()"...




















--> APLICAMOS A FUNCTION DE EXTRACT,



DA MANEIRA CORRETA,




PEDINDO O "DAY OF THE MONTH" 



DESSE RENTAL_dATE 


(

    no nosso caso,

    é retornado '24', o dia do mes...
)












-------> MAS ESSA FUNCTION DE "EXTRACT()"



TAMBÉM NOS DEIXA 

EXTRAIR DIFERENTES PARTES,


COMO OS SEGUNDOS.....










MAS ANTES DE FALARMOS EM MAIS DETALHES SOBRE 



COMO ESSA FUNCTION FUNCIONA,



QUEREMOS 

TER 

1 

BRIEF OVERVIEW 








DOS DIFERENTES 

DATA TYPES QUE 

EXISTEM PARA O DATA TYPE DE "DATE"...




------------------------------------------------------









CERTO, SAO ELES:





                                              YYYY-MM-DD
1) DATE ---> ''JUST DATE, WITHOUT TIME'' --> '2022-11-28'




2) TIME (WITH/WITHOUT TIME ZONE) ---> JUST TIME, WITHOUT DATE --> '01:02:03.678' (without timezone)...
                                                                  '01:02:03.678+02' (WITH timezone)....
                                                                                    PLUS 2 HOURS, UTC.
                                                                                                

3) TIMESTAMP (WITH/WITHOUT TIMEZONE) ---> DATE AND TIME (combination) --> '2022-11-28 01:02:03.678+02';


4) INTERVALS ------------> TIME INTERVALS ----------------------------> '01:02:03.678';







INTERVALS --> É BASICAMENTE 1 DIFFERENCE ENTRE 2 DATES...







--> OK, MAS AGORA DEVEMOS VER COMO FUNCIONA ESSA FUNCTION 

DE EXTRACT...





SUA SINTAXE É A SEGUINTE:








EXTRACT(<FIELD> FROM <DATE/TIME/INTERVAL>)






FIELD --> É DAY/MONTH/YEAR, coisas assim....




<DATE/TIME/INTERVAL> --> COLOCAMOS O NOME DA COLUMN ALI... (rental_date, por exemplo)..


(é a column de onde queremos fazer "extract" from)...






---------------------------------







O PROFESSOR ENTAO TEM 1 SLIDE COM 1 OVERVIEW 



DE TODOS 


DATE/TIME/INTERVAL/SECOND/xxxx


POSSÍVEIS...









SAO MTAS PARTS DIFERENTES...






SAO ELAS:



1) CENTURY 


2) DAY 


3) DECADE 


4) DOW (day of week) -- 0 sunday, 6 saturday.

5) DOY (day of year)


6) EPOCH (number of seconds since 1970-01-01 00:00:00 UTC)



7) HOUR  (0-23)


8) ISODOW  (day of the week based on ISO 8601) - Monday(1) SUNDAY (7)



9) ISOYEAR -----_> ISO 8601 week number of year...





10) MICROSECONDS --> seconds field, including fractional parts, multiplied by 10000000

11) MILLENIUM 



12) MILLISECONDS 



13) MINUTE 


14) MONTH 



15) QUARTER (of year)



16) SECOND 



17) TIMEZONE (TIMEZONE OFFSET FROM UTC, measured in seconds)


18) TIMEZONE_HOUR (hour component of time zone offset)


19) TIMEZONE_MINUTE (minute component of time zone offset)


20) WEEK -- number of ISO 8601 week-numbering week of year 


21) YEAR









-----------------------------------







MAIS IMPORTANTES SAO:






1) DAY 

2) DOW 


3) DOY 


4) HOUR 


5) MONTH 


6) QUARTER 



7) WEEK 


8) YEAR 













-------> THEY ARE USEFUL WHEN CREATING NEW TABLES...








--------------------------------------------------











CHEGA DE TEORIA, DEVEMOS VER ALGUNS EXEMPLOS,


COM O RENTAL_DATE....



--------------------------------












NO NOSSO EXEMPLO, QUEREMOS SABER 


"EM QUE DIA DO MES TEMOS MAIS SALES"...











--> PARA ISSO, 

PODEMOS USAR "COUNT(*)" 


JUNTO COM 1 AGGREGATE FUNCTION, E JUNTO COM rental_date...





temos os seguintes fields:



1) RENTAL_ID 


2) RENTAL_DATE 



3) INVENTORY_ID 


4) CUSTOMER_ID 


5) RETURN_dATE 


6) STAFF_ID 


7) LAST_UPDATE..





USAREMOS "RENTAL_DATE" 


E "*"  (no count)....











--> ACHO QUE A QUERY PODERIA FICAR ASSIM:












SELECT COUNT(*),
EXTRACT('MONTH' FROM rental_date) AS month_of_the_year
FROM rental
GROUP BY month_of_the_year
ORDER BY COUNT(*) DESC;











COM ISSO, É POSSÍVEL PERCEBER QUE JULHO É 

O MES COM O MAIOR NÚMERO DE SALES,






TIPO ASSIM:







6688	7
5707	8
2311	6
1156	5
182	    2




















COM O NEGÓCIO FORMATADO, FICOU ASSIM:











SELECT COUNT(*),
EXTRACT('MONTH' FROM rental_date) AS month_of_the_year,
CASE 
	WHEN EXTRACT('MONTH' FROM rental_date) = 2 THEN 'February'
	WHEN EXTRACT('MONTH' FROM rental_date) = 5 THEN 'May'
	WHEN EXTRACT('MONTH' FROM rental_date) = 6 THEN 'June'
	WHEN EXTRACT('MONTH' FROM rental_date) = 7 THEN 'July'
	WHEN EXTRACT('MONTH' FROM rental_date) = 8 THEN 'August'
END AS month_of_the_year
FROM rental
GROUP BY EXTRACT('MONTH' FROM rental_date)
ORDER BY COUNT(*) DESC;




















--> É CLARO QUE AINDA PODEMOS FORMATTAR ESSE OUTPUT,


COLOCAR OS NOMES DOS MESES,

EM VEZ DE NÚMEROS...




-_> PARA ISSO, PRECISAMOS DE "CASE WHEN", é claro....










--> poderia ficar tipo assim:














CERTO.... QUER DIZER QUE 




A ESCRITA É REALMENTE 



EXTRACT(<month> from COL_NAME )

























--> OBS::: É UMA BEST PRACTICE 


COLOCAR "from" 


COM LETRAS MINÚSCULAS,


DENTRO DO "EXTRACT()",


justamente PARA 



DISTINGUIR 




O FROM DE DENTRO DA FUNCTION de "extract()"



do FROM usado 


com o select comum...








--> certo..









MAS O PROFESSOR RODOU 



O EXTRACT COM O EXTRACT DE "DAY",

E
 NAO 


 DATE...














OK... UM MONTE DE COISAS NOVAS...




DEVEMOS PRATICAR ESSA FUNCTION DE "EXTRACT",

NA PRÓXIMA CHALLENGE...


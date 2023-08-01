






AGORA OLHAREMOS ALGUNS EXEMPLOS PRÁTICOS 


DO 


CASE WHEN statement...














--> VAMOS NA DATABASE DAS FLIGHTS...








--> ABRIMOS A QUERY TOOL NELA...










--> TABLE DE FLIGHTS...











SELECT * FROM flights...

"flight_id"	"flight_no"	"scheduled_departure"	"scheduled_arrival"	"departure_airport"
3979	"PG0052"	"2017-08-25 08:50:00-03"	"2017-08-25 11:35:00-03"	"VKO"











--> PODEMOS CALCULAR "QUANTO CADA FLIGHT FOI DELAYED"...

















-> BASTA RODAR ASSIM:











SELECT 
actual_departure - scheduled_departure
FROM flights;














--> ISSO VAI NOS DAR INTERVALS,

SE EXISTIREM 



ESSAS DISCREPANCIAS....










--> O INTERVALO SERÁ HH:MM:SS







TIPO ASSIM:







SELECT 
actual_departure - scheduled_departure
FROM flights;













OK... MAS O QUE QUEREMOS FAZER,

AGORA, 

É 


CRIAR """"BUCKETS"""" (use-case MT COMUM de case statements)





DIZENDO 

""QUANTO TEMPO NOSSOS FLIGHTS FORAM DELAYED""..















-> PARA ISSO, ESCREVEMOS ASSIM:





SELECT 
actual_departure - scheduled_departure AS delay,
CASE 
    WHEN EXTRACT(MINUTES FROM (actual_departure - scheduled_departure)) < 3 THEN 'small delay'
    WHEN EXTRACT(MINUTES FROM (actual_departure - scheduled_departure)) >= 3 AND EXTRACT(MINUTES FROM (actual_departure - scheduled_departure)) < 4 THEN 'medium delay'
    WHEN EXTRACT(MINUTES FROM (actual_departure - scheduled_departure)) >= 4 AND EXTRACT(MINUTES FROM (actual_departure - scheduled_departure)) < 5  THEN 'high delay'
	WHEN EXTRACT(MINUTES FROM (actual_departure - scheduled_departure)) = 0 OR EXTRACT(MINUTES FROM (actual_departure - scheduled_departure)) IS NULL THEN 'no delay'
    ELSE 'extreme delay'
END 
FROM flights
ORDER BY delay;











agora essa query está correta...









mas ela considera mt os minutos, o que pode nao fazer sentido...














A QUERY DO PROFESSOR, POR SUA VEZ, FOI FICANDO ASSIM:














SELECT 
CASE 
WHEN actual_departure - scheduled_departure < '00:05:00' THEN 'On time',
END 
FROM flights;













OK... "QUANDO O INTERVAL/DELAY FOR MENOR DO QUE 5 MINUTOS",



QUEREMOS QUE A STRING FIQUE COMO "On time"....











COM ISSO, FICAREMOS COM ESSA 

COLUMN PREENCHIDA COM "NULL" e "On time"..






ficamos com null pq 

nao colocamos nenhuma else condition...







podemos colocar 

um else de 'Late',

TIPO ASSIM:








SELECT 
CASE 
    WHEN actual_departure - scheduled_departure < '00:05:00' THEN 'On time'
    ELSE 'Late flight'
END 
FROM flights;













--> PODEMOS COLOCAR UMA OUTRA CONDITION, QUE VENHA ANTES...





--> condition de "nao há departure_time" -------- SE 


ISSO ACONTECER, PODEMOS DEFINIR 


"No departure time",



TIPO ASSIM:








SELECT 
CASE 
    WHEN actual_departure IS NULL THEN 'No departure time'
    WHEN actual_departure - scheduled_departure < '00:05:00' THEN 'On time'
    ELSE 'Late flight'
END 
FROM flights;



--------------------------------














POR FIM, O PROFESSOR NOS EXPLICA QUE É AQUI QUE PODEMOS


DEFINIR "BUCKETS" PARA NOSSAS CONDITIONS...












--> DIGAMOS QUE QUEREMOS ESPECIFICAR 



"QUAO TARDE FOI O VOO",






tipo assim:









WHEN actual_departure IS NULL THEN 'No departure time'
WHEN actual_departure - scheduled_departure < '00:05:00' THEN 'On time'
WHEN actual_departure - scheduled_departure < '01:00:00' AND  THEN 'A little bit late'
ELSE 'Very late'











--> COM ISSO, DEFINIMOS TIPO 1 BUCKET...





--> condicoes:

--> 1) caso estejamos com menos de 5 minutos de atraso,
estamos "on time"...










--> 2) caso estejamos com MAIS DO QUE 5 MINUTOS DE 
ATRASO, MAS COM MENOS DE 1 HORA DE ATRASO, ESTAMOS 1 POUCO ATRASADOS...






--> 3) CASO estejamos COM QUALQUER OUTRA QUANTIA (
    mais de 1 hora de atraso
), 

FICAMOS COM 'Very late'....









QUERY COMPLETA:







SELECT 
CASE 
    WHEN actual_departure IS NULL THEN 'No departure time'
    WHEN actual_departure - scheduled_departure < '00:05:00' THEN 'On time'
    WHEN actual_departure - scheduled_departure < '01:00:00' THEN 'A little bit late'
    ELSE 'Very late'
END 
FROM flights;



















OK... ISSO FUNCIONOU...









MAS UMA COISA QUE DEIXA ESSE CASE STATEMENT __sUPER _ PODEROSO____ 






É QUE __ PODEMOS __ JUSTAMENTE___ AGRUPAR __ (group by)



POR ESSE STATEMENT AÍ...












FAZEMOS ISSO TIPO ASSIM:












SELECT
COUNT(*),

CASE 
    WHEN actual_departure IS NULL THEN 'No departure time'
    WHEN actual_departure - scheduled_departure < '00:05:00' THEN 'On time'
    WHEN actual_departure - scheduled_departure < '01:00:00' THEN 'A little bit late'
    ELSE 'Very late'
END 
FROM flights;














depois colocamos 1 ALIAS PARA NOSSO CASE,

TIPO ASSIM:

'is_late' (Essa flag)...



EX:






SELECT
COUNT(*),
CASE 
    WHEN actual_departure IS NULL THEN 'No departure time'
    WHEN actual_departure - scheduled_departure < '00:05:00' THEN 'On time'
    WHEN actual_departure - scheduled_departure < '01:00:00' THEN 'A little bit late'
    ELSE 'Very late'
END AS is_late
FROM flights
GROUP BY is_late;











--> PODEMOS USAR ESSE ALIAS,


PARA AÍ 





POSSUIRMOS O EXATO __ COUNT__ DE 

"QUANTOS FLIGHTS ESTAO LATE,

QUANTOS FLIGHTS ESTAO A LITTLE BIT LATE,

E QUANTOS FLIGHTS TEM NO DEPARTURE TIME"...




EX:




"count"	"is_late"
800	        "Very late"
16348	"No departure time"
13063	"On time"
2910	"A little bit late"














COM ISSO, CRIAMOS NOSSAS PRÓPRIAS CATEGORIAS/NOSSOS 

PRÓPRIOS BUCKETS,



O QUE 

DEIXA O GET 

DE DATA, DE NOSSA REAL DATA,

BEM MAIS FÁCIL...
















--> AGORA É HORA DE PRATICARMOS ESSE CONHECIMENTO TUDO...
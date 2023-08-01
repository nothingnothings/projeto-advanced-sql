









OK... TEMOS UMA CHALLENGE SOBRE O CASE STATEMENT....










--> 3 CHALLENGES...






1) YOU NEED TO FIND OUT HOW MANY TICKETS 

YOU HAVE SOLD IN THE FOLLOWING CATEGORIES:



a) LOW PRICE TICKET --> total_amount < 20.000




b) MID PRICE TICKET --> total_amount between 20.000 and 150.000




c) HIGH PRICE TICKET --> total_amount >= 150.000









A PERGUNTA é


""HOW MANY HIGH PRICE TICKETS HAS THE COMPANY SOLD?""









PODEMOS ESCREVER ASSIM:





SELECT 
COUNT(amount),
    CASE 
        WHEN amount < 20000 THEN 'Low Price ticket'
        WHEN amount BETWEEN 20000 AND 150000 THEN 'Mid price ticket'
        WHEN amount >= 150000 THEN 'High price ticket'
    END as ticket_grade
FROM ticket_flights
GROUP BY ticket_grade
ORDER BY COUNT(amount);






EX:










SELECT 
COUNT(amount),
    CASE 
        WHEN amount < 20000 THEN 'Low Price ticket'
        WHEN amount BETWEEN 20000 AND 150000 THEN 'Mid price ticket'
        WHEN amount >= 150000 THEN 'High price ticket'
    END as ticket_grade
FROM ticket_flights
GROUP BY ticket_grade
ORDER BY COUNT(amount) DESC;










OK... DEU CERTO...




O OUTPUT FICOU ASSIM:







"count"	"ticket_grade"
748881	"Low Price ticket"
289831	"Mid price ticket"
7014	"High price ticket"




--------------------------


E FICOU ERRADO, POR ALGUMA RAZAO....








--> foi a TABLE errada...



--> usei 'ticket_flights',



quando deveria ser OUTRA TABLE..







--> talvez "bookings":






SELECT 
COUNT(amount),
    CASE 
        WHEN total_amount < 20000 THEN 'Low Price ticket'
        WHEN total_amount BETWEEN 20000 AND 150000 THEN 'Mid price ticket'
        WHEN total_amount >= 150000 THEN 'High price ticket'
    END as booking_grade
FROM bookings
GROUP BY booking_grade
ORDER BY COUNT(amount) DESC;









OK... AGORA FUNCIONOU...








FICOU ASSIM:





"count"	"booking_grade"
205054	"Mid price ticket"
29994	"High price ticket"
27740	"Low Price ticket"











------------------------------







QUAL É A SEGUNDA CHALLENGE....













2) YOU NEED TO FIND OUT HOW MANY 

FLIGHTS HAVE DEPARTED IN THE FOLLOWING SEASONS:






A) WINTER
    (december, january, february)




B) SPRING 
    (MARCH, APRIL, MAY)




C) SUMMER 
    (JUNE, JULY, AUGUST)



D) FALL 
    (SEPTEMBER, OCTOBER, NOVEMBER)








        PARA ISSO,


        ESCREVO UMA QUERY ASSIM:







        SELECT
        COUNT(*) as departures,
        CASE 
            WHEN EXTRACT(MONTH, actual_departure) = 12 OR EXTRACT(MONTH, actual_departure) = 1 OR EXTRACT(MONTH, actual_departure) = 2 THEN 'Winter'
            WHEN EXTRACT(MONTH, actual_departure) BETWEEN 3 AND 5 THEN 'Spring'
            WHEN EXTRACT(MONTH, actual_departure) BETWEEN 6 AND 8 THEN 'Summer'
            WHEN EXTRACT(MONTH, actual_departure) BETWEEN 9 AND 11 THEN 'Fall'
        END AS season
        FROM flights
        GROUP BY season
        ORDER BY departures;














MAS ESTÁ ERRADA, E A VERSAO CORRETA FICOU ASSIM:










   SELECT
        COUNT(*) as departures,
        CASE 
            WHEN EXTRACT(MONTH from scheduled_departure) = 12 OR EXTRACT(MONTH from scheduled_departure) = 1 OR EXTRACT(MONTH from scheduled_departure) = 2 THEN 'Winter'
            WHEN EXTRACT(MONTH from scheduled_departure) BETWEEN 3 AND 5 THEN 'Spring'
            WHEN EXTRACT(MONTH from scheduled_departure) BETWEEN 6 AND 8 THEN 'Summer'
            WHEN EXTRACT(MONTH from scheduled_departure) BETWEEN 9 AND 11 THEN 'Fall'
        END AS season
        FROM flights
        GROUP BY season
        ORDER BY departures;







ISSO ME DEU O OUTPUT CORRETO:






"departures"	"season"
7585	"Fall"
25536	"Summer"







------------------------












AGORA TEMOS A ÚLTIMA CHALLENGE...













--> CRIE 1 TIER LIST DE MOVIES (movie database)...








CRIE 1 LISTA EM QUE:






1) TIER 1 --> FILMES EM QUE A RATING É 'PG' OU 'PG-13',

OU EM QUE A DURACAO DO FILME É MAIS DO QUE 210 MINUTOS...




Coloque o identificador 

'Great rating or long (tier 1)' 







2) Description contains 'Drama' and length 
is more than 90min



Coloque o identificador 'Long Drama (tier 2)'






3) Description contains 'Drama' and length
is not more than 90min 


'Short drama (tier 3)'






4) Rental_rate less than $1 




'Very cheap (tier 4)'









--> IF ONE MOVIE CAN BE IN MULTIPLE CATEGORIES,
IT GETS THE HIGHER TIER ASSIGNED...







OK... É UMA QUERY BEM LONGA... vários conceitos...











-- E TEMOS UMA CHALLENGE FINAL -->


'HOW CAN YOU FILTER SO THAT ONLY 

MOVIES THAT CAN BE INSERTED INTO THOSE CATEGORIES APPEAR 


IN THE RESULT SET (Rest of movies EXCLUDED)'...















-- OK... PODEMOS COMECAR ASSIM:








1) TIER 1 --> FILMES EM QUE A RATING É 'PG' OU 'PG-13',

OU EM QUE A DURACAO DO FILME É MAIS DO QUE 210 MINUTOS...




Coloque o identificador 

'Great rating or long (tier 1)' 












--> nossos fields sao estes:


"film_id"	
"title"	
"description"
	"release_year"
	"language_id"	
    "original_language_id"	
    "rental_duration"
    	"rental_rate"
        	"length"
            	"replacement_cost"
                	"rating"
                    	"last_update"
                        	"special_features"
                            	"fulltext"










SELECT
*,
CASE
    WHEN rating = 'PG' OR rating = 'PG-13' OR length > 210 THEN 'Great rating or long (tier 1)'
    WHEN description LIKE '%Drama%' AND length > 90 THEN 'Long drama (tier 2)'
    WHEN description LIKE '%Drama%' AND length < 90 THEN 'Short drama (tier 3)'
    WHEN rental_rate < 1 THEN 'very cheap (tier 4)'
    ELSE NULL
END as movie_tier
FROM film
WHERE movie_tier != NULL;















--> O ÚNICO PROBLEMA É RESOLVER 



O ÚLTIMO PEDIDO,


DE 



FILTRAR POR TODOS OS 

FILMS QUE 


NAO SE ENCAIXEM NESSES 4 CASES...










PARA ISSO, O CHATGPT 

SUGERE 1 

SUBQUERY:







SELECT *
FROM (
    SELECT
        *,
        CASE
            WHEN rating = 'PG' OR rating = 'PG-13' OR length > 210 THEN 'Great rating or long (tier 1)'
            WHEN description LIKE '%Drama%' AND length > 90 THEN 'Long drama (tier 2)'
            WHEN description LIKE '%Drama%' AND length < 90 THEN 'Short drama (tier 3)'
            WHEN rental_rate < 1 THEN 'very cheap (tier 4)'
        END as movie_tier
    FROM film
) AS subquery
WHERE movie_tier IS NOT NULL
ORDER BY movie_tier;













--> FUNCIONOU...






O RESULTADO FICOU ASSIM:



"film_id"	"title"	"description"	"release_year"	"language_id"	"original_language_id"	"rental_duration"	"rental_rate"	"length"	"replacement_cost"	"rating"	"last_update"	"special_features"	"fulltext"	"movie_tier"
1	"ACADEMY DINOSAUR"	"A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies"	2006	1		6	0.99	86	20.99	"PG"	"2020-09-10 18:46:03.905795+02"	"{""Deleted Scenes"",""Behind the Scenes""}"	"'academi':1 'battl':15 'canadian':20 'dinosaur':2 'drama':5 'epic':4 'feminist':8 'mad':11 'must':14 'rocki':21 'scientist':12 'teacher':17"	"Great rating or long (tier 1)"
6	"AGENT TRUMAN"	"A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China"	2006	1		3	2.99	169	17.99	"PG"	"2020-09-10 18:46:03.905795+02"	"{""Deleted Scenes""}"	"'agent':1 'ancient':19 'boy':11 'china':20 'escap':14 'intrepid':4 'must':13 'panorama':5 'robot':8 'sumo':16 'truman':2 'wrestler':17"	"Great rating or long (tier 1)"
7	"AIRPLANE SIERRA"	"A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat"	2006	1		6	4.99	62	28.99	"PG-13"	"2020-09-10 18:46:03.905795+02"	"{Trailers,""Deleted Scenes""}"	"'airplan':1 'boat':20 'butler':11,16 'discov':14 'hunter':8 'jet':19 'must':13 'saga':5 'sierra':2 'touch':4"	"Great rating or long (tier 1)"
9	"ALABAMA DEVIL"	"A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat"	2006	1		3	2.99	114	21.99	"PG-13"	"2020-09-10 18:46:03.905795+02"	"{Trailers,""Deleted Scenes""}"	"'administr':9 'alabama':1 'boat':23 'databas':8 'devil':2 'jet':22 'mad':12,18 'must':15 'outgun':16 'panorama':5 'scientist':13,19 'thought':4"	"Great rating or long (tier 1)"
11	"ALAMO VIDEOTAPE"	"A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention"	2006	1		6	0.99	126	16.99	"G"	"2020-09-10 18:46:03.905795+02"	"{Commentaries,""Behind the Scenes""}"	"'alamo':1 'bore':4 'butler':8 'cat':11 'chef':17 'convent':21 'epistl':5 'fight':14 'must':13 'mysql':20 'pastri':16 'videotap':2"	"very cheap (tier 4)"



















CERTO...











AS SOLUCOES DO PROFESSOR FICARAM:








SELECT 
COUNT(*) as flights,
CASE
WHEN EXTRACT(month from scheduled_departure) IN (12,1,2) THEN 'Winter'
WHEN EXTRACT (month from scheduled_departure) <= 5 THEN 'Spring'
WHEN EXTRACT (month from scheduled_departure) <= 8 THEN 'Summer'
ELSE 'Fall' 
END as season
FROM flights
GROUP BY season
















E:







SELECT
COUNT(*) AS tickets,
CASE 
WHEN total_amount < 20000 THEN 'low price ticket'
WHEN total_amount < 150000 THEN 'mid price ticket'
ELSE 'high price ticket'
END as ticket_price
FROM bookings

















E (a 3 ficou bem diferente):











SELECT
title,
CASE
    WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
    WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
    WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
    WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
END as tier_list
FROM film
WHERE 
CASE
    WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
    WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
    WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
    WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
END is not null;






----------------------------




















ELE VAI NOS EXPLICANDO,


REITERA O CONCEITO DOS BUCKETS....






AÍ ELE FALA DO "END" 



e do "FROM film"....
















--> MAS O PROFESSOR DEPOIS QUERIA QUE FILTRÁSSEMOS 



PARA FORA TODOS OS MOVIES QUE NAO ENCAIXASSEM 


NESSAS CATEGORIAS...










--> SIMPLESMENTE COLOCAR 1 ALIAS PARA ESSE CASE 




NAO VAI PERMITIR QUE ELE SEJA USADO 



NO WHERE (


    pq o WHERE é executado ANTES 

    DA DEFINICAO  DE ALIASES....
)











--> se quisermos 


FILTRAR POR 'TODAS AS COISAS QUE ENCAIXAM NESSAS 4 CATEGORIAS",







PODEMOS __ USAR ESSA MESMA COLUMN,


CHECAR POR ESSA COLUMN INTEIRA (

    bem grande
),


E AÍ CHECAR POR ESSA COLUMN INTEIRA,

"IS NOT NULL":







SELECT
title,
CASE
    WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
    WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
    WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
    WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
END as tier_list
FROM film
WHERE 
CASE
    WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
    WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
    WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
    WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
END is not null;











OK... ACABAMOS COM ESTA CHALLENGE...













A CHALLENGE É:






THE AIRLINE COMPANY WANTS TO UNDERSTAND IN WHICH CATEGORY 
THEY 
SELL MOST TICKETS...





HOW MANY PEOPLE CHOOSE SEATS IN THE CATEGORY:


1) BUSINESS 

2) ECONOMY 

3) COMFORT...





THE TABLES ARE:


1) SEATS 


2) BOARDING_PASSES






SELECT
SUM(
CASE
    WHEN s.fare_conditions = 'Business' THEN 1
    ELSE 0
	END
) AS "Business",
SUM(
CASE
    WHEN s.fare_conditions = 'Economy' THEN 1
    ELSE 0
	END
) AS "Economy",
SUM(
CASE
    WHEN s.fare_conditions = 'Comfort' THEN 1
    ELSE 0
	END
) AS "Comfort"
FROM seats as s 
INNER JOIN boarding_passes as bp
ON s.seat_no = bp.seat_no;














USEI O TRUQUE DO "SUM()" COM O CASE,



E O OUTPUT FICOU ASSIM:




"Business"	"Economy"	"Comfort"
621092	    2476771	       112098









MAS É CLARO QUE PODERÍAMOS 


FAZER ISSO COM O FORMATO COMUM,


DE 


BUSINESS  -- xxxx

CONFORT  --- yyyy

ECONOMY --- zzzz









PARA ISSO, DEVEMOS ESCREVER ASSIM:









SELECT
COUNT(*),
s.fare_conditions
FROM seats AS s 
INNER JOIN boarding_passes AS bp
ON s.seat_no = bp.seat_no
GROUP BY s.fare_conditions
ORDER BY COUNT(*);






ISSO FUNCIONOU...









COMO FICOU A SOLUCAO DO PROFESSOR?











ele explica que "seat_no" 

é a column que une as 2 tables...





ELE ESCREVEU ASSIM:










SELECT * FROM boarding_passes AS bp
INNER JOIN seats AS s 
ON s.seats_no = bp.seats_no;










DEPOIS ELE COMPLEMENTA:





SELECT 
COUNT(*),
s.fare_conditions
FROM boarding_passes AS bp
INNER JOIN seats AS s 
ON s.seats_no = bp.seats_no
GROUP BY s.fare_conditions;






-------------------





ok, acertamos...


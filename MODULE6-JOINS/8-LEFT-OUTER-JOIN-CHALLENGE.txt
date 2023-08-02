






TEMOS ESTA CHALLENGE:







1) THE FLIGHT COMPANY IS TRYING TO 
FIND OUT WHAT THEIR MOST POPULAR SEATS ARE.







TRY TO FIND OUT WHICH SEAT HAS 

BEEN CHOSEN MOST FREQUENTLY...







temos que joinar tables....








MAKE SURE THAT __ ALL SEATS 

ARE INCLUDED,

EVEN IF THEY HAVE NEVER BEEN CHOSEN BEFORE...







2A PERGUNTA 


"""ARE THERE SEATS THAT HAVE NEVER BEEN BOOKED?""













-------------------------------










OK... como escrevemos essa query?










MAIS OU MENOS ASSIM:







SELECT
s.seat_no,
COUNT(s.seat_no) AS number_of_times
-- COUNT(bp) AS number_of_times
FROM seats AS s
LEFT JOIN boarding_passes as bp
ON s.seat_no = bp.seat_no
-- WHERE bp.seat_no IS NULL
GROUP BY s.seat_no
ORDER BY number_of_times DESC;










"seat_no"	"n_chosen"
"1A"	53559
"4A"	53181
"2A"	53145
"3A"	52524
"5A"	52029
"18A"	42704
"4C"	42384
"18D"	42272
"20D"	42072
"2C"	42008













mas nao ficou mt bom,




pq temos 



seats DUPLICATAS, lá na nossa table...
















--> AGORA TEMOS A SEGUNDA CHALLENGE:














2) TRY TO FIND OUT WHICH 


LINE (A,B,H) HAS BEEN CHOSEN MOST 

FREQUENTLY...







tipo 2A 1A, etc...












-> ok....






para isso, escrevo uma query assim:







SELECT 
RIGHT(s.seat_no, 1) AS seat_identifier,
COUNT(RIGHT(s.seat_no, 1)) AS n_of_times_chosen
FROM seats AS s
LEFT JOIN boarding_passes AS bp
ON s.seat_no = bp.seat_no
GROUP BY seat_identifier
ORDER BY n_of_times_chosen DESC;















FUNCIONOU...





RESULTADO:








"seat_identifier"	"n_of_times_chosen"
"A"	751618
"D"	652188
"C"	596921
"F"	467493
"E"	377687
"B"	280289
"H"	34574
"G"	34552
"K"	9000
"J"	5639











ok...





USAMOS ALGUMAS AGGREGATE FUNCTIONS 


E STRING FUNCTIONS...
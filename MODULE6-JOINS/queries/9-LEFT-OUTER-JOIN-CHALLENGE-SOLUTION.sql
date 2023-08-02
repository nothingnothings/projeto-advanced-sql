



QUEREMOS 1 COUNT DE 

QUANTAS VEZES CADA 1 DE NOSSAS SEATS 

FORAM BOOKED...













SELECT * FROM tickets;







SELECT * FROM boarding_passes; -- temos a data dentro dessa table....























COMECAMOS ASSIM:












SELECT * FROM seats s
LEFT JOIN boarding_passes b 
ON s.seat_no = b.seat_no;


















MAS AGORA PODEMOS CHECAR SE TEMOS ALGUMAS SEATS 

QUE NUNCA FORAM USADAS....





PARA ISSO, USAMOS UM WHERE...





SELECT * FROM seats s
LEFT JOIN boarding_passes b 
ON s.seat_no = b.seat_no
WHERE b.seat_no IS NULL;











--> OK, 


NAO GANHAMOS NENHUM RESULT... --> 




ISSO QUER DIZER QUE NAO TEMOS NENHUMA 

SEAT INUTILIZADA...




DEPOIS O PROFESSOR ESCREVE ASSIM:







SELECT * FROM seats s
LEFT JOIN boarding_passes b 
ON s.seat_no = b.seat_no
GROUP BY s.seat_no
ORDER BY COUNT(*) DESC;
















--> o resultado ficou assim:





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


















JÁ A SEGUNDA CHALLENGE FOI RESOLVIDA DESTA FORMA:




















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













--> COMO TODOS OS ROWS APARECEM 

EM AMBOS 


TABLES,


PODERÍAMOS TER USADO O INNER JOIN PARA 

CONSEGUIR O MESMO RESULTADO...














-- --> MAS O COMPORTAMENTO PADRAO,

-- DE DEVS,

-- É 


-- RODAR PRIMEIRAMENTE LEFT JOINS,


-- AINDA QUE 

-- PROVAVELMENTE 


-- CONSEGUIREMOS O MESMO 

-- RESULTADO 

-- DO INNER JOIN (
--     só para checar se 

--     alguma das tables 

--     está como NULL...


-- )













WRITE A QUERY THAT RETURNS THE __RUNNING TOTAL __ 

OF HOW LATE THE FLIGHTS ARE (
    difference between actual_arrival and 
    scheduled_arrival 
),


ORDERED BY FLIGHT_ID, including the DEPARTURE 
AIRPORT...








ACHO QUE A QUERY VAI FICAR ASSIM:







SELECT 
flight_id,
departure_airport,
SUM(actual_arrival - scheduled_arrival) OVER(ORDER BY flight_id)
FROM flights;









DEPOIS DISSO, TEMOS ESTA QUERY:






AS A SECOND QUERY, CALCULATE THE SAME RUNNING TOTAL,

BUT PARTITION ALSO BY THE DEPARTURE AIRPORT....










ACHO QUE FICA TIPO ASSIM:





SELECT 
flight_id,
departure_airport,
SUM(actual_arrival - scheduled_arrival) OVER(PARTITION BY departure_airport ORDER BY flight_id)
FROM flights;





ACERTEI....









A SOLUCAO DO PROFESSOR:







SELECT 
flight_id,
departure_airport,
SUM(actual_arrival - scheduled_arrival) OVER(ORDER BY flight_id)
FROM flights;



E:






SELECT 
flight_id,
departure_airport,
SUM(actual_arrival - scheduled_arrival) OVER(PARTITION BY departure_airport ORDER BY flight_id)
FROM flights;



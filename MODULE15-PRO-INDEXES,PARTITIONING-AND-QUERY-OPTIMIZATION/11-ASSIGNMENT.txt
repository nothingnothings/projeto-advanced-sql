Execute the following query:

SELECT * FROM flights f2
WHERE flight_no < (SELECT MAX(flight_no)
				  FROM flights f1
				   WHERE f1.departure_airport=f2.departure_airport
				   )


-- This query has a very bad performance.

-- Test indexes on different columns and compare their performance.


CREATE INDEX flights_flight_no_departure_airport_index
    ON flights 
    (flight_no, departure_airport);




-- query reduced to 13 seconds (3 second gain)...

-- Also consider an index on multiple columns.

-- Questions for this assignment


-- On which column(s) would you place an index to get the best performance
--  in the query?









CHALLENGE:








1) UPDATE ALL RENTAL PRICES THAT ARE 0.99 TO 1.99







2) THE CUSTOMER TABLE NEEDS TO BE ALTERED AS WELL:
    
    A) ADD THE COLUMN "INITIALS"(data type VARCHAR(10))

    B) UPDATE THE VALUES TO THE ACTUAL INITIALS (
        for example, Frank Smith should be F.S.
    )









ok... 









SELECT * FROM film;

UPDATE film
SET rental_rate=1.99 
WHERE rental_rate=0.99;



ALTER TABLE customer 
ADD COLUMN initials VARCHAR(10);

UPDATE customer
SET initials=CONCAT(LEFT(first_name, 1), '.', LEFT(last_name, 1), '.');

SELECT * FROM film WHERE rental_rate=0.99; -- returns 0 rows

SELECT * FROM customer;












OK... TERMINEI...
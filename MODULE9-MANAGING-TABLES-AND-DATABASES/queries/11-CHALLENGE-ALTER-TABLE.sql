



VIMOS QUE HÁ DIFERENTES STEPS/OPTIONS 

QUE TEMOS, 
PARA ALTERAR 


NOSSAS TABLES...











--> NA NOSSA CHALLENGE,

DEVEMOS CRIAR 

A
 TABLE 


 DE 
 


 "director"...











 --> devemos criar essa table com este comando:








CREATE TABLE director (
    director_id SERIAL PRIMARY KEY,
    director_account_name VARCHAR(20) UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50) DEFAULT 'Not specified',
    date_of_birth DATE,
    address_id INT REFERENCES address(address_id)
);












--> CERTO... CRIEI ESSA TABLE...











--> AGORA PODEMOS VISUALIZAR ESSA TABLE,




COM select * from director....




----------------------











ISSO FEITO, O PROFESSOR QUER QUE 

APLIQUEMOS ESTAS CHANGES NAQUELA TABLE:













ALTER TABLE steps:





1.change director_account_name type to VARCHAR(30)

2.drop the default on LAST_NAME 

3. ADD the constraint not null to last_name 

4. add the column "email" of data type VARCHAR(40)

5. rename the director_account_name TO account_name


6. RENAME THE TABLE from "director" to directors...







CERTO... TENTAREI FAZER ISSO...









O CÓDIGO FICOU ASSIM:


















SELECT * FROM film
WHERE 'Behind the Scenes' = ANY(special_features);








CREATE TABLE director (
    director_id SERIAL PRIMARY KEY,
    director_account_name VARCHAR(20) UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50) DEFAULT 'Not specified',
    date_of_birth DATE,
    address_id INT REFERENCES address(address_id)
);


SELECT * FROM director;




ALTER TABLE director
ALTER COLUMN director_account_name SET DATA TYPE VARCHAR(30),
ALTER COLUMN last_name DROP DEFAULT,
ALTER COLUMN last_name SET NOT NULL,
ADD COLUMN email VARCHAR(40);




ALTER TABLE director
RENAME COLUMN director_account_name TO account_name;


ALTER TABLE director
RENAME TO directors;









DROP TABLE director;














SELECT * FROM director;




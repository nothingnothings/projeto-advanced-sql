


CREATE A TABLE SONGS WITH THE FOLLOWING COLUMNS:








SONG_ID --> PRIMARY KEY 



SONG_NAME --> VARCHAR(30)




genre --> varchar(30)



PRICE --> NUMERIC(4,2)



RELEASE DATE --> DATE 















1) DURING CREATION,
ADD THE DEFAULT 'Not defined' to the genre...








2) ADD THE 'NOT NULL' CONSTRAINT TO THE SONG_NAME 
COLUMN ...






3) ADD THE CONSTRAINT WITH DEFAULT NAME (no name assigned)

to ensure THE PRICE IS AT LEAST 1.99...







4) ADD THE CONSTRAINT with the name "date_check" to 
ensure the release date is BETWEEN TODAY AND 
01-01-1950....








5) TRY TO INSERT A ROW LIKE THIS:





song_id --> 4,




song_name -> SQL song 




genre --> 'Not defined' 




price --> 0.99 




release_date --> 2022-01-07 











APARECERÁ UM ERRO POR CONTA DO PRICE,


pq esse price aí será de 0.99...













POR ISSO TEMOS 1 PASSO FINAL,

QUE É:




6) MODIFY THE CONSTRAINT TO BE ABLE TO HAVE 
0.99 ALLOWED AS THE LOWEST POSSIBLE PRICE...










7) TRY TO INSERT THE ROW, AGAIN...















OK.... VOU TENTAR....

















DROP TABLE songs;

CREATE TABLE songs (
    song_id SERIAL PRIMARY KEY,
    song_name VARCHAR(30),
    genre VARCHAR(30) DEFAULT 'Not defined',
    price NUMERIC(4,2),
    release_date DATE 
);




ALTER TABLE songs
ALTER COLUMN song_name SET NOT NULL,
ADD CHECK(price >= 1.99),
ADD CONSTRAINT date_check CHECK(
    release_date BETWEEN '01-01-1950' 
    AND current_timestamp);
	
	
	
INSERT INTO songs (song_name, price, release_date) 
VALUES (
    'SQL song',
    0.99,
    '2022-01-07'
);



ALTER TABLE songs 
DROP CONSTRAINT songs_price_check;




ALTER TABLE songs 
ADD CHECK(price >= 0.99);



INSERT INTO songs (song_name, price, release_date) 
VALUES (
    'SQL song',
    0.99,
    '2022-01-07'
);













OK... FUNCIONOU.




















COMO FICOU A SOLUCAO DO PROFESSOR:














CREATE TABLE songs (
    song_id SERIAL PRIMARY KEY,
    song_name VARCHAR(30) NOT NULL,
    genre VARCHAR(30) DEFAULT 'Not defined',
    price NUMERIC(4,2) CHECK(price >= 1.99)
    release_date DATE CONSTRAINT date_check CHECK(release_date BETWEEN '01-01-1950' AND current_date)
);



INSERT INTO songs (song_name, price, release_date) 
VALUES (
    'SQL song',
    0.99,
    '2022-01-07'
);


ALTER TABLE songs 
DROP CONSTRAINT songs_price_check;




ALTER TABLE songs 
ADD CHECK(price >= 0.99);




--------------------------------------------












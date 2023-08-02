




VAMOS APLICAR O QUE APRENDEMOS SOBRE SUBQUERIES 

E UNIONS...









CHALLENGE:












1) SELECT ALL OF THE FILMS 

WHERE THE LENGTH IS LONGER THAN THE 

AVERAGE OF ALL FILMS...






SUBQUERY...










2) return all the filMs that are available 


IN THE INVENTORY.. available 


IN STORE 2, MORE THAN 3 times....






DEVEMOS COMBINAR SUBQUERIES COM COISAS QUE APRENDEMOS ANTERIORMEMNTE...















COMECAMOS COM O EXERCÍCIO 1:





1) SELECT ALL OF THE FILMS 

WHERE THE LENGTH IS LONGER THAN THE 

AVERAGE OF ALL FILMS...








FICOU ASSIM:




SELECT
*
FROM film
WHERE length > (
	SELECT 
	AVG(length) 
	FROM film
);




E O OUTPUT:






"film_id"	"title"	"description"	"release_year"	"language_id"	"original_language_id"	"rental_duration"	"rental_rate"	"length"	"replacement_cost"	"rating"	"last_update"	"special_features"	"fulltext"
4	"AFFAIR PREJUDICE"	"A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank"	2006	1		5	2.99	117	26.99	"G"	"2020-09-10 18:46:03.905795+02"	"{Commentaries,""Behind the Scenes""}"	"'affair':1 'chase':14 'documentari':5 'fanci':4 'frisbe':8 'lumberjack':11 'monkey':16 'must':13 'prejudic':2 'shark':19 'tank':20"
5	"AFRICAN EGG"	"A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico"	2006	1		6	2.99	130	22.99	"G"	"2020-09-10 18:46:03.905795+02"	"{""Deleted Scenes""}"	"'african':1 'chef':11 'dentist':14 'documentari':7 'egg':2 'fast':5 'fast-pac':4 'forens':19 'gulf':23 'mexico':25 'must':16 'pace':6 'pastri':10 'psychologist':20 'pursu':17"
6	"AGENT TRUMAN"	"A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China"	2006	1		3	2.99	169	17.99	"PG"	"2020-09-10 18:46:03.905795+02"	"{""Deleted Scenes""}"	"'agent':1 'ancient':19 'boy':11 'china':20 'escap':14 'intrepid':4 'must':13 'panorama':5 'robot':8 'sumo':16 'truman':2 'wrestler':17"
11	"ALAMO VIDEOTAPE"	"A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention"	2006	1		6	0.99	126	16.99	"G"	"2020-09-10 18:46:03.905795+02"	"{Commentaries,""Behind the Scenes""}"	"'alamo':1 'bore':4 'butler':8 'cat':11 'chef':17 'convent':21 'epistl':5 'fight':14 'must':13 'mysql':20 'pastri':16 'videotap':2"
12	"ALASKA PHANTOM"	"A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia"	2006	1		6	0.99	136	22.99	"PG"	"2020-09-10 18:46:03.905795+02"	"{Commentaries,""Deleted Scenes""}"	"'alaska':1 'australia':19 'boy':17 'chef':12 'fanci':4 'hunter':8 'must':14 'pastri':11 'phantom':2 'saga':5 'vanquish':15"














CERTO...










AGORA O OUTRO EXERCÍCIO:







2) return all the filMs that are available 


IN THE INVENTORY.. available 


IN STORE 2, MORE THAN 3 times....








FICOU ASSIM:







SELECT
f.title,
COUNT(f.title) AS n_in_store
FROM film AS f
INNER JOIN inventory AS i
ON i.film_id = f.film_id
AND store_id = 2
GROUP BY f.title
HAVING COUNT(f.title) > 3
ORDER BY f.title;











E O OUTPUT:






"title"	"n_in_store"
"ACADEMY DINOSAUR"	4
"ADAPTATION HOLES"	4
"AIRPORT POLLOCK"	4
"ALASKA PHANTOM"	4
"ALIEN CENTER"	4
"ALI FOREVER"	4











COMO FICOU A SOLUCAO DO PROFESSOR?















ELE ESCREVEU ASSIM:











SELECT * FROM film 
WHERE length > (
    SELECT AVG(length) FROM film
);








-->  A AVERAGE LENGTH É 115 MIN....






MAS ESSE VALUE DE 115.272 É COMPARADO COM A LENGTH,

E USADO COMO MAIN FILTER NA NOSSA QUERY...













--> MAS AÍ TEMOS A SEGUNDA CHALLENGE,





DE "RETURN ALL THE FILMS THAT ARE AVAILABLE IN THE INVENTORY,
IN STORE OF ID 2,

MORE THAN 3 TIMES"...











--> FICOU TIPO ASSIM:









SELECT * FROM inventory










depois:





SELECT film_id,
COUNT(*)
FROM inventory
WHERE store_id=2
GROUP BY film_id
HAVING COUNT(*) > 3;










--> MAS AÍ O PROFESSOR TRANSFORMA TUDO ISSO EM UMA 
SUBQUERY:



SELECT * FROM film 
WHERE film_id IN
(
SELECT film_id,
COUNT(*)
FROM inventory
WHERE store_id=2
GROUP BY film_id
HAVING COUNT(*) > 3
);










EU USEI JOINS PARA RESOLVER ISSO....




E DEU o mesmo resultado...





AGORA TEREMOS MAIS CHALLENGES SOBRE SUBQUERIES...
-- Question 4:

-- Level: Moderate

-- Topic: JOIN & GROUP BY

-- Task: Create an overview of how many movies (titles) there are in each category (name).

-- Question: Which category (name) is the most common among the films?







QUERY:



SELECT 
c.name,
COUNT(f.title) AS n_of_movies
FROM film AS f
LEFT JOIN film_category AS fc
ON fc.film_id = f.film_id
INNER JOIN category AS c
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY n_of_movies DESC;


OUTPUT:



"name"	"n_of_movies"
"Sports"	74
"Foreign"	73
"Family"	69
"Documentary"	68
"Animation"	66
"Action"	64
"New"	63
"Drama"	62
"Sci-Fi"	61
"Games"	61
"Children"	60
"Comedy"	58
"Travel"	57
"Classics"	57
"Horror"	56
"Music"	51









Answer: Sports with 74 titles










--------------------






MINHA VERSAO:







SELECT 
c.name,
COUNT(f.title) AS n_of_movies
FROM film AS f
LEFT JOIN film_category AS fc
ON fc.film_id = f.film_id
INNER JOIN category AS c
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY n_of_movies DESC;





VERSAO DO PROFESSOR:





select 
c.name,
COUNT(f.title) AS n_of_movies
FROM film AS f 
LEFT JOIN film_category AS fc 
ON fc.film_id = f.film_id 
INNER JOIN category AS c
ON c.category_id=fc.category_id 
GROUP BY name 
ORDER BY n_of_movies DESC;
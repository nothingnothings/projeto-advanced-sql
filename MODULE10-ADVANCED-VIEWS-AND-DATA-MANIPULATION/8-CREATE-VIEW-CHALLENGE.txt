Create a view called films_category that shows
 a list of the film titles including their title,
  length and category name ordered descendingly by the
   length.

Filter the results to only the movies
 in the category 'Action' and 'Comedy'.












 CREATE VIEW films_category 
 AS
 SELECT
 title,
 length,
 ca.name AS category_name
 FROM film AS f
 LEFT JOIN film_category AS fc 
 ON fc.film_id=f.film_id
 INNER JOIN category AS ca 
 ON ca.category_id=fc.category_id
 WHERE ca.name='Action' OR ca.name='Comedy'
 ORDER BY length DESC;







CERTO... FUNCIONOU.
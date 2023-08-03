-- Question 1:

-- Level: Simple

-- Topic: DISTINCT

-- Task: Create a list of all the different (distinct) replacement costs of the films.



-- QUERY:

SELECT 
DISTINCT replacement_cost
FROM film
ORDER BY replacement_cost DESC;


-- OUTPUT:


"replacement_cost"
29.99
28.99
27.99
26.99
25.99
24.99
23.99
22.99
21.99
20.99
19.99
18.99
17.99
16.99
15.99
14.99
13.99
12.99
11.99
10.99
9.99








-- Question: What's the lowest replacement cost?

-- Answer: 9.99













-- CORRECAO DO PROFESSOR:







minha versao:



SELECT 
DISTINCT replacement_cost
FROM film
ORDER BY replacement_cost DESC;









SELECT DISTINCT replacement_cost
FROM film
ORDER BY replacement_cost DESC;










CERTO... ACERTEI...







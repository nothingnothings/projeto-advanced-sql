-- Question 6:

-- Level: Moderate

-- Topic: LEFT JOIN & FILTERING

-- Task: Create an overview of the addresses that are not associated to any customer.



QUERY:

SELECT
a.address_id,
a.address
FROM address AS a
LEFT JOIN customer AS c
ON a.address_id = c.address_id
WHERE a.address_id NOT IN (
	SELECT
	address_id
	FROM customer
);





ALTERNATIVE QUERY:



SELECT
COUNT(a.address)
FROM address AS a
LEFT JOIN customer AS c
ON a.address_id = c.address_id
WHERE a.address_id NOT IN (
	SELECT
	address_id
	FROM customer
);


OUTPUT:


SELECT
a.address_id,
a.address
FROM address AS a
LEFT JOIN customer AS c
ON a.address_id = c.address_id
WHERE a.address_id NOT IN (
	SELECT
	address_id
	FROM customer
);




-- Question: How many addresses are that?

-- Answer: 4










MINHA VERSAO:





SELECT
a.address_id,
a.address
FROM address AS a
LEFT JOIN customer AS c
ON a.address_id = c.address_id
WHERE a.address_id NOT IN (
	SELECT
	address_id
	FROM customer
);





VERSAO DO PROFESSOR


SELECT
a.address_id,
a.address
FROM address AS a
LEFT JOIN customer AS c
ON a.address_id = c.address_id
WHERE c.customer_id IS NULL;
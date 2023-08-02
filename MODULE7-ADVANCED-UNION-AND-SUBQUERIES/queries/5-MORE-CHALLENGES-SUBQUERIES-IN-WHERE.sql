








AGORA DEVEMOS VER MAIS ALGUMAS CHALLENGES....






1) return ALL CUSTOMERS' FIRST_NAMES AND LAST_NAMES 


THAT HAVE MADE A PAYMENT ON 


'2020-01-25'...






CERTO...





PARA ISSO,

ESCREVEMOS:






SELECT 
first_name,
last_name 
FROM (
    SELECT 
    first_name,
    last_name 
    FROM customer AS c
    INNER JOIN payment AS p
    ON p.customer_id = c.customer_id
    AND EXTRACT(DATE from p.payment_date) = '2020-01-25'
);








--> depois disso,


PRECISAMOS 







2) RETURN ALL CUSTOMERS' FIRST_NAMES 


AND EMAIL ADDRESSES THAT HAVE SPENT 

MORE THAN 30 DOLLARS...







EX:




SELECT 
first_name,
email
FROM (
	SELECT
	first_name,
	email,
	SUM(amount) AS amount_spent
	FROM customer AS c
	INNER JOIN payment AS p
	ON p.customer_id = c.customer_id
	GROUP BY first_name, email
) AS result_set
WHERE result_set.amount_spent > 30
ORDER BY first_name;











DEPOIS DISSO, TEMOS A CHALLENGE MAIS DIFÍCIL 
ATÉ AGORA:






3) RETURN ALL THE CUSTOMERS FIRST 
AND LAST NAMES THAT ARE FROM 

CALIFORNIA AND HAVE SPENT MORE THAN 100 IN TOTAL....






minha query ficou meio enorme,

e com detalhes desnecessários (joins desnecessários):






SELECT
first_name,
last_name
FROM (
	SELECT 
		c.first_name,
		c.last_name,
		a.district,
		SUM(p.amount) AS amount_spent
	FROM customer AS c
	LEFT JOIN payment as p
	ON p.customer_id = c.customer_id
	INNER JOIN address AS a
	ON a.address_id = c.address_id
	INNER JOIN city AS ci 
	ON ci.city_id = a.city_id
	INNER JOIN country as co
	ON co.country_id = ci.country_id
	AND a.district = 'California'
	GROUP BY c.first_name, c.last_name, a.district
) AS result_set
WHERE result_set.amount_spent > 100;













QUAIS FORAM AS SOLUCOES DO PROFESSOR?















--> A PRIMEIRA CHALLENGE:










MINHA VERSAO:






SELECT 
first_name,
last_name 
FROM (
    SELECT 
    first_name,
    last_name 
    FROM customer AS c
    INNER JOIN payment AS p
    ON p.customer_id = c.customer_id
    AND EXTRACT(DATE from p.payment_date) = '2020-01-25'
);







--> eu coloquei sem 1 where no lado de fora...





--> O PROFESSOR, POR SUA VEZ, ESCREVEU ASSIM:






SELECT first_name, last_name 
FROM customer 
WHERE customer_id IN (
    SELECT customer_id
    FROM payment 
    WHERE DATE(payment_date)='2020-01-25'
);









--> a subquery nos dá os customer_ids,


que usamos 


NO FILTER DA MAIN QUERY, NAQUELE WHERE...









certo...









MINHA VERSAO FICOU ERRADA,


PQ FIQUEI COM 136 ROWS,

EM VEZ DE 127...









CONSERTEI.... 






PRECISEI USAR A KEYWORD "DISTINCT" NO SELECT,

PARA 

EVITAR 

PAYMENTS QUE ESTAVAM REPETIDOS...



E TAMBÉM NAO PRECISO DA OUTER QUERY, POIS 

ELA É REDUNDANTE...



ex:



    SELECT DISTINCT
    first_name,
    last_name,
	c.customer_id
    FROM customer AS c
    INNER JOIN payment AS p
    ON p.customer_id = c.customer_id
    AND DATE(p.payment_date) = '2020-01-25'
	ORDER BY c.customer_id;












MAS 



A VERSAO DO PROFESSOR, QUE USAVA SUBQUERIES,

É ESTA:







SELECT first_name, last_name 
FROM customer 
WHERE customer_id IN (
    SELECT customer_id
    FROM payment 
    WHERE DATE(payment_date)='2020-01-25'
);







---------------------------------------



















A MESMA COISA DEVE TER OCORRIDO COM A QUESTAO 


2, 
EM QUE TAMBÉM USEI UM INNER JOIN...











SE EU TIRAR AS REDUNDANCIAS,


O CÓDIGO FICA ASSIM:






	SELECT DISTINCT
	first_name,
	email,
	SUM(amount) AS amount_spent
	FROM customer AS c
	INNER JOIN payment AS p
	ON p.customer_id = c.customer_id
	GROUP BY first_name, email
	HAVING SUM(amount) > 30
	ORDER BY first_name;












certo...










MAS ESSE CÓDIGO AINDA ESTÁ __ ERRADO___,

AINDA NAO 

ESTÁ USANDO 


O WHERE/IN 



COM 

SUBQUERIES...









TEMOS QUE O REESCREVER, TIPO ASSIM:









2) RETURN ALL CUSTOMERS' FIRST_NAMES 


AND EMAIL ADDRESSES THAT HAVE SPENT 

MORE THAN 30 DOLLARS...







SELECT 
first_name,
email
FROM customer
WHERE customer_id IN (
    SELECT
    c.customer_id
    FROM customer AS c
    INNER JOIN payment as p
    ON p.customer_id = c.customer_id
    GROUP BY c.customer_id
    HAVING SUM(amount) > 30
)
ORDER BY first_name;









OK... AGORA CONSEGUI SEGUIR O FORMATO DO PROFESSOR,

E TIVE 

599 ROWS RETORNADOS....









o código do professor ficou um pouco mais simples (
    sem joins
), 

mas bem parecido:








SELECT first_name, email
FROM customer 
WHERE customer_id IN (
    SELECT customer_id
    FROM payment 
    GROUP BY customer_id 
    HAVING SUM(amount) > 30
);




------------------------------------





agora temos a última query...







a minha ficou assim, 

horrível:






SELECT
first_name,
last_name
FROM (
	SELECT 
		c.first_name,
		c.last_name,
		a.district,
		SUM(p.amount) AS amount_spent
	FROM customer AS c
	LEFT JOIN payment as p
	ON p.customer_id = c.customer_id
	INNER JOIN address AS a
	ON a.address_id = c.address_id
	INNER JOIN city AS ci 
	ON ci.city_id = a.city_id
	INNER JOIN country as co
	ON co.country_id = ci.country_id
	AND a.district = 'California'
	GROUP BY c.first_name, c.last_name, a.district
) AS result_set
WHERE result_set.amount_spent > 100;












É CLARO QUE PODEMOS DEIXAR ISSO MAIS ENXUTO..







FICA ASSIM:








SELECT first_name, email
FROM customer 
WHERE customer_id IN (
    SELECT customer_id
    FROM payment 
    GROUP BY customer_id 
    HAVING SUM(amount) > 100
);







MAS É CLARO QUE PRECISAMOS DA SEGUNDA CONDITION DO WHERE,

QUE PODEMOS ESCREVER LOGO ABAIXO,

ASSIM:






SELECT first_name, email
FROM customer 
WHERE customer_id IN (
    SELECT customer_id
    FROM payment 
    GROUP BY customer_id 
    HAVING SUM(amount) > 100
)
AND customer_id IN (
    SELECT customer_id
    FROM 
)










AGORA QUEREMOS PEGAR TODOS OS CUSTOMER_ID 

QUE FICAM NO DISTRICT DA CALIFORNIA...


PRECISAMOS DE UM JOIN NO NOSSO SUBSELECT,
TIPO ASSIM:










SELECT first_name, email
FROM customer 
WHERE customer_id IN (
    SELECT customer_id
    FROM payment 
    GROUP BY customer_id 
    HAVING SUM(amount) > 100
)
AND customer_id IN (
    SELECT customer_id
    FROM customer 
    INNER JOIN address
    ON address.address_id = customer.address_id
    WHERE district = 'California'
);












OK... FOI EXATAMENTE O MESMO QUE O MEU,


MAS BEM MAIS OPTIMIZADO...





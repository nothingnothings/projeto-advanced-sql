


EM VEZ DE USAR O "RANK()" FUNCTION,



PODEMOS USAR A FUNCTION DE 



"FIRST_VALUE()"...







ISSO NOS DÁ O PRIMEIRO VALUE DE 1 CERTA PARTITION (
    por exemplo, 1 row que tenha 1 given country...
)










PODEMOS RODAR ASSIM:




SELECT
name,
country,
COUNT(*),
FIRST_VALUE() OVER(PARTITION BY country ORDER BY count(*) DESC)
FROM customer_list
LEFT JOIN payment
ON id=customer_id
GROUP BY name, country;



-------------------------











OK... TEMOS A FUNCTION DE "FIRST_VALUE()"....








MAS AGORA TEMOS QUE DECIDIR ""QUAL É O PRIMEIRO 
VALUE QUE QUEREMOS VER""....









por exemplo,

QUEREMOS VER PRIMEIRO O "NAME",

ORDENADO PELO COUNT?










EX:





SELECT
name,
country,
COUNT(*),
FIRST_VALUE(name) OVER(PARTITION BY country ORDER BY count(*) DESC)
FROM customer_list
LEFT JOIN payment
ON id=customer_id
GROUP BY name, country;




















essa aggreg function nao é tao útil assim...\









resumo dessa function:




1) apenas definimos QUAL VALUE QUEREMOS VER, dentro 
dela...


2) depois, no OVER(),

DEFINIMOS O PARTITIONING E A ORDERING...
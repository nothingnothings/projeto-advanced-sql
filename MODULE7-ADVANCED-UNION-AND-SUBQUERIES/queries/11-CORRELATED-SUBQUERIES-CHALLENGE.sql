







A CHALLENGE É:











SHOW ONLY THOSE MOVIE TITLES, THEIR 
ASSOCIATED FILM_ID AND REPLACEMENT_COST,


WITH THE LOWEST REPLACEMENT_COST 


FOR EACH RATING CATEGORY...  ALSO SHOW THE RATING....











--> é uma challenge bem mais difícil...










a query ficou gigante:










SELECT
title,
film_id,
replacement_cost,
rating
FROM film AS f1
WHERE film_id IN (
	SELECT
	film_id
	FROM film AS f2
	WHERE f1.film_id = f2.film_id
	AND replacement_cost = (
		SELECT 
		MIN(replacement_cost)
		FROM film AS f3
		WHERE f2.film_id = f1.film_id
	)
);









NAO SEI SE ESCREVI PARTES DESNECESSÁRIAS 

NESSA QUERY...




O CHATGPT 



DIZ QUE UMA VERSAO MAIS SIMPLIFICADA SERIA ESTA:








SELECT
    title,
    film_id,
    replacement_cost,
    rating
FROM
    film
WHERE
    replacement_cost = (
        SELECT 
            MIN(replacement_cost)
        FROM
            film
        WHERE
            film_id = film.film_id
    );




-----------------------








realmente, ele está certo...












----------------------------










AGORA TEMOS A SEGUNDA CHALLENGE:












""SHOW ONLY THOSE MOVIE TITLES, THEIR ASSOCIIATED
FILM_ID AND THE LENGTH THAT HAVE 

THE __ HIGHEST LENGTH IN EACH RATING CATEGORY...

AND ALSO SHOW THE RATING"...














------- OK. PODEMOS TENTAR ESCREVER ASSIM:









SELECT 
title,
film_id,
length,
rating
FROM film
WHERE length = (
	SELECT MAX(length)
	FROM film
	WHERE film_id = film_id
);


















--> ESSA É A MELHOR SINTAXE...









COLOQUE 1 WHERE 



DE 2 CONDITIONS EXATAMENTE IGUAIS,




QUE ISSO JÁ SERÁ O BASTANTE 


PARA CORRELACIONAR AS 2 TABLES (por alguma 
razao)







----------------------------------















COMO FOI A SOLUCAO DO PROFESSOR?












ELE ESCREVE ASSIM:










SELECT 
title,
film_id,
replacement_cost,
rating 
FROM film f1
WHERE replacement_cost = (
    SELECT 
    MIN(replacement_cost)
    FROM film f2 
    WHERE f1.rating = f2.rating
);













--> ERA ISSO QUE EU TINHA ERRADO...







O NOSSO GROUPING É ALL ABOUT O RATING,



E NAO 


O "ID",


POR ISSO EU DEVERIA TER ESCRITO 

"f1.rating", e nao "f1.customer_id"...













A SEGUNDA CHALLENGE:





SELECT 
title,
film_id,
length,
rating 
FROM film f1
WHERE length = (
    SELECT 
    MAX(length)
    FROM film f2 
    WHERE f1.rating = f2.rating
);





----------------------------

















ENTENDI...










AQUELE WHERE É __eXTREMAMENTE IMPORTANTE___...






É ELE QUE É USADO PARA AGRUPAR 

POR RATING/CITY/COUNTRY/QUALQUER COISA...












no caso, aqui AGRUPAMOS POR RATING,



mas poderíamos agrupar por city, também...











o propósito das correlated subqueries 


É 



PRODUZIR RESULT SETS COM BASE 




EM __ SUB-PEDACOS__ 


DE NOSSA TABLE ORIGINAL (

    como "o average de todos os produtos 

        de tipo BEBIDAS", etc...
)








--> é por isso que NAO DEVEMOS USAR


IDs para CORRELACIONAR AS QUERIES,


E SIM DEVEMOS USAR 


VALUES QUE "AGRUPAM" os rows...










OK... ESSAS FORAM AS SOLUCOES...














MAS AGORA HÁ OUTRA MANEIRA DE 


USAR 




1 CORRELATED SUBQUERY,



QUE A UTILIZA 




NA CLAUSE DE "SELECT",



E NAO 





NA 

PARTE DO "WHERE"...




VEREMOS ISSO NA PRÓXIMA AULA...
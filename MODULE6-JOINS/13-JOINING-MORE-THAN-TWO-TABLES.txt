





ATÉ AGORA APENAS JOINAMOS 2 TABLES...















COMO A TABLE DE SALES E A TABLE DE BONUS...



















--> MAS OCASIONALMENTE PODEMOS 


TER MÚLTIPLAS TABLES QUE

QUEREMOS JOINAR...









MAS DIGAMOS QUE TEMOS 3 TABLES:













SALES:







EMPLOYEE    city_Id     sales 
Sandra      1           500 









CITY:




city_Id         city        country_id 
1           Frankfurt           1 









COUNTRY:




country_id      country
    1           Germany















OK... MAS DIGAMOS QUE QUEREMOS JOINAR ESSAS 3 TABLES,


POR MEIO DO 

1 

DE 'city_Id'...











COMO ESCREVEMOS ISSO, QUAL É A SINTAXE?













ACHO QUE É ASSIM:










SELECT 
employee,
co.country 
FROM sales AS s 
INNER JOIN city AS ci
ON s.city_id = ci.city_id
INNER JOIN country AS co
ON ci.country_id = co.country_id;








OU SEJA, QUEREMOS 



PEGAR 


1 LISTA DE TODOS EMPLOYEES E SEUS COUNTRIES...





TIPO ASSIM:







employee    country 
Sandra      Germany











--> O PROFESSOR DIZ QUE O PRIMEIRO 

PASSO É JOINAR 


SALES TABLE COM CITIES TABLE...







---> DEPOIS JOINARÍAMOS 



ESSE RESULT SET 



COM A TABLE DE "COUNTRY"....










--> 

RESULTADO:







SELECT 
employee,
co.country 
FROM sales AS s 
INNER JOIN city AS ci
ON s.city_id = ci.city_id
INNER JOIN country AS co
ON ci.country_id = co.country_id;





















->OBS: SE QUISÉSSEMOS RODAR 1 "WHERE" FILTER,


SERÍAMOS OBRIGADOS A O EXECUTAR NO FINAL DE TUDO,

DEPOIS DE TODOS OS JOINS...











PODEMOS JOINAR MÚLTIPLAS TABLES ENTRE SI....










--> SE USAMOS UM INNER JOIN,


ISSO NOS AJUDA COM O UNDERSTANDING...





---> nos ajuda pq 


A ORDEM NAO IMPORTA, COM INNER JOINS....








--> ENTRETANTO, PARA 

LEFT E RIGHT JOINS,

A ORDEM __iMPORTA,

SIM...















--> A ORDEM IMPORTA, PQ NO LEFT JOIN 



AS ENTRIES DA TABLE A  (left) SEMPRE VAO 

CONSTAR 


NO RESULT FINAL...











OK... AGORA DEVEMOS TESTAR TUDO ISSO 

NO PGADMIN4...





-> DEPOIS TER UMA CHALLENGE SOBRE ISSO..
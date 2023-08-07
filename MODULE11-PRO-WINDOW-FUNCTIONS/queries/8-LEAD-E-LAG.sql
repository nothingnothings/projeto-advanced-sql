







AGORA VEREMOS UMAS DAS WINDOW FUNCTIONS MAIS 

INTERESSANTES....







É O "LEAD" E O "LAG"...














--> COM OS 2, PODEMOS GERAR



CALCULATIONS BEM "MEANINGFUL"....











---> PODEMOS GERAR RESULTADOS QUE APARECEM 


IMPOSSÍVEIS...














--> PARA USAR ISSO, TEMOS ESTE CÓDIGO:






SELECT
LEAD() OVER(PARTITION BY country ORDER BY count(*) ASC) AS rank
FROM customer_list
LEFT JOIN payment
ON id=customer_id
GROUP BY name, country;














COMECAMOS COM O 'LEAD'...









com isso, TEMOS A FUNCTION DE "LEAD",


OVER A PARTITION DE "COUNTRY",


E ORDENADO POR "COUNT"...












--> OK, MAS ISSO VAI NOS DAR 1 ___ ERRO....






ERRO _ PQ __ NÓS NAO PASSAMOS VALUE ALGUM 

A ESSA FUNCTION DE "LEAD()"....







(é exatamente como com "FIRST_VALUE()", que 

exige que INPUTTEMOS O PRIMEIRO VALUE QUE QUEREMOS VER...)

















--> NO CASO DESSE LEAD,

colocamos "name"...










--> ex:






LEAD(name) OVER(PARTITION BY country ORDER BY count(*))







NO CASO,




"LEAD" vai gerar O value que 


VEM __ DEPOIS_...













ex: ESTAMOS NA PARTITION DE "ALGERIA"...
        e o próximo value,

        na partition de "algeria",

        é 

        "MARIO CHEATHAM".... esse value,

        "MARIO CHEATHAM",

        vai aparecer JUSTAMENTE 



        NA COLUMN EM QUE ESCREVEMOS ESSE 

        'LEAD"..








OU SEJA, O LEAD VAI 
NOS DAR 

O PRÓXIMO VALUE 

DESSA PARTITION...








-> E SE NAO EXISTIR MAIS NENHUM VALUE NESSA PARTITION(

    como com a partition de AFGHANISTAN
),


O VALUE NESSA COLUMN, NESSE ROW,
SERÁ NULL...















--> E ISSO TUDO FICA MT MEANINGFUL



SE NAO COLOCAMOS
1 COLUMN como "name" 


dentro do call de LAG(),



E SIM COLOCAMOS ALGO COMO 

"COUNT(*)"...





pq aí podemos rodar CÁLCULOS:














SELECT
LEAD(COUNT(*)) OVER(PARTITION BY country ORDER BY count(*) ASC) AS rank
FROM customer_list
LEFT JOIN payment
ON id=customer_id
GROUP BY name, country;




















PODEMOS USAR ISSO COM CÁLCULOS...





--> PODEMOS PEGAR ESSA MESMA COLUMN E ENTAO 

SUBTRAIR 


O COUNT,

PARA TER A DIFERENCA ENTRE O PREVIOUS E NEXT VALUES:










SELECT
LEAD(COUNT(*)) OVER(PARTITION BY country ORDER BY count(*) ASC) AS rank,
LEAD(COUNT(*)) OVER(PARTITION BY country ORDER BY count(*) ASC) - COUNT(*)
FROM customer_list
LEFT JOIN payment
ON id=customer_id
GROUP BY name, country;



















--> podemos criar cálculos interessantes....














-> TAMBÉM TEMOS A FUNCTION DE "LAG()",

QUE FUNCIONA DA MESMA FORMA,

MAS COM O "pREVIOUS VALUE"....




EX:







SELECT
LAG(COUNT(*)) OVER(PARTITION BY country ORDER BY count(*) ASC) AS rank,
LAG(COUNT(*)) OVER(PARTITION BY country ORDER BY count(*) ASC) - COUNT(*)
FROM customer_list
LEFT JOIN payment
ON id=customer_id
GROUP BY name, country;





----------------------------------------------








se precisamos calcular a growth/diferenca 


em relacao 


aos anos anteriores,




PODEMOS USAR AS FUNCTIONS DE "LAG()" 

E 


"LEAD()"...








VEREMOS ISSO COM 1 CHALLENGE, AGORA....







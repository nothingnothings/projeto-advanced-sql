










QUANTO MAIS COMPLEXAS FICAM NOSSAS QUERIES,



MAIS IMPORTANTE FICA DEIXAR O CÓDIGO LEGÍVEL E 


UNDERSTANDABLE....











--> É POR ISSO QUE DEVEMOS USAR COMMENTS E ALIASES..













COMMENTS --> SAO USADOS PARA DEIXAR NOSSO CÓDIGO MAIS 
LEGÍVEL E UNDERSTANDABLE...











-->  É -- 



ou // (snowflake)...







também /* */ 





TUDO ISSO É USADO PARA EXPLICAR 

SEU CÓDIGO...








--> OU ENTAO PARA 

EVITAR QUE CERTAS PARTES DE SEU 

CÓDIGO SEJAM EXECUTADAS...



-----------------------------









ok... agora o professor 


FALA 

DE ALIASES....











--> PODEMOS OS UTILIZAR PARA RENOMEAR A COLUMN 


NA DATA OUTPUT,


MAS APENAS PARA 1 SINGLE QUERY (
    isso nao renomeia a column na database,

    e sim apenas 

    no RESULT SET.. --> podemos fazer isso para deixar 


    nossos column names mais descritivos...
)










AGORA DEVEMOS COLOCAR TUDO ISSO EM PRÁTICA..












VEJA ESTE EXEMPLO:








SELECT 
title,
description,
release_year 
FROM film 
WHERE description LIKE '%Documentary%';










-> PODEMOS COLOCAR 1 ALIAS EM 'description',

para alterar o name dessa column,
 
 no output:








SELECT 
title,
description AS desc,
release_year 
FROM film 
WHERE description LIKE '%Documentary%';











-------------------------





CERTO... ISSO VAI REALMENTE TROCAR O NOME DESSA COLUMN,

NO OUTPUT...





---------











OK... BEM SIMPLES, ESSA PARTE....











--> OS ALIASES SAO FREQUENTEMENTE 
USADOS 



QUANDO 



TEMOS UM OUTPUT 



QUE NAO É TAO DESCRITIVO, NO RESULT SET...






CERTO...








TIPO ASSIM:



SELECT 
COUNT(*) AS NUMBER_OF_MOVIES 
FROM FILM 
WHERE DESCRIPTION LIKE '%Documentary%';












-- É ASSIM QUE DEIXAMOS NOSSO CÓDIGO MAIS UNDERSTANDABLE E READABLE...
















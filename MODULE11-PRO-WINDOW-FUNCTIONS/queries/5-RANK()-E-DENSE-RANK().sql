













FREQUENTEMENTE VAMOS QUERER "RANKEAR" NOSSA DATA...











EX:





""QUEREMOS CRIAR 1 RANKING DOS TOP 10 SHORTEST E LONGEST FILMS

DE CADA CATEGORY"" 








--> OK.... PQ NA CATEGORIA ACTION TEREMOS 1 CERTO RANKING,

E EM COMEDY TEREMOS OUTRO 


RANKING...













--> ISSO É ALGO QUE FREQUENTEMENTE QUEREMOS FAZER,


CRIAR 1 RANKING EM CADA PARTITION...
















--> PARA ISSO, DEVEMOS USAR ESSA FUNCTION DE "RANK()"...














--> MAS COMO ELA FUNCIONA?













--> O PROFESSOR NOS TRAZ 1 QUERY SIMPLES:












SELECT 
f.title,
c.name,
f.length 
FROM film AS f 
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id 
LEFT JOIN category AS c ON c.category_id=fc.category_id;



















2 SIMPLES LEFT JOINS,




aí pegamos o name e length 


dos films...














--> OK... AGORA VAMOS QUERER CRIAR ESSE RANKING...












--> COMECAMOS COM A COMPREENSAO DA FUNCTION DE "RANK()"...








RANK() é uma aggregation function,

exatamente como "sum()",

"count()",


"min()" e "max()"











QUER DIZER QUE SUA SINTAXE, NO CONTEXTO DAS WINDOW FUNCTIONS,
é assim:





SELECT 
f.title,
c.name,
f.length,
RANK() OVER(ORDER BY length)  -- COM ISSO, SERÁ CRIADO 1 RANKING CONSIDERADA A LENGTH DOS MOVIES...
FROM film AS f 
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id 
LEFT JOIN category AS c ON c.category_id=fc.category_id;














SE QUISERMOS TER OS FILMES MAIS LONGOS NO INÍCIO, BASTA COLOCAR 


O ORDER BY COM "DESC":


SELECT 
f.title,
c.name,
f.length,
RANK() OVER(ORDER BY length DESC)  -- COM ISSO, SERÁ CRIADO 1 RANKING CONSIDERADA A LENGTH DOS MOVIES...
FROM film AS f 
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id 
LEFT JOIN category AS c ON c.category_id=fc.category_id;








-----------------------

















OK, MAS NOSSOS ROWS ESTAO FICANDO COM RANKS ASSIM:









                1
                2
                2
                2
                2
                2
                2
                2
                2
                2
                2
                12 
                12
                12
                12
                16











--> e esse é um behavior QUE NEM SEMPRE QUEREMOS TER...






--> SE NAO QUISERMOS ESSE BEHAVIOR,




DEVEMOS USAR A AGGREG FUNCTION ALTERNATIVA À RANK,

que é 


"DENSE_RANK()"...







COM DENSE_RANK(),



NOSSO RESULT SET FICA ASSIM:








                1
                2
                2
                2
                2
                2
                2
                2
                2
                2
                2
                3
                3
                3
                3
                4
                4
                4
















OU SEJA, SE EXISTEM EMPATES,






SIMPLESMENTE PROSSEGUIMOS 1 NÚMERO ACIMA para o próximo "rank"...









SUA SINTAXE FICA ASSIM:





SELECT 
f.title,
c.name,
f.length,
DENSE_RANK() OVER(ORDER BY length DESC)  -- COM ISSO, SERÁ CRIADO 1 RANKING CONSIDERADA A LENGTH DOS MOVIES...
FROM film AS f 
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id 
LEFT JOIN category AS c ON c.category_id=fc.category_id;








---------------------------------------------












OK....





MAS QUEREMOS PARTICIIONAR ESSE "RANK"






POR CADA CATEGORIA...











PARA ISSO, VAMOS COLOCAR A CLAUSE DE "PARTITION BY"



dentro 




do OVER(), dentro da window function:




















SELECT 
f.title,
c.name,
f.length,
DENSE_RANK() OVER(PARTITION BY c.name, ORDER BY length DESC)  
FROM film AS f 
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id 
LEFT JOIN category AS c ON c.category_id=fc.category_id;























COM ISSO, CADA CATEGORIA (como "Action") 

TERÁ 



1 RANKING DE MOVIES MAIS LONGOS...













QUER DIZER QUE ESSA FUNCTION DE RANK()


NAO É TAO COMPLICADA DE ENTENDER,



SE JÁ COMPREENDEMOS AS WINDOW FUNCTIONS...









--> HÁ APENAS 1 COISA ESPECÍFICA QUE DEVEMOS TER EM MENTE:




1) NAO __ PODEMOS_ USAR __ ESSAS FUNCTIONS, 



AS WINDOW FUNCTIONS,




COM  __ WHERE __ FILTERING...















MAS PQ NAO PODEMOS FAZER ISSO?


QUAL É O CONFLITO ENTRE "WHERE" E WINDOW FUNCTIONS ("OVER()")?










--> BEM, ISSO ACONTECE PQ 

O 

FILTER DO _ WHERE__ 



É EXECUTADO_ _ 


___ANTES___ DO EVALUATE DA WINDOW FUNCTION... (
    pode soar complicado,
    mas essa 

    é a razao pela qual nao podemos filtrar por 1 function de rank/outra 
    window function diretamente.... se queremos 

    FILTRAR POR 1 DESSAS FUNCTIONS,

    PRECISAMOS USAR UMA _ SUBQUERY...
)


















OK... PARA EXEMPLIFICAR, O PROFESSOR EXPOe:





""DIGAMOS QUE QUEREMOS USAR A EXPRESSAO DE DENSE_RANK() com a window function 


COMO FILTER LÁ NO WHERE...""..











ou seja, este trecho aqui:




DENSE_RANK() OVER(PARTITION BY c.name, ORDER BY length DESC)  















--> OK, DIGAMOS QUE ""QUEREMOS VER APENAS OS TOP RANKS DE CADA CATEGORIA""...


















--> PARA ISSO, COPIAMOS ESSA EXPRESSAO E A COLOCAMOS 

NA WHERE CONDITIOn:








SELECT 
f.title,
c.name,
f.length,
DENSE_RANK() OVER(PARTITION BY c.name, ORDER BY length DESC)  
FROM film AS f 
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id 
LEFT JOIN category AS c ON c.category_id=fc.category_id
WHERE (DENSE_RANK() OVER(PARTITION BY c.name, ORDER BY length DESC))=1;














mas se TENTARMOS EXECUTAR 


ESSA QUERY, COM ESSE WHERE DE "APENAS O TOP 1 DESSAS WINDOW FUNCTIONS",









RECEBEREMOS UM ERRO, JUSTAMENTE UM AVISO 



DIZENDO JUSTAMENTE O QUE O PROFESSOR ACABOU DE MENCIONAR:




"""WINDOW FUNCTIONS NAO SAO PERMITIDAS EM WHERE""" (

    PQ __AS WINDOW FUNCTIONS SAO EVALUATED


    __aPENAS_ dEPOIS_ DO WHERE...
)














--> ENTRETANTO, NOVAMENTE,


SE QUEREMOS FAZER ESSE FILTERING,

PODEMOS 


CRIAR 1 SUBQUERY... --------> 










BASTA USAR "SELECT * FROM"

E DAI 


TRANSFORMAR NOSSA QUERY TODA EM 1 SUBQUERY, TIPO ASSIM:








SELECT * FROM 
(
SELECT 
f.title,
c.name AS name,
f.length AS length,
DENSE_RANK() OVER(PARTITION BY c.name ORDER BY length DESC) AS rank
FROM film AS f 
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id 
LEFT JOIN category AS c ON c.category_id=fc.category_id
) AS result_set
WHERE result_set.rank=1;















E ISSO REALMENTE FUNCIONA....








FICAMOS COM 1 OUTPUT ASSIM:





"title"	"name"	"length"	"rank"
"WORST BANGER"	"Action"	185	1
"DARN FORRESTER"	"Action"	185	1
"POND SEATTLE"	"Animation"	185	1
"GANGS PRIDE"	"Animation"	185	1
"WRONG BEHAVIOR"	"Children"	178	1
"FURY MURDER"	"Children"	178	1
"CONSPIRACY SPIRIT"	"Classics"	184	1
"CONTROL ANTHEM"	"Comedy"	185	1
"YOUNG LANGUAGE"	"Documentary"	183	1
"WIFE TURN"	"Documentary"	183	1
"JACKET FRISCO"	"Drama"	181	1
"KING EVOLUTION"	"Family"	184	1
"CRYSTAL BREAKING"	"Foreign"	184	1
"SORORITY QUEEN"	"Foreign"	184	1
"CHICAGO NORTH"	"Games"	185	1
"LOVE SUICIDES"	"Horror"	181	1
"ANALYZE HOOSIERS"	"Horror"	181	1
"HOME PITY"	"Music"	185	1
"FRONTIER CABIN"	"New"	183	1
"SOLDIERS EVOLUTION"	"Sci-Fi"	185	1
"SMOOCHY CONTROL"	"Sports"	184	1
"SWEET BROTHERHOOD"	"Travel"	185	1
"MUSCLE BRIGHT"	"Travel"	185	1













PEGAMOS TODOS OS MOVIES COM RANK DE 1, mais longos em cada categoria...















OK, APRENDEMOS SOBRE A AGGREG FUNCTION DE "RANK()" E "DENSE_RANK()"...
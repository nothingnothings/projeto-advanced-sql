








AGORA VEREMOS "CORRELATED SUBQUERIES"...












ANTES DISSO, O PROFESSOR QUER RESUMIR 

O QUE PODEMOS FAZER COM NORMAL SUBQUERIES...















DIGAMOS QUE TEMOS ESTA TABLE:











NAME    SALES 
Sunita   600
Anil     400 
Shanti   100 
Sunita   300 
Maya    300 
Peter   200 
Max    100 
Anna    400 










-----> COM NORMAL SUBQUERIES,

PODEMOS 


CONSEGUIR 


""GET ALL PEOPLE THAT ARE ABOVE THE AVERAGE SALE RATE!""







para isso, poderíamos escrever:





SELECT 
first_name,
sales 
FROM employees 
WHERE sales > (
    SELECT AVG(sales) FROM employees
);











OK... ESSAS SAO STANDARD SUBQUERIES...








A SUBQUERY, NESSE CASO,


OBTEM A AVERAGE DAS SALES,
QUE É 300,



E AÍ 




O RESTO 



DA QUERY RODA NORMAL,

COMO SE FOSSE ISTO:







SELECT 
first_name,
sales 
FROM employees 
WHERE sales > 300;





----------------------















ok, mas agora IMAGINE A SEGUINTE SITUACAO:










DIGAMOS QUE 

TEMOS 1 OUTRA COLUMN,

CHAMADA DE CITY...








--> E  AGORA, COM ISSO,

QUEREMOS 


"""GET ALL PEOPLE THAT 

ARE __ ABOVE__ THE __ aVERAGE__ 
OF THEIR __ CITY,
THE CITY THEY ARE IN"""...









--> COM ISSO, A QUERY FICA BEM MAIS COMPLEXA...








IMAGINE A TABLE ASSIM, AGORA:









NAME    SALES   CITY
Sunita   600    Delhi
Anil     400    Delhi
Shanti   100    Delhi
Sunita   300    Dallas
Maya    300     Dallas
Peter   200     Dallas
Max    100      Berlin
Anna    400     Berlin











--> OK... 








SE QUEREMOS FAZER ISSO,





VAMOS PRECISAR 

DAS 



_CORRELATED SUBQUERIES (

    isso nao é possível apenas com 

    subqueries padrao...
)










--> DEVEMOS VER COMO ISSO FUNCIONA,

ETAPA POR ETAPA:








FICA TIPO ASSIM:








SELECT
first_name,
sales 
FROM employees 
WHERE sales > (
    ...<correlated_subquery>...
)













quer dizer que o formato da correlated_subquery


É EXATAMENTE O MESMO DAS SUBQUERIES 


QUE SAO ESCRITAS 



NA WHERE CLAUSE (




    como 


SELECT * FROM 
<table_name>
WHERE <col_name> = (
    SELECT ....
);


e


SELECT * FROM 
<table_name>
WHERE <col_name> IN (
    SELECT ....
); 






)
















ok... mas a diferenca 


DAS CORRELATED SUBQUERIES 


É QUE 



PRECISAMOS 



COLOCAR 1 __ WHERE___ CONDITION 



dentro


DESSA CORRELATED SUBQUERY,

TIPO ASSIM:









SELECT
first_name,
sales 
FROM employees AS e1
WHERE sales > (
        SELECT AVG(sales) FROM employees AS e2
        WHERE e1.city=e2.city
);







TAMBÉM PRECISAMOS __ COLOCAR NOMES 



NAS 2 TABLES ENVOLVIDAS 


NA QUERY (e1 e e2, nesse caso)....













ISSO PODE PARECER 1 POUCO COMPLICAOD,


MAS É ASSIM

QUE FUNCIONA:












A DIFERENCA-CHAVE 

É QUE 


AGORA 



___cADA__ ROW__ NA NOSSA _tABLE 



ACABA SENDO AVALIADO -__ 


INDEPENDENTEMENTE...
















--> MAS COMO ISSO FUNCIONA...




vejamos de forma mais aprofundada:











WHERE sales >
    (
        SELECT AVG(sales) FROM employees e2 
        WHERE e1.city = e2.city
    )






(A ÚNICA COISA QUE MUDA É A ADICAO 
DAQUELA WHERE CONDITION;

é uma where condition especial,

QUE TRANSFORMA O VALUE 

DE "e1.city", que antes era a COLUMN inteira 
de city, em 'e1', EM 1 VALUE MAIS SETORIZADO,

limitado a apenas a city desse "e2",
que, no caso, 

será CADA employee/row na table...



EX:

WHERE e1.city=e2.city
    (DEVE SER/VAI SER apenas a 
    city encontrada nesse row...)




)




NO PRIMEIRO ROW,


TEMOS SALES DE 600...





assim:



name    sales  city
Sunita  600  Delhi






--> ok...
 







mas a pergunta é,



a que value essa correlated_subquery


é transformada...




--> bem, é UM CONJUNTO DE VALUES 

(

    pq vamos selecionar o average DE CADA CITY,

    e temos MÚLTIPLAS CITIES....
)






--> primeiramente vamos pegar

o average de todas as cities que ficam em DELHI....







--> quer dizer que conseguimos o value 

de 366.67,

que é o average 


da city de delhi....











--> MAS DEPOIS TEMOS O AVERAGE DE DALLAS,


QUE É OUTRO....





AVERAGE DE 266.67 









--> E O MESMO ACONTECE COM BERLIN,


AVERAGE DE 250...















QUER DIZER QUE FICAMOS COM 3 DIFERENTES AVERAGES...










--> O TAKEAWAY,

AQUI,

É QUE, 

NESSA SUBQUERY,







"""EVERY ROW GETS __EVALUATED__ 
INDEPENDENTLY"""










""SUBQUERY GETS EVALUATED __ FOR EVERY SINGLE ROW""...











OUTRA COISA QUE DEVEMOS SABER É QUE 








"""A CORRELATED SUBQUERY 
DOES ___ NOT ___ WORK _ INDEPENDENTLY""...





ISSO ACONTECE PQ, VEJA A EXPRESSAO:









SELECT AVG(sales) FROM employees e2 
WHERE e1.city=e2.city 









--> "e1.city=e2.city",



OU SEJA,


ESTAMOS 


FAZENDO 1 REFERENCIA A NOSSA OUTER QUERY,



A QUERY 



DE 


"select first_name, sales FROM employees e1"...













É POR ISSO QUE EXECUTAR APENAS A SUBQUERY É ALGO QUE NAO FUNCIONA,


VAI NOS DAR 1 ERROR MESSAGE..









OK... ESSA É A TEORIA SOBRE CORRELATED SUBQUERIES,

É UM POUCO COMPLEXA...







DEVEMOS ENTRAR NO PGADMIN E TESTAR ISSO....

















O PROFESSOR COLOCA 1 PRIMEIRO  EXEMPLO:












-- Correlated Subquery in WHERE 





-- Show only those payments that have the 
-- highest amount ___ per customer __








COMECAMOS ASSIM:







SELECT * 
FROM payment AS p1
WHERE amount = (
	SELECT MAX(amount)
	FROM payment AS p2
	WHERE p1.customer_id = p2.customer_id
)
ORDER BY amount DESC;










POR ALGUMA RAZAO, EU ACERTEI....



A CORRELATED SUBQUERY fica dentro do 

"()"...




o que importa é realmente o WHERE...













TEREMOS 1 CHALLENGE PARA TESTAR O QUE 

APRENDEMOS SOBRE ESSA CORRELATED SUBQUERY..
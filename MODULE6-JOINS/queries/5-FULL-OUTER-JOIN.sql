







agora devemos dar uma olhada no 

"full outer join"...








é parecido com o INNER JOIN,

MAS HÁ ALGUMAS DIFERENCAS...







------------------










o professor mostra o diagrama de venn,

de novo...















--> JÁ NO "FULL OUTER JOIN",


NÓS GANHAMOS 





TODOS OS ROWS __ DE AMBAS AS TABLES...






--> OU SEJA,




GANHAMOS ROWS ATÉ MESMO SE OS 

ROWS 


SÓ ESTAO PRESENTES EM 1 DAS TABLES... (ou seja,

ficamos com mtos null values)...









----------------------------






PARA COMPREENDERMOS UM POUCO MELHOR,


NOVAMENTE TEMOS AQUELE EXAMPLE:










1) SALES TABLE 



EMPLOYEE CITY SALES 

SANDRA    NY  1000
hugo      SP  2000
DENIS     AC  3000








2) BONUS TABLE





EMPLOYEE BONUS
SANDRA    YES
SIMON      NO






OU SEJA,


AGORA TEMOS 2 ROWS 


QUE NAO APARECEM NA TABLE "BONUS"...


E TEMOS 1 ROW, SIMON, QUE APARECE EM BONUS, MAS 
NAO APARECE EM "EMPLOYEES"..









O RESULTADO DO JOIN FICA ASSIM:





EMPLOYEE CITY SALES BONUS 

SANDRA    NY  1000   TRUE 
hugo      SP  2000   NULL 
DENIS     AC  3000  NULL
NULL     NULL NULL  NO








-----------------------------







é isso que acontece...



--> NO SIMON A "city" e "sales"

ficam null, isso faz sentido, sim...









--> MAS PQ DIABOS "SIMON" ficou como "null",

em vez de "simon"?








isso é um pouco surpreendente...











--> É PQ ESSA COLUMN É 

"sales.employee",


e nao "bonus.employee" (a table 

em que SIMON REALMENTE EXISTE, nessa column)...






QUER DIZER QUE O FORMATO COMPLETO SERIA ESTE:











bonus.EMPLOYEE sales.employee CITY SALES BONUS 

SANDRA          SANDRA          NY  1000   TRUE 
null            hugo            SP  2000   NULL 
null            DENIS           AC  3000  NULL
simon           NULL           NULL NULL  NO







ok.... 


QUER DIZER QUE TODOS OS ROWS VAO APARECER,


COM VÁRIOS NULL VALUES NOS FIELDS...










COM ISSO, TEMOS TODAS AS COLUMNS,


DE AMBAS TABLES,

COMBINADAS...







SE 



2 COLUMN TEM 1 MESMO NOME,


AS 2 COLUMN AINDA VAO APARECER 

NO OUTPUT,


MAS 

NESSE FORMATO AÍ (bonus.employee, sales.employee)....












--> PARA EVITAR DE CONSEGUIR TODAS 


AS COLUMNS EM 1 OUTPUT, PODEMOS FAZER 2 
COISAS DIFERENTES:


1) SELECIONAR APENAS 1 DAS COLUMNS REPETIDAS, NO SELECT (da table que desejarmos)



2) USAR A FUNCTION DE "COALESCE()",

PARA COALESCER (fundir) OS 
VALUES NULL COM OS VALUES PREENCHIDOS (
    overwrite dos values null com os values preenchidos....

)



TIPO COALESCE(<col1>, <col2>),

ETC...






----------------------------------------








AGORA DEVEMOS VER COMO ESSA SINTAXE FUNCIONA....








É TIPO ASSIM:











SELECT * FROM TABLE_A AS TAB_A
FULL OUTER JOIN TABLE_B AS TAB_B
ON TAB_A.employee = TAB_B.employee



------------------------------






ok... TODO O RESTO É IGUAL...





DEVEMOS VER ISSO EM 1 PRACTICAL EXAMPLE...










RODAMOS:







SELECT * FROM tickets;









SELECT * FROM boarding_passes;












PODEMOS RODAR 1 JOIN ENTRE OS 2....













TIPO ASSIM:









SELECT 
*
FROM boarding_passes AS bp
FULL OUTER JOIN tickets AS t
ON bp.ticket_no = t.ticket_no;











CERTO... MAS A CHALLENGE DO PROFESSOR É:




""FIND THE TICKETS THAT DON'T HAVE 

A BOARDING PASS RELATED TO IT!''








--> PARA ENCONTRARMOS 


ESSA INFORMACAO, BASTA USAR UM WHERE (filter)

PROCURANDO 



POR 


WHERE bp.ticket_no IS NULL,







TIPO ASSIM:







SELECT 
*
FROM boarding_passes AS bp
FULL OUTER JOIN tickets AS t
ON bp.ticket_no = t.ticket_no
WHERE bp.ticket_no IS NULL;
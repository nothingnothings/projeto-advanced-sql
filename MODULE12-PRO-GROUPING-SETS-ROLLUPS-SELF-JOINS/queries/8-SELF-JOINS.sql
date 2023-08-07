



NESSA LICAO, VEREMOS SELF-JOINS...












--> NAO É NADA DE NOVO,




MAS __ É UMA TECNICA QUE PODEMOS USAR 

SEMPRE QUE 

TEMOS UMA 



"SELF-REFERENCING COLUMN"


EM 1 TABLE...















COMO EXEMPLO DISSO, TEMOS A SEGUINTE TABLE:








employee_id     name        manager_id
1               Liam smith      null
2               Oliver brown    1 
3               Elijah jones     1
4               William Miller     1
5               James davis         2
6               Olivia Hernandez    2









------> A COLUMN DE MANAGER_ID 



SIMPLSEMENTE ESPECIFICA 

""QUEM É O MANAGER 

DESSE EMPLOYEE"" -------__> NO CASO,


ISSO ESTÁ REFERENCIANDO O EMPLOYEE_iD 


DESSA MESMA TABLE...







--> quer dizer que 
O "Liam Smith"

É O __ MANAGER DO OLIVER BROWN,

ELIJAH JONES E 

WILLIAM MILLER....













------> PARA JUNTAR ESSA INFO TODA,





TEREMOS DE USAR 1 JOIN __ COM __ A MESMA TABLE,



EM QUE SIMPLEMENTE FAZEMOS JOIN




DA COLUMN DE "manager_id" 


COM A COLUMN DE "employee_id"...







-->  COM ISSO, PODEMOS PEGAR A COLUMN DE "NAME"

dessa mesma table, para criar 1 column de "manager" no 

result set,
tipo assim:








    i----------------------------           
    i                           i
employee_id     name        manager_id      manager
1               Liam smith      null        null 
2               Oliver brown    1           Liam Smith
3               Elijah jones     1          Liam Smith
4               William Miller     1        Liam Smith
5               James davis         2       Oliver Brown
6               Olivia Hernandez    2       Oliver brown


















OK....







FAZ TOTAL SENTIDO...











ESSA É A IDEIA DE UM SELF-JOIN... NAO É NADA DE NOVO...







TEMOS QUE VER COMO ALCANCAR ESSE RESULTADO, NA PRÁTICA...









RESUMINDO:







1) O SELF-JOIN É 


SIMPLESMENTE UM JOIN COMUM,


MAS 1 JOIN COM A MESMA TABLE...






TIPO ASSIM:









SELECT 
t1.column1,
t2.column1

FROM employee t1 
LEFT JOIN employee t2 
ON t1.column1=t2.column1;










O QUE DEVEMOS TER CUIDADO É QUE,

SE ESTIVERMOS 



FAZENDO 1 SELF-JOIN,




DEVEMOS SEMPRE DAR ALIASES BONS 
a ESSA MESMA TABLE...








--> E É UMA BEST PRACTICE NOMEAR 



A MESMA TABLE COM NOMES DIFERENTES,



NOMES QUE DESCREVAM O PROPÓSITO DE CADA 

1 DAS REPRESENTACOES DESSA TABLE,

TIPO ASSIM:





SELECT 
emp.employee_id,
emp.name AS employee,
man.name AS manager
FROM employee AS emp
LEFT JOIN employee AS  man 
ON man.employee_id=emp.manager_id;

















OK.... AGORA QUEREMOS VER COMO TUDO ISSO FUNCIONA NA PRÁTICA,

NO PGADMIN...












O PROFESSOR CRIA 1 TABLE, DE NOME "employee",

COM ESTE CÓDIGO:









CREATE TABLE employee (
    employee_id INT,
    name VARCHAR(50),
    manager_id INT 
)



INSERT INTO employee 
VALUES
	(1, 'Liam Smith', NULL),
	(2, 'Oliver Brown', 1),
	(3, 'Elijah Jones', 1),
	(4, 'William Miller', 1),
	(5, 'James Davis', 2),
	(6, 'Olivia Hernandez', 2),
	(7, 'Emma Lopez', 2),
	(8, 'Sophia Andersen', 2),
	(9, 'Mia Lee', 3),
	(10, 'Ava Robinson', 3);










INSERIDOS ESSES 10 ROWS,



queremos 



RODAR 1 QUERY CONSIDERANDO ESSE SELF-JOIN...










TIPO ASSIM:










SELECT 
emp.employee_id,
emp.name AS employee_name,
man.name AS manager_name
FROM employee AS emp
LEFT JOIN employee AS man
ON emp.manager_id=man.employee_id;

















--> O PROFESSOR TAMBÉM COMPLEMENTA,

DIZ QUE PODERÍAMOS 

ATÉ MESMO CRIAR 1 SEGUNDO SELF-JOIN, AQUI...










--> POR EXEMPLO, QUEREMOS SABER 


O "manager_of_the_manager"...








--> para isso, devemos rodar um OUTRO JOIN,

dessa vez com 1 outro alias para essa table,




e com outro "ON",

tipo assim:






SELECT 
emp.employee_id,
emp.name AS employee_name,
man.name AS manager_name,
man_of_man.name AS manager_of_the_manager_name
FROM employee AS emp
LEFT JOIN employee AS man
ON emp.manager_id=man.employee_id
LEFT JOIN employee AS man_of_man
ON man.manager_id=man_of_man.employee_id;







OK... AGORA DEVEMOS PRATICAR...
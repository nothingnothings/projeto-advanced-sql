NA ÚLTIMA AULA VIMOS 



COMO FUNCIONA O OVERALL USER MANAGEMENT,



E COMO 


PDOEMOS CRIAR 


USERS E ROLES...












AGORA VEREMOS O QUE SAO OS PRIVILEGES,

E COMO OS CONCEDER..
















TENHO ESTE CÓDIGO, PARECIDO COM O DO SNOWFLAKE:






CREATE OR REPLACE USER Sarah
WITH PASSWORD='Sarah123';

CREATE OR REPLACE ROLE Analyst;

GRANT USAGE ON DATABASE exemplo TO ROLE Analyst;

USE DATABASE exemplo;

GRANT USAGE ON SCHEMA exemplo2 TO ROLE Analyst;

GRANT USAGE ON TABLE exemplo3 TO ROLE Analyst;

GRANT SELECT ON TABLE exemplo3 TO ROLE Analyst;

GRANT ROLE Analyst TO USER Sarah;













--> QUER DIZER QUE VAMOS 


CONCEDER 1 PRIVILEGE ESPECÍFICO A 1 ROLE/USER....










--> E PRIVILEGES SAO APLICÁVEIS EM:



1) TABLES 

2) SCHEMAS 

3) DATABASES...















--> EM GERAL, QUEREMOS MENCIONAR O PRIVILEGE DE "USAGE",

PQ 

ELE 

PERMITE QUE 


1 

GIVEN USER CONSIGA VER 



1 SCHEMA ESPECÍFICO,

E TODOS OS OBJECTS EXISTENTES DENTRO 

DESSE SCHEMA...
















-- POR DEFAULT,

TODOS OS USERS CRIADOS 


POSSUEM O PRIVILEGE DE USAGE 

NO SCHEMA DE "PUBLIC" -> mas em nenhum outro schema... 














--> TAMBÉM PODEMOS FAZER "GRANT" 

DE PERMISSIONS __ EM TODAS _AS TABLES EM 1 SCHEMA,








E TAMBÉM PODEMOS FAZER GRANT DE TODOS OS PRIVILEGES 



EM 1 GIVEN SCHEMA,


BASTA ESCREVER ASSIM:









GRANT ALL 
ON ALL TABLES IN SCHEMA schema_name
TO ROLE Analyst;



OU:





GRANT ALL 
ON ALL TABLES IN SCHEMA schema_name
TO nikolai;






















--> EM GERAL,

APENAS O SUPERUSER PODE CONCEDER PRIVILEGES 

A OUTROS USERS...










--> ENTRETANTO,


HÁ TAMBÉM OS OWNERS DOS OBJECTS (

    pessoas que criaram os objects
),

QUE TAMBÉM 

PODEM FAZER GRANT DE PRIVILEGES, A ESSE OBJECT,

EM OUTRAS PESSOAS...






















-> OK... MAIS 1 DETALHE....








--> NOS NOSSOS STATEMENTS DE "GRANT",


PODEMOS COLOCAR 

A 


OPTION DE 


"WITH GRANT OPTION"





TIPO ASSIM:













GRANT SELECT 
ON ALL TABLES IN SCHEMA schema_name 
TO nikolai WITH GRANT OPTION;








ISSO BASICAMENTE 


DÁ TAMBÉM O "PRIVILEGE DE DAR PRIVILEGES" (A esse object)


A ESSE USER AÍ...


















--> TAMBÉM PODEMOS__ FAZER REVOKE DE PRIVILEGES,


BASTA RODAR ASSIM:










REVOKE privilege (select, delete, update, usage)
ON database_object 
FROM USER | ROLE | PUBLIC;















--> OK... REVOGAMOS 1 PRIVILEGE DE 1 user/role....





















--> MAS PODEMOS SER MAIS ESPECÍFICOS AINDA,
PODEMOS 


COLOCAR "GRANTED BY USER | ROLE"...









TIPO ASSIM:










REVOKE privilege (select, delete, update, usage)
ON database_object 
FROM USER | ROLE | PUBLIC
GRANTED BY USER | ROLE;











(poedmos revogar direitos que foram concedidos 
por 1 user/role específico)...











POR FIM, PODEMOS REVOGAR TAMBÉM A OPTION DE "GRANT"


para os privileges que concedemos a outros users,

tipo assim:







REVOKE GRANT OPTION FOR privilege 
ON database_object 
FROM USER | ROLE | PUBLIC;











e também podemos colocar o granted by:




REVOKE GRANT OPTION FOR privilege 
ON database_object 
FROM USER | ROLE | PUBLIC
GRANTED BY USER | ROLE;







------------------------------------------



























OK... MAS AGORA VAMOS DEIXAR ISSO MAIS PRÁTICO...









OS PRIVILEGES IMPORTANTES SAO:












PRIVILEGE               APPLICABLE OBJECT TYPES



SELECT                 TABLE, VIEWS, table-like objects... also TABLE COLUMNS...

INSERT                  TABLE, table column

UPDATE                    TABLE, table column


DELETE                  TABLE


TRUNCATE                TABLE

CREATE                  DATABASE, SCHEMA

CONNECT                 DATABASE

EXECUTE                 FUNCTION, PROCEDURE

USAGE                   SCHEMA 























ISSO TUDO É INTUITIVO...


















OK, MAS QUAIS 


SAO OS PRIVILEGES MAIS USADOS E MAIS IMPORTANTES...








--> e como conferimos privileges..






é tipo assim:










1) CREATE USER 




CREATE USER 
WITH PASSWORD 'amar1234';








2) GRANT USAGE ON SCHEMA  (se schema nao for o 'PUBLic')...




GRANT USAGE 
ON SCHEMA name
to amar;








--> TEMOS QUE DAR GRANT DE USAGE EM 1 SCHEMA,
PARA QUE 
O USER CONSIGA 

PELO MENOS VER O SCHEMA, E VER OS DATABASE OBJECTS 

NO INTERIOR DESSE SCHEMA (
    caso contrário,
    o user nao vai 

    ver nem mesmo o schema,

    nem mesmo as tables....
)










3) GRANT SELECT E UPDATE, DELETE....







GRANT SELECT, UPDATE
ON customer 
TO amar;











4) TAMBÉM PODEMOS CONCEDER TODOS OS PRIVILEGES 

EM 1 SCHEMA,

TIPO ASSIM:







GRANT ALL 
ON ALL TABLES IN SCHEMA public 
TO amar;










5) MESMA COISA COM A DATABASE, DATABASE-LEVEL...








GRANT ALL 
ON DATABASE greencycles 
TO amar;












6) TAMBÉM PODEMOS CONCEDER 

(mas nao por default)


O PRIVILEGE DE CRIAR DATABASES:






GRANT "createdb"





TIPO ASSIM:







ALTER USER amar CREATEDB;







ISSO FAZ COM QUE ESSE USER 



CONSIGA CRIAR DATABASES....













-> PODEMOS CONFERIR ROLES A USERS,


TIPO ASSIM:








7) GRANT ROLE TO USER:





GRANT sarah TO amar;





GRANT analyst TO amar;










--> a sintaxe é parecida com a do SNOWFLAKE... (
    mas no snowflake temos a keyword de "ROLE"...
)


















8) TAMBÉM PODEMOS REVOKE PRIVILEGES ESPECÍFICOS 
DE USERS,



COM ESTE COMANDO:





-- REVOKE INSERT:



REVOKE INSERT ON customer FROM amar;









-- REVOKE ALL PRIVILEGES:

REVOKE ALL PRIVILEGES ON customer FROM PUBLIC;










-- REVOKE ROLE 

REVOKE analyst from amar;


















--> OK... AGORA DEVEMOS PRATICAR ESSE CONHECIMENTO,

COM O PGADMIN...





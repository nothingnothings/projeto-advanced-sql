









ok... agora sabemos o que sao views 

e materialized views,



e 



COMO PODEMOS 

AS CRIAR...












-> MAS, ANALOGAMENTE A 



TABLES,




PODEMOS TAMBÉM ALTERAR VIEWS,

E TAMBÉM AS DROPPAR...














PODEMOS RODAR:





1) ALTER VIEW 


2) DROP VIEW 


3) ALTER MATERIALIZED VIEW 


4) DROP MATERIALIZED VIEW












-> PODEMOS USAR ISSO PARA ALTERAR AS PROPRIEDADES 

DE 
1 


MATERIALIZED VIEW...













--> COM NORMAL VIEWS,

TEMOS 



A OPCAO DE RODAR:




5) CREATE OR REPLACE VIEW...








ESSA É UMA OPTION MT ÚTIL SE QUEREMOS 

MODIFICAR 1 VIEW 

INTEIRA...













MAS O CREATE E REPLACE VIEW 


NAO EXISTE 



PARA 


MATERIALIZED VIEWS...














--> PARA DROPPAR AS VIEWS,

RODAMOS:











DROP VIEW v_customer_anonymous;




DROP MATERIALIZED VIEW customer_anonymous;















--> MAS SE QUEREMOS ALTERAR 1 VIEW/MV 


rodamos assim:












ALTER VIEW customer_anonymous
RENAME TO v_customer_info;









ALTER VIEW v_customer_info 
RENAME COLUMN name TO customer_name;
















--> MAS SE QUEREMOS MUDAR O ACTUAL SELECT 

STATEMENT DE 1 VIEW,


DEVEMOS 



USAR 

O 

COMANDO DE 


"CREATE OR REPLACE VIEW v_customer_info 
AS new_query";

















--> CREATE OR REPLACE VIEW 


É UM COMANDO QUE FUNCIONA APENAS COM AS STANDARD 

VIEWS,
E QUE 


NAO FUNCIONA COM TABLES E MATERIALIZED VIEWS (

    apenas funciona no snowflake,
    no caso...
)








DEVEMOS APLICAR ISSO NA PRÓXIMA CHALLENGE...









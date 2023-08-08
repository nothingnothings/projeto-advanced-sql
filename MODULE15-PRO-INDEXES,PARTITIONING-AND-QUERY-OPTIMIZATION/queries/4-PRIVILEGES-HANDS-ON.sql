






AGORA TEREMOS 1 EXEMPLO PRÁTICO DE COMO PODEMOS CRIAR USERS,
ROLES E ASSIGNAR PRIVILEGES A ESSES ROLES..







--> NO FINAL, VEREMOS COMO PODEMOS ASSIGNAR ESSES ROLES A NOSSOS USERS....















--> COMECAMOS ASSIM:









-- Create users 

CREATE USER ria 
WITH PASSWORD 'ria123';



CREATE USER mike
WITH PASSWORD 'mike123';





-- Create role 

CREATE ROLE read_only;
CREATE ROLE read_update;








-- Assign privileges to roles 

GRANT USAGE ON SCHEMA public TO read_only;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO read_only;


GRANT USAGE ON SCHEMA public TO read_update;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO read_update;
GRANT UPDATE ON ALL TABLES IN SCHEMA public TO read_update;






-- Assign roles to users 

GRANT read_only TO mike;
GRANT read_update TO ria;










COM ISSO, MIKE SÓ PODERÁ 


LER/RODAR SELECT EM CIMA DAS TABLES,


UPDATES E DELETES NAO FUNCIONARAO..












-- Grant all privileges on all tables in public to role

GRANT ALL
ON ALL TABLES IN SCHEMA public 
TO read_update;


-- Revoke some privileges 
REVOKE DELETE, INSERT 
ON ALL TABLES IN SCHEMA public 
FROM read_update;



-- Assign role to users
GRANT read_update 
TO ria;





-- DROP roles 
DROP ROLE mike;












mas se tentarmos droppar o role de "read-update",



GANHAMOS 1 ERROR:




"ROLE READ_UPDATE CANNOT BE DROPPED 
BECAUSE SOME OBJECTS DEPEND ON IT"...




(

    quer dizer que 


    ESSE ROLE FOI ASSIGNADO A 1 USER,

    E ESSE USER CRIOU ALGUNS OBJECTS...
)










--> Para consertar esse problema,
podemos REMOVER ESSAS DEPENDENCIES DESSE ROLE,



com estes comandos:









-- REMOVING dependencies 
DROP OWNED BY read_update;
DROP ROLE read_update;












--> COM ISSO, TUDO QUE DEPENDE DESSE ROLE VAI SER DROPPADO...



--> AÍ PODEMOS DROPPAR ESSE ROLE...










--> ESSE FOI 1 EXEMPLO PRÁTICO DE COMO PODEMOS MANAGEAR 

NOSSOS USERS E PERMISSIONS...



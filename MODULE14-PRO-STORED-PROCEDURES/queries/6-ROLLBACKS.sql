




OK... MAS DIGAMOS QUE 



DURANTE O UPDATE,

PERCEBEMOS QUE OCORREU 1 MISTAKE,

ALGO N FOI UPDATADO CORRETAMENTE...









--> NESSAS SITUACOES,

PODEMOS USAR __ ROLLBACKS,


FEATURE ESPECIAL DAS TRANSACTIONS,
PARA REVERTER 


MISTAKES...






--> NA AULA ANTERIOR,

APRENDEMOS 



"BEGIN"


E 



"COMMIT"..











-> BEGIN E COMMIT SAO 2 

COMANDOS ESPECÍFICOS A TRANSACTION...











--> MAS ALÉM DE "BEGIN" E "COMMIT",


TEMOS UM TERCEIRO 

COMANDO,




QUE 

É O 


"ROLLBACK"...







ROLLBACK --> UNDOES EVERYTHING IN THE 
CURRENT TRANSACTION (within the current transaction 
) THAT 


HAS NOT BEEN COMMITTED YET ... --> PQ 




SE NÓS 


TIVERMOS COMMITADO ALGUMA TRANSACTION,




ELA NAO PODE SER ROLLBACKZADA...












--> MAS DENTRO DE 1 TRANSACTION QUE 

AINDA 

NAO COMMITAMOS,

PODEMOS 


__ FAZER_  ROLLBACK___ 


DE TODAS 


AS OPERATIONS EM 1 TRANSACTION.....




















--> MAS É CLARO QUE 1 USE-CASE É 




""TEMOS 20 OPERATIONS DENTRO DE 1 TRANSACTION,


MAS QUEREMOS FAZER ROLLBACK DE APENAS 5 DELAS""...













--> TIPO ASSIM:







BEGIN;

OPERATION1;
OPERATION2;
OPERATION3;
OPERATION4;
OPERATION5;


ROLLBACK;


COMMIT;


















--> SE QUEREMOS FAZER ROLLBACK ATÉ 


1 PONTO ESPECÍFICO 


DENTRO DE NOSSAS OPERATIONS,








TEMOS ESTES COMANDOS:




BEGIN;

OPERATION1;
OPERATION2;
SAVEPOINT op2;
OPERATION3;
OPERATION4;
OPERATION5;


ROLLBACK TO SAVEPOINT op2;


COMMIT;









-------> PODEMOS USAR 



"SAVEPOINTS",

basicamente....











COM OS SAVEPOINTS,


PODEMOS OS SETTAR E ENTAO 



PODEMOS ___ FAZER


ROLLBACK 


ATÉ 



ELES...

















--> OK... MAS É CLARO QUE 

O SAVEPOINT FUNCIONA APENAS 

DENTRO 
DE 
1 

"CURRENT TRANSACTION"...





uma vez commitada a transaction,

nao podemos retornar 


até o savepoint estipulado 



no código....












----> OK... TAMBÉM PODEMOS 


DELETAR _ 1 SAVEPOINT,






POR MEIO DO COMANDO "RELEASE SAVEPOINT <savepoint_name>",



TIPO ASSIM:









BEGIN;

OPERATION1;
OPERATION2;
SAVEPOINT op2;
OPERATION3;
SAVEPOINT op3;
OPERATION4;
OPERATION5;


RELEASE SAVEPOINT op3;

COMMIT;






















--> OK... POR FIM, O PROFESSOR APONTA QUE 



__ EXISTE__ 1 DIFERENCA 

ENTRE 



"ROLLBACK" (puro)



E 


"ROLLBACK TO <savepoint>"....








-------------------------------









DIFERENCA:







1) ROLLBACK PURO --> QUANDO FAZEMOS 1 ROLLBACK PURO,
EM CIMA DE 1 TRANSACTION,
ESSA 

TRANSACTION É __ IMEDIATAMENTE TERMINADA (ends transaction)..





"""ROLLBACK"" -> DEIXAMOS DE FICAR DENTRO 
DE NOSSA TRANSACTION, BASICAMENTE...











2) ROLLBACK TO SAVEPOINT --> QUANDO FAZEMOS 

"ROLLBACK TO <savepoint>",


NOSSA __ TRANSACTION _ NAO É 


TERMINADA (does not end transaction),



CONTINUAMOS 


DENTRO 


DE NOSSA CURRENT TRANSACTION,


A ÚNICA COISA QUE 

FIZEMOS 



É VOLTAR ATÉ 1 STEP EM QUE 
RODAMOS 
1 

CERTA OPERATION.... -------> E TODAS AS CHANGES 


ANTERIORES AINDA ESTARAO 


APLICADAS NA NOSSA SESSION... A PARTIR 


DESSE PONTO,

TEMOS 


3 OPCOES:






1) FECHAR A SESSION (acaba com a transaction, REVERTE
todas as changes)




2) COMMITAR AS CHANGES ATÉ ESSE PONTO;
ISSO VAI APLICAR AS OPERATIONS ANTES DESSE SAVEPOINT 
A QUE VC FEZ ROLLBACK, MAS NAO VAI APLICAR AS OPERATIONS 
QUE OCORREM DEOPIS...



3) RODAR "ROLLBACK" PURO,

PARA REVERTER TODAS AS CHANGES


e acabar com a transaction...


















--> É ASSIM QUE PODEMOS CONTROLAR NOSSAS 
TRANSACTIONS....





---------------------------------















devemos ter 1 exemplo prático...










COMECAMOS NOSSA TRANSACTION ASSIM:








SELECT * FROM acc_balance



-- start transaction 
BEGIN;

-- 1st operation
UPDATE acc_balance
SET amount = amount - 100
WHERE id=1;


-- 2nd operation 
UPDATE acc_balance 
SET amount= amount + 100
WHERE id=2;

-- 3rd operation (unwanted delete)
DELETE FROM acc_balance
WHERE id=3;



-- end transaction and COMMIT CHANGES
-- COMMIT;






COMECAMOS A TRANSACTION, SIM,
E AÍ 


DIGAMOS 



QUE, SEM QUERER,
DELETAMOS 1 ROW (

    a 3rd operation
)...















--> SE ISSO ACONTECEU,



E SE AINDA NAO COMMITAMOS A CHANGE,

O QUE PODEMOS FAZER 


É 


RODAR "ROLLBACK",




PARA AÍ REVERTERMOS A CHANGE...









--> E ISSO VAI REVERTER __ TODAS AS CHANGES, NO CASO,



FICAREMOS COM O STATE DA DB ANTES 

DE COMECARMOS 

A TRANSACTION...




TIPO ASSIM:




SELECT * FROM acc_balance



-- start transaction 
BEGIN;

-- 1st operation
UPDATE acc_balance
SET amount = amount - 100
WHERE id=1;


-- 2nd operation 
UPDATE acc_balance 
SET amount= amount + 100
WHERE id=2;

-- 3rd operation (unwanted delete)
DELETE FROM acc_balance
WHERE id=3;

-- reverts the db to a state before the transaction, and reverts the deletion (one of the steps in the transaction)...
ROLLBACK


-- end transaction and COMMIT CHANGES
-- COMMIT;




















--> ALTERNATIVAMENTE,

SE ___sABEMOS__ QUE 1 PARTE DA OPERATION É PERIGOSA,


PODEMOS COLOCAR 1 

SAVEPOINT,

tipo assim:





SELECT * FROM acc_balance



-- start transaction 
BEGIN;

-- 1st operation
UPDATE acc_balance
SET amount = amount - 100
WHERE id=1;


-- 2nd operation 
UPDATE acc_balance 
SET amount= amount + 100
WHERE id=2;

SAVEPOINT s1;

-- 3rd operation (unwanted delete)
DELETE FROM acc_balance
WHERE id=3;

-- reverts the db to a state before the transaction, and reverts the deletion (one of the steps in the transaction)...
ROLLBACK


-- end transaction and COMMIT CHANGES
-- COMMIT;



















COM ISSO, COM A EXISTENCIA 
DESSE SAVEPOINT,

PODEMOS DEIXAR DE FAZER O ROLLBACK PURO,

PARA ENTAO FAZER ROLLBACK A ESSE PONTO ESPECÍFICO...









EX:









SELECT * FROM acc_balance



-- start transaction 
BEGIN;

-- 1st operation
UPDATE acc_balance
SET amount = amount - 100
WHERE id=1;


-- 2nd operation 
UPDATE acc_balance 
SET amount= amount + 100
WHERE id=2;

SAVEPOINT s1;

-- 3rd operation (unwanted delete)
DELETE FROM acc_balance
WHERE id=3;

-- reverts the db to THE S1 SAVEPOINT.
ROLLBACK TO s1;


-- end transaction and COMMIT CHANGES
-- COMMIT;















MAS É CLARO QUE AINDA FICAREMOS DENTRO 

DA TRANSACTION,





MESMO COM ESSE ROLLBACK...






PQ O "ROLLBACK TO"



AINDA NOS POSICIONA DENTRO DA 

TRANSACTION....








AÍ PODEMOS OU RODAR 


"ROLLBACK" (puro),

PARA CANCELAR TUDO,


OU 


"COMMIT", PARA APLICAR 

APENAS AS STEPS ATÉ O 

SAVEPOINT...




















NAS AULAS ANTERIORES,




APRENDEMOS SOBRE 

""USER-DEFINED FUNCTIONS"",


QUE SAO 


FUNCTIONS CRIADAS 

POR MEIO DESTA SINTAXE:













CREATE FUNCTION <function_name> (

)

$$



$$














--> OK...













MAS UMA GRANDE DESVANTAGEM 


DE USER-DEFINED FUNCTIONS É QUE 


_ ELAS_ NAO SAO CAPAZES 



DE 




EXECUTAR TRANSACTIONS...














--> QUER DIZER QUE OS COMANDOS DE 

"BEGIN;"



"COMMIT;"


E 

"ROLLBACK"


NAO FUNCIONAM NO INTERIOR DE FUNCTIONS...







É POR ISSO QUE AÍ, NESSES CASOS,


EM QUE 



PRECISAMOS USAR TRANSACTIONS,










PRECISAMOS 





CRIAR E USAR PROCEDURES...










A SINTAXE 



DAS PROCEDURES É BEM PARECIDA 


COM A SINTAXE DAS FUNCTIONS...

















--> SAO CRIADAS ASSIM:















CREATE OR REPLACE PROCEDURE <procedure_name> (
    arg1 DATA_tYPE, arg2 DATA_tYPE
)





















---> DEPOIS DISSO, COLOCAMOS 

AS OPTIONS/COISAS DA PROCEDURE....



--> AS PROCEDURES SAO MT PARECIDAS


COM USER-DEFINED FUNCTIONS,
EM QUESTAO DE SINTAXE...








ex:








CREATE OR REPLACE PROCEDURE <procedure_name> (
    arg1 DATA_tYPE, arg2 DATA_tYPE
)
    LANGUAGE plpgsql
    AS 
    $$
    DECLARE 
        <variable_declaration> <data_type>
    BEGIN;
        <procedure_definition>
    END;

    $$


















--> A ÚNICA DIFERENCA QUE ENCONTRAMOS,
AQUI,



EM RELACAO A USER-DEFINED FUNCTIONS,



é 


a ESTIPULACAO 

DO "RETURNS <data_type>"..














ISSO ACONTECE JUSTAMENTE PQ 

A STORED PROCEDURE 


NAO RETORNA 1 VALUE (nao é exatamente como 

USER-DEFINED FUNCTIONS, portanto)...





















QUER DIZER QUE, EM STORED PROCEDURES,


NADA É RETORNADO...

















-> ENTRETANTO, PODEMOS USAR 

"return" com nada, nas stored procedures --> 


se fizermos isso,


ISSO VAI IMEDIATAMENTE  PARAR A STORED PROCEDURE...






















--> TEMOS 1 EXEMPLO:





id  first_name      last_name       amount
1   Max                 Brown       2500.00
2   Sandra              Miller      1600.00

















--> DIGAMOS QUE QUEREMOS FAZER 1 BANK TRANSFER 
COM 1 TRANSACTION...








--> TRANSFERIR 1 VALUE 



DE "MAX" A SANDRA... -> E TUDO ISSO 

deve 

ser considerado como 1 única unit of work...









MAS NAO QUEREMOS FAZER TUDO ISSO MANUALMENTE...








--> O QUE QUEREMOS FAZER É SIMPLESMENTE 

ESPECIFICAR,

NA STORED PROCEDURE,


O "AMOUNT" QUE DEVE SER 

TRANSFERIDO,

E DE QUE 

CONTA PARA QUE CONTA 


O AMOUNT DEVE SER TRANSFERIDO....









--> COM ISSO,

TEMOS 1 COMPLETE STORED PROCEDURE,


QUE VAI 

FAZER ESSA 



BANK TRANSFER PARA NÓS,



DEIXANDO A NÓS APENAS A TAREFA DE 

PASSAR OS PARAMETERS...

















--> COMO EXEMPLO DE STORED PROCEDURE,

TEMOS:















CREATE PROCEDURE bank_transfer (
    transfer_amount INT,
    sender_id INT,
    recipient_id INT
)
LANGUAGE plpgsql
AS 
$$


BEGIN 
--1st - subtract from sender's balance 
UPDATE acc_balance
SET amount=amount-transfer_amount
WHERE id=sender_id;


-- 2nd - add to recipient's balance
UPDATE acc_balance
SET amount=amount + transfer_amount
WHERE id=recipient_id;


COMMIT;
END;
$$















OK... AGORA SE QUISERMOS _ CHAMAR __ ESSA 

PROCEDURE,

NAO VAMOS A EXECUTAR COMO UMA FUNCTION,


E SIM 

VAMOS A EXECUTAR


COM 













CALL <stored_procedure_name> (arg1, arg2, ...);










TIPO ASSIM:











CALL bank_transfer(1000, 1, 2);
















---> OK... QUER DIZER QUE PRECISAMOS DA KEYWORD 


DE 

"CALL"...














nossa stored procedure tem esta estrutura:







bank_transfer(transfer_amount, sender_id, recipient_id);











--> COM ISSO,

NOSSO VALUE TERÁ SIDO TRANSFERIDO,

COM NOSSA 

STORED PROCEDURE...















PARA TESTAR ISSO,


O PROFESSOR ESCREVE:











CREATE PROCEDURE bank_transfer (
    transfer_amount INT,
    sender_id INT,
    recipient_id INT
)
LANGUAGE plpgsql
AS 
$$


BEGIN 
--1st - subtract from sender's balance 
UPDATE acc_balance
SET amount=amount-transfer_amount
WHERE id=sender_id;


-- 2nd - add to recipient's balance
UPDATE acc_balance
SET amount=amount + transfer_amount
WHERE id=recipient_id;


COMMIT;
END;
$$










CALL bank_transfer(1000, 1, 2);













OK... ISSO FUNCIONOU...








AS PROCEDURES TAMBÉM APARECEM 

COMO OBJECTS NOS NOSSOS SCHEMAS...











OK... É ASSIM QUE PODEMOS DEFINIR 
E CHAMAR 1 STORED PROCEDURE....






AGORA DEVEMOS VER A CHALLENGE...
























VAMOS APLICAR TUDO ISSO...

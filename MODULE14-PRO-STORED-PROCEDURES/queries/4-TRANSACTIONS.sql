


EM DATABASES,


ÀS VEZES É IMPORTANTE TRABALHAR COM "TRANSACTIONS"..












-_> UMA TRANSACTION É SIMPLESMENTE 


1 


"""UNIT OF WORK""...






E UMA GIVEN "UNIT OF WORK"







PODE SER COMPREENDIDA POR 1 OU MAIS 


OPERATIONS...















--> UM EXEMPLO DE TRANSACTION É UMA 

TRANSFERENCIA BANCÁRIA... -> ISSO PQ 

QUEREMOS 



__MOVER 1 QUANTIA (remover 1 certa quantia)



DE 1 ROW, EM ALGUMA TABLE,




PARA 1 ROW EM OUTRA TABLE (ou na mesma table)...









QUEREMOS 


MOVE 100 dolares de 1 conta para _ OUTRA 


CONTA...













--> QUER DIZER QUE NAO QUEREMOS UPDATAR 


OS 

VALUES 1 POR 1,



1 de cada vez...










--> QUEREMOS QUE __ TUDO ISSO ACONTECA 


DE 1 VEZ SÓ,





como "ONE SINGLE UNIT OF WORK"...
















OK... FAZ TOTAL SENTIDO... ESSAS 

ACOES (a remocao de dinheiro de 1 conta,
insercao na outra) NAO 

PODEM ACONTECER INSTANTANEAMENTE...
















--> ESSA É UMA DAS RAZOES 

DE BANCOS USAREM SQL...




















--> COMO ESCREVEMOS UMA TRANSACTION?










PRECISAMOS DA KEYWORD 



"BEGIN TRANSACTION"...













--> PODEMOS ESCREVER 


"BEGIN WORK",

também...














NA VERDADE,


TEMOS 3 OPCOES PARA COMECAR 1 TRANSACTION:








1) BEGIN TRANSACTION 



2) BEGIN WORK 




3) BEGIN (só "BEGIN" funciona, tambeḿ)...


















OK... ASSIM QUE COMECAMOS NOSSA TRANSACTION,

PODEMOS 



COMECAR __ NOSSAS OPERATIONS..













TIPO ASSIM:






BEGIN 


OPERATION1;
OPERATION2;











TIPO ASSIM:







BEGIN 

SELECT * FROM dummy;
DELETE FROM dummy 
WHERE id=x;
















--> OK... MAS SE AINDA NAO TIVERMOS COMITTADO 

ESSA TRANSACTION, 


ELA NAO SERÁ VISÍVEL EM OUTRAS SESSIONS (
    e.g. OTHER USERS...
)










--> isso significa que 



outros users 


NAO VERAO 
ESSA TRANSACTION...













1 SESSION --> NÓS, COMO USERS,
ABRIMOS 

A QUERY TOOL NA WINDOW...---> E, SE 

ABRIMOS 
A QUERY TOOL EM OUTRA WINDOW,


SERÁ OUTRA SESSION... (mesmo se

somos o mesmo user)..














--> E O IMPORTANTE SOBRE 

TRANSACTIONS É QUE 


__ SE ELAS NAO FOREM COMMITADAS,

ELAS 


SÓ PODERAO 

SER VISUALIZADAS 


NA NOSSA CURRENT SESSION (


QUER DIZER QUE NENHUM RESULTADO TERÁ 
SIDO APLICADO, INICIALMENTE...
)













--> DEPOIS DE EXECUTARMOS A TRANSACTION,



SE ESTAMOS FELIZES COM O RESULTADO 

OBTIDO,


PODEMOS 


RODAR 



"COMMIT",

PARA COMITAR E APLICAR ESSAS CHANGES...






EX:





BEGIN;


OPERATION1;
OPERATION2;



COMMIT;
















COM O COMMIT, AS OPERATIONS


PASSAM A SER APLICADAS AOS OUTROS USERS,


SURTEM EFEITOS...

















-> PARA VISUALIZAR ISSO,


VAMOS NO 

PGADMIN 



E 



VAMOS 

IMPLEMENTAR
 
 ESSE "BANK TRANSFER",



 JUSTAMENTE PARA DEMONSTRAR O FUNCIONAMENTO 


 DE 
 


 TRANSACTIONS....









 FAZEMOS TIPO ASSIM:













 CREATE TABLE acc_balance (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    amount DEC(9,2) NOT NULL
 );




INSERT INTO acc_balance
VALUES 
(1,'Tim','Brown',2500),
(2,'Sandra','Miller',1600)

SELECT * FROM acc_balance;
















--> CERTO.... FAZEMOS ISSO PARA TER 2 

CONTAS, NESSA TABLE DE 

acc_balance..





















OK....









AGORA VEREMOS COMO FUNCIONAM TRANSACTIONS..













PODEMOS ESCREVER ASSIM:








BEGIN;


DELETE FROM xxx 
UPDATE xxxx 




COMMIT;



















--> OK... O PROFESSOR QUER FAZER 1 TRANSFER 

ENTRE ESSAS 2 CONTAS...








COMECAMOS A TRANSACTION COM "BEGIN"...







ex:






-- start transaction 
BEGIN;

-- 1st operation
UPDATE acc_balance
SET amount = amount - 100
WHERE id=1;


-- 2nd operation 




-- end transaction and COMMIT CHANGES
COMMIT;




















--> AGORA, SE VISUALIZARMOS ESSA TABLE 



ENQUANTO ESTAMOS NESSA SESSION,


VEREMOS QUE AS CHANGES 

TERAO 

SIDO APLICADAS (

    pq os efeitos da transaction sao 
    aplicados SOMENTE

    NA NOSSA CURRENT SESSION, E NAO 

    NAS OUTRAS SESSIONS/USERS 

    rodando na database... se desejamos que 
    os efeitos 

    sejam aplicados 

    aos outros users/database inteira,

    devemos 
    rodar 

    "COMMIT;" DEPOIS DE NOSSAS OPERATIONS...
)














-> PQ SE ABRIRMOS ESSA TABLE EM UMA OUTRA 

QUERY,


NOSSA TRANSACTION AINDA NAO TERÁ SIDO COMITADA,


AS CHANGES 

NAO APARECERAO... (pq nao foi comittada)...

























--> AGORA DIGAMOS QUE DESEJAMOS 

ADICIONAR 100 À OUTRA CONTA, como 1 
das STEPS dessa transaction....





TIPO ASSIM:









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



-- end transaction and COMMIT CHANGES
COMMIT;















--> OK.... MAS SABEMOS QUE ESSES EFEITOS SÓ SERAO VISTOS 

NAS OUTRAS SESSIONS/DATABASE INTEIRA 



SE FOREM COMMITADOS,

SE ESSA TRANSACTION FOR COMMITADA...











É ASSIM QUE PODEMOS USAR TRANSACTIONS 

PARA 

FORMAR "uNITS OF WORK",

compostas por operations que devem 

pertencer em 1 conjunto,
e que 

só 



possuem efeitos na database 

quando os commitamos...










--> MAIS TARDE VEREMOS QUE 


TRANSACTIONS TAMBÉM SAO UTEIS POR CONTA 

DE 

"rOLLBACKS">..













mas agora vamos praticar transactions...
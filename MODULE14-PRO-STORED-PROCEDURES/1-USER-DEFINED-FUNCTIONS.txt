




A FUNCIONALIDADE BASE DO 


SQL PODE SER ESTENDIDA... TUDO POR MEIO 

DO USO 


DE "USER-DEFINED FUNCTIONS"...










--> MAIS TARDE FALAREMOS SOBRE STORED PROCEDURES,


QUE SAO ALGO MT PARECIDO COM USER-DEFINED FUNCTIONS,


mas depois veremos isso...











--> POR ENQUANTO, BASTA SABER QUE 


PODEMOS ESTENDER A FUNCIONALIDADE 

DO SQL COM 


USER-DEFINED FUNCTIONS,


PARA RODAR 


CUSTOM CALCULATIONS MAIS COMPLEXAS..












-- PARA ESSAS FUNCTIONS,

NÓS TIPICAMENTE USAMOS 

SQL,



OU, RECOMENDADO,




USAR "PL/PGSQL"...












--> PL/PGSQL --> É UMA VERSAO EXTENDIDA 

DO 

SQL, E QUE SIMPLESMENTE TEM 

UMA MELHOR PERFORMANCE (

    nas user-defined functions e stored procedures...
)












--> ADICIONALMENTE,

PODEMOS USAR "SANDBOX LANGUAGES",


COMO PYTHON E C,



para rodar essas user-defined functions....








--> MAS PYTHON E C SAO CHAMADAS 




""UNSAFE LANGUAGES"",



JUSTAMENTE PQ 


SOMOS FORÇADOS 

A 

ACESSAR ALGUNS EXTERNAL RESOURCES,



E ISSO 



NOS DEIXA BYPASSAR CERTAS SECURITIES....















--> UNSAFE LANGUAGES --> DEVEMOS TER MT CUIDADO....












--> É MELHOR USAR APENAS O PL/PGSQL,



PQ AÍ 


FICAMOS CONTIDOS DENTRO DO AMBIENTE DA DATABASE...
















-> OK, MAS COMO FUNCIONAM ESSAS FUNCTIONS?












--> SUA SINTAXE É ASSIM:









CREATE FUNCTION <function_name> (
    param1, param2 
);









--> OK. NOS PARENTESES JÁ PODEMOS 



COLOCAR OS PARAMETROS DA FUNCTION...










TAMBÉM PODEMOS USAR CREATE OR REPLACE,

TIPO ASSIM:







CREATE OR REPLACE FUNCTION <function_name> (
    param1, param2 
)













-> MAS DEPOIS 


DA DEFINICAO DOS PARAMETERS,


DEVEMOS SEMPRE DEFINIR 



"RETURNS + DATA_TYPE_RETORNADO_POR_ESSA_fUNCTION"...














OU SEJA,

TIPO ASSIM:




CREATE OR REPLACE FUNCTION <function_name> (
    param1, param2, ...
)
RETURNS return_datatype 
LANGUAGE plpgsql  -- (ESSE É O STANDARD)....



















EM "lANGUAGE", podemos usar também 

c, python, mas tipicamente 


COLOCAMOS 

"plpgsql",



que é 


a language default, mais usada..













DEPOIS DISSO,



TEMOS O BODY DA FUNCTION,

QUE É ESCRITO USANDO 

"AS",


tipo assim






CREATE OR REPLACE FUNCTION <function_name> (
    param1, param2, ...
)
    RETURNS return_datatype 
    LANGUAGE plpgsql
AS

















--> DEPOIS DO "AS",



temos que escrever "$$    $$",




E ENTAO 


INSERIR 


O BODY DE NOSSA FUNCTION, NO INTERIOR 



DESSES $....






EX:












CREATE OR REPLACE FUNCTION <function_name> (
    param1, param2, ...
)
    RETURNS return_datatype 
    LANGUAGE plpgsql
AS
    $$


    LÓGICA



    $$

















--> CERTO.... E, DENTRO DESSE BODY,




podemos:







1) DECLARAR VARIABLES,

com 

""DECLARE 
        <variable_declaration>""





2) ESCREVER O FUNCTION BODY/LÓGICA,

comecando com "BEGIN
                    <function_definition>"








3) TERMINAR A PARTE DA LÓGICA,
com 

o termo "END;"






EX:
















CREATE OR REPLACE FUNCTION <function_name> (
    param1, param2, ...
)
    RETURNS return_datatype 
    LANGUAGE plpgsql
AS
    $$
        DECLARE 
            <variable_declaration>;


        BEGIN
            <function_definition>;
        END;
    $$




















-----> OK... DIGAMOS QUE QUEREMOS CRIAR 1 FUNCTION 


QUE ACEITA/EXIGE 2 ARGUMENTOS...










TIPO ASSIM:






SELECT first_function(3,4);







--> DIGAMOS QUE ESSA FUNCTION PEGA OS 2 
PARAMETERS E OS SOMA EM 1 NUMBER SÓ, E ENTAO ACRESCENTA 
+3 A ESSE RESULTADO (valor fixo)...







EM "DECLARE",


podemos declarar a variável "arg3"...



--> PARA ISSO, ESCREVERÍAMOS ASSIM:















CREATE OR REPLACE FUNCTION first_function (
    arg1 INT, arg2 INT  --especificamos também o data type de cada param.
)
    RETURNS INT -- especificamos o que deverá ser retornado.
    LANGUAGE plpgsql
AS
    $$
        DECLARE 
            arg3 INT;
        BEGIN
          SELECT arg1 + arg2 + 3;
        END;
    $$





















OK... MAS NAO ACABAMOS..... 



AQUILO É UM SELECT NORMAL,


ENCERRADO COM 1 SEMI-COLON (SELECT arg1 + arg2 + 3)...





--> MAS PRECISAMOS COLOCAR ESSE RESULTADO 

EM ALGUMA COISA, EM ALGUMA VARIABLE,


por isso escrevemos "INTO arg3"....








POR FIM, RETORNAMOS ESSA VARIABLE/VALUE,

com 


"RETURN arg3"...





ex:








CREATE OR REPLACE FUNCTION first_function (
    arg1 INT, arg2 INT  --especificamos também o data type de cada param.
)
    RETURNS INT -- especificamos o que deverá ser retornado.
    LANGUAGE plpgsql
AS
    $$
        DECLARE 
            arg3 INT;
        BEGIN
          SELECT arg1 + arg2 + 3
          INTO arg3;

          RETURN arg3;
        END;
    $$














QUER DIZER QUE ARMAZENAMOS 




O RESULT DO SELECT NESSA VARIABLE DE "arg3",


para entao 


retornar 

essa variable..













OK.... COMECAMOS E TERMINAMOS NOSSA FUNCTION 
DEFINITION...














--> MAS AGORA QUEREMOS 



VER ISSO 



EM ACAO....




MAIS TARDE TEREMOS 1 CHALLENGE PARA ESCREVERMOS 


1 FUNCTION POR CONTA PRÓPRIA..






SINTAXE BÁSICA:











CREATE TABLE <table_name> (
    id SERIAL PRIMARY KEY,
    col1 TEXT,
    col2 INT,
    col3 DATE,
    col4 BOOLEAN
);














--> OK... O PROFESSOR FALA SOBRE ESSE COMANDO...









ELE É UTILIZADO PARA DEFINIR TABLES NA NOSSA 

DATABASE...













CREATE TABLE <table_name> (
    column_name TYPE,
    column_name TYPE
)













-> CREATE TABLE staff (
    staff_id INT,
    name VARCHAR(50)
);


















--> PODEMOS USAR CONSTRAINTS TAMBÉM NA TABLE CREATION:




CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);















--> O MELHOR DATA TYPE 
PARA A PRIMARY KEY É O "SERIAL",

PQ ELE _ INCREMENTA 

VALEUS AUTOMATICAMENTE,

1
 POR 1 ...
















E PODEMOS COMBINAR MÚLTIPLAS 



CONSTRAINTS,

TIPO ASSIM:







CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);















TAMBÉM PODEMOS COLOCAR 1 CONSTRAINT EM MÚLTIPLAS 

COLUMNS,


BASTA ESCREVER ASSIM:












CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
    UNIQUE(name, staff_id)
);






















OK... MAS AGORA QUEREMOS PRATICAR ISSO....











--> DIGAMOS QUE QUEREMOS CRIAR 1 TABLE ADICIONAL 


"director"...












--> ESCREVEMOS ASSIM:










CREATE TABLE director (
    director_id SERIAL PRIMARY KEY,
    director_account_name VARCHAR(20) UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50) DEFAULT 'Not specified',
    date_of_birth DATE,
    address_id INT REFERENCES address(address_id)
);














OK... JÁ TEMOS ALGUMAS CONSTRAINTS USADAS...




A ÚLTIMA COLUMN 


É 1 FOREIGN KEY,


FOREIGN KEY QUE CONECTA ESSA TABLE 

à TABLE DE "address"...


















---> PODEMOS CLICAR NAS TABLES,


APERTAR REFRESH,


E AÍ 




PDEMOS 



VER TODAS AS CONSTRAINTS 





DE CADA 




TABLE...









--> address_id_fkey --> É A NOSSA FOREIGN COLUMN...






-> SE CLICAMOS NISSO, PODEMOS COLOCAR EM PROPRIEDADES,



E VISUALIZAR 


QUAL COLUMN,

DE QUAL TABLE,
ESTÁ SENDO REFERENCIADA....









É ASSIM QUE PODEMOS CRIAR 



TABLES, SET DATA TYPES 


E DEFINIR CONSTRAINTS..










VEREMOS ISSO NA PRÓXIMA CHALLENGE...







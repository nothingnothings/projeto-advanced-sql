










-> VIMOS QUE PODEMOS DEFINIR TABLE PROPERTIES (constraints,
data types, etc)...










--> BEM, TODAS ESSAS PROPERTIES PODEM 

SER ALTERADAS/MODIFICADAS DEPOIS...












--> ISSO QUER DIZER QUE PODEMOS:





1) ADD, DELETE columns 




2) ADD, DROP constraints 



3) RENAME columns... (ou a table inteira)...





4) ALTER data types..















-->  A SINTAXE PARA ISSO É BEM SIMPLES:






ALTER TABLE<table_name>
ALTER_ACTION













POR EXEMPLO, PODEMOS DROPPAR 1 COLUMN, TIPO ASSIM:








ALTER TABLE <table_name>
DROP COLUMN <col-name>







EX:







ALTER TABLE staff 
DROP COLUMN IF EXISTS first_name;











--> COM "IF EXISTS",



CONSEGUIMOS PREVENIR O THROW DE 1 ERROR ....









--> PQ COM O THROW DE 1 ERROR,


OPERATIONS SAO INTERROMPIDAS...







--> MAS COM "IF EXISTS",



A OPERATION INTEIRA NAO É INTERROMPIDA,

E SIM UM MERO 


AVISO É THROWN...















--> TAMBÉM PODEMOS __ ADICIONAR 1 COLUMN 

EM 1 TABLE,



BASTA 



ESCREVER ASSIM:










ALTER TABLE staff 
ADD COLUMN IF NOT EXISTS date of birth DATE;










------------------------












TAMBÉM PODEMOS TROCAR O DATA TYPE 

DE 1 COLUMN EM 1 TABLE,


BASTA ESCREVER ASSIM:









ALTER TABLE staff 
ALTER COLUMN address_id TYPE SMALLINT

















--> TAMBÉM PODEMOS RENOMEAR UMA COLUMN,


tipo assim:








ALTER TABLE staff 
RENAME COLUMN <old_col_name> TO <new_col_name>;


















-> TAMBÉM PODEMOS __ ADICIONAR NOVAS CONSTRAINTS 


EM COLUMNS,

TIPO ASSIM:








ALTER TABLE staff
ALTER COLUMN store_id SET DEFAULT NULL;
















--> TAMBÉM PODEMOS DROPPAR CONSTRAINTS...







EX:







ALTER TABLE staff 
ALTER COLUMN example_col DROP NOT NULL;

















--> PODEMOS TAMBÉM 

ADICIONAR TABLE CONSTRAINTS POR MEIO DO COMANDO 

DE 

ALTER...







EX:






ALTER TABLE table_name 
ADD CONSTRAINT name_of_constraint
UNIQUE(col1, col2, col3);











OK...









POR FIM, PODEMOS TAMBÉM ADICIONAR PRIMARY KEYS 


EM 

TABLES JÁ EXISTENTES,

TIPO ASSIM:










ALTER TABLE <table_name>
ADD CONSTRAINT <name_of_constraint>,
ADD PRIMARY KEY(col1, col2);















--> O COMANDO DE ALTER TABLE É 


ÚTIL PQ PODEMOS ADICIONAR MODIFICACOES 

TODAS EM 1 ÚNICO COMANDO,


TIPO ASSIM:














ALTER TABLE director
ALTER COLUMN director_account_name SET DEFAULT 3,
ALTER COLUMN first_name TYPE TEXT,
ALTER COLUMN last_name TYPE TEXT,
ADD COLUMN middle_name TEXT,
ADD CONSTRAINT constraint_1 UNIQUE(account_name);















--> POR ISSO QUE É ÚTIL O "IF NOT EXISTS"


NESSES COMANDOS,
PQ 



AÍ 


 O COMANDO INTEIRO NAO VAI SER INTERROMPIDO,


EM CASO DE ERRORS..












--> E ESSAS ACTION STEPS PODEMOS 


COMBINAR SEMPRE...








--> A ÚNICA EXCECAO É O COMANDO DE "RENAME",

QUE DEVE SER 


EXECUTADO STANDALONE...












--> TAMBÉM PODEMOS RENOMEAR TABLES,



COM ESTA SINTAXE:









ALTER TABLE director 
RENAME director_table;











OK....







QUER DIZER QUE TEMOS ESTES COMANDOS/OPCOES,

DENTRO DO ALTER TABLE:




1) DROP 

2) ADD 


3) TYPE 


4) RENAME 


5) DEFAULT (constraint)

6) NOT NULL (constraint)


7) TABLE CONSTRAINT 



8) PRIMARY KEY (constraint) 



9) check constraint...













AGORA DEVEMOS VER ISSO COM 1 CHALLENGE,

NO PGADMIN...









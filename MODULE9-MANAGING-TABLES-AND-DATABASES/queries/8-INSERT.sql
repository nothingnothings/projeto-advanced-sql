









AGORA QUEREMOS SABER COMO PODEMOS 

INSERIR DATA NA NOSSA TABLE..













--> PARA ISSO,

PRECISAMOS DO COMANDO:















INSERT INTO <table_name>

VALUES (
    val1,
    val2,
    val3,
    val4
);



















no caso, temos a table 


com transaction_id, customer_id, film_id,
amount,

promotion...














EX:







INSERT INTO online_sales 
VALUES (
    1,269, 13, 10.99, 'BUNDLE2022'
);











É CLARO QUE OS DATA TYPES DEVEM SER MATCHING...











PODEMOS TAMBÉM INSERIR FORA DE ORDEM,




OU INSERIR APENAS VALUES EM COLUMNS ESPECÍFICAS 
(sem inserir ids, por exemplo)...










TIPO ASSIM:












INSERT INTO online_sales
(customer_id, film_id, amount)
VALUES (269, 13, 10.99);











--> OK.... ISSO TAMBÉM FUNCIONA....











--> E PODEMOS ADICIONAR MÚLTIPLOS ROWS,

BASTA COLOCAR 1 VÍRGULA 

ENTRE 

CADA SET OF VALUES:





INSERT INTO online_sales
(customer_id, film_id, amount)
VALUES (269, 13, 10.99),
(270, 12, 22.99);



















SERIAL DATA TYPE --> MESMO DELETADOS 

CERTOS VALUES,

ELE VAI CONTINUAR INCREMENTANDO,

A PARTIR 


DO 


ÚLTIMO VALUE QUE FOI DELETADO.. --> ISSO NOS AJUDA 

A 

VER 

SE 

CERTA DATA FOI DELETADA..















-> É HORA DE PRATICARMOS...











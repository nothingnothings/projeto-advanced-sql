








QUANDO 

CRIAMOS 1 COLUMN,


PRECISAMOS 


DEFINIR:







1) COLUMN NAME 






2) DATA TYPE






3) CONSTRAINTS (opcionalmente)....



















--> O QUE É 1 CONSTRAINT... --> 









É BASICAMENTE DEFINIDA QUANDO CRIAMOS 1 TABLE...












--> USAMOS AS CONSTRAINTS PARA DEFINIR 

RULES 
PARA A DATA NA TABLE...














--> COM CONSTRAINTS, DEFINIMOS 

RULES DE INSERT/MODIFY...









--> PREVINE A INSERCAO DE INVALID DATA...










--> E PODEMOS DEFINIR CONSTRAINTS 


OU EM 

__COLUMN OU TABLE-LEVEL...





---------------------------










OK, MAS QUE CONSTRAINTS TEMOS?















COLUMN CONSTRAINT            Description



NOT NULL            Ensures that a column 
                        cannot have a NULL value 




UNIQUE             Ensures that all values in 
                    a column must be different (no duplicate values)


DEFAULT            sets a DEFAULT VALUE for a column 
                    if no value is specified.


PRIMARY KEY        A combination of a NOT NULL 
                    AND UNIQUE constraints. Uniquely 
                    IDENTIFIES EACH ROW IN A TABLE...


REFERENCES          ENSURES REFERENTIAL INTEGRITY 
                    (only values of another column can 
                    be used) --> another column,
                    in another table...


CHECK               ENSURES THAT THE VALUES IN A COLUMN 
                    SATISFY A SPECIFIC CONDITION.










--> SE TENTAMOS INSERIR ALGO 


EM 1 TABLE, VALUE QUE VIOLA ESSA 

REFERENCE CONSTRAINT,

GANHARÍAMOS 1 ERRO 

PQ 

""ESSE VALUE NAO EXISTE NA OUTRA TABLE"".

    


















POR EXEMPLO, O CHECK PODE 


CHECKAR "VALUES ENTRE 100 E 300"...














--> PODEMOS DEFINIR ESSAS CONSTRAINTS EM 1 TABLE LEVEL...










--> POR EXEMPLO, SE QUEREMOS 

DEFINIR 1 PRIMARY KEY EM MÚLTIPLAS COLUMNS,


PODEMOS COLOCAR 


MÚLTIPLAS COLUMNS NA SUA DEFINICAO:







PRIMARY KEY(column1, column2, column3)












MESMA COISA NA CONSTRAINT DE "UNIQUE":






UNIQUE(col1, col2, col3)...









MESMA COISA NA DE CHECK:






CHECK(search_condition)





-----------------







VEREMOS VÁRIOS EXEMPLOS, MAS ANTES DISSO FALAREMOS SOBRE 


A PRIMARY KEY...








--> PRIMARY E FOREIGN KEY...

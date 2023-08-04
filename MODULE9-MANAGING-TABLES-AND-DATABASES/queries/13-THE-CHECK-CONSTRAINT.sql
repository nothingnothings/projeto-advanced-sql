


ESSA CONSTRAINT É UM POUCO ESPECIAL...











COM ELA,

PODEMOS 


DEFINIR 1 CONDITION 




QUE __ DEVE _sER MET__ 



PARA QUE VALUES CONSIGAM SER INSERIDOS NA NOSSA 

TABLE...















--> A SINTAXE É ASSIM:









CREATE TABLE <tab_name> (
    <col_name> INT/STRING/WHATEVER CHECK(<condition>)
)














SE A CONDITION DO CHECK FOR MET,


O ROW 



SERÁ 


INSERIDO COM SUCESSO.... CASO CONTRÁRIO,
TEREMOS 

1 ERROR MESSAGE..







-> ex:






CREATE TABLE director (
    name TEXT CHECK(length(name) > 1)
);


















OK... E SE QUISERMOS DAR 1 NOME A NOSSA CONSTRAINT,



PODEMOS FAZER ISSO,



BASTA 





ESCREVER 



"CONSTRAINT <nome_da_constraint> CHECK(length(name) > 1)"















CÓDIGO COMPLETO:














CREATE TABLE director (
    name TEXT CONSTRAINT length_check CHECK(length(name) > 1)
);


















ok... MAS MESMO QUE NAO ASSIGNEMOS NOME ALGUM,




GANHAREMOS 

1 

NOME DEFAULT PARA ESSA CONSTRAINT QUE FOI CRIADA...




(
    por exemplo,


    <table>_<column>_check 
)







ou entao 





<table>_<column>_not_null














ok... mas o estranho é que 


o nome dessa "<column>"




NAO VEM DA ACTUAL COLUMN


EM QUE 

COLOCAMOS 



ESSA CONSTRAINT,



E SIM 





VEM 





DA COLUMN QUE COLOCAMOS NA CONDITION...












TIPO ESTE EXEMPLO AQUI:





CREATE TABLE director (
    name TEXT,
    date_of_birth DATE,
    start_date DATE,
    end_date DATE CHECK(start_date > '01-01-2000')

);





O NOME DA CONSTRAINT SERÁ 



"director_start_date_check"


















é meio confuso, mas tudo bem...










--> E, COMO PODEMOS VER,
PODEMOS USAR OUTRAS COLUMNS 


DENTRO DO CONSTRAINT DE 'CHECK',

PARA FORMAR A CONDITION..












--> MAS PQ ISSO É POSSÍVEL?






É PQ, BEHIND THE SCENES,


O CONSTRAINT DE "CHECK" É UM 


__TABLE__ CONSTRAINT.....















BEM, E SE QUISERMOS __ ADICIONAR___ 1 CONSTRAINT 



A 1 GIVEN TABLE,


PODEMOS USAR 


O COMANDO DE "ALTER TABLE"...









tipo assim:










ALTER TABLE director 
ADD CONSTRAINT date_check CHECK(start_date < end_date);










SE QUEREMOS 

DROPPAR 1 CONSTRAINT,

PODEMOS FAZER ISSO COM:










ALTER TABLE director 
DROP CONSTRAINT date_check;















PARA MODIFICAR 1 CONSTRAINT,

TAMBÉM FAZEMOS ISSO:





1) DROPPAMOS A CONSTRAINT ANTIGA ...






2) ADICIONAMOS 1 NOVA CONSTRAINT,


PARECIDA COM A CONSTRAINT ANTIGA QUE FOI DROPPADA,

MAS COM 

NOVAS CONDITIONS...










TAMBÉM PODEMOS RENOMEAR CONSTRAINTS,

COM ESTA SINTAXE:







ALTER TABLE director 
RENAME CONSTRAINT date_check TO data_constraint;















OK... É ASSIM QUE O COMANDO DE "CHECK" FUNCIONA...










-> dEVEMOS APLICAR ISSO COM 1 CHALLENGE...
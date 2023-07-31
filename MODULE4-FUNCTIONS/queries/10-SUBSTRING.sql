









É MT COMUM 

SER NECESSŚARIO 




EXTRAIR __ 1 SUBSTRING DE 1 GIVEN STRING....










E MTAS VEZES NAO É CONVENIENTE/ELEGANTE 


TRABALHAR COM AS FUNCTIONS DE "LEFT()"

E 

"RIGHT()",




principalmente quando temos 1 parte de alguma 

string que 


FICA BEM NO MEIO...












-> TRABALHAREMOS COM A FUNCTION DE "SUBSTRING"...













substring --> É USADA PARA __ EXTRAIR UMA _ SUBSTRING__ 



DE 
1 

STRING...












--> POR EXEMPLO, TEMOS ESTE ENDERECO:










MARY.SMITH@exemplo.com 












DIGAMOS QUE __ QUEREMOS _ EXTRAIR __ 


A SUBSTRING "SMITH",


que EXISTE 


ENTRE O "." e o "@"..



----------------------------










OK, MAS ___ COMO É A SINTAXE DE "SUBSTRING()"?

















--> A SINTAXE É ASSIM:










SUBSTRING(<col_name/string> FROM start [FOR <length>])














--> NO CASO, PRIMEIRAMENTE COLOCAMOS O NOME DA COLUNA/string


DE QUE QUEREMOS FAZER "Extract"...








--> NO NOSSO CASO, SERIA A COLUMN DE "EMAIL"....






EX:









SUBSTRING(email FROM start [FOR <length>])








DEPOIS DISSO,


TEMOS ____ A "POSITION" DE ONDE QUEREMOS 


COMECAR A EXTRAIR A SUBSTRING dessa string....





(por exemplo, definir 1 position 

NO MEIO DA STRING, e nao no início/final)











--> POR FIM,


TEMOS [for <length>],





que é um _ PARÂMETRO OPCIONAL,


QUE TE DEIXA ESPECIFICAR 


"POR QUANTOS/QUANTOS CARACTERES VAMOS QUERER 
EXTRAIR"....




PODEMOS EXTRAIR 10 CARACTERES, 3 CARACTERES,

ETC... MAS É UM PARAMETER OPCIONAL...




-> SE NAO ESPECIFICAMOS NADA NESSE PARAMETER,


SIMPLESMENTE 

EXTRAÍMOS "UNTIL THE END OF THE STRING"..






----------------------------










NO CONTEXTO DO EMAIL, COMO ISSO FICA...?











talvez assim:








SUBSTRING (email FROM POSITION(last_name IN email) FOR LENGTH(last_name));











EM UMA QUERY, FICARIA ASSIM:





SELECT 
SUBSTRING (email FROM POSITION(last_name IN email) FOR LENGTH(last_name)) as extracted_last_name 
FROM customer;










EXATO... 


ISSO DEU CERTO... É EXATAMENTE ASSIM QUE 


QUEREMOS USAR ESSA FUNCTION...










QUER DIZER QUE O USO DE "POSITION()"



COM "SUBSTRING()"



É __ EXTREMAMENTE PODEROSO....



















--> GERALMENTE O ARGUMENTO "FROM" 


É USADO -_ COM "POSITION()",


DE FORMA DINAMICA...










TAMBÉM PODERÍAMOS TER RODADO ASSIM, NESSE EXEMPLO:







SUBSTRING(email FROM POSITION('.' IN email) + 1 FOR LENGTH(last_name));












TAMBÉM FREQUENTEMENTE NAO USAMOS UMA LENGTH FIXA COMO '3',


E SIM USAMOS 


'LENGTH'....










--> O PROFESSOR DEMONSTRA

A UTILIZACAO SIMPLES,

COM 1 EXEMPLO PRÁTICO....












EX:









SELECT 
email,
SUBSTRING(email FROM 3 FOR 2)
FROM customer;









COM ISSO, O QUE SERÁ RETORNADO 


SERÁ 



RY
TR 
ND 
RB 
IZ 
NN 







(
    PQ COMECAMOS DO SLOT 3, E AÍ PEGAMOS SÓ 2 ESPACOS, RODAMOS 
    "FOR 2"...
)













--> OK... 


MAS DIGAMOS QUE QUEREMOS PEGAR A STRING DE "LAST NAME"



DENTRO DO EMAIL,


MAS __
AO MESMO TEMPO 

NAO TEMOS 

A COLUMN DE "LAST NAME" DISPONÍVEL (

    o que quer dizer que nao podemos usar "LENGTH(last_name)"

    lá no 'FOR <length>'...
)










BEM, NESSE CASO,



PODEMOS TRABALHAR COM A FUNCTION DE 



"POSITION" 


DE UM JEITO UM POUCO DIFERENTE...






-------------------------------------






ESSE USO DA FUNCTION DE "POSITION" É UM POUCO 



MAIS COMPLEXO,



MAS O PROFESSOR VAI NOS MOSTRAR....








-->  INICIALMENTE TEMOS ESTE CÓDIGO:







SELECT 
email,
SUBSTRING(email FROM POSITION('.' IN email) + 1 FOR <LENGTH>)
FROM customer;











OK...QUEREMOS 
TER A 

___LENGTH__ DO ÚLTIMO NAME,

DENTRO DAQUELE EMAIL...













PARA CONSEGUIR ISSO, PODEMOS USAR 'position()',

e nao 
'length()',


dentro daquele slot de '<LENGTH>'...








MAS COMO?




ACHO QUE ASSIM:













TALVez....



tipo assim:



SELECT 
email,
SUBSTRING(email FROM POSITION('.' IN email) + 1 FOR POSITION('@' IN email) - POSITION('.' IN email))
FROM customer;













FUNCIONOU:









SELECT 
email,
SUBSTRING(email FROM POSITION('.' IN email) + 1 FOR POSITION('@' IN email) -1 - POSITION('.' IN email)) AS extracted_last_name
FROM customer;







-------------------------------














OU SEJA, SUBTRAÍMOS A POSITION DE "." da POSITION DE "@"....






(junto com um '-1')...






----------------------------------









É ASSIM QUE PODEMOS EXTRAIR 1 STRING 

DE DENTRO 



DE 2 DIFERENTES CHARACTERS...








--> QUER DIZER QUE O SUBSTRING 

É BEM VERSÁTIL...












--> AGORA DEVEMOS APLICAR TUDO ISSO, COM 

UMA CHALLENGE...
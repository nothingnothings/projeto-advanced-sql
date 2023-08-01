






AGORA TEREMOS UMA SECTION SOBRE 

O CASE STATEMENT...









ELE É USADO COM MT FREQUENCIA, É MT PODEROSO....










--> VAMOS USAR MT...















--> ELE É UM POUCO TRICKY DE ENTENDER,


POR ISSO 

DEVEMOS 



VER TODAS AS SUAS NUANCES E PRACTICAL APPLICATIONS...










--> OK... COMECAMOS COM A TEORIA, O QUE É ESSE CASE STATEMENT...?











o "CASE"



funciona ESSENCIALMENTE 



COMO UM "IF/THEN STATEMENT"..











--> QUER DIZER QUE É UMA __ CONDITIONAL EXPRESSION QUE 


""GOES THROUGH A SET OF CONDITIONS, AND THEN RETURNS 
A VALUE IF A CONDITION IS MET""....













-> SUA SINTAXE É ASSIM:





CASE 
WHEN condition1 THEN result1 
WHEN condition2 THEN result2 
WHEN conditionN THEN resultN 
ELSE result 
END;












--> ANTES DE MAIS NADA,


SEMPRE COMECAMOS 1 CASE STATEMENT 

COM A KEYWORD "CASE",

E SEMPRE TERMINAMOS 


COM "END"....











-> SEMPRE DEVEMOS NOS CERTIFICAR DE QUE 




ESTAMOS ESCREVENDO "CASE" E "END" no nosso statement...















--> É BEM COMUM ESQUECER O "CASE" E O "END"....











--> NO MEIO DO STATEMENT,


TEMOS AS CONDITIONS, E ENTAO OS RESULTS...






-> QUANDO A CONDITION1 É SATISFEITA,



DADA COMO TRUE,




AÍ __ É EXECUTADA A PARTE DO "THEN result1"...










--> E VAMOS POR DENTRO DE TODAS AS CONDITIONS...








--> OK, MAS O QUE ACONTECE SE __MÚLTIPLAS 

CONDITIONS __ FICAREM COMO "TRUE"...?






BEM, 



AÍ APENAS A __PRIMEIRA _ CONDITION DADA COMO TRUE 

SERÁ RETORNADA/EXECUTADA...














--> OK... E SE NENHUMA OUTRA CONDITION FOR RETURNED,


TEMOS O "ELSE",


QUE É O 

RESULT ALTERNATIVO/DEFAULT...










--> OK, AGORA TEMOS 1 EXEMPLO...













SELECT 
amount,
    CASE 
    WHEN amount < 2 THEN 'Low amount'
    WHEN amount < 5 THEN 'medium amount'







PERCEBA QUE SE TIVERMOS UM VALUE DE AMOUNT DE '1',


AMBAS AS CONDITIONS SERAO MET, SIM,


MAS __ APENAS A 'HIGHEST CONDITION' ( ou seja, 'LOW AMOUNT')

SERÁ EXECUTADA/RETORNADA...









POR FIM, PODEMOS DEFINIR 1 ELSE PARA TODOS OS OUTROS 

VALUES, que pode ser 'high amount', nesse caso:



SELECT 
amount,
    CASE 
        WHEN amount < 2 THEN 'Low amount'
        WHEN amount < 5 THEN 'medium amount'
        ELSE 'high amount'
    END
FROM payment;



















-> OK... AGORA DEVEMOS VER OUTRO EXEMPLO,

PARA PERCEBERMOS QUE 
PODEMOS 

USAR DIFERENTES FUNCTIONS, DIFERENTES OPERATORS,

DIFERENTES COISAS,


COM 


O CASE STATEMENT...






EX:









    SELECT 
    TO_CHAR(book_date, 'Dy'),
    TO_CHAR(book_date, 'Mon'),
    CASE
        WHEN TO_CHAR(book_date, 'Dy')='Mon' THEN 'Monday special'
    
    END
    FROM bookings;










COM ISSO, USAMOS O "TO_CHAR()" 


PARA DEFINIR O WEEK DAY.... -_> E SE O WEEK DAY FOR IGUAL 

A 


"Mon" (mondaY),

QUEREMOS QUE 

O RESULT FIQUE COMO "Monday special"...






------------------------------------







PODEMOS FAZER A MESMA COISA COM OUTRA CONDITION,

ASSIM:







    SELECT 
    TO_CHAR(book_date, 'Dy'),
    TO_CHAR(book_date, 'Mon'),
    CASE
        WHEN TO_CHAR(book_date, 'Dy')='Mon' THEN 'Monday special'
        WHEN TO_CHAR(book_date, 'Mon')='Jul' THEN 'July special'
    END
    FROM bookings;



















--> OK... MAS O OUTPUT DISSO,

SE AMBAS CONDITIONS FOREM MET (monday E july, ao mesmo tempo),

SERÁ  


O PRIMEIRO, PQ A PRIMEIRA CONDITION SATISFEITA SEMPRE FAZ 


"OVERWRITE" DA SEGUNDA CONDITION, CASO AMBAS 
SEJAM SATISFEITAS...



(
    o output será 'Monday special',

    e nao 'July special'..

)














--> OK... E, CLARO, SE NENHUMA DAS CONDITIONS FOREM 

MET,


E SE NAO TIVERMOS ESTIPULADO NENHUM ELSE 


STATEMENT,

O OUTPUT

DESSES ROWS, NAQUELA COLUMN, SERÁ DE NULL..












-> PODEMOS EVITAR ISSO, USANDO A ELSE CONDITION,
TIPO ASSIM:














    SELECT 
    TO_CHAR(book_date, 'Dy'),
    TO_CHAR(book_date, 'Mon'),
    CASE
        WHEN TO_CHAR(book_date, 'Dy')='Mon' THEN 'Monday special'
        WHEN TO_CHAR(book_date, 'Mon')='Jul' THEN 'July special'
        ELSE 'No special at all'
    END
    FROM bookings;




















OK... É CLARO QUE PODEMOS USAR DIVERSAS FUNCTIONS


NAS CONDITIONS,

E PODEMOS 

COMBINAR TUDO ISSO COM 


OPERATORS 

E EXPRESSIONS, TIPO ASSIM:











SELECT 
total_amount
TO_CHAR(book_date, 'Dy'),
CASE 
    WHEN TO_CHAR(book_date, 'Dy')='Mon' THEN 'Monday special'
    WHEN total_amount < 30000 Then 'Special deal'
    ELSE 'no special at all'
END 
FROM bookings;















--> E TAMBÉM PODEMOS USAR CALCULATIONS:








SELECT 
total_amount
TO_CHAR(book_date, 'Dy'),
CASE 
    WHEN TO_CHAR(book_date, 'Dy')='Mon' THEN 'Monday special'
    WHEN total_amount*1.4 < 30000 Then 'Special deal'
    ELSE 'no special at all'
END 
FROM bookings;













-> É MELHOR 


INDENTAR TUDO,

PARA FICAR MELHOR DE LER...





AGORA DEVEMOS PRATICAR...

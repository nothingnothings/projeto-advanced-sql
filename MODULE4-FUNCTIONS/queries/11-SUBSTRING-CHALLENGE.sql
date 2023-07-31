







NESSA CHALLENGE,

DEVEMOS:









1) CREATE AN ANONYMIZED VERSION OF THE 

EMAIL ADDRESSES,


IN THE FOLLOWING WAY:







M****.S****@balalaika.com 
P****.T****@dassasaa.com











2) NA SEGUNDA QUERY,




FAÇA:





CREATE AN ANONYMIZED FORM OF THE EMAIL 
ADDRESSES, IN THE FOLLOWING WAY:



***Y.S***@exemplo.com
***A.T***@exemplo.com








DEVEMOS TENTAR FAZER ISSO, POR CONTA PRÓPRIA....











-- PRIMEIRO ESTE:







1) CREATE AN ANONYMIZED VERSION OF THE 

EMAIL ADDRESSES,


IN THE FOLLOWING WAY:







M***.S***@balalaika.com 
P***.T***@dassasaa.com







SELECT 
email,
CONCAT(SUBSTRING(email FROM 1 FOR 1),
 '***', 
SUBSTRING(email FROM POSITION('.' IN email) FOR 2),
'***',
SUBSTRING(email FROM POSITION('@' IN email))
 ) AS masked_email
FROM customer;










-- OK... CONSEGUI... ESTÁ CORRETO...















AGORA PARA A 2:




2) NA SEGUNDA QUERY,




FAÇA:





CREATE AN ANONYMIZED FORM OF THE EMAIL 
ADDRESSES, IN THE FOLLOWING WAY:



***Y.S***@exemplo.com
***A.T***@exemplo.com





TENTO ASSIM:



SELECT 
email,
CONCAT(
     '***', 
    SUBSTRING(email FROM POSITION('.' IN EMAIL) - 1 FOR 1),
    SUBSTRING(email FROM POSITION('.' IN email) FOR 2),
    '***',
SUBSTRING(email FROM POSITION('@' IN email))
 ) AS masked_email
FROM customer;









OK... CONSEGUI... AS 2 QUERIES ESTAO CORRETAS.











----------------------------------











QUAL FOI A SOLUCAO DO PROFESSOR?










ELE NAO USOU PURAMENTE O SUBSTRING.... USOU TAMBÉM 

A LEFT FUNCTION, TIPO ASSIM:














SELECT 
    CONCAT(
        LEFT(email, 1),
        '***',
        SUBSTRING(email FROM POSITION('.' IN email) FOR 2),
        '***',
        SUBSTRING(email FROM POSITION('@' IN email)),
    )
    FROM customer;
















MAS AGORA TEMOS A SEGUNDA CHALLENGE:









SELECT 
    CONCAT(
        '***',
        SUBSTRING(email FROM POSITION('.' IN email) - 1 FOR 3),
        '***',
        SUBSTRING(email FROM POSITION('@' IN email))
    )
    FROM customer;

















ISSO FOI 1 POUCO MAIS TRICKY,



MAS FOI UM BOM EXERCÍCIO...








NA PRÓXIMA LECTURE,


VEREMOS 


"""COMO EXTRAIR PARTES DE DATES E TIMES"" 

(
    é algo super importante, por isso é o que 

    estudarmos...
)


















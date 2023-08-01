






ATÉ AGORA, FALAMOS SOBRE FUNCTIONS 


DE STRINGS E DATE/TIME DATATYPES...













--> FICAMOS COM APENAS O DATA TYPE DE "NUMERIC" (INT, FLOAT, ETC)


FALTANDO...














--> MATHEMATICAL FUNCTIONS AND OPERATORS...







OS OPERATORS MAIS BÁSICOS E USADOS SAO ESTES:






1) + 


2) - 


3) * 


4) / 



5) %  ----_> temos MODULE...







--> O QUE DEVEMOS TER EM MENTE, COM DIVISION,

É QUE 

SE USAMOS INT NUMBERS,



O RESULTADO SERÁ __tRUNCATED_..










POR EXEMPLO:








9/4  ----_> O RESULTADO SERÁ 2 (e o 1, o RESTO, será DESCARTADO)...






mas 


se dividimos assim:




9.0/4 ---> SE USAMOS DECIMAL PLACES, CONSEGUIMOS O RESULT COMO FLOAT (
    2.2500000000000000000000000 
)









E PODEMOS FAZER ROUND EM CIMA 


DOS RESULTS DISSO, TIPO ASSIM:





SELECT 
ROUND(9.0/4, 2);















OK... MAS AGORA TEMOS MAIS ALGUNS OPERATORS,





COMO '%' (Que é basicamente o RESTO)...







EX:






10%4 ----- RESULT IS 2 (remainder of the division... 2,5 2,5 2,5 2,5 --> 0,5 + 0,5 + 0,5 + 0,5)..
















6) ^ ----> potenciacao...  2^3 














--> PODEMOS MULTIPLICAR 

COISAS, SOMAR,

DIVIDIR....








ex:






SUM (replacement_cost) * 2 


SUM(replacement_cost) + 1 








SUM(replacement_cost) / SUM (rental_rate) * 1000
















TEMOS POUCAS FUNCTIONS DE MATH... poucas importantes...








-----------------------------------------


SAO ELAS:






ABS(x) --> isso NOS DÁ O ABSOLUTE VALUE DE 1 NUMBER --> ex: ABS(-7) ---> vira 7...








ROUND(x, d) ---> PODEMOS ARREDONDAR NOSSOS NUMBERS... EX: round(4.3543, 2) ----_> VIRA 4.35...




ceiling(x) ---> ARREDONDAMOS ATÉ O PRÓXIMO INT... ----> EX:  round(4.3543) --> RESULT: 5 




FLOOR(X) --> ARREDONDAMOS ATÉ O INT ANTERIOR ---> EX: FLOOR(4.3543) --> RESULT: 4...








SAO FUNCTIONS BEM BÁSICAS,



E NAO PRECISAMOS SABER E CONHECER TODAS ELAS....












----> DEVEMOS GOOGLAR ALGO, SE PRECISARMOS.....














-> SE TEMOS ALGUM USE-CASE ESPECÍFICO,

COMO TRIGONOMETRIC FUNCTIONS,



BASTA USAR 


A DOCUMENTATION....














OK, AGORA ALGUNS EXEMPLOS:













SELECT 
*
FROM film;














SELECT 
film_id,
rental_rate as old_rental_rate
rental_rate * 1.1 AS new_rental_rate 
FROM film;













COM ISSO, PODEMOS VER 

COMO FICARIAM NOSSOS PRECOS AUMENTADOS em 10%....











CERTO... ISSO É SIMPLES.
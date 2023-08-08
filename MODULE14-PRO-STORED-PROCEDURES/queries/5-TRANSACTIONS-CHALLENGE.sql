





CHALLENGE:







THE TWO EMPLOYEES,



MILLER MCQUARTER 



E 

CHRISTALLE MCKENNY 



HAVE AGREED TO SWAP THEIR POSITIONS,

INCLUDING THEIR SALARY...














--> PARA ISSO, DEVEMOS USAR 1 TABLE JÁ CRIADA...










--> DEPOIS DISSO,


DEVEMOS 



CRIAR 1 TRANSACTION 


QUE FAÇA O SWAP DA POSITION E TITLE 

DESSAS PESSOAS/ROWS...










ACHO QUE FICA TIPO ASSIM:








BEGIN;

UPDATE employees
SET salary=12587.00,
position_title='Head of Sales'
WHERE emp_id=2;


UPDATE employees
SET salary=14614.00,
position_title='Head of Bi'
WHERE emp_id=3;



COMMIT;










é claro que essas changes só sao aplicadas 


aos outros users/sessions 



se AS COMMITARMOS,


COMMITARMOS A TRANSACTION...







OK, OS 2 VALUES TERAO SIDO SWAPPADOS...














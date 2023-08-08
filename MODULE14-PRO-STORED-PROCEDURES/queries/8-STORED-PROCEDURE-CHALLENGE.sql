







CHALLENGE:












CREATE A STORED PROCEDURE CALLED 
EMP_SWAP


THAT 


1) ACCEPTS TWO PARAMETERS, emp1 and emp2 








2) SWAPS THE  TWO EMPLOYEES POSITION AND SALARY....








3) TEST THE STOERD PROCEDURE WITH EMP_ID 2 AND 3...

















CREATE OR REPLACE PROCEDURE emp_swap (
    emp1 INT, emp2 INT
)
    LANGUAGE plpgsql
    AS 
    $$

    BEGIN
    
    UPDATE employees 
    SET position_title=
    WHERE emp_id=emp
    


    COMMIT;
    END;
    $$















    CONSEGUI...









    FICOU ASSIM:








CREATE OR REPLACE PROCEDURE emp_swap (
    emp1 INT, emp2 INT
)
    LANGUAGE plpgsql
    AS 
    $$
	
	DECLARE
		emp1_position VARCHAR;
		emp2_position VARCHAR;
		emp1_salary NUMERIC;
		emp2_salary NUMERIC;
    BEGIN
	
	
	SELECT 
	position_title FROM employees
	WHERE emp_id=emp1
	INTO emp1_position;
	
	SELECT 
	salary FROM employees
	WHERE emp_id=emp1
	INTO emp1_salary;
	
	SELECT 
	position_title FROM employees
	WHERE emp_id=emp2
	INTO emp2_position;
    
	SELECT 
	salary FROM employees
	WHERE emp_id=emp2
	INTO emp2_salary;
	
    UPDATE employees 
    SET position_title=emp2_position,
	salary=emp2_salary
    WHERE emp_id=emp1;
	
	UPDATE employees 
    SET position_title=emp1_position,
	salary=emp1_salary
    WHERE emp_id=emp2;
    
    COMMIT;
    END;
    $$
	
	
	
SELECT 
position_title,
salary 
FROM employees 
WHERE emp_id IN (2,3);
	
	
	
	
CALL emp_swap(2, 3);
	
	
	
















BASICAMENTE,


ARMAZENEI OS VALUES 


DAS POSITIONS 

E SALARIES EM VARIABLES,

E DEPOIS 


RODEI 2 UPDATE CALLS,



1 PARA CADA PAR OPOSTO 

DE SALARY-POSITION...













O professor admite que PRECISAMOS USAR VARIABLES...








--> PQ COPIAMOS 

VARIABLES DE 1 LUGAR PARA OUTRO...







--> FOI EXATAMENTE ISSO QUE FIZ...











SOLUCAO DO PROFESSOR:










CREATE OR REPLACE PROCEDURE emp_swap (
    emp1 INT, emp2 INT
)
    LANGUAGE plpgsql
    AS 
    $$
	
	DECLARE
		emp1_position VARCHAR;
		emp2_position VARCHAR;
		emp1_salary NUMERIC;
		emp2_salary NUMERIC;
    BEGIN
	
	
	SELECT 
	position_title FROM employees
	WHERE emp_id=emp1
	INTO emp1_position;
	
	SELECT 
	salary FROM employees
	WHERE emp_id=emp1
	INTO emp1_salary;
	
	SELECT 
	position_title FROM employees
	WHERE emp_id=emp2
	INTO emp2_position;
    
	SELECT 
	salary FROM employees
	WHERE emp_id=emp2
	INTO emp2_salary;
	
    UPDATE employees 
    SET position_title=emp2_position,
	salary=emp2_salary
    WHERE emp_id=emp1;
	
	UPDATE employees 
    SET position_title=emp1_position,
	salary=emp1_salary
    WHERE emp_id=emp2;
    
    COMMIT;
    END;
    $$
	
	
	
SELECT 
position_title,
salary 
FROM employees 
WHERE emp_id IN (2,3);
	
	
	
	
CALL emp_swap(2, 3);







-------------------------





















OK...



já estamos em um nível mais avancado...




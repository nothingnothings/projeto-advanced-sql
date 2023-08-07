-- In your company there hasn't been a database 
-- table with all the employee information yet.

-- You need to set up the table called
--  employees in the following way:




--  emp_id   first_name    last_name  job_position    salary   start_date  birth_date



--  department_id   manager_id 





    
--     



-- There should be NOT NULL constraints for the following columns:

-- first_name,

-- last_name ,

-- job_position,

-- start_date DATE,

-- birth_date DATE




-- ANSWER:

CREATE TABLE employees (
        emp_id SERIAL PRIMARY KEY,
        first_name VARCHAR NOT NULL,
        last_name VARCHAR NOT NULL,
        job_position VARCHAR(20) NOT NULL,
        salary NUMERIC(8,2),
        start_date DATE NOT NULL,
        birth_date DATE NOT NULL,
        store_id INT,
        department_id INT,
        manager_id INT
);






-- Set up an additional table called departments in the following way:





-- department_id         department          division 





-- Additionally no column should allow nulls.






ANSWER:


CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department VARCHAR NOT NULL,
    division VARCHAR NOT NULL
)
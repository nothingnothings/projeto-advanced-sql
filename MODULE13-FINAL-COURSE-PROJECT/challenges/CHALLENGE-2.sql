-- Difficulty: Moderate



-- Alter the employees table in the following way:

-- - Set the column department_id to not null.

-- - Add a default value of CURRENT_DATE to the column start_date.

-- - Add the column end_date with an appropriate data type (one that you think makes sense).

-- - Add a constraint called birth_check that doesn't allow birth dates that are in the future.

-- - Rename the column job_position to position_title.





ANSWER:


ALTER TABLE employees
ALTER COLUMN department_id SET NOT NULL,
ALTER COLUMN start_date SET DEFAULT current_date,
ADD COLUMN end_date DATE,
ADD CONSTRAINT birth_check CHECK(birth_date < current_date);




ALTER TABLE employees 
RENAME column job_position TO position_title;



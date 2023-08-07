Task 5

Difficulty: Advanced



Task 5.1

Write a query that adds
 a column called manager that contains 
  first_name and last_name (in one column) in the data output.

Secondly, add a
 column called is_active with 'false' if 
 the employee has left the company already, otherwise the value is 'true'.








-- version without join (wrong manager in the column)
 SELECT 
 *,
CONCAT(first_name, ' ', last_name) AS manager,
(
    CASE
        WHEN end_date IS NULL then 'true'
        ELSE 'false'
    END
)          AS is_active
FROM employees;







-- version with join (correct manager in column):
 SELECT 
 *,
CONCAT(man.first_name, ' ', man.last_name) AS manager,
(
    CASE
        WHEN emp.end_date IS NULL then 'true'
        ELSE 'false'
    END
)          AS is_active
FROM employees AS emp
LEFT JOIN employees AS man
ON emp.manager_id=man.emp_id;







-- Task 5.2

-- Create a view called v_employees_info from that previous query.





CREATE OR REPLACE VIEW v_employees_info
AS 
 SELECT 
 emp.emp_id,
 emp.first_name,
 emp.last_name,
 emp.position_title,
 emp.salary,
 emp.start_date,
 emp.birth_date,
 emp.store_id,
 emp.department_id,
 emp.manager_id,
 emp.end_date,
CONCAT(man.first_name, ' ', man.last_name) AS manager,
(
    CASE
        WHEN emp.end_date IS NULL then 'true'
        ELSE 'false'
    END
)          AS is_active
FROM employees AS emp
LEFT JOIN employees AS man
ON emp.manager_id=man.emp_id;










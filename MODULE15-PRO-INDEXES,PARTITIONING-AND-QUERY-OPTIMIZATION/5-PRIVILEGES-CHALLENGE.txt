In this challenge you need to create a user, 
a role and add privileges.

Your tasks are the following:



Create the user mia with password 'mia123'

Create  the role analyst_emp;

Grant SELECT on all tables in the public schema to that role.

Grant INSERT and UPDATE on the employees table to that role.

Add the permission to create databases to that role.

Assign that role to mia and test the privileges with that user.

Good luck!









CREATE USER mia 
WITH PASSWORD 'mia123';


CREATE ROLE analyst_emp;


GRANT SELECT 
ON ALL TABLES 
IN SCHEMA public
TO analyst_emp;


GRANT INSERT
ON TABLE employees 
TO analyst_emp;

GRANT UPDATE
ON TABLE employees 
TO analyst_emp;

-- this is problematic
ALTER ROLE analyst_emp CREATEDB;


GRANT analyst_emp TO mia;



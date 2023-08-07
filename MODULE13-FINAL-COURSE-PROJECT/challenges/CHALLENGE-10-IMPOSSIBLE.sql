Difficulty: Pro / Very difficult

Create the same running total but now also consider the fact that people were leaving the company.



Note:

This challenge is actually very difficult.

Don't worry if you can't solve it you are not expected to do so.

It is possible to solve the challenge even without the hints.

If you want you can try to solve it using the hints and it is still a difficult challenge.



Question:

What was the total salary after 2018-12-31?



Answer:

166802.84



Hint 1:
Use the view v_employees_info.

Hint 2:
Create two separate queries: one with all employees and one with the people that have already left

Hint 3:
In the first query use start_date and in the second query use end_date instead of the start_date

Hint 4:
Multiply the salary of the second query with (-1).

Hint 5:
Create a subquery from that UNION and use a window function in that to create the running total.
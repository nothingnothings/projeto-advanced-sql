









PRATICAREMOS A FUNCTION DE 'ROLLUP"...







CHALLENGE:









WRITE A QUERY THAT CALCULATES THE BOOKING AMOUNT 
ROLLUP FOR THE HIERARCHY 

OF:

1) QUARTER 

2) MONTH 


3) WEEK (in month) 


4) DAY...
















OK...


ACHO QUE A QUERY FICARÁ ASSIM:




SELECT 
CONCAT('Q', TO_CHAR(book_date, 'Q')) AS quarter,
EXTRACT('Month' from book_date) AS month,
TO_CHAR(book_date, 'W') AS week_in_month,
DATE(book_date) AS day,
SUM(total_amount)
FROM bookings 
GROUP BY 
    ROLLUP(quarter, month, week_in_month, day)
ORDER BY 1, 2, 3, 4;

















OK... ACERTEi...
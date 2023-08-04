







INSERT THESE VALUES IN THE TABLE 

"ONLINE_SALES":



transaction_id      customer_id     film_id         amount    promotion_code     
1                       124            65           14,99       PROMO2022
2                       225             231         12,99       JULYPROMO
3                       119             53          15,99       SUMMERDEAL







ANSWER:







INSERT INTO online_sales 
(customer_id, film_id, amount, promotion_code)
VALUES 
(
    124, 65, 14.99, 'PROMO2022'
),
(
    225, 231, 12.99, 'JULYPROMO'
),
(
    124, 65, 14.99, 'SUMMERDEAL'
);




SUMMERDEAL2022 - length 14, varchar(10)


answer: 





The column's max length is 10, and the string to be inserted 
is 14 characters long.


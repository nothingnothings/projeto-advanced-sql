










O RIGHT OUTER JOIN É EXATAMENTE 


A MESMA COISA QUE O LEFT OUTER JOIN,



COM A DIFERENCA DE QUE 




__ SEMPRE OS ROWS 



DA SEGUNDA TABLE VAO APARECER,



E ALGUNS TABLES 

DA 




PRIMEIRA TABLE (left) 


NAO VAO APARECER, SE NAO TIVEREM RELATING 

COLUMNS...













A SINTAXE É ESTA:








SELECT * FROM table_a AS tab_a 
RIGHT OUTER JOIN table_b as tab_b 
ON tab_a.employee = tab_b.employee;








QUER DIZER QUE ISSO É EXATAMENTE A MESMA COISA QUE 

ESCREVER ISTO

SELECT * FROM table_b AS tab_b 
LEFT OUTER JOIN table_a as tab_a 
ON tab_a.employee = tab_b.employee;









------------------------












PARA DEMONSTRAR, O PROFESSOR RODA ASSIM:














SELECT * FROM aircrafts_data AS a 
LEFT JOIN flights AS f 
ON a.aircraft_code = f.aircraft_code
WHERE f.aircraft_code IS NULL; 







--> essa table nos mostra 


todos os aircrafts que nunca foram usados...










COM O RIGHT JOIN,


ficaríamos com o mesmo resultado desta forma:



















SELECT * FROM flights AS f 
RIGHT JOIN aircrafts_data AS a
ON a.aircraft_code = f.aircraft_code
WHERE f.aircraft_code IS NULL; 


















QUER DIZER QUE PODEMOS 



SEMPRE USAR O LEFT JOIN...









--> PQ O RIGHT JOIN É A MESMA COISA,


SÓ INVERTIDO...





-------------------









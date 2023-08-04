











JÁ VIMOS COMO INSERIR ROWS EM 1 EXISTING 

TABLE..















--> MAS COMO PODEMOS USAR UPDATE?









É ASSIM:










UPDATE <table_name>
SET column=value
WHERE <condition> 











EX:









queremos definir TODOS OS VALUES DA COLUMN DE "genre"

como "Country music":











ESCREVEMOS ASSIM:







UPDATE songs 
SET genre='Pop Music';













--> MAS GERALMENTE O UPDATE É USADO COM WHERE...








ex:










UPDATE songs 
SET genre='Pop Music'
WHERE song_id=4;











-> OK, COM ISSO APENAS O ROW DE song_id 4 será UPDATADO...
















--> MAS É CLARO QUE PODEMOS usar outras 

columns no value settado,

tipo assim:













UPDATE songs 
SET price=song_id+0.99;


















--> ALGUNS EXEMPLOS PRÁTICOS:











SELECT * FROM customer;














DIGAMOS QUE O CLIENTE "Mary smith"


TEVE SEU 

SOBRENOME 



TROCADO PARA "BROWN"...








--> PARA ISSO,


ESCREVEMOS ASSIM:




UPDATE customer
SET last_name='BROWN'
WHERE customer_id=1;












ok, COM ISSO UPDATAREMOS APENAS ESSE SINGLE ROW...





















-> PODEMOS TAMBÉM 

TROCAR 
O FORMATO 

DE 

TODOS OS EMAILS NA COLUMN DE EMAIL,

TIPO ASSIM:











UPDATE customer 
SET email=LOWER(email);









-> ISSO VAI REALMENTE UPDATAR TUDO,


PQ 

NAO COLOCAMOS O FILTER DE WHERE....















OK... VIMOS COMO PODEMOS USAR O UPDATE...













---> AGORA DEVEMOS PRATICAR, 



NA SEGUINTE CHALLENGE...








--
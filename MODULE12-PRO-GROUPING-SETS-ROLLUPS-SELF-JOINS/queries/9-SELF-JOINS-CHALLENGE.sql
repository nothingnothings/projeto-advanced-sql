



DEVEMOS APLICAR O QUE APRENDEMOS SOBRE O SELF-JOIN...






CHALLENGE:







1) FIND ALL THE PAIRS OF FILMS WITH THE SAME LENGTH...

(order descendingly)...




EX:






TITLE            TITLE      LENGTH 
MUSCLE BRIGHT   SOLDIERS      91



2) MAKE SURE THAT THE SAME TITLE DOESNT REPEAT...


ex:



TITLE            TITLE          LENGTH 
MUSCLE BRIGHT  MUSCLE BRIGHT     91







(PRECISAMOS ADICIOANR 1 CONDICAO NO SELF-JOIN QUE 
PREVIINA A REPETICAO DO MESMO TITLE...)




OK...











ACHO QUE A QUERY PODERIA FICAR ASSIM:










SELECT 
film1.title,
film2.title,
film1.length
FROM film AS film1
LEFT JOIN film AS film2 
ON film1.length=film2.length
AND film1.title!=film2.title
ORDER BY film1.length DESC;











OK... ACHO QUE ACERTEI..










FICOU ASSIM:





"SOLDIERS EVOLUTION"	"POND SEATTLE"	185
"SOLDIERS EVOLUTION"	"CONTROL ANTHEM"	185
"SOLDIERS EVOLUTION"	"CHICAGO NORTH"	185
"MUSCLE BRIGHT"	"WORST BANGER"	185
"MUSCLE BRIGHT"	"SOLDIERS EVOLUTION"	185
"MUSCLE BRIGHT"	"HOME PITY"	185
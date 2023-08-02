





CONTINUAMOS COM A CHALLENGE DA ÚLTIMA LICAO:








ok... TODO O RESTO É IGUAL...





DEVEMOS VER ISSO EM 1 PRACTICAL EXAMPLE...










RODAMOS:







SELECT * FROM tickets;









SELECT * FROM boarding_passes;












PODEMOS RODAR 1 JOIN ENTRE OS 2....













TIPO ASSIM:









SELECT 
*
FROM boarding_passes AS bp
FULL OUTER JOIN tickets AS t
ON bp.ticket_no = t.ticket_no;











CERTO... MAS A CHALLENGE DO PROFESSOR É:




""FIND THE TICKETS THAT DON'T HAVE 

A BOARDING PASS RELATED TO IT!''








--> PARA ENCONTRARMOS 


ESSA INFORMACAO, BASTA USAR UM WHERE (filter)

PROCURANDO 



POR 


WHERE bp.ticket_no IS NULL,







TIPO ASSIM:







SELECT 
*
FROM boarding_passes AS bp
FULL OUTER JOIN tickets AS t
ON bp.ticket_no = t.ticket_no
WHERE bp.ticket_no IS NULL;



















NAO SEI SE ESSE MEU 'WHERE" está correto...












VER OS TICKETS QUE NAO POSSUEM NENHUM BOARDING 

RELATED A ELES...






O PROFESSOR 

ESCREVEU EXATAMENTE ASSIM:









SELECT 
*
FROM boarding_passes AS bp
FULL OUTER JOIN tickets AS t
ON bp.ticket_no = t.ticket_no
WHERE bp.ticket_no IS NULL;















ok, era isso...













temos 2 ticket_no,





um lá na table de boarding_passes,


e outro em "tickets"....















OK.... COM ESSE FILTERING,



EM QUE DIZEMOS 


QUE 1 COLUMN DA TABLE B 


DEVE SER NULL,





FICAMOS APENAS COM A PARTE DA TABLE A (preenchidos 
da table A),

ignorada a parte da table B...











sua sintaxe fica assim:








SELECT * FROM table_b AS tab_b 
FULL OUTER JOIN table_a AS tab_a 
ON tab_a.employee = tab_b.employee 
WHERE tab_b.anyColumn IS NULL;














ok... é um case meio especial,


meio uncommon, mas 


faz sentido 


usar o where com o full outer join,

para encontrar 


ROWS ESPECÍFICOS, que ocorrem 



em apenas 1 das tables...
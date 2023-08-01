






A TASK É 











1) CREATE A LIST OF ALL RENTAL DURATIONS 
OF CUSTOMER 
WITH 

CUSTOMER_ID 35...








2) find out WHICH CUSTOMER HAS 
THE LONGEST AVERAGE RENTAL DURATION...















-> COMECAMOS PELA 1:













1) CREATE A LIST OF ALL RENTAL DURATIONS 
OF CUSTOMER 
WITH 

CUSTOMER_ID 35...












SELECT 
* FROM rental;










--> o formato é este:



"rental_id"	"rental_date"	"inventory_id"	"customer_id"	"return_date"	"staff_id"	"last_update"
2	"2005-05-24 23:54:33+02"	1525	459	"2005-05-28 20:40:33+02"	1	"2020-02-16 03:30:53+01"








SELECT 
(return_date - rental_date) AS rental_duration  -- interval is created.
FROM rental
WHERE customer_id = 35
ORDER BY rental_duration DESC;










O RESULTADO FICOU ASSIM:






"rental_duration"
"9 days 04:17:00"
"9 days 00:13:00"
"8 days 22:57:00"
"8 days 18:13:00"
"8 days 18:10:00"
"8 days 03:26:00"















CERTO... AGORA TEMOS O OUTRO:





2) find out WHICH CUSTOMER HAS 
THE LONGEST AVERAGE RENTAL DURATION...







SELECT
customer_id,
AVG(return_date - rental_date) as average_rental_duration
FROM rental
GROUP BY customer_id
ORDER BY average_rental_duration DESC;














OK... consegui... era isso, mesmo.






EX:






"customer_id"	"average_rental_duration"
315	"6 days 14:13:22.5"
187	"5 days 34:58:38.571428"
321	"5 days 32:56:32.727273"
539	"5 days 31:39:57.272727"
436	"5 days 31:09:46"
532	"5 days 30:59:34.838709"
427	"5 days 29:27:05"
555	"5 days 26:48:35.294118"
448	"5 days 26:13:51.111111"
453	"5 days 25:43:13.043478"
508	"5 days 25:30:02.5"
61	"5 days 24:23:21.428571"
222	"5 days 24:08:57.142857"
82	"5 days 24:08:32.307692"
181	"5 days 24:04:18.181818"
504	"5 days 23:34:23.571429"
295	"5 days 23:33:00"
558	"5 days 23:29:38.571428"
10	"5 days 23:25:57.6"
466	"5 days 23:25:57.391304"
437	"5 days 22:52:20.869565"
548	"5 days 22:42:33.333333"
542	"5 days 22:40:46.666667"
398	"5 days 22:38:11.25"
449	"5 days 22:23:30"
337	"5 days 22:10:45"
332	"5 days 22:02:55.714286"
259	"5 days 21:57:31.875"




-------------------------







SOLUCAO DO PROFESSOR:







SELECT 
(return_date - rental_date) AS rental_duration  -- interval is created.
FROM rental
WHERE customer_id = 35
ORDER BY rental_duration DESC;












--> A SEGUNDA QUERY...










SELECT
customer_id,
AVG(return_date - rental_date) as average_rental_duration
FROM rental
GROUP BY customer_id
ORDER BY average_rental_duration DESC;


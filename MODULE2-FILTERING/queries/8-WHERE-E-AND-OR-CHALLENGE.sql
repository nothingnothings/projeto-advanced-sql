







NESSA CHALLENGE,




PRATICAREMOS AS CONJUNCTIONS COMPLEXAS DE 

AND E OR..













--> O PEDIDO É ESTE:










THE SUPPORT MANAGER ASKS YOU FOR A LIST OF ALL THE 
PAYMENTS OF THE CUSTOMERS 322, 346 AND 354 WHERE 

_ THE AMOUNT _ IS EITHER LESS THAN 2
 OR GREATER THAN 10...
















fica tipo assim:









SELECT
*
FROM PAYMENTS 
WHERE 
(
CUSTOMER_ID = 322 OR 
CUSTOMER_ID = 346 OR 
CUSTOMER_ID = 354 
) AND (
    AMOUNT < 2 OR AMOUNT > 10
);















AÍ TEMOS:



"IT SHOULD BE ORDERED BY THE CUSTOMER FIRST (ascending)
AND THEN, AS SECOND CONDITION, ORDER BY AMOUNT, IN DESCENDING 
ORDER"....






QUER DIZER QUE FICARÁ ASSIM:






SELECT
*
FROM PAYMENTS 
WHERE 
(
CUSTOMER_ID = 322 OR 
CUSTOMER_ID = 346 OR 
CUSTOMER_ID = 354 
) AND (
    AMOUNT < 2 OR AMOUNT > 10
)
ORDER BY customer_id, amount DESC;



















ok... deu certo....









25784	322	2	3627	1.99	"2020-04-06 00:47:51.996577-03"
25794	322	1	9252	1.99	"2020-04-30 08:48:25.996577-03"
16167	322	2	166	0.99	"2020-01-25 22:17:37.996577-03"
25788	322	2	6673	0.99	"2020-04-12 06:19:22.996577-03"
20023	322	2	11456	0.99	"2020-03-02 16:42:30.996577-03"
20027	322	1	15450	0.99	"2020-03-22 20:24:27.996577-03"
17420	322	1	2554	0.99	"2020-02-18 22:34:04.996577-03"
25783	322	1	3478	0.99	"2020-04-05 17:34:10.996577-03"
20248	346	2	10521	0.99	"2020-03-01 07:14:43.996577-03"
26062	346	2	8543	0.99	"2020-04-29 05:30:23.996577-03"
20254	346	1	15535	0.99	"2020-03-22 23:26:28.996577-03"
20257	346	1	15827	0.99	"2020-03-23 10:43:45.996577-03"
16210	354	2	158	1.99	"2020-01-25 20:55:37.996577-03"
20331	354	2	15956	0.99	"2020-03-23 14:47:47.996577-03"
16209	354	1	140	0.99	"2020-01-25 19:02:48.996577-03"
16211	354	2	402	0.99	"2020-01-27 08:45:44.996577-03"
17556	354	1	1491	0.99	"2020-02-15 17:16:44.996577-03"
20329	354	2	14245	0.99	"2020-03-21 00:59:20.996577-03"
26148	354	2	4034	0.99	"2020-04-06 21:04:59.996577-03"
26154	354	1	6054	0.99	"2020-04-10 22:27:05.996577-03"
26156	354	1	6926	0.99	"2020-04-26 17:21:11.996577-03"
26158	354	2	7148	0.99	"2020-04-27 01:32:35.996577-03"
26160	354	2	7241	0.99	"2020-04-27 04:54:15.996577-03"
26164	354	2	8921	0.99	"2020-04-29 20:32:28.996577-03"
31942	354	1	11782	0.00	"2020-05-14 09:44:29.996577-03"

















25 ROWS....




acertei...
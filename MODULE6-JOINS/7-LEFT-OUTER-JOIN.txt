












DEPOIS DE COMPREENDERMOS O 

INNER JOIN E FULL OUTER JOIN,





AGORA DEVEMOS 

ESTUDAR O LEFT OUTER JOIN...




--------------------------------














ELE PEGA __ TODOS OS 



ROWS DA TABLE A,



ALGUNS DA TABLE B (overlapping),






MAS OS ROWS QUE APARECEM APENAS NA TABLE B,

E NAO APARECEM NA TABLE A,


ESSES SAO DESCARTADOS...




----------------------------------















NOSSO EXEMPLO É ESTE:










1) SALES TABLE 



EMPLOYEE CITY SALES 

SANDRA    NY  1000
hugo      SP  2000
DENIS     AC  3000
Frank     CD  1000








2) BONUS TABLE





EMPLOYEE BONUS
SANDRA    YES
SIMON      NO















O RESULTADO FICA ASSIM:











s.employee            b.employee       city         SALES       BONUS 
  Sandra                Sandra          Munich      500         YES
  DENIS                 NULL            AC          AC          NULL
  FRANK                 null            CD          1000        NULL 

















COMO VOCE PODE PERCEBER,




O "SIMON", QUE EXISTE APENAS NA TABLE B,


NEM MESMO APARECE NO RESULTADO DESSE JOIN...
















----> A LEFT TABLE É SEMPRE A TABLE A,



É SEMPRE A __PRIMEIRA TABLE__ INCLUÍDA NO NOSSO CÓDIGO (colocada 

no select)...












--> como simon só existe na table B,


ele nao é incluído 

no left join...












A SINTAXE É A MESMA COISA:










SELECT * FROM table_a AS tab_a 
LEFT OUTER JOIN table_b AS tab_b 
ON tab_a.employee = tab_b.employee;










OK... USAMOS "LEFT OUTER JOIN" EM VEZ DE "INNER JOIN" OU 

"FULL OUTER JOIN"....











--> o professor nos explica que 

"left join"


É O TYPE DE JOIN MAIS UTILIZADO, NA VERDADE...















--> ELE É MAIS UTILIZADO PQ 




GERALMENTE VAMOS QUERER """TODOS OS ROWS DE 1 GIVEN TABLE INCLUÍDOS,
MAS OS 
ROWS EXCLUSIVOS DAS OUTRAS TABLES PODEM SER IGNORADOS""" (pegar apenas os matching ones)
















--> AGORA VAMOS SELECIONAR TODA A "aircraft_data"...














-> QUEREMOS CONTAR 


"EM QUANTOS FLIGHTS ESSES AIRCRAFTS FORAM USADOS"..











--> queremos nos certificar, nesse exemplo,



DE QUE __TODOS __OS AIRCRAFTS FIQUEM NO OUTPUT,


AINDA QUE NAO TENHAM SIDO USADOS 



EM VOO ALGUM...

















O CÓDIGO FICA TIPO ASSIM:












SELECT
ad.model,
COUNT(*) AS n_of_flights 
FROM aircrafts_data AS ad
LEFT JOIN flights AS f
ON f.aircraft_code = ad.aircraft_code
GROUP BY ad.model;















OK... FICAMOS COM ESTE RESULTADO:




"model"	                                                    "n_of_flights"
"{""en"": ""Airbus A320-200"", ""ru"": ""Аэробус A320-200""}"	        1
"{""en"": ""Boeing 737-300"", ""ru"": ""Боинг 737-300""}"	            1274
"{""en"": ""Bombardier CRJ-200"", ""ru"": ""Бомбардье CRJ-200""}"	    9048
"{""en"": ""Boeing 767-300"", ""ru"": ""Боинг 767-300""}"	            1221
"{""en"": ""Sukhoi Superjet-100"", ""ru"": ""Сухой Суперджет-100""}"	8504
"{""en"": ""Airbus A321-200"", ""ru"": ""Аэробус A321-200""}"	        1952
"{""en"": ""Boeing 777-300"", ""ru"": ""Боинг 777-300""}"	            610
"{""en"": ""Airbus A319-100"", ""ru"": ""Аэробус A319-100""}"	        1239
"{""en"": ""Cessna 208 Caravan"", ""ru"": ""Сессна 208 Караван""}"	    9273





















OK.... NAO PRECISAMOS ESCREVER LEFT OUTER JOIN,


BASTA ESCREVER LEFT JOIN...








MAS O DESAFIO AINDA NAO ACABOU...







PQ O  PROFESSOR COLOCA 1 CHALLENGE:





"FIND ALL AIRCRAFTS THAT HAVE NOT BEEN USED IN ANY FLIGHT"...








mas esse desafio já foi cumprido... --> todos os planes já tiveram flights...





parece que errei... existia 1 com "null" em alguma column...












--> eu errei pq eu "contei" com * (todos os rows),

e nao com "f" (que significa A TABLE DE FLIGHTS)...




A VERSAO CORRETA DO CÓDIGO FICOU ASSIM:





ex:






SELECT
ad.model,
COUNT(f) AS n_of_flights
-- ad.model,
-- COUNT(*) AS n_of_flights 
FROM aircrafts_data AS ad
LEFT JOIN flights AS f
ON f.aircraft_code = ad.aircraft_code
-- WHERE f.aircraft_code IS NULL
GROUP BY ad.model;












CÓDIGO LIMPO:





SELECT
ad.model,
COUNT(f) AS n_of_flights
FROM aircrafts_data AS ad
LEFT JOIN flights AS f
ON f.aircraft_code = ad.aircraft_code
GROUP BY ad.model;











E ASSIM:






SELECT
ad.model,
COUNT(f) AS n_of_flights
FROM aircrafts_data AS ad
LEFT JOIN flights AS f
ON f.aircraft_code = ad.aircraft_code
WHERE f.aircraft_code IS NULL
GROUP BY ad.model;









E O OUTPUT FICOU ASSIM:












"model"	                                                        "n_of_flights"
"{""en"": ""Airbus A320-200"", ""ru"": ""Аэробус A320-200""}"	        0
"{""en"": ""Boeing 737-300"", ""ru"": ""Боинг 737-300""}"	            1274
"{""en"": ""Bombardier CRJ-200"", ""ru"": ""Бомбардье CRJ-200""}"	        9048
"{""en"": ""Boeing 767-300"", ""ru"": ""Боинг 767-300""}"	                1221
"{""en"": ""Sukhoi Superjet-100"", ""ru"": ""Сухой Суперджет-100""}"	    8504
"{""en"": ""Airbus A321-200"", ""ru"": ""Аэробус A321-200""}"	            1952
"{""en"": ""Boeing 777-300"", ""ru"": ""Боинг 777-300""}"	                610
"{""en"": ""Airbus A319-100"", ""ru"": ""Аэробус A319-100""}"	            1239
"{""en"": ""Cessna 208 Caravan"", ""ru"": ""Сессна 208 Караван""}"	        9273

















SE TIVÉSSEMOS USADO O INNER JOIN,


NAO TERÍAMOS CONSEGUIDO ESSE ROW... (

    esse filtering com o where nao teria funcionado.
)




QUER DIZER QUE, COM O LEFT JOIN, ATÉ MESMO OS AIRCRAFTS (tABLE A) 

QUE NAO APARECEM NA TABLE B (FLIGHTS)


APARECEM NO FINAL OUTPUT....
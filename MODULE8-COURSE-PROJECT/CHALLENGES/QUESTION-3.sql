Question 3:

Level: Moderate

Topic: JOIN

Task: Create a list of 
the film titles including their title, 
length, and category name
ordered descendingly by length. 
Filter the results to only 
the movies in the category 'Drama' or 'Sports'.



QUERY:



SELECT 
	title,
	length,
	c.name
FROM film AS f
LEFT JOIN film_category AS fc
ON fc.film_id = f.film_id
INNER JOIN category AS c
ON fc.category_id = c.category_id
WHERE c.name IN ('Drama', 'Sports')
ORDER BY length DESC;
	


OUTPUT:


"title"	"length"	"name"
"SMOOCHY CONTROL"	184	"Sports"
"RECORDS ZORRO"	182	"Sports"
"STAR OPERATION"	181	"Sports"
"JACKET FRISCO"	181	"Drama"
"SOMETHING DUCK"	180	"Drama"
"MUSSOLINI SPOILERS"	180	"Sports"
"SLACKER LIAISONS"	179	"Drama"
"TORQUE BOUND"	179	"Drama"
"VIRGIN DAISY"	179	"Drama"
"FLIGHT LIES"	179	"Sports"
"ANONYMOUS HUMAN"	179	"Sports"
"DROP WATERFRONT"	178	"Sports"
"WARDROBE PHANTOM"	178	"Drama"
"IMAGE PRINCESS"	178	"Sports"
"RIDER CADDYSHACK"	177	"Sports"
"BEAUTY GREASE"	175	"Drama"
"JADE BUNCH"	174	"Sports"
"VIETNAM SMOOCHY"	174	"Drama"
"EVOLUTION ALTER"	174	"Sports"
"TALENTED HOMICIDE"	173	"Sports"
"CONQUERER NUTS"	173	"Drama"
"NORTHWEST POLISH"	172	"Sports"
"TIGHTS DAWN"	172	"Sports"
"KRAMER CHOCOLATE"	171	"Sports"
"TRADING PINOCCHIO"	170	"Sports"
"ARTIST COLDBLOODED"	170	"Sports"
"HAROLD FRENCH"	168	"Drama"
"TRANSLATION SUMMER"	168	"Drama"
"LESSON CLEOPATRA"	167	"Sports"
"EXORCIST STING"	167	"Sports"
"GREEDY ROOTS"	166	"Drama"
"QUEEN LUKE"	163	"Drama"
"ROSES TREASURE"	162	"Sports"
"NEIGHBORS CHARADE"	161	"Sports"
"PEACH INNOCENT"	160	"Sports"
"MUMMY CREATURES"	160	"Sports"
"POSEIDON FOREVER"	159	"Sports"
"WEST LION"	159	"Drama"
"DRIVER ANNIE"	159	"Sports"
"SECRETARY ROUGE"	158	"Sports"
"HOBBIT ALIEN"	157	"Drama"
"SLIPPER FIDELITY"	156	"Sports"
"DURHAM PANKY"	154	"Sports"
"EDGE KISSING"	153	"Drama"
"APOLLO TEEN"	153	"Drama"
"ELIZABETH SHANE"	152	"Sports"
"LUCK OPUS"	152	"Drama"
"TUXEDO MILE"	152	"Sports"
"TOURIST PELICAN"	152	"Sports"
"STRAIGHT HOURS"	151	"Sports"
"HUNCHBACK IMPOSSIBLE"	151	"Drama"
"BEETHOVEN EXORCIST"	151	"Drama"
"SATURDAY LAMBS"	150	"Sports"
"HYSTERICAL GRAIL"	150	"Sports"
"RIVER OUTLAW"	149	"Sports"
"RACER EGG"	147	"Drama"
"LIES TREATMENT"	147	"Drama"
"ROCKY WAR"	145	"Drama"
"PAYCHECK WAIT"	145	"Drama"
"CHILL LUCK"	142	"Drama"
"SPICE SORORITY"	141	"Drama"
"STEERS ARMAGEDDON"	140	"Sports"
"GRACELAND DYNAMITE"	140	"Sports"
"LIBERTY MAGNIFICENT"	138	"Sports"
"PHILADELPHIA WIFE"	137	"Sports"
"SCORPION APOLLO"	137	"Drama"
"SQUAD FISH"	136	"Sports"
"SIERRA DIVIDE"	135	"Sports"
"DUDE BLINDNESS"	132	"Sports"
"NECKLACE OUTBREAK"	132	"Drama"
"HOLES BRANNIGAN"	128	"Sports"
"GUNFIGHTER MUSSOLINI"	127	"Sports"
"SAINTS BRIDE"	125	"Drama"
"DECEIVER BETRAYED"	122	"Drama"
"HARRY IDAHO"	121	"Drama"
"PATHS CONTROL"	118	"Drama"
"ORIENT CLOSER"	118	"Drama"
"INSTINCT AIRPORT"	116	"Sports"
"BLADE POLISH"	114	"Drama"
"CONEHEADS SMOOCHY"	112	"Drama"
"CRUSADE HONEY"	112	"Sports"
"SEABISCUIT PUNK"	112	"Sports"
"GROOVE FICTION"	111	"Sports"
"SEATTLE EXPECATIONS"	110	"Drama"
"DIARY PANIC"	107	"Drama"
"CHITTY LOCK"	107	"Drama"
"DALMATIONS SWEDEN"	106	"Drama"
"JOON NORTHWEST"	105	"Sports"
"MOB DUFFEL"	105	"Drama"
"MERMAID INSECTS"	104	"Sports"
"MOTHER OLEANDER"	103	"Sports"
"PIRATES ROXANNE"	100	"Sports"
"FLATLINERS KILLER"	100	"Sports"
"WITCHES PANIC"	100	"Drama"
"DARKNESS WAR"	99	"Drama"
"PERDITION FARGO"	99	"Sports"
"TENENBAUMS COMMAND"	99	"Drama"
"GOLDFINGER SENSIBILITY"	93	"Drama"
"ENCOUNTERS CURTAIN"	92	"Drama"
"CARIBBEAN LIBERTY"	92	"Sports"
"GLEAMING JAWBREAKER"	89	"Sports"
"CONGENIALITY QUEST"	87	"Sports"
"TREATMENT JEKYLL"	87	"Drama"
"SAVANNAH TOWN"	84	"Drama"
"HONEY TIES"	84	"Sports"
"GONE TROUBLE"	84	"Drama"
"LOSER HUSTLER"	80	"Sports"
"SEA VIRGIN"	80	"Drama"
"PEAK FOREVER"	80	"Sports"
"UNFAITHFUL KILL"	78	"Drama"
"PICKUP DRIVING"	77	"Sports"
"DESTINATION JERK"	76	"Drama"
"SATISFACTION CONFIDENTIAL"	75	"Sports"
"CALIFORNIA BIRDS"	75	"Sports"
"BRIGHT ENCOUNTERS"	73	"Drama"
"CHANCE RESURRECTION"	70	"Sports"
"LEBOWSKI SOLDIERS"	69	"Drama"
"SHOOTIST SUPERFLY"	67	"Drama"
"CONFESSIONS MAGUIRE"	65	"Drama"
"CRAFT OUTFIELD"	64	"Drama"
"NOVOCAINE FLIGHT"	64	"Sports"
"VICTORY ACADEMY"	64	"Sports"
"MILE MULAN"	64	"Sports"
"REUNION WITCHES"	63	"Drama"
"ALADDIN CALENDAR"	63	"Sports"
"BUNCH MINDS"	63	"Drama"
"HANGING DEEP"	62	"Drama"
"SHAKESPEARE SADDLE"	60	"Sports"
"BUBBLE GROSSE"	60	"Sports"
"PITY BOUND"	60	"Drama"
"CRANES RESERVOIR"	57	"Sports"
"MOSQUITO ARMAGEDDON"	57	"Sports"
"SENSE GREEK"	54	"Sports"
"NOTTING SPEAKEASY"	48	"Drama"
"DIVORCE SHINING"	47	"Sports"
"KWAI HOMEWARD"	46	"Drama"



Question: In which category is the longest film and how long is it?

Answer: Sports and 184










----------------------


MINHA VERSAO:









SELECT 
	title,
	length,
	c.name
FROM film AS f
LEFT JOIN film_category AS fc
ON fc.film_id = f.film_id
INNER JOIN category AS c
ON fc.category_id = c.category_id
WHERE c.name IN ('Drama', 'Sports')
ORDER BY length DESC;













CORRECAO DO PROFESSOR:





SELECT 
title,
c.name,
length
FROM film AS f
LEFT JOIN film_category AS fc 
ON f.film_id = fc.film_id
LEFT JOIN category AS c
ON c.category_id=fc.category_id 
WHERE c.name IN ('Drama', 'Sports')
ORDER BY length DESC;


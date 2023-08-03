Level: Very difficult

Topic: Uncorrelated subquery

Task: Create a list that shows the "average customer lifetime value" grouped by the different districts.

Example:
If there are two customers 
in "District 1" where one customer has a total (lifetime) spent of $1000 and the second customer has a total spent of $2000 then the "average customer lifetime spent" in this district is $1500.

So, first, you need to 
calculate the total per customer and then the average of these totals per district.

Question: Which district has the highest average customer lifetime value?







QUERY:




SELECT
result_set.district_name,
ROUND(SUM(amount_spent_per_customer)/COUNT(result_set.customer_id), 2) AS lifetime_earnings_per_district
FROM (
	SELECT 
c.customer_id AS customer_id,
a.district AS district_name,
SUM(p.amount) AS amount_spent_per_customer
FROM payment AS p
LEFT JOIN customer AS c
ON c.customer_id = p.customer_id
JOIN address AS a 
ON a.address_id = c.address_id
GROUP BY c.customer_id, a.district
ORDER BY a.district DESC
) AS result_set
GROUP BY result_set.district_name
ORDER BY lifetime_earnings_per_district DESC;




OUTPUT:

"district_name"	"lifetime_earnings_per_district"
"Saint-Denis"	216.54
"Minsk"	195.58
"Skikda"	173.63
"Khartum"	169.65
"Pietari"	162.62
"Hodeida"	160.68
"Irkutsk"	159.67
"Baskimaa"	158.69
"Adygea"	155.68
"Changhwa"	155.59
"Southern Tagalog"	152.99
"Nakhon Sawan"	152.67
"Kalimantan Barat"	152.65
"Balikesir"	152.63
"Central Serbia"	151.67
"Baden-Wrttemberg"	151.65
"Sofala"	151.63
"Gelderland"	150.69
"Arecibo"	150.66
"Lombardia"	149.67
"Songkhla"	148.67
"Esfahan"	148.01
"Usak"	147.65
"Kwara & Kogi"	146.69
"Par"	145.68
"Batman"	145.67
"British Colombia"	144.70
"Chollanam"	144.67
"Skne ln"	144.66
"Khanh Hoa"	143.68
"Daugavpils"	142.70
"Kowloon and New Kowl"	142.70
"Moscow (City)"	142.66
"Esprito Santo"	141.71
"Nam Ha"	141.70
"Puebla"	141.67
"Tokat"	141.66
"Chimborazo"	140.69
"Hebei"	140.68
"Ningxia"	139.70
"Kaohsiung"	139.66
"Veracruz"	138.71
"Kedah"	138.68
"Aden"	137.69
"Kitaa"	137.66
"East Java"	137.19
"Ahal"	136.73
"Florida"	136.20
	136.00
"Shiga"	135.74
"Attika"	135.74
"Dolnoslaskie"	135.72
"Baijeri"	135.71
"Sumqayit"	135.70
"East Azerbaidzan"	135.69
"Chari-Baguirmi"	135.68
"Hiroshima"	135.36
"Rio de Janeiro"	134.70
"Jilin"	134.69
"Yamaguchi"	134.68
"Copperbelt"	134.67
"Aceh"	134.66
"Dhaka"	134.02
"Nampula"	133.75
"Severn Morava"	133.71
"Kirov"	133.71
"Sisilia"	132.72
"Kyonggi"	132.68
"Osmaniye"	131.73
"Michigan"	131.22
"Krim"	130.74
"Roraima"	130.68
"Ohio"	130.22
"Loja"	129.72
"Sucre"	129.71
"Hunan"	129.71
"Banjul"	129.70
"Eastern Visayas"	129.70
"Central Visayas"	129.68
"Midi-Pyrnes"	129.68
"Tennessee"	129.24
"Michoacn de Ocampo"	128.71
"Taka-Karpatia"	128.70
"Sinaloa"	128.67
"Gansu"	128.20
"Haryana"	128.19
"Antofagasta"	127.73
"Miyazaki"	127.71
"Chisinau"	127.66
"Santa Catarina"	126.73
"Edo & Delta"	126.72
"Coquimbo"	126.72
"Huanuco"	126.71
"Shanxi"	126.70
"Southern Mindanao"	126.69
"North Carolina"	126.68
"Lima"	126.68
"Saitama"	126.36
"Northern Cape"	125.76
"Ontario"	125.71
"Zhejiang"	125.24
"al-Daqahliya"	124.73
"Botosani"	124.67
"Slaskie"	124.36
"al-Qalyubiya"	124.22
"So Paulo"	123.95
"Lilongwe"	123.72
"Apulia"	123.70
"Taipei"	123.69
"Volgograd"	122.74
"Santa F"	122.73
"Gifu"	122.71
"St Thomas"	122.68
"Central"	122.42
"Jiangsu"	122.18
"Mazowieckie"	121.76
"Massachusetts"	121.74
"Risaralda"	121.23
"Galicia"	121.04
"Kursk"	120.77
"Funafuti"	120.74
"Sawhaj"	120.74
"Qaraghandy"	120.71
"Morelos"	120.70
"Ondo & Ekiti"	120.70
"Anhalt Sachsen"	120.69
"Sichuan"	120.03
"Stavropol"	119.74
"Manab"	119.72
"Steiermark"	119.71
"Liepaja"	119.70
"Hanoi"	119.69
"Yerevan"	118.75
"Mie"	118.75
"Sharja"	118.73
"Salzburg"	118.72
"Sind"	118.70
"Nagasaki"	118.68
"Oyo & Osun"	118.48
"Tamil Nadu"	118.33
"Boyac"	117.76
"Sumy"	117.76
"Kang-won"	117.75
"Tahiti"	117.73
"Hmelnytskyi"	117.71
"Nonthaburi"	117.70
"Maharashtra"	117.42
"California"	117.39
"Madhya Pradesh"	117.05
"Northern"	116.70
"Minas Gerais"	116.40
"Andhra Pradesh"	116.08
"Callao"	115.74
"Sarawak"	115.73
"Mwanza"	115.71
"Tartumaa"	115.70
"Nothwest Border Prov"	115.70
"Chiba"	115.70
"Nagano"	115.68
"Mxico"	115.47
"Baja California"	114.75
"Perak"	114.74
"Zanzibar West"	114.73
"Streymoyar"	114.72
"Vaduz"	114.72
"Western Cape"	114.72
"Rajasthan"	114.24
"Chihuahua"	114.23
"Gauteng"	113.97
"Rabat-Sal-Zammour-Z"	113.78
"Ynlin"	113.73
"Pyongyang-si"	113.69
"Brunei and Muara"	113.65
"Buenos Aires"	113.32
"Northern Mindanao"	113.23
"Guanajuato"	113.23
"Illinois"	112.97
"Inner Mongolia"	112.96
"Istanbul"	112.77
"Ruse"	112.76
"al-Manama"	112.75
"Nebraska"	112.75
"Batna"	112.72
"Sagaing"	112.70
"Ha Darom"	112.24
"Zulia"	111.77
"Benguela"	111.75
"Hawalli"	111.74
"Nordrhein-Westfalen"	111.74
"Sivas"	111.74
"Ninawa"	111.73
"Taizz"	111.72
"Fejr"	111.71
"Kerala"	111.24
"National Capital Reg"	111.21
"Uttar Pradesh"	110.86
"East Kasai"	110.76
"Santiago"	110.76
"al-Sharqiya"	110.74
"Tabora"	110.73
"Oriental"	110.73
"Kurgan"	110.72
"Bukarest"	110.71
"North West"	110.24
"West Bengali"	109.95
"Sokoto & Kebbi & Zam"	109.75
"Caquet"	109.75
"Bern"	109.75
"Nyanza"	109.75
"Baki"	109.73
"Gurico"	109.72
"Henan"	109.07
"Cear"	108.78
"Toscana"	108.76
"Lipetsk"	108.75
"Liaoning"	108.73
"Paran"	107.77
"Tianjin"	107.77
"Vojvodina"	107.76
"Smolensk"	107.76
"Hainan"	107.74
"Cagayan Valley"	107.74
"Guerrero"	107.73
"Puerto Plata"	107.70
"Karnataka"	107.56
"Abu Dhabi"	107.22
"Mekka"	105.77
"Georgia"	105.73
"Shandong"	105.63
"Bauchi & Gombe"	104.77
"Wielkopolskie"	104.75
"Tabuk"	104.74
"Oaxaca"	104.74
"Nantou"	104.72
"Coahuila de Zaragoza"	104.07
"Cayenne"	103.78
"Okinawa"	103.77
"Gumma"	103.77
"Jharkhand"	103.76
"Colorado"	103.75
"Haiphong"	103.75
"Moskova"	103.75
"Ponce"	103.73
"Namibe"	103.73
"Pernambuco"	103.72
"Guangdong"	102.24
"England"	102.05
"Gaziantep"	101.78
"Pohjois-Pohjanmaa"	101.74
"Shaba"	101.74
"Ibaragi"	101.74
"Osaka"	101.73
"Texas"	101.54
"Ivanovo"	100.77
"Ziguinchor"	100.75
"Bihar"	100.74
"Drenthe"	100.74
"Sanaa"	100.74
"Centre"	100.69
"West Java"	100.50
"Kerman"	99.80
"La Romana"	99.77
"Ishikawa"	99.77
"Nord-Ouest"	99.77
"Piura"	99.75
"Central Mindanao"	99.73
"Kalmykia"	98.79
"Tel Aviv"	98.77
"Tokyo-to"	98.77
"Gois"	98.75
"Battambang"	98.74
"Okayama"	98.45
"Chiayi"	97.76
"Krasnojarsk"	97.74
"Zufar"	97.73
"Campeche"	96.78
"Asir"	96.76
"Bchar"	96.75
"St George"	96.75
"West Greece"	96.72
"Fukushima"	96.26
"KwaZulu-Natal"	95.80
"Jiangxi"	95.78
"Baja California Sur"	95.78
"Qubec"	95.78
"Virginia"	95.77
"Kanagawa"	95.77
"Chuquisaca"	95.77
"Eskisehir"	95.75
"Crdoba"	95.75
"Free State"	95.72
"Tatarstan"	95.27
"Missouri"	95.26
"Sumatera Selatan"	94.82
"Jakarta Raya"	94.76
"Distrito Federal"	94.76
"Scotland"	94.74
"Mahajanga"	93.78
"Nghe An"	93.78
"Kaduna"	93.77
"Utrecht"	93.77
"Valle"	93.75
"Kermanshah"	93.74
"Gujarat"	93.45
"Hidalgo"	93.29
"Punjab"	93.19
"Miranda"	92.79
"Kaliningrad"	92.79
"Provence-Alpes-Cte"	92.76
"Hamilton"	92.76
"Phnom Penh"	92.73
"Markazi"	92.73
"Washington"	91.80
"Heilongjiang"	91.79
"Piemonte"	91.79
"Jaroslavl"	91.79
"Addis Abeba"	91.77
"Kyongsangbuk"	91.76
"New Hampshire"	91.76
"Nova Scotia"	91.75
"Haskovo"	91.74
"Rio Grande do Sul"	91.45
"Carabobo"	90.78
"Noord-Brabant"	90.77
"Adana"	89.79
"Lubelskie"	89.79
"Kilis"	89.78
"Masqat"	89.77
"Qina"	89.77
"Bratislava"	89.74
"Central Java"	89.43
"Hubei"	88.96
"Denizli"	88.82
"Sulawesi Utara"	88.80
"Bursa"	88.74
"Asuncin"	87.79
"Cheju"	87.79
"Saarland"	87.76
"La Paz"	87.76
"Xinxiang"	86.76
"Caraga"	86.27
"Asturia"	84.78
"Chaharmahal va Bakht"	84.77
"Assam"	83.79
"Vaud"	83.78
"Central Luzon"	82.81
"Jalisco"	82.80
"Tadla-Azilal"	82.78
"Tucumn"	82.76
"Mandalay"	81.78
"Mogiljov"	81.76
"Alto Paran"	80.82
"Bretagne"	79.80
"Nizni Novgorod"	79.78
"Komi"	78.80
"Sousse"	78.77
"Pavlodar"	77.77
"Friuli-Venezia Giuli"	74.81
"Rostov-na-Donu"	74.80
"OHiggins"	73.84
"Ktahya"	73.82
"Tongatapu"	73.82
"Tuvassia"	73.77
"Vilna"	73.76
"Shimane"	72.80
"Pays de la Loire"	71.80
"Tutuila"	71.80
"Tamaulipas"	71.77
"North Austria"	68.79
"Kabol"	67.82
"Anzotegui"	66.79
"Basel-Stadt"	58.86
"Tete"	58.82
"al-Qadarif"	57.81
"Kujawsko-Pomorskie"	52.88
"Fujian"	50.86



Answer: Saint-Denis with an average customer lifetime value of 216.54.















MINHA SOLUCAO:











SELECT
result_set.district_name,
ROUND(
SUM(amount_spent_per_customer)/COUNT(result_set.customer_id), 2)

 AS lifetime_earnings_per_district
FROM (
	SELECT 
c.customer_id AS customer_id,
a.district AS district_name,
SUM(p.amount) AS amount_spent_per_customer
FROM payment AS p
LEFT JOIN customer AS c
ON c.customer_id = p.customer_id
JOIN address AS a 
ON a.address_id = c.address_id
GROUP BY c.customer_id, a.district
ORDER BY a.district DESC
) AS result_set
GROUP BY result_set.district_name
ORDER BY lifetime_earnings_per_district DESC;











SOLUCAO DO PROFESSOR:



SELECT
district,
ROUND(AVG(total),2) AS avg_customer_spent
FROM
(SELECT 
c.customer_id,
district,
SUM(amount) total
FROM payment p
INNER JOIN customer c
ON c.customer_id=p.customer_id
INNER JOIN address a
ON c.address_id=a.address_id
GROUP BY district, c.customer_id) sub
GROUP BY district
ORDER BY 2 DESC
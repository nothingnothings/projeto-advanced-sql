-- Level: Moderate

-- Topic: JOIN & GROUP BY

-- Task: Create an overview of the cities and how much sales (sum of amount) have occurred there.

-- Question: Which city has the most sales?







QUERY:



SELECT 
ci.city AS city_name,
SUM(p.amount) AS sales
FROM city AS ci
LEFT JOIN address AS a
ON a.city_id = ci.city_id
INNER JOIN customer AS c
ON c.address_id = a.address_id
INNER JOIN payment AS p
ON p.customer_id = c.customer_id
GROUP BY city_name
ORDER BY sales DESC;




OUTPUT:




"city_name"	"sales"
"Cape Coral"	221.55
"Saint-Denis"	216.54
"Aurora"	198.50
"Molodetno"	195.58
"Apeldoorn"	194.61
"Santa Brbara dOeste"	194.61
"Qomsheh"	186.62
"London"	180.52
"Ourense (Orense)"	177.60
"Bijapur"	175.61
"Tanza"	175.58
"Memphis"	174.66
"Skikda"	173.63
"Halisahar"	170.67
"Omdurman"	169.65
"Santa Rosa"	167.67
"Richmond Hill"	167.62
"Valparai"	166.65
"Kolpino"	162.62
"Bhilwara"	161.68
"Tanauan"	161.65
"Hodeida"	160.68
"Sumy"	159.72
"Zhoushan"	159.68
"Usolje-Sibirskoje"	159.67
"Lengshuijiang"	159.64
"Donostia-San Sebastin"	158.69
"Probolinggo"	158.66
"Salamanca"	157.65
"Najafabad"	157.65
"Maikop"	155.68
"Tangail"	155.65
"Changhwa"	155.59
"Changzhou"	154.60
"Shubra al-Khayma"	153.66
"Cam Ranh"	152.68
"Nakhon Sawan"	152.67
"Citt del Vaticano"	152.66
"Karnal"	152.65
"Pontianak"	152.65
"Balikesir"	152.63
"Uruapan"	151.67
"Kragujevac"	151.67
"Fuyu"	151.66
"Mannheim"	151.65
"Bergamo"	151.64
"Beira"	151.63
"Arecibo"	150.66
"Cabuyao"	149.65
"Yangor"	148.69
"Songkhla"	148.67
"Brescia"	147.69
"Usak"	147.65
"Ilorin"	146.69
"Akron"	146.69
"Hsichuh"	146.64
"Sincelejo"	145.70
"Belm"	145.68
"Batman"	145.67
"Vancouver"	144.70
"Ogbomosho"	144.68
"Naju"	144.67
"Malm"	144.66
"Nantou"	144.62
"Onomichi"	143.71
"Nyeri"	143.71
"Dos Quebradas"	143.68
"Daugavpils"	142.70
"Kowloon and New Kowloon"	142.70
"Moscow"	142.66
"Ciomas"	142.66
"Vila Velha"	141.71
"Nam Dinh"	141.70
"Rae Bareli"	141.69
"Atlixco"	141.67
"Binzhou"	141.67
"Tokat"	141.66
"Ikerre"	141.63
"Robamba"	140.69
"Qinhuangdao"	140.68
"Shimonoseki"	140.64
"Sterling Heights"	139.71
"Cuauhtmoc"	139.71
"Omiya"	139.70
"Yinchuan"	139.70
"Duisburg"	139.67
"Fengshan"	139.66
"Coatzacoalcos"	138.71
"Imus"	138.71
"Sungai Petani"	138.68
"Fontana"	138.67
"Siliguri (Shiliguri)"	138.66
"Ife"	137.70
"Parbhani"	137.69
"Aden"	137.69
"Ashdod"	137.67
"Nuuk"	137.66
"Ashgabat"	136.73
"Tychy"	136.64
"Athenai"	135.74
"Otsu"	135.74
"Wroclaw"	135.72
"Erlangen"	135.71
"Sumqayit"	135.70
"Papeete"	135.70
"Tabriz"	135.69
"NDjamna"	135.68
"Boksburg"	135.68
"Jinchang"	135.66
"Juiz de Fora"	134.73
"Angra dos Reis"	134.70
"La Plata"	134.68
"Leshan"	134.68
"Bhopal"	134.68
"Nha Trang"	134.68
"Kitwe"	134.67
"Lhokseumawe"	134.66
"Naala-Porto"	133.75
"Mysore"	133.73
"Goinia"	133.72
"Joliet"	133.72
"Kirovo-Tepetsk"	133.71
"Olomouc"	133.71
"Lancaster"	133.70
"Syrakusa"	132.72
"Miraj"	132.71
"Avellaneda"	132.70
"Huixquilucan"	132.70
"San Felipe del Progreso"	132.70
"Uijongbu"	132.68
"Osmaniye"	131.73
"Hiroshima"	131.70
"Sorocaba"	131.67
"Simferopol"	130.74
"Jining"	130.73
"Jedda"	130.72
"Yuncheng"	130.70
"Boa Vista"	130.68
"Fukuyama"	130.68
"York"	129.72
"Loja"	129.72
"Salinas"	129.70
"Banjul"	129.70
"Patiala"	129.70
"Baybay"	129.70
"Lapu-Lapu"	129.68
"Toulouse"	129.68
"Santo Andr"	129.64
"Ozamis"	128.73
"San Bernardino"	128.73
"Baha Blanca"	128.72
"Iwakuni"	128.71
"Mukateve"	128.70
"El Fuerte"	128.67
"Ahmadnagar"	128.67
"Vijayawada"	127.75
"Antofagasta"	127.73
"Miyakonojo"	127.71
"Tiefa"	127.71
"Jhansi"	127.71
"Xinxiang"	127.70
"Jamalpur"	127.68
"Jastrzebie-Zdrj"	127.68
"Urawa"	127.66
"Chisinau"	127.66
"Blumenau"	126.73
"Purnea (Purnia)"	126.73
"Coquimbo"	126.72
"Benin City"	126.72
"Hunuco"	126.71
"Cuernavaca"	126.71
"Merlo"	126.70
"Davao"	126.69
"Lima"	126.68
"Greensboro"	126.68
"Kimberley"	125.76
"Emeishan"	124.74
"Mit Ghamr"	124.73
"Dallas"	124.72
"Cavite"	124.70
"Botosani"	124.67
"Liaocheng"	124.66
"Lilongwe"	123.72
"Palghat (Palakkad)"	123.71
"Brindisi"	123.70
"Lungtan"	123.66
"Kamyin"	122.74
"Santa F"	122.73
"Warren"	122.72
"Mandaluyong"	122.71
"Kakamigahara"	122.71
"Datong"	122.69
"Charlotte Amalie"	122.68
"Xiangfan"	122.66
"Plock"	121.76
"Brockton"	121.74
"Satna"	121.70
"Korolev"	121.69
"Dadu"	121.69
"Kursk"	120.77
"Baiyin"	120.74
"Ambattur"	120.74
"Sawhaj"	120.74
"Funafuti"	120.74
"Zhezqazghan"	120.71
"Southend-on-Sea"	120.71
"Halle/Saale"	120.69
"Udaipur"	119.74
"Pjatigorsk"	119.74
"Pudukkottai"	119.73
"Portoviejo"	119.72
"Graz"	119.71
"Liepaja"	119.70
"Rampur"	119.70
"Hanoi"	119.69
"Chandrapur"	119.68
"Yerevan"	118.75
"Kuwana"	118.75
"Sharja"	118.73
"Owo"	118.73
"Dhaka"	118.72
"Tanshui"	118.72
"Salzburg"	118.72
"Bhimavaram"	118.71
"Tongliao"	118.68
"Sasebo"	118.68
"Southampton"	117.77
"Quilmes"	117.76
"Sogamoso"	117.76
"Tonghae"	117.75
"Iwaki"	117.74
"Effon-Alaiye"	117.73
"Citrus Heights"	117.72
"Po"	117.72
"Kamjanets-Podilskyi"	117.71
"Baicheng"	117.71
"Jinzhou"	117.70
"Pak Kret"	117.70
"Birgunj"	116.78
"Newcastle"	116.77
"Jaffna"	116.70
"Sunnyvale"	116.69
"Uluberia"	116.69
"Poos de Caldas"	116.68
"Callao"	115.74
"Kuching"	115.73
"Madiun"	115.72
"Weifang"	115.71
"Tambaram"	115.71
"Mwanza"	115.71
"Shikarpur"	115.71
"Shaoguan"	115.71
"Nagareyama"	115.70
"Mardan"	115.70
"Tartu"	115.70
"Ueda"	115.68
"Guaruj"	114.76
"Mexicali"	114.75
"Ipoh"	114.74
"Lipetsk"	114.74
"Zanzibar"	114.73
"Trshavn"	114.72
"Vaduz"	114.72
"Rockford"	114.72
"Paarl"	114.72
"Haldia"	114.69
"Cuautla"	114.69
"Sal"	113.78
"Huejutla de Reyes"	113.75
"Garden Grove"	113.74
"Acua"	113.74
"Dayton"	113.74
"Touliu"	113.73
"Nabereznyje Telny"	113.71
"Cuman"	113.71
"Pyongyang"	113.69
"Bandar Seri Begawan"	113.65
"Sultanbeyli"	112.77
"Ruse"	112.76
"Lincoln"	112.75
"al-Manama"	112.75
"Adana"	112.74
"Rustenburg"	112.73
"Batna"	112.72
"Monywa"	112.70
"Tel Aviv-Jaffa"	112.70
"Maracabo"	111.77
"Benguela"	111.75
"Jalib al-Shuyukh"	111.74
"Sivas"	111.74
"Pemalang"	111.73
"Iwatsuki"	111.73
"Mosul"	111.73
"Taizz"	111.72
"Szkesfehrvr"	111.71
"Munger (Monghyr)"	111.68
"Mwene-Ditu"	110.76
"Santiago de los Caballeros"	110.76
"al-Qatif"	110.75
"Uttarpara-Kotrung"	110.74
"Nador"	110.73
"Tabora"	110.73
"Bilbays"	110.72
"Kurgan"	110.72
"Meixian"	110.72
"Bucuresti"	110.71
"Pune"	110.70
"Shanwei"	110.70
"Hohhot"	110.66
"Stockport"	109.78
"Arlington"	109.75
"Bern"	109.75
"Florencia"	109.75
"Kisumu"	109.75
"Sokoto"	109.75
"Etawah"	109.74
"Johannesburg"	109.73
"Baku"	109.73
"Valle de la Pascua"	109.72
"Akishima"	109.72
"Tandil"	109.68
"Juazeiro do Norte"	108.78
"Livorno"	108.76
"Witten"	108.75
"Czestochowa"	108.75
"Celaya"	108.74
"Soshanguve"	108.72
"Peoria"	108.70
"Tianjin"	107.77
"Maring"	107.77
"Novi Sad"	107.76
"Smolensk"	107.76
"Sanya"	107.74
"Klerksdorp"	107.74
"Tuguegarao"	107.74
"Jos Azueta"	107.73
"A Corua (La Corua)"	107.71
"San Felipe de Puerto Plata"	107.70
"Abu Dhabi"	107.68
"Ede"	106.77
"Bhavnagar"	106.77
"San Lorenzo"	106.77
"Sagamihara"	106.76
"al-Ayn"	106.75
"Ljubertsy"	106.73
"South Hill"	106.65
"Tsuyama"	105.79
"Hidalgo"	105.75
"Allende"	105.75
"Kansas City"	105.75
"Chungho"	105.75
"Augusta-Richmond County"	105.73
"Atinsk"	105.71
"Coacalco de Berriozbal"	104.78
"Deba Habe"	104.77
"Dongying"	104.77
"Kalisz"	104.75
"Kamarhati"	104.74
"San Juan Bautista Tuxtepec"	104.74
"Tabuk"	104.74
"Izumisano"	104.70
"Cayenne"	103.78
"Isesaki"	103.77
"Okinawa"	103.77
"ostka"	103.76
"Yuzhou"	103.75
"Haiphong"	103.75
"Bhusawal"	103.74
"Ponce"	103.73
"Rio Claro"	103.73
"Namibe"	103.73
"Yamuna Nagar"	103.72
"Vitria de Santo Anto"	103.72
"Jelets"	102.76
"Escobar"	102.74
"Rajkot"	101.78
"Adoni"	101.78
"Gaziantep"	101.78
"Almirante Brown"	101.75
"Springs"	101.75
"Ondo"	101.75
"Lubumbashi"	101.74
"Vicente Lpez"	101.74
"Tama"	101.74
"Oulu"	101.74
"Chapra"	100.80
"Balaiha"	100.78
"Ivanovo"	100.77
"Varanasi (Benares)"	100.76
"Ziguinchor"	100.75
"Sanaa"	100.74
"Emmen"	100.74
"Araatuba"	100.72
"Yaound"	100.69
"Daxian"	100.67
"Sirjan"	99.80
"Okayama"	99.79
"Xiangtan"	99.78
"Firozabad"	99.77
"La Romana"	99.77
"Kanazawa"	99.77
"Bamenda"	99.77
"Suihua"	99.76
"Faaa"	99.76
"Sullana"	99.75
"Esfahan"	99.75
"Monclova"	99.74
"Iligan"	99.73
"Taguig"	99.70
"Yantai"	98.80
"Elista"	98.79
"So Bernardo do Campo"	98.78
"So Leopoldo"	98.78
"Sambhal"	98.77
"Pereira"	98.77
"Allappuzha (Alleppey)"	98.76
"Jaipur"	98.75
"Higashiosaka"	98.75
"Battambang"	98.74
"Torren"	98.73
"Ibirit"	97.80
"Talavera"	97.79
"Chiayi"	97.76
"Caracas"	97.74
"Compton"	97.74
"Laohekou"	97.74
"Salala"	97.73
"Gingoog"	97.72
"Carmen"	96.78
"Abha"	96.76
"Kingstown"	96.75
"Bchar"	96.75
"Alvorada"	96.74
"Garland"	96.73
"Patras"	96.72
"La Paz"	95.78
"Gatineau"	95.78
"Pingxiang"	95.78
"Guadalajara"	95.77
"Aparecida de Goinia"	95.77
"Sucre"	95.77
"Roanoke"	95.77
"Nanyang"	95.77
"Zaria"	95.75
"Eskisehir"	95.75
"Crdoba"	95.75
"Botshabelo"	95.72
"Pangkal Pinang"	94.82
"Shimoga"	94.79
"Shivapuri"	94.78
"Qalyub"	94.77
"Jakarta"	94.76
"Dundee"	94.74
"Oshawa"	93.78
"Mahajanga"	93.78
"Vinh"	93.78
"Amersfoort"	93.77
"guas Lindas de Gois"	93.76
"Buenaventura"	93.75
"Anpolis"	93.75
"Kermanshah"	93.74
"Laredo"	93.72
"Kaliningrad"	92.79
"Ocumare del Tuy"	92.79
"Toulon"	92.76
"Hamilton"	92.76
"Bayugan"	92.75
"Arak"	92.73
"Phnom Penh"	92.73
"Laiwu"	92.73
"Bellevue"	91.80
"Okara"	91.79
"Jaroslavl"	91.79
"Alessandria"	91.79
"Kaduna"	91.78
"Braslia"	91.78
"Addis Abeba"	91.77
"Zalantun"	91.77
"Manchester"	91.76
"Xintai"	91.76
"Kimchon"	91.76
"Halifax"	91.75
"Junan"	91.75
"Balurghat"	91.74
"Stara Zagora"	91.74
"Nezahualcyotl"	91.70
"Haining"	90.79
"Valencia"	90.78
"s-Hertogenbosch"	90.77
"Ciparay"	90.77
"Lublin"	89.79
"Konotop"	89.79
"Kilis"	89.78
"Ezhou"	89.77
"Masqat"	89.77
"Idfu"	89.77
"Kurashiki"	89.76
"Zeleznogorsk"	89.76
"Katihar"	89.75
"Huaian"	89.75
"Bratislava"	89.74
"Surakarta"	89.74
"Denizli"	88.82
"Gorontalo"	88.80
"Rizhao"	88.79
"Dhule (Dhulia)"	88.78
"Amroha"	88.76
"Jurez"	88.75
"Inegl"	88.74
"Hino"	87.82
"Purwakarta"	87.81
"Cheju"	87.79
"Asuncin"	87.79
"Bradford"	87.77
"Saarbrcken"	87.76
"El Alto"	87.76
"Ashqelon"	86.81
"Siegen"	86.81
"Hami"	86.79
"Korla"	86.72
"Serpuhov"	85.80
"Hoshiarpur"	85.79
"Bat Yam"	84.83
"Kamakura"	84.78
"Gijn"	84.78
"Shahr-e Kord"	84.77
"Saint Louis"	84.77
"Clarksville"	83.82
"Tieli"	83.81
"Southport"	83.79
"Nagaon"	83.79
"Lausanne"	83.78
"Grand Prairie"	82.79
"Beni-Mellal"	82.78
"San Miguel de Tucumn"	82.76
"Myingyan"	81.78
"Mogiljov"	81.76
"Mandi Bahauddin"	80.83
"Ciudad del Este"	80.82
"al-Hawiya"	80.82
"Ranchi"	80.79
"Yingkou"	80.77
"Valle de Santiago"	80.76
"Cianjur"	80.74
"Tarlac"	79.81
"Brest"	79.80
"Bislig"	79.79
"El Monte"	79.79
"Dzerzinsk"	79.78
"Bag"	78.84
"Syktyvkar"	78.80
"Sousse"	78.77
"Pathankot"	77.82
"Santiago de Compostela"	77.80
"Pavlodar"	77.77
"Niznekamsk"	76.83
"Jodhpur"	76.78
"Ezeiza"	76.77
"Luzinia"	76.77
"Berhampore (Baharampur)"	75.79
"Chatsworth"	74.83
"Udine"	74.81
"Novoterkassk"	74.80
"Koriyama"	74.78
"Zaoyang"	74.78
"Rancagua"	73.84
"Ktahya"	73.82
"Nukualofa"	73.82
"Oyo"	73.80
"Teboksary"	73.77
"Vilnius"	73.76
"Pachuca de Soto"	72.82
"Matsue"	72.80
"Gandhinagar"	71.81
"Shenzhen"	71.81
"Le Mans"	71.80
"Tafuna"	71.80
"Matamoros"	71.77
"Hagonoy"	70.82
"Gulbarga"	70.81
"Zapopan"	69.83
"Kumbakonam"	68.82
"Linz"	68.79
"Kabul"	67.82
"Tarsus"	66.84
"Tegal"	66.81
"Barcelona"	66.79
"Kanchrapara"	65.84
"Tsaotun"	64.81
"Hubli-Dharwad"	62.85
"Enshi"	59.86
"Basel"	58.86
"Tete"	58.82
"al-Qadarif"	57.81
"Bydgoszcz"	52.88
"Fuzhou"	50.86
"Tallahassee"	50.85

-- Answer: Cape Coral with a total amount of 221.55





MINHA VERSAO:









SELECT 
ci.city AS city_name,
SUM(p.amount) AS sales
FROM city AS ci
LEFT JOIN address AS a
ON a.city_id = ci.city_id
INNER JOIN customer AS c
ON c.address_id = a.address_id
INNER JOIN payment AS p
ON p.customer_id = c.customer_id
GROUP BY city_name
ORDER BY sales DESC;




versao do professor:











SELECT 
ci.city AS city_name,
SUM(p.amount) AS sales
FROM city AS ci
LEFT JOIN address AS a
ON a.city_id = ci.city_id
INNER JOIN customer AS c
ON c.address_id = a.address_id
INNER JOIN payment AS p
ON p.customer_id = c.customer_id
GROUP BY city_name
ORDER BY sales DESC;





---------------------














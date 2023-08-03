-- Level: Moderate to difficult

-- Topic: JOIN & GROUP BY

-- Task: Create an overview of the revenue (sum of amount) grouped by a column in the format "country, city".

-- Question: Which country, city has the least sales?





QUERY:


SELECT 
CONCAT(co.country, ', ', ci.city) AS country_and_city,
SUM(p.amount) AS amount_sold
FROM payment AS p
LEFT JOIN customer AS C
ON c.customer_id = p.customer_id
JOIN address AS a
ON a.address_id = c.address_id
JOIN city AS ci
ON a.city_id = ci.city_id 
JOIN country AS co
ON co.country_id = ci.country_id
GROUP BY country_and_city
ORDER BY amount_sold;




OUTPUT:















"United States, Tallahassee"	50.85
"China, Fuzhou"	50.86
"Poland, Bydgoszcz"	52.88
"Sudan, al-Qadarif"	57.81
"Mozambique, Tete"	58.82
"Switzerland, Basel"	58.86
"China, Enshi"	59.86
"India, Hubli-Dharwad"	62.85
"Taiwan, Tsaotun"	64.81
"India, Kanchrapara"	65.84
"Venezuela, Barcelona"	66.79
"Indonesia, Tegal"	66.81
"Turkey, Tarsus"	66.84
"Afghanistan, Kabul"	67.82
"Austria, Linz"	68.79
"India, Kumbakonam"	68.82
"Mexico, Zapopan"	69.83
"India, Gulbarga"	70.81
"Philippines, Hagonoy"	70.82
"Mexico, Matamoros"	71.77
"France, Le Mans"	71.80
"American Samoa, Tafuna"	71.80
"India, Gandhinagar"	71.81
"China, Shenzhen"	71.81
"Japan, Matsue"	72.80
"Mexico, Pachuca de Soto"	72.82
"Lithuania, Vilnius"	73.76
"Russian Federation, Teboksary"	73.77
"Nigeria, Oyo"	73.80
"Turkey, Ktahya"	73.82
"Tonga, Nukualofa"	73.82
"Chile, Rancagua"	73.84
"China, Zaoyang"	74.78
"Japan, Koriyama"	74.78
"Russian Federation, Novoterkassk"	74.80
"Italy, Udine"	74.81
"South Africa, Chatsworth"	74.83
"India, Berhampore (Baharampur)"	75.79
"Argentina, Ezeiza"	76.77
"Brazil, Luzinia"	76.77
"India, Jodhpur"	76.78
"Russian Federation, Niznekamsk"	76.83
"Kazakstan, Pavlodar"	77.77
"Spain, Santiago de Compostela"	77.80
"India, Pathankot"	77.82
"Tunisia, Sousse"	78.77
"Russian Federation, Syktyvkar"	78.80
"Brazil, Bag"	78.84
"Russian Federation, Dzerzinsk"	79.78
"United States, El Monte"	79.79
"Philippines, Bislig"	79.79
"France, Brest"	79.80
"Philippines, Tarlac"	79.81
"Indonesia, Cianjur"	80.74
"Mexico, Valle de Santiago"	80.76
"China, Yingkou"	80.77
"India, Ranchi"	80.79
"Paraguay, Ciudad del Este"	80.82
"Saudi Arabia, al-Hawiya"	80.82
"Pakistan, Mandi Bahauddin"	80.83
"Belarus, Mogiljov"	81.76
"Myanmar, Myingyan"	81.78
"Argentina, San Miguel de Tucumn"	82.76
"Morocco, Beni-Mellal"	82.78
"United States, Grand Prairie"	82.79
"Switzerland, Lausanne"	83.78
"United Kingdom, Southport"	83.79
"India, Nagaon"	83.79
"China, Tieli"	83.81
"United States, Clarksville"	83.82
"Iran, Shahr-e Kord"	84.77
"United States, Saint Louis"	84.77
"Spain, Gijn"	84.78
"Japan, Kamakura"	84.78
"Israel, Bat Yam"	84.83
"India, Hoshiarpur"	85.79
"Russian Federation, Serpuhov"	85.80
"China, Korla"	86.72
"China, Hami"	86.79
"Germany, Siegen"	86.81
"Israel, Ashqelon"	86.81
"Bolivia, El Alto"	87.76
"Germany, Saarbrcken"	87.76
"United Kingdom, Bradford"	87.77
"Paraguay, Asuncin"	87.79
"South Korea, Cheju"	87.79
"Indonesia, Purwakarta"	87.81
"Japan, Hino"	87.82
"Turkey, Inegl"	88.74
"Mexico, Jurez"	88.75
"India, Amroha"	88.76
"India, Dhule (Dhulia)"	88.78
"China, Rizhao"	88.79
"Indonesia, Gorontalo"	88.80
"Turkey, Denizli"	88.82
"Slovakia, Bratislava"	89.74
"Indonesia, Surakarta"	89.74
"India, Katihar"	89.75
"China, Huaian"	89.75
"Russian Federation, Zeleznogorsk"	89.76
"Japan, Kurashiki"	89.76
"Oman, Masqat"	89.77
"China, Ezhou"	89.77
"Egypt, Idfu"	89.77
"Turkey, Kilis"	89.78
"Ukraine, Konotop"	89.79
"Poland, Lublin"	89.79
"Indonesia, Ciparay"	90.77
"Netherlands, s-Hertogenbosch"	90.77
"Venezuela, Valencia"	90.78
"China, Haining"	90.79
"Mexico, Nezahualcyotl"	91.70
"India, Balurghat"	91.74
"Bulgaria, Stara Zagora"	91.74
"Canada, Halifax"	91.75
"China, Junan"	91.75
"China, Xintai"	91.76
"United States, Manchester"	91.76
"South Korea, Kimchon"	91.76
"Ethiopia, Addis Abeba"	91.77
"China, Zalantun"	91.77
"Nigeria, Kaduna"	91.78
"Brazil, Braslia"	91.78
"Italy, Alessandria"	91.79
"Russian Federation, Jaroslavl"	91.79
"Pakistan, Okara"	91.79
"United States, Bellevue"	91.80
"China, Laiwu"	92.73
"Iran, Arak"	92.73
"Cambodia, Phnom Penh"	92.73
"Philippines, Bayugan"	92.75
"France, Toulon"	92.76
"New Zealand, Hamilton"	92.76
"Venezuela, Ocumare del Tuy"	92.79
"Russian Federation, Kaliningrad"	92.79
"United States, Laredo"	93.72
"Iran, Kermanshah"	93.74
"Brazil, Anpolis"	93.75
"Colombia, Buenaventura"	93.75
"Brazil, guas Lindas de Gois"	93.76
"Netherlands, Amersfoort"	93.77
"Canada, Oshawa"	93.78
"Vietnam, Vinh"	93.78
"Madagascar, Mahajanga"	93.78
"United Kingdom, Dundee"	94.74
"Indonesia, Jakarta"	94.76
"Egypt, Qalyub"	94.77
"India, Shivapuri"	94.78
"India, Shimoga"	94.79
"Indonesia, Pangkal Pinang"	94.82
"South Africa, Botshabelo"	95.72
"Nigeria, Zaria"	95.75
"Turkey, Eskisehir"	95.75
"Argentina, Crdoba"	95.75
"China, Nanyang"	95.77
"Bolivia, Sucre"	95.77
"Brazil, Aparecida de Goinia"	95.77
"United States, Roanoke"	95.77
"Mexico, Guadalajara"	95.77
"Mexico, La Paz"	95.78
"China, Pingxiang"	95.78
"Canada, Gatineau"	95.78
"Greece, Patras"	96.72
"United States, Garland"	96.73
"Brazil, Alvorada"	96.74
"Saint Vincent and the Grenadines, Kingstown"	96.75
"Algeria, Bchar"	96.75
"Saudi Arabia, Abha"	96.76
"Mexico, Carmen"	96.78
"Philippines, Gingoog"	97.72
"Oman, Salala"	97.73
"Venezuela, Caracas"	97.74
"United States, Compton"	97.74
"China, Laohekou"	97.74
"Taiwan, Chiayi"	97.76
"Philippines, Talavera"	97.79
"Brazil, Ibirit"	97.80
"Mexico, Torren"	98.73
"Cambodia, Battambang"	98.74
"India, Jaipur"	98.75
"Japan, Higashiosaka"	98.75
"India, Allappuzha (Alleppey)"	98.76
"India, Sambhal"	98.77
"Colombia, Pereira"	98.77
"Brazil, So Bernardo do Campo"	98.78
"Brazil, So Leopoldo"	98.78
"Russian Federation, Elista"	98.79
"China, Yantai"	98.80
"Philippines, Taguig"	99.70
"Philippines, Iligan"	99.73
"Mexico, Monclova"	99.74
"Iran, Esfahan"	99.75
"Peru, Sullana"	99.75
"French Polynesia, Faaa"	99.76
"China, Suihua"	99.76
"Dominican Republic, La Romana"	99.77
"Cameroon, Bamenda"	99.77
"India, Firozabad"	99.77
"Japan, Kanazawa"	99.77
"China, Xiangtan"	99.78
"Japan, Okayama"	99.79
"Iran, Sirjan"	99.80
"China, Daxian"	100.67
"Cameroon, Yaound"	100.69
"Brazil, Araatuba"	100.72
"Yemen, Sanaa"	100.74
"Netherlands, Emmen"	100.74
"Senegal, Ziguinchor"	100.75
"India, Varanasi (Benares)"	100.76
"Russian Federation, Ivanovo"	100.77
"Russian Federation, Balaiha"	100.78
"India, Chapra"	100.80
"Congo, The Democratic Republic of the, Lubumbashi"	101.74
"Finland, Oulu"	101.74
"Japan, Tama"	101.74
"Argentina, Vicente Lpez"	101.74
"Nigeria, Ondo"	101.75
"Argentina, Almirante Brown"	101.75
"South Africa, Springs"	101.75
"India, Rajkot"	101.78
"India, Adoni"	101.78
"Turkey, Gaziantep"	101.78
"Argentina, Escobar"	102.74
"Russian Federation, Jelets"	102.76
"India, Yamuna Nagar"	103.72
"Brazil, Vitria de Santo Anto"	103.72
"Angola, Namibe"	103.73
"Puerto Rico, Ponce"	103.73
"Brazil, Rio Claro"	103.73
"India, Bhusawal"	103.74
"China, Yuzhou"	103.75
"Vietnam, Haiphong"	103.75
"Ukraine, ostka"	103.76
"Japan, Okinawa"	103.77
"Japan, Isesaki"	103.77
"French Guiana, Cayenne"	103.78
"Japan, Izumisano"	104.70
"Saudi Arabia, Tabuk"	104.74
"India, Kamarhati"	104.74
"Mexico, San Juan Bautista Tuxtepec"	104.74
"Poland, Kalisz"	104.75
"China, Dongying"	104.77
"Nigeria, Deba Habe"	104.77
"Mexico, Coacalco de Berriozbal"	104.78
"Russian Federation, Atinsk"	105.71
"United States, Augusta-Richmond County"	105.73
"United States, Kansas City"	105.75
"Mexico, Hidalgo"	105.75
"Taiwan, Chungho"	105.75
"Mexico, Allende"	105.75
"Japan, Tsuyama"	105.79
"Anguilla, South Hill"	106.65
"Russian Federation, Ljubertsy"	106.73
"United Arab Emirates, al-Ayn"	106.75
"Japan, Sagamihara"	106.76
"Paraguay, San Lorenzo"	106.77
"India, Bhavnagar"	106.77
"Netherlands, Ede"	106.77
"United Arab Emirates, Abu Dhabi"	107.68
"Dominican Republic, San Felipe de Puerto Plata"	107.70
"Spain, A Corua (La Corua)"	107.71
"Mexico, Jos Azueta"	107.73
"China, Sanya"	107.74
"Philippines, Tuguegarao"	107.74
"South Africa, Klerksdorp"	107.74
"Yugoslavia, Novi Sad"	107.76
"Russian Federation, Smolensk"	107.76
"Brazil, Maring"	107.77
"China, Tianjin"	107.77
"United States, Peoria"	108.70
"South Africa, Soshanguve"	108.72
"Mexico, Celaya"	108.74
"Germany, Witten"	108.75
"Poland, Czestochowa"	108.75
"Italy, Livorno"	108.76
"Brazil, Juazeiro do Norte"	108.78
"Argentina, Tandil"	109.68
"Japan, Akishima"	109.72
"Venezuela, Valle de la Pascua"	109.72
"South Africa, Johannesburg"	109.73
"Azerbaijan, Baku"	109.73
"India, Etawah"	109.74
"Colombia, Florencia"	109.75
"Switzerland, Bern"	109.75
"United States, Arlington"	109.75
"Nigeria, Sokoto"	109.75
"Kenya, Kisumu"	109.75
"United Kingdom, Stockport"	109.78
"China, Hohhot"	110.66
"India, Pune"	110.70
"China, Shanwei"	110.70
"Romania, Bucuresti"	110.71
"Egypt, Bilbays"	110.72
"Russian Federation, Kurgan"	110.72
"China, Meixian"	110.72
"Tanzania, Tabora"	110.73
"Morocco, Nador"	110.73
"India, Uttarpara-Kotrung"	110.74
"Saudi Arabia, al-Qatif"	110.75
"Congo, The Democratic Republic of the, Mwene-Ditu"	110.76
"Dominican Republic, Santiago de los Caballeros"	110.76
"India, Munger (Monghyr)"	111.68
"Hungary, Szkesfehrvr"	111.71
"Yemen, Taizz"	111.72
"Japan, Iwatsuki"	111.73
"Indonesia, Pemalang"	111.73
"Iraq, Mosul"	111.73
"Turkey, Sivas"	111.74
"Kuwait, Jalib al-Shuyukh"	111.74
"Angola, Benguela"	111.75
"Venezuela, Maracabo"	111.77
"Myanmar, Monywa"	112.70
"Israel, Tel Aviv-Jaffa"	112.70
"Algeria, Batna"	112.72
"South Africa, Rustenburg"	112.73
"Turkey, Adana"	112.74
"United States, Lincoln"	112.75
"Bahrain, al-Manama"	112.75
"Bulgaria, Ruse"	112.76
"Turkey, Sultanbeyli"	112.77
"Brunei, Bandar Seri Begawan"	113.65
"North Korea, Pyongyang"	113.69
"Venezuela, Cuman"	113.71
"Russian Federation, Nabereznyje Telny"	113.71
"Taiwan, Touliu"	113.73
"United States, Dayton"	113.74
"United States, Garden Grove"	113.74
"Mexico, Acua"	113.74
"Mexico, Huejutla de Reyes"	113.75
"Morocco, Sal"	113.78
"Mexico, Cuautla"	114.69
"India, Haldia"	114.69
"United States, Rockford"	114.72
"Liechtenstein, Vaduz"	114.72
"Faroe Islands, Trshavn"	114.72
"South Africa, Paarl"	114.72
"Tanzania, Zanzibar"	114.73
"Malaysia, Ipoh"	114.74
"Russian Federation, Lipetsk"	114.74
"Mexico, Mexicali"	114.75
"Brazil, Guaruj"	114.76
"Japan, Ueda"	115.68
"Japan, Nagareyama"	115.70
"Estonia, Tartu"	115.70
"Pakistan, Mardan"	115.70
"India, Tambaram"	115.71
"Tanzania, Mwanza"	115.71
"China, Weifang"	115.71
"Pakistan, Shikarpur"	115.71
"China, Shaoguan"	115.71
"Indonesia, Madiun"	115.72
"Malaysia, Kuching"	115.73
"Peru, Callao"	115.74
"Brazil, Poos de Caldas"	116.68
"India, Uluberia"	116.69
"United States, Sunnyvale"	116.69
"Sri Lanka, Jaffna"	116.70
"South Africa, Newcastle"	116.77
"Nepal, Birgunj"	116.78
"China, Jinzhou"	117.70
"Thailand, Pak Kret"	117.70
"China, Baicheng"	117.71
"Ukraine, Kamjanets-Podilskyi"	117.71
"Brazil, Po"	117.72
"United States, Citrus Heights"	117.72
"Nigeria, Effon-Alaiye"	117.73
"Japan, Iwaki"	117.74
"South Korea, Tonghae"	117.75
"Colombia, Sogamoso"	117.76
"Argentina, Quilmes"	117.76
"United Kingdom, Southampton"	117.77
"China, Tongliao"	118.68
"Japan, Sasebo"	118.68
"India, Bhimavaram"	118.71
"Taiwan, Tanshui"	118.72
"Bangladesh, Dhaka"	118.72
"Austria, Salzburg"	118.72
"United Arab Emirates, Sharja"	118.73
"Nigeria, Owo"	118.73
"Armenia, Yerevan"	118.75
"Japan, Kuwana"	118.75
"India, Chandrapur"	119.68
"Vietnam, Hanoi"	119.69
"Latvia, Liepaja"	119.70
"India, Rampur"	119.70
"Austria, Graz"	119.71
"Ecuador, Portoviejo"	119.72
"India, Pudukkottai"	119.73
"India, Udaipur"	119.74
"Russian Federation, Pjatigorsk"	119.74
"Germany, Halle/Saale"	120.69
"Kazakstan, Zhezqazghan"	120.71
"United Kingdom, Southend-on-Sea"	120.71
"China, Baiyin"	120.74
"Tuvalu, Funafuti"	120.74
"Egypt, Sawhaj"	120.74
"India, Ambattur"	120.74
"Russian Federation, Kursk"	120.77
"Russian Federation, Korolev"	121.69
"Pakistan, Dadu"	121.69
"India, Satna"	121.70
"United States, Brockton"	121.74
"Poland, Plock"	121.76
"China, Xiangfan"	122.66
"Virgin Islands, U.S., Charlotte Amalie"	122.68
"China, Datong"	122.69
"Japan, Kakamigahara"	122.71
"Philippines, Mandaluyong"	122.71
"United States, Warren"	122.72
"Argentina, Santa F"	122.73
"Russian Federation, Kamyin"	122.74
"Taiwan, Lungtan"	123.66
"Italy, Brindisi"	123.70
"India, Palghat (Palakkad)"	123.71
"Malawi, Lilongwe"	123.72
"China, Liaocheng"	124.66
"Romania, Botosani"	124.67
"Philippines, Cavite"	124.70
"United States, Dallas"	124.72
"Egypt, Mit Ghamr"	124.73
"China, Emeishan"	124.74
"South Africa, Kimberley"	125.76
"Peru, Lima"	126.68
"United States, Greensboro"	126.68
"Philippines, Davao"	126.69
"Argentina, Merlo"	126.70
"Peru, Hunuco"	126.71
"Mexico, Cuernavaca"	126.71
"Nigeria, Benin City"	126.72
"Chile, Coquimbo"	126.72
"Brazil, Blumenau"	126.73
"India, Purnea (Purnia)"	126.73
"Japan, Urawa"	127.66
"Moldova, Chisinau"	127.66
"Bangladesh, Jamalpur"	127.68
"Poland, Jastrzebie-Zdrj"	127.68
"China, Xinxiang"	127.70
"China, Tiefa"	127.71
"India, Jhansi"	127.71
"Japan, Miyakonojo"	127.71
"Chile, Antofagasta"	127.73
"India, Vijayawada"	127.75
"Mexico, El Fuerte"	128.67
"India, Ahmadnagar"	128.67
"Ukraine, Mukateve"	128.70
"Japan, Iwakuni"	128.71
"Argentina, Baha Blanca"	128.72
"United States, San Bernardino"	128.73
"Philippines, Ozamis"	128.73
"Brazil, Santo Andr"	129.64
"Philippines, Lapu-Lapu"	129.68
"France, Toulouse"	129.68
"Gambia, Banjul"	129.70
"India, Patiala"	129.70
"United States, Salinas"	129.70
"Philippines, Baybay"	129.70
"Ecuador, Loja"	129.72
"United Kingdom, York"	129.72
"Japan, Fukuyama"	130.68
"Brazil, Boa Vista"	130.68
"China, Yuncheng"	130.70
"Saudi Arabia, Jedda"	130.72
"China, Jining"	130.73
"Ukraine, Simferopol"	130.74
"Brazil, Sorocaba"	131.67
"Japan, Hiroshima"	131.70
"Turkey, Osmaniye"	131.73
"South Korea, Uijongbu"	132.68
"Argentina, Avellaneda"	132.70
"Mexico, Huixquilucan"	132.70
"Mexico, San Felipe del Progreso"	132.70
"India, Miraj"	132.71
"Italy, Syrakusa"	132.72
"United States, Lancaster"	133.70
"Czech Republic, Olomouc"	133.71
"Russian Federation, Kirovo-Tepetsk"	133.71
"United States, Joliet"	133.72
"Brazil, Goinia"	133.72
"India, Mysore"	133.73
"Mozambique, Naala-Porto"	133.75
"Indonesia, Lhokseumawe"	134.66
"Zambia, Kitwe"	134.67
"China, Leshan"	134.68
"Argentina, La Plata"	134.68
"India, Bhopal"	134.68
"Vietnam, Nha Trang"	134.68
"Brazil, Angra dos Reis"	134.70
"Brazil, Juiz de Fora"	134.73
"China, Jinchang"	135.66
"Chad, NDjamna"	135.68
"South Africa, Boksburg"	135.68
"Iran, Tabriz"	135.69
"French Polynesia, Papeete"	135.70
"Azerbaijan, Sumqayit"	135.70
"Germany, Erlangen"	135.71
"Poland, Wroclaw"	135.72
"Japan, Otsu"	135.74
"Greece, Athenai"	135.74
"Poland, Tychy"	136.64
"Turkmenistan, Ashgabat"	136.73
"Greenland, Nuuk"	137.66
"Israel, Ashdod"	137.67
"Yemen, Aden"	137.69
"India, Parbhani"	137.69
"Nigeria, Ife"	137.70
"India, Siliguri (Shiliguri)"	138.66
"United States, Fontana"	138.67
"Malaysia, Sungai Petani"	138.68
"Philippines, Imus"	138.71
"Mexico, Coatzacoalcos"	138.71
"Taiwan, Fengshan"	139.66
"Germany, Duisburg"	139.67
"China, Yinchuan"	139.70
"Japan, Omiya"	139.70
"United States, Sterling Heights"	139.71
"Mexico, Cuauhtmoc"	139.71
"Japan, Shimonoseki"	140.64
"China, Qinhuangdao"	140.68
"Ecuador, Robamba"	140.69
"Nigeria, Ikerre"	141.63
"Turkey, Tokat"	141.66
"Mexico, Atlixco"	141.67
"China, Binzhou"	141.67
"India, Rae Bareli"	141.69
"Vietnam, Nam Dinh"	141.70
"Brazil, Vila Velha"	141.71
"Indonesia, Ciomas"	142.66
"Russian Federation, Moscow"	142.66
"Latvia, Daugavpils"	142.70
"Hong Kong, Kowloon and New Kowloon"	142.70
"Colombia, Dos Quebradas"	143.68
"Japan, Onomichi"	143.71
"Kenya, Nyeri"	143.71
"Taiwan, Nantou"	144.62
"Sweden, Malm"	144.66
"South Korea, Naju"	144.67
"Nigeria, Ogbomosho"	144.68
"Canada, Vancouver"	144.70
"Turkey, Batman"	145.67
"Brazil, Belm"	145.68
"Colombia, Sincelejo"	145.70
"Taiwan, Hsichuh"	146.64
"Nigeria, Ilorin"	146.69
"United States, Akron"	146.69
"Turkey, Usak"	147.65
"Italy, Brescia"	147.69
"Thailand, Songkhla"	148.67
"Nauru, Yangor"	148.69
"Philippines, Cabuyao"	149.65
"Puerto Rico, Arecibo"	150.66
"Mozambique, Beira"	151.63
"Italy, Bergamo"	151.64
"Germany, Mannheim"	151.65
"China, Fuyu"	151.66
"Mexico, Uruapan"	151.67
"Yugoslavia, Kragujevac"	151.67
"Turkey, Balikesir"	152.63
"Indonesia, Pontianak"	152.65
"India, Karnal"	152.65
"Holy See (Vatican City State), Citt del Vaticano"	152.66
"Thailand, Nakhon Sawan"	152.67
"Vietnam, Cam Ranh"	152.68
"Egypt, Shubra al-Khayma"	153.66
"China, Changzhou"	154.60
"Taiwan, Changhwa"	155.59
"Bangladesh, Tangail"	155.65
"Russian Federation, Maikop"	155.68
"Iran, Najafabad"	157.65
"Mexico, Salamanca"	157.65
"Indonesia, Probolinggo"	158.66
"Spain, Donostia-San Sebastin"	158.69
"China, Lengshuijiang"	159.64
"Russian Federation, Usolje-Sibirskoje"	159.67
"China, Zhoushan"	159.68
"Ukraine, Sumy"	159.72
"Yemen, Hodeida"	160.68
"Philippines, Tanauan"	161.65
"India, Bhilwara"	161.68
"Russian Federation, Kolpino"	162.62
"India, Valparai"	166.65
"Canada, Richmond Hill"	167.62
"Philippines, Santa Rosa"	167.67
"Sudan, Omdurman"	169.65
"India, Halisahar"	170.67
"Algeria, Skikda"	173.63
"United States, Memphis"	174.66
"Philippines, Tanza"	175.58
"India, Bijapur"	175.61
"Spain, Ourense (Orense)"	177.60
"United Kingdom, London"	180.52
"Iran, Qomsheh"	186.62
"Netherlands, Apeldoorn"	194.61
"Brazil, Santa Brbara dOeste"	194.61
"Belarus, Molodetno"	195.58
"United States, Aurora"	198.50
"Runion, Saint-Denis"	216.54
"United States, Cape Coral"	221.55










Answer: United States, Tallahassee with a total amount of 50.85.



















MINHA VERSAO:








SELECT 
CONCAT(co.country, ', ', ci.city) AS country_and_city,
SUM(p.amount) AS amount_sold
FROM payment AS p
LEFT JOIN customer AS C
ON c.customer_id = p.customer_id
JOIN address AS a
ON a.address_id = c.address_id
JOIN city AS ci
ON a.city_id = ci.city_id 
JOIN country AS co
ON co.country_id = ci.country_id
GROUP BY country_and_city
ORDER BY amount_sold;





VERSAO DO PROFESSOR:





SELECT 
CONCAT(co.country, ', ', ci.city) AS country_and_city,
SUM(p.amount) AS amount_sold
FROM payment AS p
LEFT JOIN customer AS C
ON c.customer_id = p.customer_id
JOIN address AS a
ON a.address_id = c.address_id
JOIN city AS ci
ON a.city_id = ci.city_id 
JOIN country AS co
ON co.country_id = ci.country_id
GROUP BY country_and_city
ORDER BY amount_sold;


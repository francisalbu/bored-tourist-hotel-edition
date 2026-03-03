-- =====================================================
-- FIX: Viator affiliate_url → canonical productUrl
-- Fixes 'Explore City / You selected' redirect bug
-- Run in: Supabase Dashboard → SQL Editor
-- =====================================================

-- display_order 105: 7592P12
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Douro-Valley-Wine-Tour-with-Lunch-Tastings-and-River-Cruise/d26879-7592P12?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 105 AND affiliate_provider = 'Viator';

-- display_order 106: 384973P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Private-Tile-Painting-Workshop-in-Porto/d26879-384973P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 106 AND affiliate_provider = 'Viator';

-- display_order 107: 442666P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Porto-Surf-Experience/d26879-442666P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 107 AND affiliate_provider = 'Viator';

-- display_order 108: 122201P7
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Pastel-de-Nata-Pastery-Class/d26879-122201P7?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 108 AND affiliate_provider = 'Viator';

-- display_order 109: 406702P4
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Porto-Douro-River-Boat-Cruise-with-Port-Wine-and-Snacks/d26879-406702P4?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 109 AND affiliate_provider = 'Viator';

-- display_order 110: 7372P39
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Douro-Valley-Tour-with-Visit-to-two-Vineyards-River-Cruise-and-Lunch-at-Winery/d26879-7372P39?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 110 AND affiliate_provider = 'Viator';

-- display_order 111: 204176P3
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/SPIRITUS-A-melhor-maneira-de-viajar-e-sentir/d26879-204176P3?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 111 AND affiliate_provider = 'Viator';

-- display_order 112: 264534P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Private-Cruise-on-the-Douro-River/d26879-264534P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 112 AND affiliate_provider = 'Viator';

-- display_order 113: 154994P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/FOOD-TOURS-IN-PORTO-TO-EAT-LIKE-A-LOCAL/d26879-154994P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 113 AND affiliate_provider = 'Viator';

-- display_order 114: 174294P3
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Private-Sunset-Sailing-Cruise-on-the-Douro-River/d26879-174294P3?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 114 AND affiliate_provider = 'Viator';

-- display_order 115: 14873P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Cook-and-Taste-Porto/d26879-14873P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 115 AND affiliate_provider = 'Viator';

-- display_order 116: 31913P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Skip-the-Line-Port-Wine-Lodges-Tour-Including-7-Wine-Tastings/d26879-31913P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 116 AND affiliate_provider = 'Viator';

-- display_order 117: 12546DOUROVALLEY
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Douro-Valley-Small-Group-Tour-with-Wine-Tasting-Portuguese-Lunch-and-Optional-River-Cruise/d26879-12546DOUROVALLEY?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 117 AND affiliate_provider = 'Viator';

-- display_order 118: 48293P7
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Porto-Food-Tour-Full-Meal-and-Drinks/d26879-48293P7?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 118 AND affiliate_provider = 'Viator';

-- display_order 119: 6877P104
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Excursion-to-Aveiro-and-Costa-Nova-with-moliceiro-boat-ride/d26879-6877P104?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 119 AND affiliate_provider = 'Viator';

-- display_order 120: 8996P137
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Livraria-Lello-Entry-Ticket-Portos-Most-Iconic-Bookstore/d26879-8996P137?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 120 AND affiliate_provider = 'Viator';

-- display_order 121: 5902P10
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Porto-Highlights-E-Bike-Tour/d26879-5902P10?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 121 AND affiliate_provider = 'Viator';

-- display_order 122: 118678P21
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/9-Hour-Suspension-Bridge-516-Arouca-and-Passadicos-do-Paiva/d26879-118678P21?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 122 AND affiliate_provider = 'Viator';

-- display_order 123: 58705P7
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/HIKE-in-DOURO-VALLEY-w-winery-and-Boat-Cruise/d26879-58705P7?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 123 AND affiliate_provider = 'Viator';

-- display_order 124: 75688P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Fado-at-6h/d26879-75688P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 124 AND affiliate_provider = 'Viator';

-- display_order 125: 26918P6
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Braga-and-Guimaraes-with-Lunch-Included-Small-Group-Full-Day/d26879-26918P6?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 125 AND affiliate_provider = 'Viator';

-- display_order 126: 7372P18
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Porto-Jewish-Heritage-Walking-Tour/d26879-7372P18?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 126 AND affiliate_provider = 'Viator';

-- display_order 127: 43382P8
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Polaris-RZR-Buggy-Tour-4x4/d26879-43382P8?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 127 AND affiliate_provider = 'Viator';

-- display_order 128: 194996P4
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Rabelo-Tour/d26879-194996P4?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 128 AND affiliate_provider = 'Viator';

-- display_order 129: 66616P4
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Geres-National-Park-Nature-and-Countryside/d26879-66616P4?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 129 AND affiliate_provider = 'Viator';

-- display_order 130: 19333P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Portuguese-Gastronomy-Guided-Workshop-in-Porto/d26879-19333P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 130 AND affiliate_provider = 'Viator';

-- display_order 131: 7812P85
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Secret-Food-Tours-Porto/d26879-7812P85?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 131 AND affiliate_provider = 'Viator';

-- display_order 132: 405446P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Caminhe-pelo-Porto-e-descubra-a-historia-LGBTQIA/d26879-405446P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 132 AND affiliate_provider = 'Viator';

-- display_order 133: 168365P4
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Best-of-Porto-Walking-Tour/d26879-168365P4?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 133 AND affiliate_provider = 'Viator';

-- display_order 134: 57617P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Private-Tour-Viana-do-Castelo-from-Porto/d26879-57617P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 134 AND affiliate_provider = 'Viator';

-- display_order 135: 18121P3
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Craft-Beer-and-Food-Tour/d26879-18121P3?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 135 AND affiliate_provider = 'Viator';

-- display_order 136: 66671P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Port-Wine-Cocktails-Workshop-at-Espaco-Porto-Cruz/d26879-66671P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 136 AND affiliate_provider = 'Viator';

-- display_order 137: 102838P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Half-Day-Porto-Photo-Tour/d26879-102838P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 137 AND affiliate_provider = 'Viator';

-- display_order 138: 203526P17
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Beyond-the-Barrel-From-Decadent-to-Down-home-in-the-Heart-of-Porto/d26879-203526P17?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 138 AND affiliate_provider = 'Viator';

-- display_order 139: 131810P2
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/From-Porto-to-Gaia-Private-Bike-Tour/d26879-131810P2?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 139 AND affiliate_provider = 'Viator';

-- display_order 140: 7378P2
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Douro-4x4-Offtrack-Adventure-from-Porto/d26879-7378P2?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 140 AND affiliate_provider = 'Viator';

-- display_order 141: 124583P2
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/Pinhao-private-hike/d26879-124583P2?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 141 AND affiliate_provider = 'Viator';

-- display_order 142: 176562P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Braga/Tour-4X4-Discovering-the-Serra-dArga-in-Alto-Minho/d27331-176562P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 142 AND affiliate_provider = 'Viator';

-- display_order 143: 63975P3
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Porto/CITY-and-MOUNTAIN-BIKE-TOUR/d26879-63975P3?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 143 AND affiliate_provider = 'Viator';

-- display_order 181: 43786P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/Madeira-Exquisite-Food-on-Foot-Tours/d5392-43786P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 181 AND affiliate_provider = 'Viator';

-- display_order 182: 112367P38
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Funchal/AROUND-THE-ISLAND-TWO-DAYS-TOUR/d22388-112367P38?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 182 AND affiliate_provider = 'Viator';

-- display_order 183: 192925P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/Sunrise-At-Pico-Do-Arieiro-Hike-To-Pico-Ruivo/d5392-192925P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 183 AND affiliate_provider = 'Viator';

-- display_order 184: 125569P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Funchal/Jeep-Tours-4x4/d22388-125569P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 184 AND affiliate_provider = 'Viator';

-- display_order 185: 16720P4
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Funchal/Northern-Wonders-Jeep-Tour/d22388-16720P4?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 185 AND affiliate_provider = 'Viator';

-- display_order 186: 23523P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Calheta/Whale-and-Dolphin-Watching-or-Swim-with-Dolphins-in-Madeira/d50841-23523P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 186 AND affiliate_provider = 'Viator';

-- display_order 187: 23651P5
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/Madeira-Nuns-Valley-Tour/d5392-23651P5?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 187 AND affiliate_provider = 'Viator';

-- display_order 188: 10440P2
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Funchal/History-Tellers/d22388-10440P2?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 188 AND affiliate_provider = 'Viator';

-- display_order 189: 50221P2
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/Santa-Maria-de-Colombo/d5392-50221P2?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 189 AND affiliate_provider = 'Viator';

-- display_order 190: 15879P2
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/Wine-and-Wine-Tour/d5392-15879P2?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 190 AND affiliate_provider = 'Viator';

-- display_order 191: 36979P10
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Funchal/Madeira-Outdoors-Private-Challenging-Walking-Tour-with-Mountain-Guide/d22388-36979P10?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 191 AND affiliate_provider = 'Viator';

-- display_order 192: 336742P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/RE-CANTO-Food-Experience/d5392-336742P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 192 AND affiliate_provider = 'Viator';

-- display_order 193: 463149P6
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Funchal/Levada-do-Caldeirao-Verde-Self-Guided-Hike-in-Madeira/d22388-463149P6?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 193 AND affiliate_provider = 'Viator';

-- display_order 194: 209899P2
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Funchal/Private-tour-full-day/d22388-209899P2?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 194 AND affiliate_provider = 'Viator';

-- display_order 195: 16720P16
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Funchal/Skywalk-and-Wine-Tasting-4x4-Half-Day-Tour/d22388-16720P16?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 195 AND affiliate_provider = 'Viator';

-- display_order 196: 28388P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/Canyoning/d5392-28388P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 196 AND affiliate_provider = 'Viator';

-- display_order 197: 409330P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/Scuba-Diving-Experience-for-Beginners/d5392-409330P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 197 AND affiliate_provider = 'Viator';

-- display_order 198: 9951P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/Madeira-Scenic-Tour-by-Sidecar/d5392-9951P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 198 AND affiliate_provider = 'Viator';

-- display_order 199: 5538552P6
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Funchal/Fado-Show-with-Wine-and-History-in-Madeira/d22388-5538552P6?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 199 AND affiliate_provider = 'Viator';

-- display_order 200: 23651P17
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/Fanal-Assobiadores-Levada-Walk/d5392-23651P17?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 200 AND affiliate_provider = 'Viator';

-- display_order 201: 39129P5
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Funchal/TRY-SCUBA-DIVING/d22388-39129P5?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 201 AND affiliate_provider = 'Viator';

-- display_order 202: 7543P1
UPDATE experiences SET affiliate_url = 'https://www.viator.com/en-GB/tours/Madeira/Madeira-Levada-Walk-Rabacal-Lakes-and-Fountains/d5392-7543P1?pid=P00285354&mcid=42383&medium=link'
WHERE display_order = 202 AND affiliate_provider = 'Viator';


-- Done: 61 updated, 0 skipped.

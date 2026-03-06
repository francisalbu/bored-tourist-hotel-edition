import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://hnivuisqktlrusyqywaz.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw'
);

const PARTNER_ID = 'BONZK5E';

function gygImg(hash, ext = 'jpeg') {
  return `https://cdn.getyourguide.com/img/tour/${hash}.${ext}/145.jpg`;
}

const experiences = [
  {
    operator_id: 40,
    title: 'Monsaraz & Vila Viçosa — Guided Tour with Wine & Cheese Tasting',
    description: "Experience the true essence of the Alentejo on a private visit to Monsaraz and Vila Viçosa — two destinations rich in history, tradition and authenticity. In Monsaraz, a medieval village dramatically perched above Lake Alqueva, visit the impressive Monsaraz Castle. Walk through ancient walls, narrow cobblestone streets and whitewashed houses that create a timeless atmosphere, enhanced by breathtaking panoramic views over one of Europe's largest artificial lakes. Continue to Vila Viçosa, known as the 'Princess of the Alentejo', with a visit to the magnificent Ducal Palace — a Renaissance palace that served as residence of the Dukes of Bragança, famous for its marble façade and deep connection to Portugal's royal history. Complete the experience with a stop at a local wine shop for an Alentejo wine tasting with traditional regional cheeses, and a visit to a local pottery shop showcasing beautiful handmade Alentejo ceramics.",
    short_description: '8h private tour from Lisbon — Monsaraz Castle, Ducal Palace of Vila Viçosa, Alentejo wine & cheese tasting, local pottery. Hotel pickup included.',
    location: 'Monsaraz', address: 'Monsaraz & Vila Viçosa, Alentejo',
    latitude: 38.4432, longitude: -7.3783,
    price: 300.0, currency: 'EUR', duration: '8h', max_group_size: 5,
    category: 'Culture',
    image_url: gygImg('aeed0ec911e879656cdde510c6efd3fc7cc552281b4334e134009248db420afb'),
    images: [
      gygImg('aeed0ec911e879656cdde510c6efd3fc7cc552281b4334e134009248db420afb'),
      gygImg('1dcb328f103e5dfc27f2186e03a892b3688c7ed28983c403b733e917b596dc07'),
      gygImg('1b70f98a7837698cf8652d9bf1af6767f51d431b5d664ee39573da0518e7a515')
    ],
    highlights: [
      'Step back in time in the medieval walled village of Monsaraz, above Lake Alqueva',
      'Visit Monsaraz Castle and enjoy panoramic views of one of Europe\'s largest artificial lakes',
      'Discover the Renaissance Ducal Palace of Vila Viçosa — former royal residence of the Bragança dynasty',
      'Taste Alentejo wines paired with traditional regional cheeses',
      'Visit a local ceramics shop showcasing handmade Alentejo pottery'
    ],
    included: ['Visit to Monsaraz and Monsaraz Castle', 'Visit to Vila Viçosa and Ducal Palace', 'Wine tasting', 'Cheese tasting', 'Visit to local pottery shop', 'Hotel pickup from Lisbon'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Monsaraz',
    is_active: true, display_order: 259,
    affiliate_url: `https://www.getyourguide.com/en-gb/monsaraz-l149332/monsaraz-vila-vicosa-personal-tour-tasting-t1167902/?partner_id=${PARTNER_ID}`,
    affiliate_provider: 'GetYourGuide'
  },
  {
    operator_id: 40,
    title: 'Stargazing in Monsaraz — Dark Sky Reserve with Telescopes',
    description: "Discover the magic of the night sky in the Monsaraz Dark Sky Reserve — one of the world's most acclaimed astrotourism destinations, and the only certified Dark Sky Reserve in Portugal. The experience begins with an accessible introduction to astronomy: how to navigate by the North Star, identify constellations and learn their legends. With the help of specialist astronomy guides, you will observe through professional high-resolution telescopes: planets, double stars, nebulae, star clusters and even distant galaxies. Each observation is accompanied by clear and engaging explanations that spark both scientific curiosity and wonder about the universe. If weather conditions don't allow stargazing, the session is replaced by a fascinating virtual journey through the universe — so a unique and memorable experience is always guaranteed.",
    short_description: '1.5h guided stargazing in Portugal\'s only certified Dark Sky Reserve — professional telescopes, astronomy experts, planets, nebulae and galaxies.',
    location: 'Monsaraz', address: 'Dark Sky Reserve, Monsaraz, Alentejo',
    latitude: 38.4440, longitude: -7.3661,
    price: 65.0, currency: 'EUR', duration: '1.5h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: gygImg('b2778e513c32b1aea9433c30e5cbed12dbda891d4828a30f8bde31946df48ec5', 'png'),
    images: [
      gygImg('b2778e513c32b1aea9433c30e5cbed12dbda891d4828a30f8bde31946df48ec5', 'png'),
      gygImg('f20fcae83e2806271410d3d1bcb456d4fc418f151db3324b3abb74691744cca0'),
      gygImg('0d5285be98919e221897d6f4d8483a25166438de8cc847a3845938b02db369df')
    ],
    highlights: [
      'Portugal\'s only certified Dark Sky Reserve — internationally awarded astrotourism experience',
      'Observe planets, double stars, nebulae, star clusters and galaxies through professional telescopes',
      'Expert astronomy guides explain constellations, their legends and the science of the universe',
      'Virtual universe navigation session provided if skies are overcast — experience always guaranteed',
      'Certified Starlight Tourism Destination'
    ],
    included: ['Access to certified Dark Sky Reserve', 'Expert-guided astronomical observation', 'Professional high-resolution telescopes', 'Constellation identification and legends', 'Virtual universe navigation (if cloudy)'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Monsaraz',
    is_active: true, display_order: 260,
    affiliate_url: `https://www.getyourguide.com/en-gb/monsaraz-l149332/monsaraz-stargazing-in-the-dark-skyr-reserve-with-telescopes-t1108246/?partner_id=${PARTNER_ID}`,
    affiliate_provider: 'GetYourGuide'
  },
  {
    operator_id: 40,
    title: 'Megalithic & Medieval Monsaraz Tour in a Moto Sidecar',
    description: "An unforgettable journey through the Alentejo landscape and its plains full of cork oaks and vineyards. The tour takes you to the medieval village of Monsaraz, stopping first at the 'Anta Olival da Pêga' dolmen, then visiting the Cromeleque de Xarez and the menhir of Abelhoa. Discover the legacy of Castros, Romans, Muslims and Templars — the Castle, the Keep, the Barbican, the Hermitage of Santa Catarina, the 17th-century fortification, the ruins of the Fortress of São Bento, the old Hermitage of São Lázaro, the Church of Nossa Senhora da Lagoa, the Town Hall, the Church of Santiago and the Casa da Inquisição. Finish the tour in São Pedro do Corval and its renowned pottery. Riding in a vintage moto sidecar with bluetooth headphones — your guide tells the full story as you explore.",
    short_description: '3h megalithic & medieval tour of Monsaraz by vintage moto sidecar — dolmens, castle, Inquisition house, Templars and pottery village. Private tour.',
    location: 'Monsaraz', address: 'Tourism Office, Monsaraz, Alentejo',
    latitude: 38.4519, longitude: -7.3841,
    price: 40.0, currency: 'EUR', duration: '3h', max_group_size: 1,
    category: 'Culture',
    image_url: gygImg('3de70a61214be90b5f1da3f8077fa02be6242b445644b08850e3a8265a7d20ec', 'jpg'),
    images: [
      gygImg('3de70a61214be90b5f1da3f8077fa02be6242b445644b08850e3a8265a7d20ec', 'jpg'),
      gygImg('22e5134ca7fa720bcd1d013a2ff4a264b819b221d449f71e34c7c8aa84a99e7b', 'jpg'),
      gygImg('4072fa4e23bb6f1221a8aec40ab27097022066b8a7e73a42c7b2d5aa651594ba', 'jpg')
    ],
    highlights: [
      'Explore Monsaraz\'s megalithic heritage — Cromeleque de Xarez, menhirs and ancient dolmens',
      'Discover the medieval village: Castle, Keep, Templar legacy and Casa da Inquisição',
      'Ride through the Alentejo plains of cork oaks and vineyards in a vintage moto sidecar',
      'Bluetooth headphones — your guide narrates history as you ride',
      'Finish at São Pedro do Corval, renowned for its traditional Alentejo pottery'
    ],
    included: ['Sidecar ride', 'Guide with bluetooth commentary', 'All equipment'],
    languages: ['English', 'Portuguese', 'Spanish'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 3, city: 'Monsaraz',
    is_active: true, display_order: 261,
    affiliate_url: `https://www.getyourguide.com/en-gb/monsaraz-l149332/megalithic-medieval-tour-of-monsaraz-in-a-moto-sidecar-t820050/?partner_id=${PARTNER_ID}`,
    affiliate_provider: 'GetYourGuide'
  },
  {
    operator_id: 40,
    title: 'Megalithic & Medieval Évora Tour in a Moto Sidecar',
    description: "Starting from the Jardim Público de Évora, this sidecar tour visits the Almendres Cromlech and the Almendres menhir — some of the oldest megalithic monuments in the world. The tour then covers essential Évora history: from the first settlers, the Eborones, at 'Alto de São João', through the UNESCO World Heritage sites spanning Roman, Visigothic and Moorish eras, to the Golden Age of Portugal in the 15th and 16th centuries. Évora became the preferred royal residence of the second Avis dynasty and one of Portugal's most splendid cultural cities — with artists like playwright Gil Vicente, sculptor Nicolau Chanterene and painter Frei Carlos. Ride through it all in a vintage moto sidecar with bluetooth headphones while your knowledgeable guide brings every stone to life.",
    short_description: '3h megalithic & medieval Évora tour by moto sidecar — Almendres Cromlech, UNESCO old town, Roman temple, royal history. Bluetooth guide included.',
    location: 'Évora', address: 'Jardim Público de Évora, Évora',
    latitude: 38.5673, longitude: -7.9093,
    price: 40.0, currency: 'EUR', duration: '3h', max_group_size: null,
    category: 'Culture',
    image_url: gygImg('39c9e461b5650a796a16d6c2d38d5fbddc9f03c604cd0138be0afbdc812d252e', 'jpg'),
    images: [
      gygImg('39c9e461b5650a796a16d6c2d38d5fbddc9f03c604cd0138be0afbdc812d252e', 'jpg'),
      gygImg('989b377b9096669b1f28b245aca5a41e4dfc4906a9bb71cef67687e600a6a419', 'jpg'),
      gygImg('9c6c60267dd055195a1ee596d0ec3bef7263881140170269f88f2fe3c6806a5f', 'jpg')
    ],
    highlights: [
      'Almendres Cromlech — one of Europe\'s oldest megalithic monuments, older than Stonehenge',
      'UNESCO World Heritage Évora: Roman temple, Moorish, Visigothic and royal Avis era sites',
      'Explore Golden Age Évora — former residence of Portuguese kings and cultural powerhouse',
      'Vintage moto sidecar with bluetooth headset — guide narrates history as you ride',
      'Unique perspective on one of Portugal\'s most beautifully preserved historic cities'
    ],
    included: ['Sidecar ride', 'Guide with bluetooth commentary', 'All equipment'],
    languages: ['English', 'Spanish', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.83, review_count: 13, city: 'Évora',
    is_active: true, display_order: 262,
    affiliate_url: `https://www.getyourguide.com/en-gb/evora-l769/megalithic-medieval-tour-on-a-sidecar-evora-t765735/?partner_id=${PARTNER_ID}`,
    affiliate_provider: 'GetYourGuide'
  },
  {
    operator_id: 40,
    title: 'Private Hot Air Balloon Flight at Sunrise over Alentejo',
    description: "Experience at least once in your life the magic of a sunrise flight over the landscapes of the Alentejo. The duration of this private balloon flight is approximately 1 hour. Your team will collect you from your hotel in the early morning and take you to the take-off field. You will watch the balloon being inflated and, step by step, rising to stand alone in the sky. Once ready, you step into the basket and prepare for this magical experience — your pilot gives a brief explanation before take-off. During the flight, the pilot will provide details about the area below, including views of Monsaraz Castle and Lake Alqueva, and keep you updated on balloon performance. You will land wherever the wind carries you, welcomed by a ground support team. After landing, you receive an official flight certificate signed by the pilot and a champagne toast. Then your team takes you back to your hotel.",
    short_description: '2.5h private hot air balloon sunrise flight over Monsaraz and Lake Alqueva — 1h flight, champagne toast, flight certificate and hotel transfer included.',
    location: 'Monsaraz', address: 'Hotel pickup — Alentejo (take-off site varies)',
    latitude: 38.4432, longitude: -7.3783,
    price: 1050.0, currency: 'EUR', duration: '2.5h', max_group_size: 2,
    category: 'Sports',
    image_url: gygImg('0d88716c27e3517919485949c5affa4f0898026d1d49a46768eb77dd518e88c8', 'jpg'),
    images: [
      gygImg('0d88716c27e3517919485949c5affa4f0898026d1d49a46768eb77dd518e88c8', 'jpg'),
      gygImg('d16dc1fab1ab742a51245ca160e2292ed24c25880981d2140c4f9bf7163d044d'),
      gygImg('8730b07cde3254a2441ab00b0717f86dc42161a206b79440e4eb96e578581163', 'jpg')
    ],
    highlights: [
      'Fly over Monsaraz Castle and Lake Alqueva at sunrise — one of Europe\'s most spectacular views',
      '1-hour private balloon flight with expert pilot over the Alentejo plains',
      'Watch the balloon inflate before take-off — a magical show in itself',
      'Champagne toast and official flight certificate signed by the pilot on landing',
      'Hotel pickup and return transfer included — fully handled experience'
    ],
    included: ['1-hour hot air balloon flight', 'Hotel pickup and return transfer', 'Official flight certificate', 'Champagne toast', 'Passenger insurance', 'Ground support team'],
    languages: ['English', 'Spanish', 'French', 'Catalan'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 2, city: 'Monsaraz',
    is_active: true, display_order: 263,
    affiliate_url: `https://www.getyourguide.com/en-gb/monsaraz-l149332/alentejo-private-hot-air-balloon-sunrise-flight-t687776/?partner_id=${PARTNER_ID}`,
    affiliate_provider: 'GetYourGuide'
  },
  {
    operator_id: 40,
    title: 'Exclusive Boat Tour on Lake Alqueva from Monsaraz',
    description: "Enjoy a magnificent boat tour while soaking in the fantastic atmosphere of Monsaraz — a historic medieval village — and discover the history, culture and gastronomy of a people who know how to welcome you in a unique and special way. Set in Monsaraz, in the heart of the Alqueva, embark on a boat tour and nautical activities for groups and families. Enjoy the surrounding nature and let the sun and water be your source of energy. Programmes are tailored to your needs — with unique and unforgettable moments. A professional and specialised boat team, the captain as storyteller, maravilhous lake views and exclusive access on the water. Includes food and drinks on board.",
    short_description: '2h exclusive private boat tour on Lake Alqueva — captain storytelling, food & drinks on board, wildlife watching, sunset option. Groups up to 16.',
    location: 'Monsaraz', address: 'Praia Fluvial de Monsaraz, Monsaraz',
    latitude: 38.4348, longitude: -7.3499,
    price: 450.0, currency: 'EUR', duration: '2h', max_group_size: 16,
    category: 'Outdoors',
    image_url: gygImg('5cb10bfdc6273d5a78f17c53ad75ed634c218fe8d0dfc1fe0a005d688a34f47c', 'jpg'),
    images: [
      gygImg('5cb10bfdc6273d5a78f17c53ad75ed634c218fe8d0dfc1fe0a005d688a34f47c', 'jpg'),
      gygImg('f2829ce9f1ee2615a95b0c02f504fafbac6b6d7346677fc84e02f16b9a78ca4c', 'jpg'),
      gygImg('5a2fa053818c8950c19d7018514161c07121b58b3a11844ea86b54cc09ecaa30', 'jpg'),
      gygImg('d326961540781a06330e001e3d18f3b8d901e394afd1b8f605fe854ef8e47b28', 'jpg')
    ],
    highlights: [
      '60-minute exclusive boat tour on Lake Alqueva with stunning views of Monsaraz Castle',
      'Captain storytelling — history of the lake, village and Alentejo culture',
      'Food and drinks on board — regional flavours on the water',
      'Wildlife watching on Europe\'s largest artificial dark-sky lake',
      'Fully private — exclusive access for your group (up to 16 people)'
    ],
    included: ['60-min boat tour', 'Captain storytelling', 'Food and drinks on board', 'Exclusive group access', 'Professional crew'],
    languages: ['English', 'Portuguese', 'Spanish', 'French'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Monsaraz',
    is_active: true, display_order: 264,
    affiliate_url: `https://www.getyourguide.com/en-gb/monsaraz-l149332/monsaraz-exclusive-boat-tour-t895271/?partner_id=${PARTNER_ID}`,
    affiliate_provider: 'GetYourGuide'
  },
  {
    operator_id: 40,
    title: 'Évora, Almendres Cromlech & Monsaraz — Private Day Tour',
    description: "Depart from Lisbon and embark on a scenic drive to the heart of Évora's historic centre — a city in the Alentejo region of Portugal, famous for its well-preserved architecture, rich history and vibrant cultural scene. Human presence in Évora dates back thousands of years to prehistoric times, as evidenced by various archaeological remains. Visit the 13th-century Cathedral, an impressive example of Gothic architecture, and the intriguing Chapel of Bones — a poignant reminder of human fragility. Walk through the city and marvel at how Évora perfectly blends ancient heritage with the lively atmosphere of university life. After lunch (not included), explore the Almendres Cromlech — dating back to 6000–5000 BC, one of the world's oldest megalithic sites, predating Stonehenge by 2,000 years. Then visit the Anta Grande do Zambujeiro, one of Portugal's most significant megalithic monuments (c. 4000–3000 BC). Throughout the journey, the Alentejo landscape offers rolling plains, vineyards, olive groves and cork forests.",
    short_description: '10h private day tour from Lisbon — Évora UNESCO city, Almendres Cromlech (older than Stonehenge), Monsaraz and Chapel of Bones. Driver/guide included.',
    location: 'Évora', address: 'Lisbon pickup — Évora, Almendres, Monsaraz',
    latitude: 38.5673, longitude: -7.9093,
    price: 192.0, currency: 'EUR', duration: '10h', max_group_size: null,
    category: 'Culture',
    image_url: gygImg('5cf4e467edce0'),
    images: [
      gygImg('5cf4e467edce0'),
      gygImg('0a6de82c45efbd011810431812d169b78947e181ca46a4022aec5bcc678a9793'),
      gygImg('6405f42e0788b'),
      gygImg('5a05a48c46ac2'),
      gygImg('5c9a263d05b61')
    ],
    highlights: [
      'Évora UNESCO World Heritage City — Cathedral, Roman temple and medieval streets',
      'Chapel of Bones — one of Portugal\'s most striking and thought-provoking monuments',
      'Almendres Cromlech: one of the world\'s oldest megalithic sites, 2,000 years older than Stonehenge',
      'Anta Grande do Zambujeiro — one of the most significant megalithic monuments in Portugal',
      'Fully private tour with dedicated driver/guide — just your group'
    ],
    included: ['Private group (just your group)', 'Driver/guide throughout', 'Fresh water', 'Hotel pickup and return from Lisbon'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 5, city: 'Évora',
    is_active: true, display_order: 265,
    affiliate_url: `https://www.getyourguide.com/en-gb/lisbon-l42/evora-almendres-cromlech-and-monsaraz-10-hour-private-tour-t128448/?partner_id=${PARTNER_ID}`,
    affiliate_provider: 'GetYourGuide'
  }
];

let insertedIds = [];

for (const exp of experiences) {
  const { data, error } = await supabase
    .from('experiences')
    .insert(exp)
    .select('id, display_order, title');
  if (error) {
    console.error(`FAIL [${exp.display_order}] ${exp.title}: ${error.message}`);
  } else {
    console.log(`OK [${data[0].display_order}] ${data[0].title} => id ${data[0].id}`);
    insertedIds.push(data[0].id);
  }
}

console.log('\nLinking to hortadamoura...');
for (const expId of insertedIds) {
  const { error } = await supabase
    .from('hotel_experiences')
    .upsert(
      { hotel_id: 'hortadamoura', experience_id: expId, is_active: true },
      { onConflict: 'hotel_id,experience_id' }
    );
  if (error) console.error(`LINK FAIL exp ${expId}: ${error.message}`);
  else console.log(`Linked exp ${expId}`);
}

const { count } = await supabase
  .from('hotel_experiences')
  .select('*', { count: 'exact', head: true })
  .eq('hotel_id', 'hortadamoura');

console.log(`\nTotal linked to hortadamoura: ${count}`);

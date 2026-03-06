import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://hnivuisqktlrusyqywaz.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw'
);

const experiences = [
  {
    operator_id: 40,
    title: 'Jurassic Hike — Dinosaur Footprints at Espichel Cape',
    description: 'Discover, on a ledge of the Jurassic cliffs of the mysterious Espichel Cape — the second most westerly cape of Europe — the incredible footprints of dinosaurs. These are ichnofossils of tracks left by sauropods and theropods about 150 million years ago. Begin at the monumental sanctuary of Espichel Cape, visiting the Memory Chapel, the church, old hostels, the aqueduct and the Casa da Água — a rare example of religious architecture unique in Portugal. Walk through the medieval streets of the picturesque fishing village of Sesimbra, then trek to the raw, wild promontory where ancient nature and history collide.',
    short_description: '7h guided hike to 150-million-year-old dinosaur footprints at Espichel Cape — Sesimbra village, sanctuary and coastal cliffs. Private transport included.',
    location: 'Cabo Espichel', address: 'Cabo Espichel, Sesimbra',
    latitude: 38.4169, longitude: -9.2188,
    price: 49.0, currency: 'EUR', duration: '7h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/7c/fc/05.jpg',
    images: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/7c/fc/05.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/fa/9d/15.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/33/68.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/3f/db.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/3f/cf.jpg'
    ],
    highlights: [
      'See 150-million-year-old sauropod and theropod footprints on the Jurassic cliffs of Espichel Cape',
      'Visit the stunning monumental sanctuary of Cabo Espichel — unique in Portugal',
      'Walk the medieval fishing village of Sesimbra with breathtaking ocean views',
      'Expert qualified guide specialized in local geology and history',
      'Private transport from Lisbon included'
    ],
    included: ['Hotel pickup and drop-off', 'Transport by private vehicle', 'Qualified guide'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.94, review_count: 47, city: 'Sesimbra',
    is_active: true, display_order: 250,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Hiking-tour-to-footprints-of-dinosaur-in-Espichel-Cape/d538-66870P6?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'eFoil Lessons in Sesimbra — Fly Above Water',
    description: 'Electric hydrofoil (eFoil) is one of the most exciting new water sports in the world. Imagine riding a surfboard and lifting above the water — no waves needed. In one session, our instructors teach you the techniques and posture to get you riding and flying above the sea. Enjoy an unforgettable experience on the crystal-clear waters off Sesimbra with a helmet, vest, wetsuit and intercom system provided.',
    short_description: '2h eFoil lesson in Sesimbra — learn to fly above water on an electric hydrofoil board. All gear included, no experience needed.',
    location: 'Sesimbra', address: 'Sesimbra Beach, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 140.0, currency: 'EUR', duration: '2h', max_group_size: null,
    category: 'Sports',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/8a/12/32.jpg',
    images: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/8a/12/32.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c1/5b/7e.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c1/5b/82.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c1/5c/68.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0d/9e/c5/7e.jpg'
    ],
    highlights: [
      'Learn to ride and fly above water on an electric hydrofoil board',
      'Suitable for complete beginners — instructors guide you from start to flight',
      'Ride on the clear turquoise waters off Sesimbra beach',
      'Intercom system between rider and instructor for real-time guidance',
      'All safety gear included: helmet, protection vest and wetsuit'
    ],
    included: ['Helmet', 'Protection vest', 'Wetsuit', 'Intercom system'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Sesimbra',
    is_active: true, display_order: 251,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Efoil-lessons-and-rentals/d5016-326369P1?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Rappel Circuit on the Cliffs of Sesimbra',
    description: 'In this rappel circuit in Sesimbra, you will have the opportunity to discover the incredible cliffs of the coastline of the Arrábida Natural Park. You will perform 3 rappels with heights between 5 and 35 metres, ending at the paradisiacal Porto da Baleeira beach. An unforgettable way to explore the dramatic sea cliffs of one of Portugal\'s most protected natural areas — with all technical equipment, insurance and activity photos included.',
    short_description: '4h rappel circuit on Sesimbra\'s sea cliffs — 3 descents up to 35m, ending on Porto da Baleeira beach. Equipment, insurance and photos included.',
    location: 'Sesimbra', address: 'Sesimbra cliffs, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 40.0, currency: 'EUR', duration: '4h', max_group_size: null,
    category: 'Sports',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/25/b8/12.jpg',
    images: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/25/b8/12.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/25/b8/16.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/25/b8/17.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/25/b8/23.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/25/b8/2c.jpg'
    ],
    highlights: [
      '3 rappels down the dramatic sea cliffs of Arrábida Natural Park (5–35m)',
      'Finish the circuit on the beautiful Porto da Baleeira beach',
      'Morning or afternoon sessions available',
      'Activity photos included — share the moment',
      'All technical equipment and activity insurance provided'
    ],
    included: ['Technical equipment', 'Activity insurance', 'Photographs', 'Bottled water'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Sesimbra',
    is_active: true, display_order: 252,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Rappel-Circuit-in-Sesimbra-in-the-Morning-or-Afternoon/d5016-197855P11?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Arrábida Jeep Tour — Hidden Beaches and Market',
    description: 'Embark on an unforgettable Jeep adventure through the stunning Arrábida Natural Park, home to some of Europe\'s most breathtaking landscapes. Start at one of the best markets in the world and ride off-road through dense woods of centenarian oak and cork trees, scenic coastal roads and charming villages. Marvel at panoramic viewpoints, uncover hidden beaches — including Galapinhos, classified by European Best Destinations as the most beautiful beach in Europe. Visit pre-historic ruins of Roman times, and optionally explore the mysterious cave of Santa Margarida. A passionate local guide brings the full story to life.',
    short_description: '5–6h private Jeep tour through Arrábida Natural Park — off-road through Galapinhos, Serra do Risco cliffs and best markets. Local guide included.',
    location: 'Arrábida', address: 'Arrábida Natural Park, Setúbal',
    latitude: 38.4848, longitude: -8.9766,
    price: 89.0, currency: 'EUR', duration: '5–6h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/16/b7/55.jpg',
    images: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/16/b7/55.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/19/87/95.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e8/57/69.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e1/37/6c.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/70/97/fc.jpg'
    ],
    highlights: [
      'Off-road Jeep through Arrábida — oak forests, vineyards and coastal roads',
      'See Galapinhos beach — voted most beautiful beach in Europe',
      'Drive past Serra do Risco — the highest limestone coastal cliff in Europe',
      'Visit Roman-era fish production ruins near the main Arrábida beach',
      'Optional: hike to the mysterious cave of Santa Margarida'
    ],
    included: ['Hotel pickup and drop-off', 'Local guide', 'Drive'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.95, review_count: 61, city: 'Arrábida',
    is_active: true, display_order: 253,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Jeep-4x4-tour-to-the-most-beautiful-beach-of-Europe/d538-66870P10?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Hike to the Summit of Arrábida — Flora & Viewpoints',
    description: 'Go inside the Arrábida Natural Park and explore its mystical paths guided by a local expert in local flora and fauna. Arrábida presents a series of specificities that, together, justify the presence of plant communities unique in the world — rich in evolutionary history and forming outstanding ecological dynamics. The park\'s vegetation is nearly impenetrable in places, yet the guided paths reveal breathtaking viewpoints over turquoise bays and white limestone cliffs, culminating at the highest point of the Arrábida mountain range. Private transport from Lisbon and a guiding book of local flora included.',
    short_description: '7h guided hike to the highest point of Arrábida — expert guide in flora & fauna, private transport from Lisbon and guiding book included.',
    location: 'Arrábida', address: 'Arrábida Natural Park, Setúbal',
    latitude: 38.4848, longitude: -8.9766,
    price: 77.0, currency: 'EUR', duration: '7h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/33/65.jpg',
    images: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/33/65.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/73/37/80.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/56/7a/1a.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/92/3b/93.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/d6/9e/50.jpg'
    ],
    highlights: [
      'Hike to the highest point of the Arrábida mountain range',
      'Expert local guide specializing in the park\'s unique flora and fauna',
      'Plant communities found nowhere else in the world',
      'Stunning panoramic views over turquoise Atlantic bays and limestone cliffs',
      'Private transport from Lisbon and illustrated guiding book included'
    ],
    included: ['Hotel pickup and drop-off', 'Private transport', 'Professional local guide', 'Guiding book of local flora', 'All insurance'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.95, review_count: 20, city: 'Arrábida',
    is_active: true, display_order: 254,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Hiking-tour-to-the-highest-point-of-Arrabida-mountain/d538-66870P5?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'South Bay Wine Experience — Wineries and Setúbal',
    description: 'A unique full-day private experience in one of Portugal\'s most iconic wine and cheese regions, with breathtaking landscapes and Europe\'s best beaches nearby. Visit two of the most prestigious wineries in the Lisbon area — one founded in 1834, another in the 15th century — for tastings of acclaimed wines. Also visit Livramento Market (named one of the world\'s best fish markets by USA Today), Cristo Rei, and enjoy a tasting of traditional Azeitão cheese. A perfect blend of food, wine, scenery and culture south of the Tagus.',
    short_description: 'Full-day private South Bay tour — two winery visits with tastings, Azeitão cheese, Livramento market and Cristo Rei. Private transport included.',
    location: 'Setúbal', address: 'Lisbon pickup — Setúbal, Azeitão, Arrábida',
    latitude: 38.5244, longitude: -8.8882,
    price: 35.0, currency: 'EUR', duration: '8h', max_group_size: null,
    category: 'Food & Wine',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0b/b2/2a.jpg',
    images: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0b/b2/2a.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0b/8c/c8.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0b/b2/23.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0b/b2/6a.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0b/b2/6d.jpg'
    ],
    highlights: [
      'Visit two of the most prestigious wineries in the Lisbon area with guided tastings',
      'Taste traditional Azeitão cheese — a local icon paired perfectly with wine',
      'Explore Livramento Market — voted one of the world\'s best fish markets by USA Today',
      'Visit Cristo Rei and enjoy views over the Tagus',
      'Breathtaking scenery between Arrábida, Setúbal and the South Bay coast'
    ],
    included: ['Private transportation', 'Visit to Cristo Rei', 'Tasting of traditional Azeitão cheese', 'Two winery visits with wine tastings', 'Visit to Livramento market'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Setúbal',
    is_active: true, display_order: 255,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/South-Bay-Wine-Experience/d538-276349P14?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Private Tour of Setúbal — The Pearl of the Sado',
    description: 'Book a private tour to Setúbal and experience its unique vibe and scenery — a beautiful historic centre, colourful buildings and notable landmarks such as the 16th-century Convent of Jesus and São Julião Church. Setúbal is famous for its vibrant food scene, particularly fresh seafood and "choco frito" (fried cuttlefish). Explore the São Domingos viewpoint overlooking the Tróia peninsula and Arrábida, the main square beside the stunning 16th-century São Julião Church, the world-renowned Livramento Market, the colourful traditional fishing marina and the 16th-century Fort of São Filipe with its spectacular azulejo chapel. Includes Azeitão cheese, bread and wine tasting.',
    short_description: '6h private tour of Setúbal — historic centre, Livramento market, Fort São Filipe, local seafood, Azeitão cheese and wine tasting with official guide.',
    location: 'Setúbal', address: 'Setúbal city centre, Setúbal',
    latitude: 38.5244, longitude: -8.8882,
    price: 130.0, currency: 'EUR', duration: '6h', max_group_size: null,
    category: 'Culture',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e1/37/e6.jpg',
    images: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e1/37/e6.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/17/fe/64.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/91/91/cb.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/94/58/96.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/1a/32/e1.jpg'
    ],
    highlights: [
      'Explore Setúbal\'s stunning 16th-century Convent of Jesus and São Julião Church',
      'Visit Livramento Market — one of the world\'s best food markets (USA Today)',
      'See traditional fishing boats in Setúbal\'s oldest marina',
      '16th-century Fort of São Filipe with famous azulejo chapel by Policarpo de Oliveira Bernardes',
      'Azeitão cheese, bread and wine tasting included'
    ],
    included: ['Official guide', 'Azeitão cheese and bread tasting', 'Wine tasting', 'All insurance'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.73, review_count: 15, city: 'Setúbal',
    is_active: true, display_order: 256,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Cultural-tour-in-the-region-of-three-castles/d5016-66870P20?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Full-Day Private Tour — Sesimbra Castle and Arrábida',
    description: 'A private full-day tour of Sesimbra and Arrábida departing from Lisbon at 9:00 AM, with a dedicated guide accompanying you to all the most interesting points. Visit the imposing Sesimbra Castle — walk its walls, hear the history from the Moorish era to the Reconquista, and enjoy panoramic views of the bay and Serra da Arrábida. Tour the old village, its tiled doorways and Fortaleza de Santiago. Drive through the Serra da Arrábida and Cabo Espichel with possibilities to observe dolphins, go kayaking in sea caves or try a dive. Includes a visit to Portinho da Arrábida — one of Portugal\'s most beautiful bays. Return to Lisbon around 18:00.',
    short_description: 'Full-day private tour from Lisbon — Sesimbra Castle, Arrábida, Cabo Espichel with dedicated guide. Optional dolphin watching, kayak or dive.',
    location: 'Sesimbra', address: 'Lisbon departure — Sesimbra, Arrábida, Cabo Espichel',
    latitude: 38.4430, longitude: -9.1012,
    price: 500.0, currency: 'EUR', duration: '9h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/2c/5e/45.jpg',
    images: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/2c/5e/45.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/2c/5e/5b.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/2c/5f/55.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/2c/5f/6c.jpg'
    ],
    highlights: [
      'Sesimbra Castle — walls, Moorish and Reconquista history, panoramic bay views',
      'Old village of Sesimbra with tiled doorways and Fortaleza de Santiago',
      'Drive through Serra da Arrábida and Cabo Espichel',
      'Portinho da Arrábida — one of Portugal\'s most beautiful bays',
      'Optional: dolphin watching, sea cave kayak or scuba baptism (on site)'
    ],
    included: ['Private guide for the full day', 'Bottled water', 'Traditional sweet'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Sesimbra',
    is_active: true, display_order: 257,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Sesimbra-and-Portinho-DA-Arrabida-the-whole-day/d538-134836P16?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Rock Climbing in Arrábida Natural Park',
    description: 'Put yourself to the test and challenge your limits in a climbing experience in one of Portugal\'s most mythical climbing spots — the Arrábida Fence (Cerca da Arrábida). An unforgettable introduction to rock climbing in the stunning Arrábida Natural Park, just 40 minutes from Lisbon. Learn the basics of rock climbing with a qualified instructor, discover the legendary routes of this iconic location, and enjoy breathtaking views over the Atlantic from the cliffs. All technical equipment provided — rope, harness, helmet and experienced instructor.',
    short_description: '4h rock climbing at the mythical Arrábida Fence — intro to climbing with instructor, Atlantic cliff views. Harness, rope and helmet included.',
    location: 'Arrábida', address: 'Arrábida Natural Park, Setúbal',
    latitude: 38.4848, longitude: -8.9766,
    price: 30.0, currency: 'EUR', duration: '4h', max_group_size: null,
    category: 'Sports',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a5/18/74.jpg',
    images: [
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a5/18/74.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a5/18/75.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a5/18/76.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a5/18/79.jpg',
      'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/a5/18/7b.jpg'
    ],
    highlights: [
      'Climb at Cerca da Arrábida — one of Portugal\'s most legendary climbing locations',
      'Expert instructor guides you through the basics from scratch',
      'Breathtaking views over the Atlantic from Arrábida\'s sea cliffs',
      'Only 40 minutes from Lisbon — easy to combine with a beach day',
      'All technical equipment included: harness, rope and helmet'
    ],
    included: ['Instructor', 'Harness', 'Rope', 'Helmet', 'Bottled water'],
    languages: ['English', 'Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.9, review_count: 10, city: 'Arrábida',
    is_active: true, display_order: 258,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Climbing-Experience-in-Arrabida/d5016-197855P8?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
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

console.log('\nLinking to wot-soul-costa-da-caparica...');
for (const expId of insertedIds) {
  const { error } = await supabase
    .from('hotel_experiences')
    .upsert(
      { hotel_id: 'wot-soul-costa-da-caparica', experience_id: expId, is_active: true },
      { onConflict: 'hotel_id,experience_id' }
    );
  if (error) console.error(`LINK FAIL exp ${expId}: ${error.message}`);
  else console.log(`Linked exp ${expId}`);
}

const { count } = await supabase
  .from('hotel_experiences')
  .select('*', { count: 'exact', head: true })
  .eq('hotel_id', 'wot-soul-costa-da-caparica');

console.log(`\nTotal linked to wot-soul-costa-da-caparica: ${count}`);

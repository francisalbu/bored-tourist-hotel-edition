import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://hnivuisqktlrusyqywaz.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw'
);

const experiences = [
  {
    operator_id: 40,
    title: 'Sesimbra: All-inclusive Sport Fishing Tour',
    description: "Sesimbra is known for its rich waters and traditional fishing that made this beautiful village a prime place for sport fishing since the 50s. Experience with your friends a real saltwater local fishing experience to catch many of the several fish species that live in this amazing sea. Our boats have all the facilities: toilets, cabin, walkaround, electronics and safety features to deliver great fishing moments. Open to all ages and groups, our seasoned crew will assist you at any time.",
    short_description: '5h all-inclusive sport fishing off Sesimbra — rich Atlantic waters, all gear, baits and license included. All ages welcome.',
    location: 'Sesimbra', address: 'Sesimbra Marina, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 89.9, currency: 'EUR', duration: '5h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/01/7e/f2.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/01/7e/f2.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/3e/46/99.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/01/7e/eb.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/3e/46/4d.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/3e/46/49.jpg'],
    highlights: ["Real saltwater fishing experience in Sesimbra's rich Atlantic waters","Multiple fish species in the natural park sea","Fully equipped boat with cabin, electronics and safety gear","All fishing equipment, baits and mandatory license included","Open to all ages — seasoned crew assistance throughout"],
    included: ['Sport fishing equipment and baits — all inclusive','On-board WiFi','Bottled water','National Park fees','Tour escort/host','Port pickup and drop-off','Mandatory daily fishing license'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.9, review_count: 20, city: 'Sesimbra',
    is_active: true, display_order: 234,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Deep-Sea-Fishing-in-Sesimbras-Coast/d5016-15178P1?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Scuba Diving in Sesimbra — Parque Luis Saldanha',
    description: 'Come to know the underwater world of Parque Luis Saldanha, a natural marine reserve full of life, together with dive professionals in comfort and safety. One of the most biodiverse dive sites in Portugal, just south of Lisbon.',
    short_description: '3h guided scuba dive in the Parque Luis Saldanha Marine Reserve, Sesimbra — with professionals, all equipment included.',
    location: 'Sesimbra', address: 'Sesimbra Port, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 39.0, currency: 'EUR', duration: '3h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/08/42/b7.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/08/42/b7.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/08/42/b8.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/08/42/bb.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/08/44/3e.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/08/44/41.jpg'],
    highlights: ['Dive in the Parque Luis Saldanha — one of Portugal\'s richest marine reserves','Professional dive guides in comfort and safety','12L air bottle and last gear included','Unique underwater biodiversity of the Arrábida coast','South of Lisbon — easily accessible from the city'],
    included: ['12L air bottle and last','Dive guide','Snacks','Safety equipment'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Sesimbra',
    is_active: true, display_order: 235,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Simple-Diving-Departure-in-Sesimbra/d5016-151733P11?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Via Ferrata in Arrábida Natural Park',
    description: 'Whether you are a beginner or experienced, the Via Ferrata in Arrábida Natural Park is ideal for enjoying alone or in a group — with friends, family and/or partner, to celebrate birthdays, farewells, school or business events, accessible to everyone. Instructors are accredited by the National School of Mountain Skiing — Federation of Camping and Mountain Skiing of Portugal.',
    short_description: '3h Via Ferrata climb in Arrábida Natural Park — beginner-friendly, accredited guides, all safety gear included. Near Lisbon.',
    location: 'Arrábida', address: 'Arrábida Natural Park, Setúbal',
    latitude: 38.4848, longitude: -8.9766,
    price: 40.0, currency: 'EUR', duration: '3h', max_group_size: null,
    category: 'Sports',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/85/51/59.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/85/51/59.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/85/52/45.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/85/59/40.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/85/a2/82.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/85/5e/b5.jpg'],
    highlights: ['Via Ferrata climbing route through Arrábida Natural Park','Suitable for all levels — beginners to experienced climbers','Nationally accredited guides from the Federation of Mountain Skiing','Individual protection equipment and insurance included','Perfect for groups, birthdays and team-building events'],
    included: ['Individual protection equipment','Individual insurance'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 7, city: 'Sesimbra',
    is_active: true, display_order: 236,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/kayaking-with-snorkeling-tour-near-lisbon-with-transfer/d5016-122184P9?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Sesimbra Boat Tour along the Marine Park Coast',
    description: "Our boat is a family boat that carries up to 7 customers — ideal for families or small groups of friends, fitted with benches for your comfort. If you want a trip just with your family or friends, or even just with your partner for a romantic trip, we have the possibility to go private. Explore the stunning coastline of the Sesimbra Marine Park with a local expert guide.",
    short_description: '3h small boat tour (max 7) along Sesimbra Marine Park coast — regional drinks, sweets and a local guide. Private option available.',
    location: 'Sesimbra', address: 'Sesimbra Port, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 50.0, currency: 'EUR', duration: '3h', max_group_size: 7,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0e/33/1f.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0e/33/1f.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0e/33/1a.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0e/33/19.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/40/84/1d.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/0e/33/1b.jpg'],
    highlights: ['Small group boat tour (max 7) — intimate and personal experience','Explore the Sesimbra Marine Park coastline with a local expert','Regional drinks and sweets of the area included','Private hire option for couples, families or friends','Life vests and personal activity insurance provided'],
    included: ['Life-saving vest','Regional sweets','Experienced local guide','Boat with skipper','Personal insurance','Regional drinks'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 16, city: 'Sesimbra',
    is_active: true, display_order: 237,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Sesimbra-Boat-Tour-by-the-Coast-in-the-Marine-Park/d5016-329981P3?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Electric Bike Tour of Sesimbra Coast',
    description: 'Discover the untouched beauty of the Sesimbra region with this exclusive E-bike Tour — a circular circuit combining stunning landscapes, rich history and unique gastronomic experiences. Pedal along the impressive west and south coastlines: Beaches of Bicas and Foz, the traditional village of Vila de Azoia with its local Torrada flour, Cabo Espichel sanctuary and lighthouse, and the rustic charm of Serra dos Pinheirinhos.',
    short_description: '4h e-bike circular tour of Sesimbra coast — secret beaches, Cabo Espichel lighthouse, local food tasting and stunning cliff views.',
    location: 'Sesimbra', address: 'Sesimbra (meeting point confirmed on booking)',
    latitude: 38.4430, longitude: -9.1012,
    price: 80.0, currency: 'EUR', duration: '4h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/72/0c/cf.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/72/0c/cf.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/72/0c/c4.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/72/0c/d7.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/6f/4c/dd.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/72/0c/c6.jpg'],
    highlights: ['E-bike circular route along Sesimbra west and south coastlines','Beaches of Bicas and Foz — perfect for swimming and relaxation','Cabo Espichel iconic sanctuary and lighthouse with breathtaking views','Vila de Azoia — taste the traditional Torrada flour','All e-bike equipment, water and snacks included'],
    included: ['Changing facilities (start and end)','Mandatory insurance under Portuguese law','Electric bicycle and helmet','Water','Snacks','Repair kit'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 1, city: 'Sesimbra',
    is_active: true, display_order: 238,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Electric-Bike-Tour-of-Sesimbra-Coast/d5016-5560378P2?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: "Lisbon's South Bay: Sesimbra, Azeitão and Palmela Full Day",
    description: "Embark on an exhilarating journey through Lisbon's southern treasures. Cross the iconic 25 de Abril Bridge and admire Cristo Rei. Explore the majestic Palmela Castle and sweeping views over the Sado River. Wind through Arrábida Natural Park's scenic roads. Witness the age-old art of tile-making at Azulejos de Azeitão or indulge in premium wine tastings at Casa-Museu José Maria da Fonseca. Explore Sesimbra's historic centre, savor local seafood, and finish at Cabo Espichel for a dramatic finale of history, nature and breathtaking views.",
    short_description: '6-8h private tour: 25 Abril Bridge, Palmela Castle, Arrábida, Azeitão tiles or wine tasting, Sesimbra and Cabo Espichel.',
    location: 'Sesimbra', address: 'Private hotel pickup in Lisbon',
    latitude: 38.4430, longitude: -9.1012,
    price: 75.0, currency: 'EUR', duration: '6h-8h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/73/6b/48.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/73/6b/48.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/73/6b/4a.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/73/6b/46.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/73/8f/98.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/73/8f/97.jpg'],
    highlights: ['25 de Abril Bridge and Cristo Rei panoramic views','Palmela Castle with sweeping vistas over the Sado River','Arrábida Natural Park scenic drive','Azulejos de Azeitão tile workshop or José Maria da Fonseca wine tasting','Sesimbra historic centre and fresh local seafood + Cabo Espichel finale'],
    included: ['Private transportation','All mandatory insurance','Hotel pick-up and drop-off','In-vehicle air conditioning','Local tour guide and driver'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Sesimbra',
    is_active: true, display_order: 239,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Sintra/Private-Tour-to-Arrabida-Nature-Park-Palmela-Azeitao-and-Sesimbra/d50861-283463P6?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Tour Sesimbra, Cabo Espichel and Aldeia do Meco',
    description: 'Visit the traditional Portuguese fishing village of Sesimbra and its Arab-origin castle with the church of Santa Maria do Castelo, covered in 18th-century Portuguese tiles. Experience the wonderful landscapes of the Arrábida Natural Park and visit the Sanctuary of Cabo Espichel. Discover the distinctive west-coast beaches of Sesimbra and the stunning Albufeira Lagoon.',
    short_description: '4h guided tour of Sesimbra fishing village, Arab castle, Cabo Espichel sanctuary, Arrábida park and Albufeira Lagoon.',
    location: 'Sesimbra', address: 'Sesimbra (pickup from Lisbon available)',
    latitude: 38.4430, longitude: -9.1012,
    price: 30.0, currency: 'EUR', duration: '4h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/08/f2/74.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/08/f2/74.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e5/d9/02.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/e5/d9/06.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/24/94/bc.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/08/f2/64.jpg'],
    highlights: ['Sesimbra traditional fishing village and Arab-origin castle','Santa Maria do Castelo church with 18th-century Portuguese tiles','Cabo Espichel Sanctuary — dramatic Atlantic cliffs and history','Arrábida Natural Park panoramic coastal landscapes','Albufeira Lagoon and distinctive west-coast beaches'],
    included: ['In-vehicle air conditioning','Local guide'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.96, review_count: 26, city: 'Sesimbra',
    is_active: true, display_order: 240,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Tour-Sesimbra/d5016-111596P1?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Private Cheese-Making and Wine Tour: Azeitão and Sesimbra from Lisbon',
    description: "Explore Portugal's coast, countryside and traditions on a private tour from Lisbon through Setúbal, Arrábida and Sesimbra, where markets, cheese-making, wine and coastal views create a perfect day of local culture and flavor. Begin at Setúbal's Livramento Market — often ranked among the world's best fresh markets. Continue through the Arrábida Natural Park before a hands-on Azeitão cheese-making workshop. Visit the coastal village of Sesimbra and conclude with a wine tasting at a family-run estate, sampling reds, whites and the famous Moscatel de Setúbal. Finish with views over Lisbon from Cristo Rei.",
    short_description: 'Private full-day tour: Livramento market + Azeitão cheese workshop + Arrábida + Sesimbra + Moscatel wine tasting. From Lisbon.',
    location: 'Sesimbra', address: 'Private pickup in Lisbon, Almada, Setúbal or Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 60.0, currency: 'EUR', duration: '8h 30min', max_group_size: null,
    category: 'Local Cooking',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/7c/3c/18.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/7c/3c/18.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/7c/39/0d.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/40/f3/53.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/4c/45/62.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/7c/38/fe.jpg'],
    highlights: ["Setúbal's Livramento Market — one of the world's best fresh markets","Hands-on Azeitão cheese-making workshop with local artisans","Arrábida Natural Park drive — green hills and turquoise sea","Sesimbra fishing village and medieval castle","Wine tasting with reds, whites and Moscatel de Setúbal at a family estate"],
    included: ['Winery entrances and tastings','Private transportation','Private pick-up and drop-off','Bottled water','Tasting spread (regional bread, fresh and Azeitão cheese, jam, Muscat wine)','All fees and taxes','Air conditioning','Private Azeitão cheese workshop'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 2, city: 'Sesimbra',
    is_active: true, display_order: 241,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Azeitao-Cheese-Private-Workshop-with-Wine-and-Food-Tasting/d538-349639P9?pid=P00285354&mcid=42383&medium=link',
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

import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://hnivuisqktlrusyqywaz.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw'
);

const experiences = [
  {
    operator_id: 40,
    title: 'Portuguese Food Experience in Almada',
    description: "A perfect blend of hands-on learning with an authentic dive into Portuguese culture. We don't just teach recipes, we share stories, traditions, and secrets behind each dish, using fresh, local ingredients.",
    short_description: 'Hands-on Portuguese food workshop in Almada — recipes, stories and traditions with fresh local ingredients. Lunch included.',
    location: 'Almada', address: 'Almada (meeting point confirmed on booking)',
    latitude: 38.6761, longitude: -9.1569,
    price: 35.0, currency: 'EUR', duration: '3h 30min', max_group_size: null,
    category: 'Local Cooking',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/23/13/1e.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/23/13/1e.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/23/13/a2.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/23/12/1a.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/23/12/60.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/d3/13/18.jpg'],
    highlights: ['Hands-on cooking with authentic Portuguese recipes','Stories and traditions behind every dish','Fresh local ingredients sourced for the class','Lunch and beverages included','Small group experience in Almada'],
    included: ['Lunch','Carbonated beverages','Tea and coffee'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Almada',
    is_active: true, display_order: 226,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Almada/Get-Creative-with-Immersive-Portuguese-Culture-Workshops/d51024-5588968P3?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Sesimbra Discovery by Kayak',
    description: 'Spend an exciting day on the water with this 3-hour guided kayak tour of the Sesimbra coast. You will be amazed with the cliffs, caves and tunnels that characterize Sesimbra\'s Natural Park. You will reach and stop at one of the most beautiful beaches in Portugal, Ribeira do Cavalo. A professional kayak guide will provide all the necessary gear before leading you on a gorgeous tour. Pickup from Lisbon available — kayak along the coast of Arrabida Nature Park through the Luiz de Saldanha Maritime Reserve.',
    short_description: '3h guided kayak tour of Sesimbra coast — sea cliffs, caves, tunnels and a stop at Ribeira do Cavalo beach.',
    location: 'Sesimbra', address: 'Sesimbra Harbour, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 25.0, currency: 'EUR', duration: '3h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/89/b1/8a.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/89/b1/8a.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/89/b1/86.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/89/b2/69.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/b2/a0/dc.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/89/b1/8e.jpg'],
    highlights: ['Kayak through cliffs, sea caves and tunnels in Arrábida Nature Park','Stop at Ribeira do Cavalo — one of Portugal\'s most beautiful beaches','Paddle 6-10 km through the Luiz de Saldanha Maritime Reserve','Professional guide and all gear provided','Lisbon pickup option available'],
    included: ['Snacks and water','Professional guide'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.95, review_count: 84, city: 'Sesimbra',
    is_active: true, display_order: 227,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Lisbon-by-kayak/d5016-10127P6?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Half-Day Kayak Tour in Sesimbra',
    description: 'Within an hour distance from Lisbon, this is a nature experience you will like to share with your family and friends. Using very stable double-seat sit-on-top Kayaks, you will comfortably and effortlessly paddle along these incredible landscapes.',
    short_description: 'Half-day sit-on-top kayak along Sesimbra\'s stunning natural coastline — suitable for all, 1h from Lisbon.',
    location: 'Sesimbra', address: 'Sesimbra, Setubal District',
    latitude: 38.4430, longitude: -9.1012,
    price: 35.0, currency: 'EUR', duration: '3h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e5/b7/d9.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e5/b7/d9.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/74/87/2d.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e5/b7/ab.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e5/b6/8c.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/e5/b6/81.jpg'],
    highlights: ['Stable sit-on-top kayaks — ideal for families and beginners','Stunning coastal scenery 1 hour from Lisbon','All safety equipment provided','Paddle through protected natural park waters','Great for groups and friends'],
    included: ['Life jacket','Waterproof bag','Backboard','Sit-on-top canoe','Paddle','Insurance'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.78, review_count: 49, city: 'Sesimbra',
    is_active: true, display_order: 228,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Kayak-Tour/d5016-75380P3?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Sesimbra: Arrabida Dolphin and Whale Watching with Biologist',
    description: 'Experience the magic of the Atlantic with Sesimbra\'s premier dolphin and whale watching tour, with 100% cetacean sightings, just a short drive from Lisbon. Cruise offshore the breathtaking Arrabida sheltered coast — UNESCO Biosphere Reserve, and be led by your biologist and seasoned crew to encounter playful dolphins and majestic whales. Discover many species of cetaceans and pelagic birds and fish all year round, and in summer months swordfish or blue fin tuna. After the dolphin cruise, explore hidden bays and turquoise beaches, swim or snorkel, and taste the famous local wine.',
    short_description: '3h dolphin and whale watching with a marine biologist — 100% cetacean sighting guarantee in Arrabida UNESCO Biosphere Reserve.',
    location: 'Sesimbra', address: 'Sesimbra Marina, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 29.9, currency: 'EUR', duration: '3h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/3e/ab/a3.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/3e/ab/a3.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/01/7e/af.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c0/c6/40.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/3e/ab/9f.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/c0/c6/29.jpg'],
    highlights: ['100% cetacean sighting guarantee — dolphins and whales guaranteed','Led by a marine biologist on board','Arrabida coast — UNESCO Biosphere Reserve','Snorkeling in hidden turquoise bays included','Perfect for families, groups and wildlife lovers'],
    included: ['Welcome drink','Local guide','Bottled water','National Park fees','Snorkeling equipment','Environmental Management Charge'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.92, review_count: 248, city: 'Sesimbra',
    is_active: true, display_order: 229,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Dolphin-Watch-Tour-in-Sesimbra/d5016-15178P4?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Kayaking and Snorkeling in Sesimbra with Photos',
    description: 'The instructors know the Sesimbra coast inside out, giving you in-depth and specific knowledge of the area. All instructors are certified and have extensive experience with water activities — the goal is for you to have fun safely. Explore the crystal-clear waters of the Arrabida Natural Park by kayak and snorkel through its marine reserve.',
    short_description: '3h kayaking + snorkeling in Sesimbra — certified instructors, all equipment and professional photos included.',
    location: 'Sesimbra', address: 'Sesimbra, Setubal District',
    latitude: 38.4430, longitude: -9.1012,
    price: 25.0, currency: 'EUR', duration: '3h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/4a/28/1f.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/4a/28/1f.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/fe/ee/10.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/2a/08/90.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/fe/ee/e0.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/fe/ee/e1.jpg'],
    highlights: ['Certified instructors with deep local knowledge of Sesimbra','Kayak and snorkel through Arrabida Marine Reserve','Professional photos of your session included','All equipment provided','Private transport from Lisbon available'],
    included: ['Private transportation','Snorkeling equipment','Insurance','Kayaking equipment'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.89, review_count: 74, city: 'Sesimbra',
    is_active: true, display_order: 230,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/All-inclusive-Kayaking-and-snorkeling-in-Arrabida-from-Lisbon/d5016-304049P2?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Arrabida Natural Park and Sesimbra Day Trip from Lisbon',
    description: 'Meet your guide at your Lisbon hotel and cross the Tagus River heading south. Drive to Arrabida Natural Park, reaching the cliffs of Meco Beach and the Western Coastline. Next, head to Cape Espichel with its Sanctuary of Our Lady of the Cape and stunning Atlantic views. Then visit the charming seaside town of Sesimbra and its Moorish Castle. After lunch (own expense), explore unmapped roads to discover St. Margareth\'s Cave and the harbour of Portinho da Arrabida. Choose between free time on Arrabida\'s hidden golden beaches or a visit to Setubal\'s dolphin-community interpretive centre.',
    short_description: 'Full-day guided tour of Arrabida Natural Park, Sesimbra and Cape Espichel from Lisbon — hotel pickup and air-conditioned minivan.',
    location: 'Arrabida', address: 'Hotel pickup in Lisbon',
    latitude: 38.4848, longitude: -8.9766,
    price: 45.0, currency: 'EUR', duration: '8h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/73/fb/82.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/73/fb/82.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/09/1c/ea.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/09/1c/ee.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/09/1c/ef.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/09/1c/f0.jpg'],
    highlights: ['Arrabida Natural Park — dramatic limestone cliffs and turquoise sea','Cape Espichel Sanctuary with sweeping Atlantic views','Sesimbra Moorish Castle and medieval old town','St. Margareth\'s Cave and Portinho da Arrabida harbour','Hotel pickup and drop-off in Lisbon included'],
    included: ['Hotel pickup and drop-off','Professional guide','Transport by air-conditioned minivan'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.63, review_count: 27, city: 'Arrabida',
    is_active: true, display_order: 231,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Arrabida-Natural-Park-and-Sesimbra-Day-Trip-from-Lisbon/d538-6999SMLBIG?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Underwater Viewing Tour along the Coast of Sesimbra',
    description: "Take an unforgettable trip and discover the stunning beauty of the Sesimbra Coast, its secrets and hidden beaches. Our boat, APNEA, has a unique feature: a hull with panoramic windows overlooking the underwater world. This underwater view and the upper platform create a complete, fun and educational tour through a unique perspective of the protected area of the Professor Luiz Saldanha Marine Park — part of the Arrabida Natural Park, including Praia da Ribeira do Cavalo and the secret beaches of this coast.",
    short_description: '2h coast tour aboard APNEA — a boat with panoramic underwater windows — through Sesimbra\'s Marine Park and hidden beaches.',
    location: 'Sesimbra', address: 'Sesimbra Port, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 18.0, currency: 'EUR', duration: '2h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/e7/d9/f2.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/e7/d9/f2.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/17/2c/a0.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/e7/d9/e7.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/17/2c/af.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/e7/7d/6e.jpg'],
    highlights: ['Unique boat with panoramic underwater hull windows','Visit Praia da Ribeira do Cavalo from the sea','Luiz Saldanha Marine Park — one of Portugal\'s most protected marine areas','Educational and fun for all ages','Instagram photos with the Aquarama frame included'],
    included: ['Insurance','Life jackets','Local guide','Photos (including Aquarama frame for Instagram)'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.83, review_count: 35, city: 'Sesimbra',
    is_active: true, display_order: 232,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Underwater-viewing-tours-along-the-coast-of-Sesimbra/d5016-124473P1?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Private Jeep Tour from Lisbon — Arrabida, Sesimbra and Beach Picnic',
    description: "Leave Lisbon behind and dive into a thrilling full-day Jeep adventure through Arrabida Natural Park and Sesimbra — home to some of Europe's most breathtaking coastal views. Ride off-road through lush landscapes, discover hidden caves, and soak up the sun on pristine beaches like Praia de Galapinhos or Praia das Bicas. Enjoy a private beach picnic in paradise, explore the charming village of Sesimbra, and take in dramatic views from the cliffs of Cabo Espichel. Led by a passionate local guide, this is more than a tour — it's a true escape into Portugal's wild beauty and culture.",
    short_description: '7h private Jeep tour: off-road through Arrabida, secret beaches, Sesimbra village, Cabo Espichel cliffs and a beachside picnic.',
    location: 'Arrabida', address: 'Private pickup in Lisbon, Setubal, Almada or Sesimbra',
    latitude: 38.4848, longitude: -8.9766,
    price: 109.0, currency: 'EUR', duration: '7h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/2b/30/fd.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/2b/30/fd.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/2b/30/ed.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/35/b9/0c.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0e/c0/cd/ea.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/13/2a/2e/1d.jpg'],
    highlights: ['Off-road private Jeep adventure through Arrabida Natural Park','Secret beaches: Praia de Galapinhos and Praia das Bicas','Private beachside picnic — local cheeses, meats, wine and pastries','Sesimbra village and dramatic Cabo Espichel cliffs','Private pickup from Lisbon, Almada, Setubal or Sesimbra'],
    included: ['Private transportation','Bottled water','All fees and taxes','Private picnic (local cheeses, bread, smoked meats, pastries, fruit, wine, juice and water)','In-vehicle air conditioning','Private pick-up and drop-off'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 48, city: 'Arrabida',
    is_active: true, display_order: 233,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Wild-Beaches-and-Picnic-Experience/d538-349639P1?pid=P00285354&mcid=42383&medium=link',
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
  if (error) {
    console.error(`LINK FAIL exp ${expId}: ${error.message}`);
  } else {
    console.log(`Linked exp ${expId}`);
  }
}

const { count } = await supabase
  .from('hotel_experiences')
  .select('*', { count: 'exact', head: true })
  .eq('hotel_id', 'wot-soul-costa-da-caparica');

console.log(`\nTotal linked to wot-soul-costa-da-caparica: ${count}`);

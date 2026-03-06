import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://hnivuisqktlrusyqywaz.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw'
);

const experiences = [
  {
    operator_id: 40,
    title: 'Coasteering and Speedboat in Arrábida near Lisbon',
    description: "Coasteering consists of the progression along a coastline where immersion in water is part of the activity. Participants cross rocky and aquatic areas using climbing (low difficulty), swimming and water jumping. A rope may be used for safety — lifelines, rappelling, via ferrata and tyrolean slides may also be included. Carried out by experienced, highly qualified technicians from WIND Mountain Activities Center in the stunning Arrábida Natural Park.",
    short_description: '3h coasteering adventure along Arrábida cliffs — climbing, swimming, sea jumps and speedboat. Expert guides, all gear included.',
    location: 'Arrábida', address: 'Arrábida Natural Park, Setúbal',
    latitude: 38.4848, longitude: -8.9766,
    price: 35.0, currency: 'EUR', duration: '3h', max_group_size: null,
    category: 'Sports',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/ad/1d/97.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/ad/1d/97.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/ad/1d/9a.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/cb/08/30.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/ad/1d/95.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/ad/1d/96.jpg'],
    highlights: ['Coasteering through Arrábida sea cliffs, caves and rock pools','Climbing, swimming and sea jumping — no technical experience required','Speedboat component for extra thrills','Experienced and qualified WIND instructors','Personal accident insurance and all coasteering equipment included'],
    included: ['Coasteering equipment','Personal accident insurance','GST'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.81, review_count: 21, city: 'Sesimbra',
    is_active: true, display_order: 242,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/coasteering-in-Arrabida/d5016-122184P7?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Sesimbra by Stand-Up Paddle',
    description: "Spend an exciting day on the water with this 3-hour guided Stand-Up Paddle tour of the Sesimbra coast. You will be amazed by the cliffs, caves and tunnels that characterize Sesimbra's Natural Park, and reach one of Portugal's most beautiful beaches — Ribeira do Cavalo. A professional guide provides all necessary gear. Lisbon pickup available — cross the 25th of April bridge and paddle along the Arrabida Nature Park coast through the Luiz de Saldanha Maritime Reserve. Total paddling distance: 6-10 km.",
    short_description: '3h guided SUP tour of Sesimbra coast — sea cliffs, caves and Ribeira do Cavalo beach. Lisbon pickup available.',
    location: 'Sesimbra', address: 'Sesimbra Harbour, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 35.9, currency: 'EUR', duration: '3h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/89/bb/d8.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/89/bb/d8.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/7a/db/cc.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/7a/db/c8.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/7a/db/c9.jpg'],
    highlights: ['SUP through cliffs, caves and tunnels of Sesimbra Natural Park','Reach Ribeira do Cavalo — one of Portugal\'s most beautiful beaches','Paddle 6-10 km through the Luiz de Saldanha Maritime Reserve','Professional guide and all SUP gear provided','Hotel pickup from Lisbon available'],
    included: ['Hotel pickup and drop-off','Snacks and water','Professional guide'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Sesimbra',
    is_active: true, display_order: 243,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Sesimbra-by-Stand-up-Paddle/d5016-10127P11?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Boat Taxi to Praia Ribeira do Cavalo from Sesimbra',
    description: 'Enjoy a taxi boat to Ribeira do Cavalo beach in just a 10-minute trip departing from the village of Sesimbra. The safest, most comfortable and fun way to discover one of the most beautiful and secluded beaches in Portugal — only accessible by sea or a steep hike.',
    short_description: '10-min boat taxi from Sesimbra to Ribeira do Cavalo — the easiest way to reach one of Portugal\'s most stunning hidden beaches.',
    location: 'Sesimbra', address: 'Sesimbra Port, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 16.0, currency: 'EUR', duration: '10min', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/45/96/35.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/45/96/35.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/46/84/45.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/12/46/83/95.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/10/7b/e5/eb.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/45/96/36.jpg'],
    highlights: ['10-minute boat taxi to the hidden Ribeira do Cavalo beach','One of Portugal\'s most beautiful and secluded beaches — only reachable by sea','Safe, comfortable and scenic crossing from Sesimbra port','Avoid the steep hike — arrive relaxed and ready to swim','Return trip also available'],
    included: ['Boat transfer to Ribeira do Cavalo'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.25, review_count: 4, city: 'Sesimbra',
    is_active: true, display_order: 244,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Private-Boat-Transport-Taxi-from-Praia-do-Cavalo/d5016-389613P3?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Snorkeling in Sesimbra — Shallow Marine Bays',
    description: "In this activity you get to know the marine life of the shallow and sheltered bays of Sesimbra from the surface, in a safe and comfortable way. Explore the rich underwater world of the Parque Luis Saldanha Marine Reserve without scuba gear — perfect for beginners, families and anyone curious about what lies beneath Sesimbra's crystal-clear waters.",
    short_description: '1h guided snorkel in Sesimbra\'s sheltered marine bays — all equipment included, suitable for all ages and beginners.',
    location: 'Sesimbra', address: 'Sesimbra Port, Sesimbra',
    latitude: 38.4430, longitude: -9.1012,
    price: 45.0, currency: 'EUR', duration: '1h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/81/44/77.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/81/44/77.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/81/44/7b.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/81/44/7e.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/81/47/a8.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/81/48/0c.jpg'],
    highlights: ['Snorkel in the sheltered bays of Sesimbra Marine Reserve','Rich marine life in the Parque Luis Saldanha protected waters','All snorkeling equipment included','Safe and comfortable — perfect for beginners and families','No experience required'],
    included: ['All snorkeling equipment','Safety equipment','Snacks'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Sesimbra',
    is_active: true, display_order: 245,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Snorkeling-Exit-Simples-in-Sesimbra/d5016-151733P8?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Try Dive in Arrábida Marine Reserve near Lisbon',
    description: 'We provide you with the opportunity to explore the bottom of the oceans. With our team you can share unforgettable experiences, discovering places and landscapes of rare beauty. You will always be supported and supervised by our team of experienced guides and instructors. A dip in a reef within the Professor Luis Saldanha Marine Park — unique and unforgettable landscapes will be the highlight of your experience.',
    short_description: '2h discover scuba diving in the Professor Luis Saldanha Marine Park — expert guides, all SCUBA equipment and insurance included.',
    location: 'Arrábida', address: 'Arrábida Natural Park / Sesimbra',
    latitude: 38.4848, longitude: -8.9766,
    price: 85.0, currency: 'EUR', duration: '2h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/6a/62/f4.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/6a/62/f4.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/6a/d5/3c.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/1f/06/63.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/14/6a/60/94.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/1f/06/64.jpg'],
    highlights: ['Dive in the Professor Luis Saldanha Marine Park — one of Portugal\'s most protected reefs','Stunning underwater landscapes of rare beauty','Guided by experienced instructors — no prior dive experience needed','Full SCUBA equipment provided','Personal accident insurance included'],
    included: ['Personal accident insurance','Use of SCUBA equipment'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 13, city: 'Sesimbra',
    is_active: true, display_order: 246,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Discover-Scuba-Diving-course-in-Marine-Reserve-near-Lisbon/d5016-122184P2?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Electric Bike Rental in Sesimbra',
    description: "Prepare for an adventure through the culture and landscapes of Sesimbra and the Arrábida Natural Park. Green meadows, vertical cliffs and long sandy beaches within reach. Follow one of our maps at your own pace — at each stop a new discovery. Talk to locals and share your story, or join a guided half-day or full-day tour.",
    short_description: '4h e-bike rental in Sesimbra — explore Arrábida cliffs, beaches and villages at your own pace with a detailed route map.',
    location: 'Sesimbra', address: 'Sesimbra (pickup point confirmed on booking)',
    latitude: 38.4430, longitude: -9.1012,
    price: 45.0, currency: 'EUR', duration: '4h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/6e/80/a5.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/6e/80/a5.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/6e/7b/96.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/6e/7b/bd.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/6e/80/ab.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/6e/80/af.jpg'],
    highlights: ['Self-guided e-bike through Sesimbra and Arrábida Natural Park','Green meadows, dramatic vertical cliffs and sandy beaches','Detailed route map included — ride at your own pace','Discover local villages and talk to residents','Option to join a guided half-day or full-day tour'],
    included: ['Electric bicycle','Helmet','Assistance equipment','Battery charger (full day rental)'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Sesimbra',
    is_active: true, display_order: 247,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Electric-Bike-Rental-in-Sesimbra/d5016-5560378P1?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Sesimbra Buggy Tour at Sunset to Foz Beach',
    description: 'This Sesimbra buggy tour stands out for taking place at the end of the day, providing a unique off-road experience at sunset on Foz Beach. Combines moderate adventure with golden landscapes, creating the most photogenic and quiet environment in the region. Ideal for couples, friends and photography lovers — includes natural trails, passage through Albufeira Lagoon and permanent accompaniment by an experienced guide, ensuring safety without losing the magic of the moment.',
    short_description: '2h sunset buggy tour through Sesimbra trails and Albufeira Lagoon to Foz Beach — golden light, off-road and unforgettable for couples.',
    location: 'Sesimbra', address: 'Sesimbra (meeting point confirmed on booking)',
    latitude: 38.4430, longitude: -9.1012,
    price: 175.0, currency: 'EUR', duration: '2h', max_group_size: null,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/70/4d.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/70/4d.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/70/56.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/70/5d.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/70/61.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/70/68.jpg'],
    highlights: ['Off-road buggy at golden hour — most photogenic time in Sesimbra','Natural trails through Albufeira Lagoon to Foz Beach','Experienced guide accompanying throughout for safety','Perfect for couples, friends and photography enthusiasts','Unique way to experience Sesimbra\'s wild landscape'],
    included: ['Guide on motorbike escort','First aid kit','Safety equipment','Insurance'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Sesimbra',
    is_active: true, display_order: 248,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Sesimbra-Buggy-tour-at-sunset-to-the-beach-of-Foz/d5016-400224P15?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Paragliding near Lisbon with Transfer',
    description: 'On this paragliding tandem flight you will fly over a fantastic spot near Lisbon — usually Praia das Bicas, Praia da Fonte da Telha, Arrábida or Sesimbra (flight site chosen according to weather conditions). After a brief briefing on flight procedure, take-off and safety, get ready for your first flight — enjoying a scenic experience over one of Portugal\'s most stunning coastlines. With your pilot instructor, all you have to do is sit back and enjoy the fantastic views!',
    short_description: '20-min tandem paragliding flight over Arrábida or Sesimbra coast — transfer from Lisbon, instructor pilot, all gear included.',
    location: 'Arrábida', address: 'Transfer from Lisbon meeting point (site varies by weather)',
    latitude: 38.4848, longitude: -8.9766,
    price: 135.0, currency: 'EUR', duration: '20min', max_group_size: null,
    category: 'Sports',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/29/8a/36.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/29/8a/36.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/29/97/20.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/29/97/31.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/29/97/4e.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0f/29/e8/a9.jpg'],
    highlights: ['Tandem paragliding over Arrábida, Sesimbra or Fonte da Telha coastline','Flight site chosen daily for best conditions','20-minute scenic flight with a certified pilot instructor','Transfer from Lisbon meeting point included','Full safety briefing — no experience required'],
    included: ['Activity insurance','Paragliding safety gear','Transfer from Lisbon','20-min flight with instructor'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 1, city: 'Sesimbra',
    is_active: true, display_order: 249,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Setubal-District/Paragliding-experience-near-Lisbon-with-transfers-from-Lisbon/d5016-7776P54?pid=P00285354&mcid=42383&medium=link',
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

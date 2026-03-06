import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://hnivuisqktlrusyqywaz.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw'
);

const experiences = [
  {
    operator_id: 40,
    title: 'Quad Bike Tour in Lisbon',
    description: 'This tour takes you to the wild side of Lisbon, visit ancient monuments and experience awe inspiring landscapes with this fun off-road experience! While on a quest to find ancient treasures and secret gems, you will have the opportunity to drive and maneuver quad bikes through diverse terrains and challenging trails. An amazing adventure that blends landscape and culture, and arguably the best kept secret in Lisbon.',
    short_description: 'Off-road quad bike adventure through dunes and ancient landscapes near Lisbon — no experience required.',
    location: 'Costa da Caparica',
    address: 'Costa da Caparica, Almada',
    latitude: 38.6411, longitude: -9.2353,
    price: 129.0, currency: 'EUR', duration: '2h', max_group_size: 2,
    category: 'Sports',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/bb/3e.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/bb/3e.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/bb/4f.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/bb/52.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/bb/4c.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/11/ba/3f.jpg'],
    highlights: ['Quad bike ride through diverse terrains and challenging trails','Visit ancient monuments and secret gems south of Lisbon','Awe-inspiring coastal landscapes','All fees and taxes included','Suitable for all experience levels'],
    included: ['All fees and taxes'],
    languages: ['English','Portuguese','Spanish'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 9, city: 'Costa da Caparica',
    is_active: true, display_order: 218,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Quad-bike-tour-Lisbon/d538-472426P1?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'The Surf Instructor in Costa da Caparica',
    description: "Surfing is not a sport but a passion, once in a life you must try the feeling of riding a wave! With us you will be able to do that in a fun and safe way, and you're going to have a unique memory taken by our professional photographer!",
    short_description: 'Surf lesson at Costa da Caparica with certified instructor + professional photographer — all levels welcome.',
    location: 'Costa da Caparica',
    address: 'Praia da Costa da Caparica, Almada',
    latitude: 38.6411, longitude: -9.2353,
    price: 50.0, currency: 'EUR', duration: '3h 30min', max_group_size: 15,
    category: 'Sports',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/9d/22/bd.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/9d/22/bd.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/f8/2b/9a.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ac/e4.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ad/53.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/9d/ad/68.jpg'],
    highlights: ["Certified surf instructor on one of Europe's best Atlantic beaches","Professional photographer captures your session","Safe and fun environment for all levels","Private transportation included","Unforgettable first-wave experience"],
    included: ['Private transportation','Surfboard and wetsuit','Professional photographer'],
    languages: ['English','Portuguese','Spanish','French'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.9, review_count: 404, city: 'Costa da Caparica',
    is_active: true, display_order: 219,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/The-Surf-Instructor/d538-160709P1?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Portuguese Cooking Class at Local Market',
    description: 'Get a deeper insight into the true culinary and typical Portuguese cuisine during a cooking class and an excursion to the local market selling fish, meat, fruits and vegetables. A practical experience designed for lovers of gastronomy, this tour allows you to explore Portuguese cuisine in more depth than simply eating in restaurants. Choose fresh ingredients from a list we will provide, buy them at a traditional market, then prepare and delight in the fruits of your work.',
    short_description: 'Guided Lisbon market visit + hands-on Portuguese cooking class + lunch — all included.',
    location: 'Lisbon',
    address: 'Central Lisbon (meeting point confirmed on booking)',
    latitude: 38.7169, longitude: -9.1399,
    price: 100.0, currency: 'EUR', duration: '6h', max_group_size: null,
    category: 'Local Cooking',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/95/83/2c.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/95/83/2c.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0d/7c/12.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/95/82/ef.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0c/0d/7c/07.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/95/84/8c.jpg'],
    highlights: ['Guided excursion to a traditional Lisbon market','Hands-on cooking class with authentic Portuguese recipes','Lunch of what you prepared — included','Air-conditioned transport','Deep dive into authentic Portuguese gastronomy'],
    included: ['Lunch','Air-conditioned vehicle','Cooking class with chef','Market tour'],
    languages: ['English','Portuguese','Spanish','French'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 5.0, review_count: 3, city: 'Lisbon',
    is_active: true, display_order: 220,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Food-Tour-Cooking-Class-and-Lunch-at-a-Market-with-Local-Market-Tour/d538-9963P25?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Ride and Relax Beach Escape at Costa da Caparica',
    description: 'Experience the beauty of Costa da Caparica on a private day trip that combines a guided 2-hour horseback ride through dunes, forest trails and sea, with exclusive access to a beach club. Enjoy roundtrip transfers, a reserved sunbed and umbrella, welcome drink, seaside lunch, and personalized service for an unforgettable escape.',
    short_description: 'Private horseback ride through dunes + exclusive beach club access with sunbed, lunch and welcome drink.',
    location: 'Costa da Caparica',
    address: 'Costa da Caparica Beach, Almada',
    latitude: 38.6411, longitude: -9.2353,
    price: 385.0, currency: 'EUR', duration: '8h', max_group_size: null,
    category: 'Outdoors',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/95/d9.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/95/d9.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/95/92.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/95/dd.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/9a/c8.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/95/c5.jpg'],
    highlights: ['2-hour guided horseback ride through dunes, forest and sea','Exclusive beach club access with reserved sunbed and umbrella','Welcome drink + seaside lunch included','Roundtrip hotel transfer Lisbon to Costa da Caparica','All taxes and insurance included'],
    included: ['Seaside lunch with one drink and coffee','Roundtrip hotel transfer (Lisbon - Costa da Caparica)','Welcome drink at beach club','Reserved sunbed and umbrella','All taxes and insurance fees'],
    languages: ['English','Portuguese','Spanish'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Costa da Caparica',
    is_active: true, display_order: 221,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Ride-and-Relax-Beach-Escape-Lisbon-Costa-da-Caparica/d538-9963P31?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Horseback Riding - Mountain, Lesson, Beach or Arrabida',
    description: "Dive into Portugal's stunning natural scenery during this 2-hour horseback ride. Choose to walk through a pine forest near a fossil coast on a path to the stunning beach of Costa da Caparica, go horseback riding in the beautiful environment of the Arrabida Louro Mountain, or simply take a 2-hour horse lesson in the ring. Limited to only six people, this small group excursion offers an intimate experience.",
    short_description: 'Choose your 2h horseback experience: forest trail to the beach, Arrabida mountain or riding lesson - max 6 people.',
    location: 'Almada',
    address: 'Equestrian Centre, Almada',
    latitude: 38.6761, longitude: -9.1569,
    price: 75.0, currency: 'EUR', duration: '2h', max_group_size: 6,
    category: 'Micro Adventures',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/f1/94/28.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/f1/94/28.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/85/49/a6.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/67/9a/08.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/11/67/9a/06.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/07/bd/47/91.jpg'],
    highlights: ['4 options: forest trail, beach, Arrabida mountain or riding lesson','Small group - maximum 6 people','2-hour intimate equestrian experience in stunning scenery','Pine forest and fossil coast trails','Experienced guides and well-trained horses'],
    included: ['Horse, tack and equipment','Experienced guide','Safety helmet'],
    languages: ['English','Portuguese','Spanish'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: 4.8, review_count: 36, city: 'Costa da Caparica',
    is_active: true, display_order: 222,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Almada/Horseback-Riding-Options-1-Horseback-ride-lesson-2-Horseback-ride-Arrabida-3-Horseback-ride-beach/d51024-9963P6?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Surf and Sunset Tour in Almada and Caparica - Private Full Day',
    description: 'Discover the best of Almada and Costa da Caparica on this private full-day tour. Start with a surf session tailored to your experience level on the learner-friendly beach breaks of Costa da Caparica, with all equipment and coaching provided. Then walk through the Arriba Fossil (Mata dos Medos), where dunes and stone pines frame sweeping ocean views. Visit the Cristo Rei monument for panoramic vistas over Lisbon and the Tagus, descend via the Boca do Vento panoramic elevator, explore historic Cacilhas, and finish the day with a sunset drink on Rua do Ginjal.',
    short_description: 'Private full day: surf at Caparica + Arriba Fossil walk + Cristo Rei + sunset drinks in Cacilhas.',
    location: 'Costa da Caparica',
    address: 'Costa da Caparica / Almada',
    latitude: 38.6411, longitude: -9.2353,
    price: 225.0, currency: 'EUR', duration: '8h', max_group_size: null,
    category: 'Sports',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/a8/f5.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/a8/f5.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/a8/f6.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/9a/cd.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/cb/18.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/17/04/9a/c8.jpg'],
    highlights: ['Private surf session at Caparica - all levels, full equipment and coaching','Arriba Fossil (Mata dos Medos) coastal dune walk','Cristo Rei monument - panoramic views over Lisbon and the Tagus','Boca do Vento panoramic elevator to historic Cacilhas riverfront','Sunset drinks on Rua do Ginjal'],
    included: ['Cristo Rei platform/elevator ticket','Private transport within Almada and Costa da Caparica','Taxes and standard liability coverage','1x bottled water per person','Surf equipment and coaching'],
    languages: ['English','Portuguese','Spanish'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Costa da Caparica',
    is_active: true, display_order: 223,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Surf-and-Sunset-Tour-in-Almada-and-Caparica-Private-Full-Day/d538-9963P32?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Day Tour - Surfing and Arrabida Wine Tasting with Lunch',
    description: 'A full day of surfing and wine tasting awaits you in Portugal. Start your adventure with a surfing lesson at Costa da Caparica, guided by professional surfer Luis Perloiro, suitable for all skill levels. Then drive with guide Francisco Gomes to enjoy a delicious all-inclusive lunch in the charming town of Sesimbra. Afterward, explore the breathtaking Arrabida National Park before indulging in a private wine tasting at a local vineyard. Perfect for adventure seekers and wine enthusiasts alike - small group of up to 7 people.',
    short_description: 'Surf lesson at Caparica + all-inclusive lunch in Sesimbra + private wine tasting at Arrabida - max 7 people.',
    location: 'Costa da Caparica',
    address: 'Costa da Caparica / Sesimbra / Arrabida',
    latitude: 38.6411, longitude: -9.2353,
    price: 150.0, currency: 'EUR', duration: '9h', max_group_size: 7,
    category: 'Sports',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8a/f0.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8a/f0.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8a/f7.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8a/fa.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8b/02.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/16/6e/8b/08.jpg'],
    highlights: ['Surf lesson with pro surfer Luis Perloiro - all levels welcome','All-inclusive lunch in picturesque Sesimbra','Private wine tasting at a family vineyard in Arrabida National Park','Scenic drive through Arrabida - turquoise water and limestone cliffs','Small group - maximum 7 people'],
    included: ['Surf lesson with equipment (surfboard and wetsuit)','Bottled water','All-inclusive lunch in Sesimbra','Private wine tasting','Transport (9-seat van or 7-seat SUV)'],
    languages: ['English','Portuguese','Spanish'],
    cancellation_policy: 'Free cancellation up to 24h before',
    rating: null, review_count: 0, city: 'Costa da Caparica',
    is_active: true, display_order: 224,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Lisbon/Day-Tour-Surfing-and-Arrabida-Wine-Tasting-Lunch-Included/d538-5520842P2?pid=P00285354&mcid=42383&medium=link',
    affiliate_provider: 'Viator'
  },
  {
    operator_id: 40,
    title: 'Boho Chic Picnic Dinner with Water Views',
    description: "The perfect blend of authenticity, intimacy, and natural beauty. This is not just a picnic - it's a carefully curated moment where Portugal's most stunning landscapes become your private dining room. Whether you're seated on the golden sands of Costa da Caparica or gazing at the calm waters of the Tagus, each location is handpicked for its breathtaking atmosphere. With bohemian touches, cozy decor, and delicious Portuguese delicacies, every detail is designed to create a magical, slow-paced experience that connects you to the land, the flavors, and the moment. Ideal for romantic escapes, special celebrations, or simply indulging in the joy of nature and good food.",
    short_description: 'Fully set-up boho-chic picnic dinner at a handpicked scenic spot - Portuguese delicacies, cozy decor, stunning views.',
    location: 'Costa da Caparica',
    address: 'Scenic location near Costa da Caparica / Tagus (confirmed on booking)',
    latitude: 38.6411, longitude: -9.2353,
    price: 108.0, currency: 'EUR', duration: '2h', max_group_size: null,
    category: 'Night Explorer',
    image_url: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bc/2a.jpg',
    images: ['https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bc/2a.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bc/18.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bc/d5.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bc/f6.jpg','https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/15/94/bd/0e.jpg'],
    highlights: ['Fully set up - just show up and enjoy','Handpicked scenic spot with stunning water or coastal views','Bohemian styling with cozy decor and warm atmosphere','Delicious Portuguese delicacies included','Perfect for couples, anniversaries and special celebrations'],
    included: ['Complete picnic set-up and boho styling','Dinner with Portuguese delicacies'],
    languages: ['English','Portuguese'],
    cancellation_policy: 'Free cancellation up to 48h before',
    rating: null, review_count: 0, city: 'Costa da Caparica',
    is_active: true, display_order: 225,
    affiliate_url: 'https://www.viator.com/en-GB/tours/Almada/A-romantic-boho-chic-picnic-dinner-with-stunning-water-views/d51024-75909P1090?pid=P00285354&mcid=42383&medium=link',
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

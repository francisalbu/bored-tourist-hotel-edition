import { useHotel } from '../contexts/HotelContext';
import React, { useState, useRef, useEffect } from 'react';
import { Send, Bot, User, MapPin } from 'lucide-react';
import OpenAI from 'openai';
import { supabase } from '../lib/supabase';
import { ExperienceDisplay, EventDisplay } from '../types';
import { useUserMemories } from '../hooks/useUserMemories';
import { DetailModal } from './DetailModal';
import FreeSpotModal from './FreeSpotModal';
import { EventCard } from './EventCard';
import { getCachedPlaceDetails, getPhotoUrl, searchPlaceByName } from '../lib/googlePlaces';

interface WeatherData {
  temperature: number;
  condition: string;
  description: string;
  humidity: number;
  windSpeed: number;
  precipitation: number; // mm of rain
}

interface EventData {
  id: string;
  name: string;
  date: string;
  venue: string;
  category: string;
  imageUrl: string;
  link: string;
  description?: string;
}

interface Message {
  id: string;
  role: 'user' | 'assistant';
  text: string;
  experienceIds?: number[];
  freeSpotIds?: number[];
  eventIds?: string[];
}

interface FreeSpot {
  id: number;
  title: string;
  description: string;
  imageUrl: string;
  rating: number;
  category: string;
  location: string;
  placeId?: string; // Google Place ID for real data
  gps?: string;
  distance?: string;
  duration?: string;
}

const FREE_SPOTS: FreeSpot[] = [
  {
    id: 1,
    title: "Time Out Market",
    description: "A lively food hall where everyone can pick their favorite bite! With local Portuguese food stalls and international options, it's a vibrant (and delicious) spot for lunch or dinner with family.",
    imageUrl: "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800",
    rating: 4.4,
    category: "Food & Dining",
    location: "Cais do Sodré (Lisboa Centro - 10min from hotel)",
    placeId: "ChIJLxl_1w9KzJIRi8WHLX2DQg8"
  },
  {
    id: 2,
    title: "Tram 28",
    description: "Hop on the iconic yellow tram for a classic Lisbon adventure—ride through the city's historic quarters, up and down hills, and past famous sights. Kids love the vintage trams, and it's a fun way to see the city together.",
    imageUrl: "https://images.unsplash.com/photo-1585208798174-6cedd86e019a?w=800",
    rating: 4.1,
    category: "Attraction",
    location: "Various stops (Lisboa Centro)",
    placeId: "ChIJX7rCWORKzJIRfLQs2iVwSIo"
  },
  {
    id: 3,
    title: "Castelo de São Jorge",
    description: "Explore castle walls, towers, gardens, and some of the best city views! The castle is full of history and space for kids to run around, and you can have a family picnic overlooking Lisbon.",
    imageUrl: "https://images.unsplash.com/photo-1585208798174-6cedd86e019a?w=800",
    rating: 4.5,
    category: "Attraction",
    location: "Alfama (Lisboa Centro - 15min from hotel)",
    placeId: "ChIJA24kWBBKzJIR5qW0VwBBQIo"
  },
  {
    id: 4,
    title: "Pastéis de Belém",
    description: "A must for families with a sweet tooth! Try the famous pastéis de nata (custard tarts) at this historic bakery—fresh out of the oven, they're a treat for all ages.",
    imageUrl: "https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800",
    rating: 4.6,
    category: "Food & Dining",
    location: "Belém (25min from hotel)",
    placeId: "ChIJYxJIQOKWJA0RI0N3WFBVGwQ"
  },
  {
    id: 5,
    title: "Oceanário de Lisboa",
    description: "One of the largest indoor aquariums in the world, this spot is a hit with families! See over 15,000 sea creatures from all over the globe and interactive exhibits that are both fun and educational for kids.",
    imageUrl: "https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800",
    rating: 4.6,
    category: "Attraction",
    location: "Parque das Nações (30min from hotel)",
    placeId: "ChIJjQVvW0U5GQ0RYzb0EUTi2CY"
  },
  {
    id: 6,
    title: "Miradouro da Graça",
    description: "Stunning sunset viewpoint with a local vibe. Perfect for photos and enjoying the city panorama with a drink from the terrace café.",
    imageUrl: "https://images.unsplash.com/photo-1555881400-74d7acaacd8b?w=800",
    rating: 4.7,
    category: "Viewpoint",
    location: "Graça (Lisboa Centro - 15min from hotel)",
    placeId: "ChIJxzt_6hBKzJIRZphtxBFXrB8"
  },
  {
    id: 7,
    title: "LX Factory",
    description: "Vibrant cultural and creative hub in a repurposed industrial complex. Street art, unique shops, trendy cafes, and cool bookstores to explore.",
    imageUrl: "https://images.unsplash.com/photo-1513342961520-28b8a0d64604?w=800",
    rating: 4.5,
    category: "Attraction",
    location: "Alcântara (20min from hotel, near Belém)",
    placeId: "ChIJFQxZcYKWJA0RgDAvsBusKgQ"
  },
  {
    id: 8,
    title: "Alfama District",
    description: "Lisbon's oldest neighborhood with narrow winding streets, colorful tiles, and authentic fado music. Perfect for wandering and feeling the soul of the city.",
    imageUrl: "https://images.unsplash.com/photo-1599056095104-4fd9536b7bbf?w=800",
    rating: 4.8,
    category: "Neighborhood",
    location: "Alfama (Lisboa Centro - 15min from hotel)",
    placeId: "ChIJzyhWTQ9KzJIRLPHg-bTTHI8"
  },
  {
    id: 9,
    title: "PR3 STB – Portinho da Arrábida Trail",
    description: "Official marked trail starting at Creiro Archaeological Station parking (38.4826° N, 8.9894° W). Route: Creiro → Oceanographic Museum → Lapa de Santa Margarida (cave chapel) → Alpertuche beach access. Distance: 1.3km linear. Elevation gain: 45m. Duration: 30-45min. Difficulty: Easy (suitable for all ages). Surface: dirt path + stone steps. Best for: romantic seaside walk with historical points. Parking: Free at Creiro. Season: Year-round, avoid midday summer heat.",
    imageUrl: "https://images.unsplash.com/photo-1551632811-561732d1e306?w=800",
    rating: 4.8,
    category: "Hiking",
    location: "Arrábida Natural Park (90min from hotel)",
    gps: "38.4826° N, 8.9894° W",
    distance: "1.3km linear",
    duration: "30-45min"
  },
  {
    id: 10,
    title: "PR1 STB – Encostas de São Filipe Trail",
    description: "Circular trail from Albarquel Urban Park (38.5245° N, 8.8912° W) climbing to 16th-century São Filipe Fort. Distance: 3.9km loop. Elevation gain: 120m. Duration: 1.5-2h. Difficulty: Moderate (some steep sections). Surface: paved initially, then dirt trail with rocks. Highlights: Panoramic 360° views of Setúbal bay, Tróia peninsula, and Serra da Arrábida. Best time: Sunset (golden hour). Parking: Albarquel park. Bring: Water, sun protection.",
    imageUrl: "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800",
    rating: 4.7,
    category: "Hiking",
    location: "Setúbal (80min from hotel)",
    gps: "38.5245° N, 8.8912° W",
    distance: "3.9km loop",
    duration: "1.5-2h"
  },
  {
    id: 11,
    title: "Risco Trail – Serra da Arrábida",
    description: "Easy coastal trail between Mil Regos camping (38.4891° N, 8.9723° W) and Eco Parque do Outão. Distance: 2.1km linear (4.2km return). Elevation: +76m / -45m. Duration: 30min one-way, 1h return. Difficulty: Easy. Terrain: well-maintained dirt path through Mediterranean scrubland. Flora: wild rosemary, cistus, pine trees. Perfect for: peaceful nature walks, picnics at viewpoints, photography. Dog-friendly! Parking: Both campsites. Best: Spring (wildflowers) or autumn (cooler temps).",
    imageUrl: "https://images.unsplash.com/photo-1445308394109-4ec2920981b1?w=800",
    rating: 4.8,
    category: "Hiking",
    location: "Arrábida Natural Park (90min from hotel)",
    gps: "38.4891° N, 8.9723° W",
    distance: "2.1km linear (4.2km return)",
    duration: "30min one-way, 1h return"
  },
  {
    id: 12,
    title: "Portinho da Arrábida Beach",
    description: "Pristine beach at 38.4814° N, 8.9877° W. Water: Crystal-clear turquoise (avg 18-22°C summer). Sand: White/golden fine sand. Cliffs: Dramatic limestone formations providing natural shelter. Activities: Swimming, snorkeling (bring gear - rocky areas teem with fish), SUP, kayaking. Facilities: Beach bar (seasonal), parking (€), showers, lifeguard (summer). Best combined with PR3 trail. Arrive early (fills up by 11am summer). Sunset swims = magical. Protected area - no fishing.",
    imageUrl: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800",
    rating: 4.7,
    category: "Beach",
    location: "Arrábida (90min from hotel)",
    placeId: "ChIJy7gU5GVYNA0RQPw-XSQX5ag",
    gps: "38.4814° N, 8.9877° W"
  },
  {
    id: 13,
    title: "Monsanto Forest Park Trails",
    description: "Lisbon's green lung at 38.7289° N, 9.1867° W. Multiple marked trails: Yellow Route (2.5km, easy, 45min), Blue Route (5km, moderate, 1.5h), Red Route (8km, challenging, 2.5h). Elevation: 50-226m above sea level. Terrain: forest paths, some rocky sections. Highlights: Panoramic viewpoints (Montes Claros, Bela Vista), picnic areas, ancient trees. Activities: Hiking, trail running, mountain biking, birdwatching. Facilities: Multiple entrances, free parking, water fountains. Best: Early morning (cooler + bird activity) or sunset. Sunrise from Montes Claros viewpoint = stunning over city.",
    imageUrl: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=800",
    rating: 4.6,
    category: "Nature",
    location: "Monsanto (20min from hotel)",
    placeId: "ChIJE0B7hiAzGQ0RQGWqX6LrAAQ",
    gps: "38.7289° N, 9.1867° W",
    distance: "2.5-8km",
    duration: "45min-2.5h"
  },
  {
    id: 14,
    title: "Gulbenkian Garden",
    description: "Peaceful 7.5-hectare landscaped garden at 38.7373° N, 9.1538° W (adjacent to Gulbenkian Museum). Features: Artificial lake with ducks & turtles, contemporary sculpture garden (Rodin, Henry Moore), walking paths through diverse flora zones, amphitheater. FREE garden entry (museum €10 separate). Open: 10:00-19:30 (summer), 10:00-17:30 (winter). Perfect for: Romantic afternoon stroll, reading by lake, photography, post-museum relaxation. Quiet zones for couples. Small café inside. 15min walk from São Sebastião metro.",
    imageUrl: "https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800",
    rating: 4.7,
    category: "Garden",
    location: "São Sebastião (10min from hotel)"
  }
];

// ══════════════════════════════════════════════════════════════
// 🧠 SMART EXPERIENCE MATCHING ENGINE
// Pre-filters and ranks experiences before sending to the LLM
// so the AI focuses on the most relevant options.
// ══════════════════════════════════════════════════════════════

const KEYWORD_TAG_MAP: Record<string, string[]> = {
  // ── Water Sports ──
  'surf': ['Surf', 'Surfing', 'Waves', 'Water Sports', 'Surf School'],
  'surfing': ['Surf', 'Surfing', 'Waves', 'Water Sports'],
  'dive': ['Scuba Diving', 'Diving', 'Underwater', 'Marine Life', 'First Dive'],
  'diving': ['Scuba Diving', 'Diving', 'Underwater', 'Marine Life'],
  'scuba': ['Scuba Diving', 'Diving', 'Underwater'],
  'snorkel': ['Snorkeling', 'Marine Life', 'Ocean'],
  'snorkeling': ['Snorkeling', 'Marine Life', 'Ocean', 'Sea Caves'],
  'kayak': ['Kayak', 'Water Sports', 'Coastal', 'Ocean'],
  'kayaking': ['Kayak', 'Water Sports', 'Coastal'],
  'sail': ['Sailing', 'Sailboat', 'Cruise', 'Boat', 'River'],
  'sailing': ['Sailing', 'Sailboat', 'Cruise', 'Boat'],
  'boat': ['Boat', 'Cruise', 'Sailing', 'River', 'Tagus River', 'Traditional Boats'],
  'cruise': ['Cruise', 'Boat', 'Sailing', 'River'],
  // ── Food & Drink ──
  'food': ['Food Tour', 'Tastings', 'Culinary', 'Foodie', 'Portuguese Cuisine', 'Local Food'],
  'eat': ['Food Tour', 'Tastings', 'Culinary', 'Local Food'],
  'cook': ['Cooking Class', 'Culinary', 'Workshop', 'Hands-On', 'Portuguese Cuisine'],
  'cooking': ['Cooking Class', 'Culinary', 'Workshop', 'Hands-On'],
  'tasting': ['Tastings', 'Food Tour', 'Wine Tasting', 'Wine'],
  'tastings': ['Tastings', 'Food Tour', 'Wine Tasting'],
  'wine': ['Wine', 'Wine Tour', 'Wine Tasting', 'Winery', 'Vineyard', 'Portuguese Wine'],
  'pasteis': ['Pastel de Nata', 'Baking', 'Portuguese Pastry'],
  'pastel de nata': ['Pastel de Nata', 'Baking', 'Portuguese Pastry'],
  'nata': ['Pastel de Nata', 'Baking', 'Portuguese Pastry'],
  'vegan': ['Vegan', 'Plant-Based', 'Healthy'],
  'vegetarian': ['Vegan', 'Plant-Based', 'Healthy'],
  'restaurant': ['Dinner', 'Restaurant', 'Dining'],
  'dinner': ['Dinner', 'Restaurant', 'Dining', 'Evening'],
  'lunch': ['Lunch', 'Food Tour', 'Tastings'],
  'brunch': ['Brunch', 'Food Tour'],
  'cheese': ['Cheese', 'Wine Tasting', 'Gourmet'],
  'petiscos': ['Petiscos', 'Tapas', 'Small Plates'],
  'tapas': ['Petiscos', 'Tapas', 'Small Plates'],
  'bacalhau': ['Bacalhau', 'Portuguese Cuisine', 'Food Tour'],
  // ── Culture & History ──
  'fado': ['Fado', 'Live Music', 'Portuguese Music', 'Traditional'],
  'music': ['Live Music', 'Fado', 'Portuguese Music', 'Performance'],
  'history': ['History', 'Walking Tour', 'Heritage', 'Cultural', 'Educational'],
  'historical': ['History', 'Heritage', 'Cultural', 'Educational'],
  'museum': ['Museum', 'Exhibition', 'Cultural', 'Indoor'],
  'art': ['Art', 'Street Art', 'Urban Art', 'Murals', 'Creative'],
  'street art': ['Street Art', 'Graffiti', 'Urban Art', 'Murals'],
  'graffiti': ['Street Art', 'Graffiti', 'Urban Art', 'Murals'],
  'theatre': ['Theatre', 'Immersive', 'Performance'],
  'theater': ['Theatre', 'Immersive', 'Performance'],
  'tile': ['Azulejo', 'Tile Painting', 'Workshop', 'Ceramic'],
  'azulejo': ['Azulejo', 'Tile Painting', 'Workshop'],
  'ceramic': ['Azulejo', 'Tile Painting', 'Ceramic', 'Workshop'],
  'photography': ['Photography', 'Photowalk', 'Creative'],
  'photo': ['Photography', 'Photowalk', 'Photo Opportunity'],
  'sketch': ['Sketching', 'Art', 'Drawing', 'Creative'],
  'draw': ['Sketching', 'Drawing', 'Art', 'Creative'],
  'jewish': ['Jewish Heritage', 'Sephardic', 'History'],
  'sephardic': ['Sephardic', 'Jewish Heritage'],
  'cabaret': ['Cabaret', 'Show', 'Night Life', 'Entertainment'],
  // ── Adventure & Sports ──
  'adventure': ['Adventure', 'Adrenaline', 'Off-Road', 'Extreme', 'Micro Adventure'],
  'adrenaline': ['Adrenaline', 'Adventure', 'Extreme', 'Thrilling'],
  'extreme': ['Extreme', 'Adrenaline', 'Adventure'],
  'paragliding': ['Paragliding', 'Flying', 'Aerial', 'Tandem'],
  'paraglide': ['Paragliding', 'Flying', 'Aerial', 'Tandem'],
  'fly': ['Paragliding', 'Flying', 'Aerial', 'Helicopter', 'Hot Air Balloon', 'Indoor Skydiving'],
  'flying': ['Paragliding', 'Flying', 'Aerial', 'Helicopter'],
  'skydiving': ['Indoor Skydiving', 'Wind Tunnel', 'Adrenaline'],
  'skydive': ['Indoor Skydiving', 'Wind Tunnel', 'Adrenaline'],
  'climb': ['Rock Climbing', 'Climbing', 'Adrenaline'],
  'climbing': ['Rock Climbing', 'Climbing', 'Coastal Cliffs'],
  'rock climbing': ['Rock Climbing', 'Climbing', 'Coastal Cliffs'],
  'hike': ['Hiking', 'Nature', 'Coastal', 'Outdoors'],
  'hiking': ['Hiking', 'Nature', 'Coastal', 'Outdoors'],
  'trek': ['Hiking', 'Nature', 'Outdoors', 'Adventure'],
  'trekking': ['Hiking', 'Nature', 'Outdoors'],
  'walk': ['Walking Tour', 'Guided Tour', 'Outdoors'],
  'walking': ['Walking Tour', 'Guided Tour'],
  'jeep': ['Jeep', '4x4', 'Off-Road', 'Safari'],
  '4x4': ['4x4', 'Jeep', 'Off-Road', 'Safari'],
  'safari': ['Safari', 'Jeep', '4x4', 'Off-Road'],
  'buggy': ['Buggy', 'Off-Road', 'Adventure'],
  'quad': ['Quad', 'ATV', 'Off-Road'],
  'atv': ['Quad', 'ATV', 'Off-Road'],
  'bike': ['E-Bike', 'Electric Bike', 'Cycling'],
  'ebike': ['E-Bike', 'Electric Bike', 'Cycling'],
  'e-bike': ['E-Bike', 'Electric Bike', 'Cycling'],
  'cycling': ['Cycling', 'E-Bike', 'Electric Bike'],
  'bicycle': ['E-Bike', 'Cycling', 'Electric Bike'],
  'horse': ['Horseback Riding', 'Horse', 'Animals'],
  'horseback': ['Horseback Riding', 'Horse', 'Beach'],
  'riding': ['Horseback Riding', 'Horse'],
  'fishing': ['Fishing', 'Deep Sea', 'Boat', 'Ocean', 'Sport Fishing'],
  'fish': ['Fishing', 'Deep Sea', 'Sport Fishing'],
  'cave': ['Caving', 'Caves', 'Underground', 'Geological'],
  'caving': ['Caving', 'Caves', 'Underground'],
  'coasteering': ['Coasteering', 'Cliff Jumping', 'Wild Swimming'],
  'cliff': ['Coasteering', 'Cliff Jumping', 'Cliff', 'Coastal Cliffs'],
  'escape room': ['Escape Room', 'Escape Game', 'Puzzle', 'Interactive'],
  'escape game': ['Escape Room', 'Escape Game', 'Puzzle', 'Interactive'],
  'escape': ['Escape Room', 'Escape Game', 'Puzzle'],
  'puzzle': ['Puzzle', 'Escape Room', 'Escape Game', 'Treasure Hunt'],
  'treasure': ['Treasure Hunt', 'Puzzle', 'Interactive'],
  // ── Wellness ──
  'spa': ['Spa', 'Massage', 'Wellness', 'Relaxation', 'Self-Care', 'Pampering'],
  'massage': ['Spa', 'Massage', 'Wellness', 'Relaxation'],
  'wellness': ['Spa', 'Wellness', 'Relaxation', 'Self-Care'],
  'relax': ['Relaxation', 'Spa', 'Wellness', 'Relaxing', 'Self-Care'],
  'relaxing': ['Relaxation', 'Spa', 'Wellness', 'Relaxing'],
  'pampering': ['Spa', 'Pampering', 'Luxury', 'Self-Care'],
  // ── Moods & Occasions ──
  'romantic': ['Romantic', 'Couples', 'Sunset', 'Intimate'],
  'romance': ['Romantic', 'Couples', 'Sunset', 'Intimate'],
  'couple': ['Romantic', 'Couples', 'Sunset'],
  'couples': ['Romantic', 'Couples', 'Sunset'],
  'date': ['Romantic', 'Couples', 'Intimate', 'Evening'],
  'honeymoon': ['Romantic', 'Couples', 'Luxury', 'Sunset'],
  'anniversary': ['Romantic', 'Couples', 'Luxury', 'Intimate'],
  'sunset': ['Sunset', 'Golden Hour', 'Romantic', 'Evening'],
  'sunrise': ['Sunrise', 'Hot Air Balloon', 'Aerial'],
  'family': ['Family Friendly', 'Kids', 'Educational'],
  'families': ['Family Friendly', 'Kids', 'Educational'],
  'kids': ['Family Friendly', 'Kids', 'Fun', 'Educational'],
  'children': ['Family Friendly', 'Kids', 'Fun'],
  'rain': ['Indoor', 'Rainy Day', 'Museum', 'Workshop'],
  'rainy': ['Indoor', 'Rainy Day', 'Museum', 'Workshop'],
  'indoor': ['Indoor', 'Rainy Day', 'Workshop', 'Museum'],
  'night': ['Night Tour', 'Evening', 'Night Life'],
  'nightlife': ['Night Life', 'Evening', 'Cabaret', 'Show'],
  'evening': ['Evening', 'Night Tour', 'Sunset', 'Dinner'],
  'morning': ['Sunrise', 'Hiking', 'Outdoors'],
  'free': ['Free Tour'],
  'budget': ['Free Tour', 'Small Group'],
  'cheap': ['Free Tour'],
  'luxury': ['Luxury', 'VIP', 'Private', 'Helicopter'],
  'vip': ['VIP', 'Luxury', 'Private'],
  'private': ['Private', 'Intimate', 'One-on-One'],
  'bucket list': ['Bucket List', 'Unique'],
  'unique': ['Unique', 'Bucket List', 'Immersive'],
  'immersive': ['Immersive', 'Interactive', 'Sensory'],
  'creative': ['Creative', 'Hands-On', 'Workshop', 'Art', 'Learn'],
  'workshop': ['Workshop', 'Hands-On', 'Creative', 'Learn'],
  'learn': ['Learn', 'Workshop', 'Educational', 'Hands-On'],
  'team': ['Team Building', 'Groups', 'Fun'],
  'group': ['Small Group', 'Team Building', 'Groups'],
  // ── Locations ──
  'sintra': ['Sintra', 'Palaces', 'Day Trip'],
  'cascais': ['Cascais', 'Coastal', 'Town'],
  'alfama': ['Alfama', 'Old Town', 'History'],
  'belem': ['Belém', 'History', 'Monuments'],
  'belém': ['Belém', 'History', 'Monuments'],
  'arrábida': ['Arrábida', 'Nature', 'Beach'],
  'arrabida': ['Arrábida', 'Nature', 'Beach'],
  'sesimbra': ['Sesimbra', 'Beach', 'Ocean'],
  'évora': ['Évora', 'Alentejo', 'UNESCO'],
  'evora': ['Évora', 'Alentejo', 'UNESCO'],
  'alentejo': ['Alentejo', 'Évora', 'Countryside'],
  'nazaré': ['Nazaré', 'Big Waves', 'Day Trip'],
  'nazare': ['Nazaré', 'Big Waves', 'Day Trip'],
  'óbidos': ['Óbidos', 'Medieval', 'Village'],
  'obidos': ['Óbidos', 'Medieval', 'Village'],
  'fátima': ['Fátima', 'Religious'],
  'fatima': ['Fátima', 'Religious'],
  'ericeira': ['Ericeira', 'Surf', 'Beach'],
  'comporta': ['Comporta', 'Beach', 'Nature Reserve'],
  'caparica': ['Costa da Caparica', 'Beach', 'Surf'],
  'carcavelos': ['Carcavelos', 'Beach', 'Surf'],
  'mouraria': ['Mouraria', 'History', 'Cultural'],
  'baixa': ['Baixa', 'Downtown', 'Walking Tour'],
  // ── General ──
  'tour': ['Walking Tour', 'Guided Tour', 'City Tour', 'Day Trip'],
  'walking tour': ['Walking Tour', 'Guided Tour'],
  'day trip': ['Day Trip', 'Full Day'],
  'excursion': ['Day Trip', 'Full Day'],
  'beach': ['Beach', 'Coastal', 'Ocean'],
  'sea': ['Ocean', 'Coastal', 'Marine Life', 'Atlantic'],
  'ocean': ['Ocean', 'Coastal', 'Atlantic', 'Water Sports'],
  'nature': ['Nature', 'Outdoors', 'Scenic', 'Ecological'],
  'outdoor': ['Outdoors', 'Nature', 'Adventure'],
  'outdoors': ['Outdoors', 'Nature', 'Adventure'],
  'dolphin': ['Dolphins', 'Wildlife', 'Marine Biology'],
  'dolphins': ['Dolphins', 'Wildlife', 'Marine Biology'],
  'whale': ['Dolphins', 'Wildlife', 'Ocean'],
  'animal': ['Animals', 'Wildlife', 'Dolphins', 'Birds'],
  'wildlife': ['Wildlife', 'Animals', 'Dolphins', 'Birds', 'Nature'],
  'bird': ['Birdwatching', 'Birds', 'Nature Reserve'],
  'birdwatching': ['Birdwatching', 'Birds', 'Nature Reserve'],
  'balloon': ['Hot Air Balloon', 'Balloon', 'Aerial'],
  'helicopter': ['Helicopter', 'Aerial', 'VIP'],
  'car': ['Vintage Car', 'Electric Car', 'Self-Drive', 'Citroën 2CV'],
  'vintage': ['Vintage Car', 'Citroën 2CV', 'Retro', 'Nostalgic'],
  'aquarium': ['Aquarium', 'Oceanário', 'Marine Life'],
  'oceanário': ['Aquarium', 'Oceanário', 'Marine Life'],
  'oceanario': ['Aquarium', 'Oceanário', 'Marine Life'],
  'dinosaur': ['Dinosaur', 'Jurassic', 'Fossils'],
  'fossil': ['Dinosaur', 'Jurassic', 'Fossils'],
  'spy': ['Spies', 'WWII', 'Espionage', 'Mystery'],
  'spies': ['Spies', 'WWII', 'Espionage'],
  'mystery': ['Mystery', 'Secrets', 'Dark History', 'Storytelling'],
  'dark': ['Dark History', 'Mystery', 'Gothic', 'Secrets'],
  'ghost': ['Dark History', 'Mystery', 'Night Tour'],
  'bridge': ['Ponte 25 de Abril', 'Climbing', 'Panoramic Views'],
  'panoramic': ['Panoramic Views', 'Scenic', 'Viewpoints'],
  'view': ['Panoramic Views', 'Scenic', 'Viewpoints'],
  'viewpoint': ['Panoramic Views', 'Viewpoints', 'Scenic'],
  // ── Portuguese / multi-language keywords ──
  'mergulho': ['Scuba Diving', 'Diving', 'Underwater'],
  'mergulhar': ['Scuba Diving', 'Diving', 'Underwater'],
  'comida': ['Food Tour', 'Tastings', 'Culinary', 'Portuguese Cuisine'],
  'cozinhar': ['Cooking Class', 'Culinary', 'Workshop'],
  'vinho': ['Wine', 'Wine Tour', 'Wine Tasting'],
  'vela': ['Sailing', 'Sailboat'],
  'barco': ['Boat', 'Cruise', 'Sailing'],
  'cavalo': ['Horseback Riding', 'Horse'],
  'bicicleta': ['E-Bike', 'Cycling', 'Electric Bike'],
  'praia': ['Beach', 'Coastal', 'Ocean'],
  'pôr do sol': ['Sunset', 'Golden Hour', 'Romantic'],
  'por do sol': ['Sunset', 'Golden Hour', 'Romantic'],
  'romântico': ['Romantic', 'Couples', 'Intimate'],
  'romantico': ['Romantic', 'Couples', 'Intimate'],
  'aventura': ['Adventure', 'Adrenaline', 'Extreme'],
  'família': ['Family Friendly', 'Kids'],
  'familia': ['Family Friendly', 'Kids'],
  'crianças': ['Family Friendly', 'Kids', 'Fun'],
  'criancas': ['Family Friendly', 'Kids', 'Fun'],
  'chuva': ['Indoor', 'Rainy Day', 'Museum'],
  'relaxar': ['Relaxation', 'Spa', 'Wellness'],
  'golfinhos': ['Dolphins', 'Wildlife', 'Marine Biology'],
  'escalada': ['Rock Climbing', 'Climbing'],
  'caminhada': ['Hiking', 'Walking Tour', 'Outdoors'],
  'gruta': ['Caving', 'Caves', 'Underground'],
  'espeleologia': ['Caving', 'Caves', 'Underground'],
  'parapente': ['Paragliding', 'Flying', 'Aerial'],
  'balão': ['Hot Air Balloon', 'Balloon', 'Aerial'],
  'balao': ['Hot Air Balloon', 'Balloon', 'Aerial'],
  'pesca': ['Fishing', 'Deep Sea', 'Sport Fishing'],
  'fotografia': ['Photography', 'Photowalk', 'Creative'],
  'azulejos': ['Azulejo', 'Tile Painting', 'Workshop'],
  'helicóptero': ['Helicopter', 'Aerial', 'VIP'],
  'helicoptero': ['Helicopter', 'Aerial', 'VIP'],
  'noite': ['Night Tour', 'Evening', 'Night Life'],
  'cultura': ['Cultural', 'History', 'Heritage'],
  'história': ['History', 'Heritage', 'Cultural'],
  'historia': ['History', 'Heritage', 'Cultural'],
};

/**
 * Scores how well an experience matches a user message.
 * Uses keyword→tag mapping + direct text matching.
 * Returns a numeric score (0 = no match).
 */
function scoreExperienceMatch(exp: any, rawMessage: string): number {
  // Normalize: lowercase, remove accents for comparison
  const msg = rawMessage.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
  const tags: string[] = Array.isArray(exp.tags) ? exp.tags : [];
  const tagsLower = tags.map((t: string) => t.toLowerCase());
  const titleLower = (exp.title || '').toLowerCase();
  const descLower = (exp.shortDescription || exp.description || '').toLowerCase();
  const categoryLower = (exp.category || '').toLowerCase();

  let score = 0;

  // 1) Multi-word keywords first (longer matches = more specific)
  const sortedKeywords = Object.keys(KEYWORD_TAG_MAP).sort((a, b) => b.length - a.length);
  const matchedKeywords = new Set<string>();

  for (const keyword of sortedKeywords) {
    const normalizedKeyword = keyword.normalize('NFD').replace(/[\u0300-\u036f]/g, '');
    if (!msg.includes(normalizedKeyword)) continue;

    // Skip single-word if a multi-word containing it already matched
    if (!keyword.includes(' ') && Array.from(matchedKeywords).some(mk => mk.includes(keyword))) continue;
    matchedKeywords.add(keyword);

    const matchTags = KEYWORD_TAG_MAP[keyword];
    for (const matchTag of matchTags) {
      if (tagsLower.includes(matchTag.toLowerCase())) {
        score += 10; // Strong: keyword in message AND tag on experience
      }
    }
    if (titleLower.includes(normalizedKeyword)) score += 5;
    if (descLower.includes(normalizedKeyword)) score += 2;
  }

  // 2) Direct word-to-tag matching (catches terms not in the map)
  const words = msg.split(/\s+/).filter(w => w.length > 3);
  for (const word of words) {
    for (const tag of tagsLower) {
      if (tag === word || tag.includes(word)) {
        score += 3;
      }
    }
    if (titleLower.includes(word) && word.length > 4) score += 2;
  }

  // 3) Category-level bonus
  const categoryMap: Record<string, string[]> = {
    'local cooking': ['food', 'cook', 'eat', 'tasting', 'wine', 'cheese', 'culinary', 'gastronomia', 'comida', 'cozinhar'],
    'micro adventures': ['adventure', 'adrenaline', 'extreme', 'buggy', 'jeep', 'quad', 'aventura'],
    'outdoors': ['outdoor', 'nature', 'hike', 'beach', 'kayak', 'surf', 'sail', 'natureza', 'praia'],
    'culture dive': ['culture', 'history', 'museum', 'art', 'fado', 'tour', 'cultura', 'historia'],
    'sports': ['sport', 'climb', 'dive', 'surf', 'fish', 'desporto'],
    'wellness': ['spa', 'massage', 'relax', 'wellness', 'bem-estar', 'relaxar'],
    'learn & create': ['workshop', 'learn', 'creative', 'photo', 'sketch', 'tile', 'aprender'],
  };
  for (const [cat, keywords] of Object.entries(categoryMap)) {
    if (categoryLower === cat.toLowerCase()) {
      for (const kw of keywords) {
        if (msg.includes(kw)) { score += 5; break; }
      }
    }
  }

  return score;
}

interface ChatSectionProps {
  onExperienceClick?: (experience: ExperienceDisplay) => void;
  userId?: string; // User identifier for memories
  isMobileFullScreen?: boolean; // Mobile full-screen mode
  onCloseMobileChat?: () => void; // Close mobile chat
}

export const ChatSection: React.FC<ChatSectionProps> = ({ 
  onExperienceClick,
  userId = 'guest-session', // Default session ID
  isMobileFullScreen = false,
  onCloseMobileChat
}) => {
  const [messages, setMessages] = useState<Message[]>([]);
  const [input, setInput] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [experiences, setExperiences] = useState<any[]>([]);
  const [selectedFreeSpot, setSelectedFreeSpot] = useState<FreeSpot | null>(null);
  const [enrichedSpots, setEnrichedSpots] = useState<Map<number, FreeSpot>>(new Map());
  const [weatherData, setWeatherData] = useState<WeatherData | null>(null);
  const [todayEvents, setTodayEvents] = useState<EventData[]>([]);
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const hotel = useHotel();
  
  // Memory hook
  const { memory, updateMemory } = useUserMemories(userId);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  // Fetch weather data for Lisbon
  useEffect(() => {
    async function fetchWeather() {
      try {
        // Using Open-Meteo API (100% free, no API key needed!)
        // Lisbon coordinates: 38.7223° N, 9.1393° W
        const response = await fetch(
          'https://api.open-meteo.com/v1/forecast?latitude=38.7223&longitude=-9.1393&current=temperature_2m,precipitation,weathercode,windspeed_10m&timezone=Europe/Lisbon'
        );
        
        if (response.ok) {
          const data = await response.json();
          const current = data.current;
          
          // Map WMO weather codes to conditions
          const getCondition = (code: number) => {
            if (code === 0) return { main: 'Clear', description: 'clear sky' };
            if (code <= 3) return { main: 'Clouds', description: 'partly cloudy' };
            if (code <= 49) return { main: 'Fog', description: 'foggy' };
            if (code <= 69) return { main: 'Rain', description: 'rainy' };
            if (code <= 79) return { main: 'Snow', description: 'snowy' };
            if (code <= 99) return { main: 'Thunderstorm', description: 'thunderstorm' };
            return { main: 'Clear', description: 'clear' };
          };
          
          const condition = getCondition(current.weathercode);
          
          setWeatherData({
            temperature: Math.round(current.temperature_2m),
            condition: condition.main,
            description: condition.description,
            humidity: 65, // Open-Meteo free tier doesn't include humidity in basic plan
            windSpeed: current.windspeed_10m,
            precipitation: current.precipitation
          });
        }
      } catch (error) {
        console.error('Error fetching weather:', error);
        // Set default sunny weather for Lisbon
        setWeatherData({
          temperature: 18,
          condition: 'Clear',
          description: 'sunny',
          humidity: 65,
          windSpeed: 3.5,
          precipitation: 0
        });
      }
    }

    fetchWeather();
    // Refresh weather every 30 minutes
    const interval = setInterval(fetchWeather, 30 * 60 * 1000);
    return () => clearInterval(interval);
  }, []);

  // Fetch events data from Agenda LX and Gulbenkian
  useEffect(() => {
    async function fetchEvents() {
      try {
        // Fetch from both sources in parallel
        const [agendaLXResponse, gulbenkianResponse] = await Promise.all([
          fetch('https://www.agendalx.pt/wp-json/agendalx/v1/events', {
            headers: { 'User-Agent': 'BoredTourist/1.0' },
          }),
          fetch('https://gulbenkian.pt/wp-json/wp/v2/events?per_page=50', {
            headers: { 'User-Agent': 'BoredTourist/1.0' },
          })
        ]);
        
        const today = new Date();
        today.setHours(0, 0, 0, 0);
        const allEvents: EventData[] = [];
        
        // Process Agenda LX events
        if (agendaLXResponse.ok) {
          const agendaData = await agendaLXResponse.json();
          const agendaEvents = agendaData
            .filter((event: any) => {
              if (!event.StartDate) return false;
              const eventDate = new Date(event.StartDate);
              const diffDays = Math.floor((eventDate.getTime() - today.getTime()) / (1000 * 60 * 60 * 24));
              return diffDays >= 0 && diffDays <= 30; // Extended to 30 days
            })
            .slice(0, 10)
            .map((event: any, index: number) => {
              const venueName = event.venue 
                ? Object.values(event.venue)[0] as { name: string }
                : null;
              
              const categoryName = event.categories_name_list
                ? Object.values(event.categories_name_list)[0] as { name: string }
                : null;

              return {
                id: `agenda-${event.id || index}`,
                name: event.title?.rendered || 'Event',
                date: event.string_dates || event.StartDate,
                venue: venueName?.name || 'Lisboa',
                category: categoryName?.name || 'cultura',
                imageUrl: event.featured_media_large || 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=800',
                link: event.link || '#',
                description: event.subtitle || '',
              };
            });
          allEvents.push(...agendaEvents);
        }

        // Process Gulbenkian events
        if (gulbenkianResponse.ok) {
          const gulbenkianData = await gulbenkianResponse.json();
          
          // Get featured media URLs for images
          const eventsWithImages = await Promise.all(
            gulbenkianData.map(async (event: any) => {
              let imageUrl = 'https://images.unsplash.com/photo-1580974928064-f0aeef70895a?w=800';
              
              // Try to fetch featured media
              if (event.featured_media && event.featured_media !== 0) {
                try {
                  const mediaResponse = await fetch(
                    `https://gulbenkian.pt/wp-json/wp/v2/media/${event.featured_media}`,
                    { headers: { 'User-Agent': 'BoredTourist/1.0' } }
                  );
                  if (mediaResponse.ok) {
                    const mediaData = await mediaResponse.json();
                    imageUrl = mediaData.source_url || imageUrl;
                  }
                } catch (err) {
                  console.log('Failed to fetch Gulbenkian media:', err);
                }
              }
              
              return { ...event, imageUrl };
            })
          );
          
          // Process each event and check ALL sessions, not just the first one
          const expandedEvents: any[] = [];
          eventsWithImages.forEach((event: any) => {
            if (!event.acf?.sessions || event.acf.sessions.length === 0) return;
            
            // Check each session of this event
            event.acf.sessions.forEach((session: any) => {
              if (!session.start_date) return;
              const sessionDate = new Date(session.start_date);
              const diffDays = Math.floor((sessionDate.getTime() - today.getTime()) / (1000 * 60 * 60 * 24));
              
              // Include if session is within next 30 days
              if (diffDays >= 0 && diffDays <= 30) {
                expandedEvents.push({
                  ...event,
                  selectedSession: session,
                  sessionDate: sessionDate
                });
              }
            });
          });
          
          // Sort by date (closest first) and take top 10
          const gulbenkianEvents = expandedEvents
            .sort((a, b) => a.sessionDate.getTime() - b.sessionDate.getTime())
            .slice(0, 10)
            .map((event: any, index: number) => {
              const sessionDate = event.sessionDate;
              const formattedDate = sessionDate.toLocaleDateString('pt-PT', {
                day: 'numeric',
                month: 'long',
                hour: '2-digit',
                minute: '2-digit'
              });

              // Get category name
              let category = 'Cultura';
              if (event['fcg-agenda_template']?.includes(31607)) category = 'Música';
              else if (event['fcg-agenda_template']?.includes(9466)) category = 'Exposição';
              else if (event['fcg-agenda_template']?.includes(9468)) category = 'Conferência';
              else if (event['fcg-agenda_template']?.includes(31507)) category = 'Atividade';

              return {
                id: `gulbenkian-${event.id}-${event.selectedSession.uuid || index}`,
                name: event.title?.rendered || 'Event',
                date: formattedDate,
                venue: 'Fundação Gulbenkian',
                category: category,
                imageUrl: event.imageUrl,
                link: event.link || '#',
                description: event.acf?.lead || event.acf?.subtitle || '',
              };
            });
          allEvents.push(...gulbenkianEvents);
        }
        
        // Sort by date and limit to 20 total events
        setTodayEvents(allEvents.slice(0, 20));
        
      } catch (error) {
        console.error('Error fetching events:', error);
        // Fallback to mock events if API fails
        setTodayEvents([
          {
            name: "Fado Night at Alfama",
            date: new Date().toLocaleDateString('pt-PT'),
            venue: "Casa de Linhares",
            category: "Music"
          }
        ]);
      }
    }

    fetchEvents();
    // Refresh events every 6 hours
    const interval = setInterval(fetchEvents, 6 * 60 * 60 * 1000);
    return () => clearInterval(interval);
  }, []);

  // Enrich free spots with Google Places data
  useEffect(() => {
    async function enrichSpotsWithGoogleData() {
      for (const spot of FREE_SPOTS) {
        if (!enrichedSpots.has(spot.id)) {
          let placeDetails = null;
          
          // If placeId exists, use it directly
          if (spot.placeId) {
            placeDetails = await getCachedPlaceDetails(spot.placeId);
          } 
          // Otherwise, search by name automatically
          else if (!spot.gps) { // Only search if it's not a hiking trail (trails don't have Google Places)
            placeDetails = await searchPlaceByName(spot.title, 'Lisbon, Portugal');
          }
          
          if (placeDetails) {
            const enrichedSpot: FreeSpot = {
              ...spot,
              title: placeDetails.name || spot.title,
              rating: placeDetails.rating || spot.rating,
              location: placeDetails.formatted_address || spot.location,
              imageUrl: placeDetails.photos && placeDetails.photos[0] 
                ? getPhotoUrl(placeDetails.photos[0].photo_reference, 800)
                : spot.imageUrl,
              gps: spot.gps || `${placeDetails.geometry.location.lat}° N, ${Math.abs(placeDetails.geometry.location.lng)}° ${placeDetails.geometry.location.lng < 0 ? 'W' : 'E'}`
            };
            setEnrichedSpots(prev => new Map(prev).set(spot.id, enrichedSpot));
          } else {
            // Keep original data if no Google Place found
            setEnrichedSpots(prev => new Map(prev).set(spot.id, spot));
          }
        }
      }
    }
    enrichSpotsWithGoogleData();
  }, []);

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  useEffect(() => {
    async function fetchExperiences() {
      const { data } = await supabase
        .from('experiences')
        .select('*')
        .eq('is_active', true);
      
      const mappedData = (data || []).map(exp => ({
        id: exp.id,
        title: exp.title,
        description: exp.description,
        shortDescription: exp.short_description,
        category: exp.category,
        price: exp.price,
        currency: exp.currency || '€',
        duration: exp.duration,
        location: exp.location,
        address: exp.address,
        rating: exp.rating,
        reviews: exp.review_count || 0,
        maxGroupSize: exp.max_group_size,
        highlights: exp.highlights || [],
        whatsIncluded: exp.included || [],
        languages: exp.languages || [],
        importantInfo: exp.important_info,
        cancellationPolicy: exp.cancellation_policy,
        videoUrl: exp.video_url,
        imageUrl: exp.images && exp.images.length > 0 ? exp.images[0] : null,
        thumbnail: exp.images && exp.images.length > 0 ? exp.images[0] : null,
        images: exp.images || [],
        tags: exp.tags || [],
        affiliateUrl: exp.affiliate_url,
        affiliateProvider: exp.affiliate_provider,
        userReviews: exp.user_reviews || [],
        reviewCount: exp.review_count,
        latitude: exp.latitude,
        longitude: exp.longitude
      }));
      
      setExperiences(mappedData);
    }
    fetchExperiences();
  }, []);

  // Function to extract memories from conversation
  const extractAndSaveMemories = async (conversationHistory: Message[], openai: OpenAI) => {
    try {
      const conversationText = conversationHistory
        .map(m => `${m.role}: ${m.text}`)
        .join('\n');

      const memoryExtractionPrompt = `Analyze this conversation and extract meaningful insights about the guest. Write memories as natural, conversational observations - not dry facts.

CONVERSATION:
${conversationText}

GOOD MEMORIES (conversational, contextual):
✅ "Loves discovering hidden cocktail bars off the beaten path"
✅ "Traveling with girlfriend - seeking romantic experiences for special occasions"
✅ "Prefers intimate venues over crowded tourist spots"
✅ "Mentioned wanting to try local Portuguese wines"

BAD MEMORIES (too factual, data-like):
❌ "Name: John"
❌ "In a relationship"
❌ "Interested in: bars, wine"

Extract and respond ONLY with JSON:
{
  "name": "Guest name or null",
  "relationshipStatus": "Natural description of who they're with (e.g., 'Traveling with girlfriend', 'Family of 4 with young kids')",
  "interests": ["specific interest 1", "specific interest 2", "interest 3"],
  "summary": "2-3 sentences describing the person's travel style, what they're seeking, and their vibe",
  "newMemories": [
    "Conversational observation about preference or context",
    "Natural sentence about what they mentioned wanting",
    "Contextual note about their travel style or interests"
  ]
}

Keep it human, conversational, and insightful - not a database dump.`;

      const response = await openai.chat.completions.create({
        model: 'gpt-4o-mini',
        messages: [
          { role: 'system', content: 'You are an expert concierge who remembers meaningful details about guests. Write observations as natural, conversational memories - like notes a thoughtful host would make. Always respond with valid JSON only.' },
          { role: 'user', content: memoryExtractionPrompt }
        ],
        temperature: 0.7,
        max_tokens: 600
      });

      const extractedData = response.choices[0]?.message?.content;
      if (!extractedData) return;

      // Parse JSON response
      const parsed = JSON.parse(extractedData);
      
      // Merge with existing memories
      const existingMemories = memory?.memories || [];
      const allMemories = [...existingMemories];
      
      // Add new memories if they don't already exist
      if (parsed.newMemories && Array.isArray(parsed.newMemories)) {
        parsed.newMemories.forEach((newMem: string) => {
          if (!allMemories.some(m => m.toLowerCase().includes(newMem.toLowerCase()))) {
            allMemories.push(newMem);
          }
        });
      }

      // Merge interests
      const existingInterests = memory?.interests || [];
      const allInterests = [...new Set([...existingInterests, ...(parsed.interests || [])])];

      // Update memory
      await updateMemory({
        name: parsed.name || memory?.name,
        relationshipStatus: parsed.relationshipStatus || memory?.relationshipStatus,
        interests: allInterests,
        summary: parsed.summary || memory?.summary,
        memories: allMemories,
        conversationCount: (memory?.conversationCount || 0) + 1
      });

      console.log('✅ Memories updated:', parsed);
    } catch (error) {
      console.error('Error extracting memories:', error);
    }
  };

  const handleSend = async () => {
    if (!input.trim() || isLoading) return;

    const userMessage: Message = { 
      id: Date.now().toString(), 
      role: 'user', 
      text: input 
    };
    
    setMessages(prev => [...prev, userMessage]);
    setInput('');
    setIsLoading(true);

    try {
      const apiKey = (import.meta.env.VITE_OPENAI_API_KEY || '').replace(/\s/g, '');
      if (!apiKey || apiKey === 'sk-proj-your-key-here') {
        throw new Error('OpenAI API key not configured');
      }
      const openai = new OpenAI({
        apiKey,
        dangerouslyAllowBrowser: true
      });
      
      // ── Smart Pre-Filtering: score & rank experiences against user message ──
      const allUserMessages = [...messages.filter(m => m.role === 'user').map(m => m.text), userMessage.text].join(' ');
      const scored = experiences.map(exp => ({
        ...exp,
        _score: scoreExperienceMatch(exp, allUserMessages)
      }));
      const topMatches = scored
        .filter(e => e._score > 0)
        .sort((a, b) => b._score - a._score)
        .slice(0, 15);
      const rest = scored.filter(e => !topMatches.includes(e));

      // Top matches: full detail so the LLM has everything it needs
      const topMatchesContext = topMatches.length > 0
        ? topMatches.map(exp => {
            const tags = Array.isArray(exp.tags) ? exp.tags.join(', ') : '';
            const desc = exp.shortDescription || exp.description || '';
            return `⭐ [${exp.id}] ${exp.title} (${exp.category}) — €${exp.price}, ${exp.duration}, ${exp.location}\n   Tags: [${tags}]\n   ${desc}`;
          }).join('\n\n')
        : '';

      // Rest: ultra-compact (id + title + category only) to save tokens
      const restContext = rest.map(exp => {
        const tags = Array.isArray(exp.tags) ? exp.tags.slice(0, 4).join(', ') : '';
        return `[${exp.id}] ${exp.title} (${exp.category}) €${exp.price} [${tags}]`;
      }).join('\n');

      // Build the two-tier catalog
      const experiencesContext = topMatches.length > 0
        ? `🎯 TOP MATCHES (most relevant to this guest — prioritize these!):\n${topMatchesContext}\n\n📋 OTHER EXPERIENCES (use ID to recommend):\n${restContext}`
        : experiences.map(exp => {
            const tags = Array.isArray(exp.tags) ? exp.tags.slice(0, 5).join(', ') : '';
            return `[${exp.id}] ${exp.title} (${exp.category}) €${exp.price}, ${exp.duration}. [${tags}]`;
          }).join('\n');
      
      const freeSpotsContext = FREE_SPOTS.map(spot =>
        `[F${spot.id}] **${spot.title}** (${spot.category}) - FREE, ${spot.location}. ${spot.description}`
      ).join('\n');

      // Current context for dynamic recommendations
      const now = new Date();
      const timeOfDay = now.getHours();
      const dayOfWeek = now.toLocaleDateString('pt-PT', { weekday: 'long' });
      const currentTime = now.toLocaleTimeString('pt-PT', { hour: '2-digit', minute: '2-digit' });
      
      const weatherContext = weatherData 
        ? `Weather: ${weatherData.temperature}°C, ${weatherData.description} (${weatherData.condition})${weatherData.precipitation > 0 ? ` - ${weatherData.precipitation}mm rain` : ' - No rain'}`
        : 'Weather: Pleasant sunny day';
      
      const eventsContext = todayEvents.length > 0
        ? `Upcoming Events in Lisbon (next 7 days):\n${todayEvents.map(e => `- ${e.name} on ${e.date} at ${e.venue}`).join('\n')}`
        : 'No major events scheduled this week';
      
      const timeContext = timeOfDay < 12 
        ? '🌅 Morning - Great time for breakfast spots, early tours, and outdoor activities'
        : timeOfDay < 17 
        ? '☀️ Afternoon - Perfect for sightseeing, museums, and lunch experiences'
        : timeOfDay < 21
        ? '🌇 Evening - Ideal for sunset views, dinner experiences, and nightlife prep'
        : '🌙 Night - Time for bars, restaurants, and evening entertainment';

      const contextualInfo = `
═══════════════════════════════════════
📍 CURRENT CONTEXT (Use this to personalize recommendations!)
═══════════════════════════════════════
⏰ Time: ${currentTime} (${dayOfWeek})
${timeContext}

🌤️ ${weatherContext}
${weatherData?.condition === 'Rain' || (weatherData?.precipitation && weatherData.precipitation > 0) ? '☔ RAINY/WET → Suggest indoor activities (museums, food halls, wine tasting)!' : ''}
${weatherData?.condition === 'Clear' && weatherData?.temperature > 25 ? '🌡️ HOT DAY → Suggest water activities, beaches, or shaded gardens!' : ''}
${weatherData?.precipitation && weatherData.precipitation > 2 ? '⚠️ HEAVY RAIN → Only recommend fully indoor experiences!' : ''}

🎭 ${eventsContext}

💡 ADJUST YOUR RECOMMENDATIONS:
- Bad weather? → Push indoor experiences and cozy restaurants
- Morning? → Breakfast spots, early tours, hiking
- Afternoon? → Museums, tours, lunch spots
- Evening? → Sunset viewpoints, dinner, pre-nightlife
- Events nearby? → Suggest dinner/drinks near event venues
`;

      const zoneContext = `
═══════════════════════════════════════
📋 COMPLETE EXPERIENCE CATALOG (search by tags & description to match guest requests)
═══════════════════════════════════════
${experiencesContext}

═══════════════════════════════════════
🆓 FREE SPOTS & LOCAL TIPS
═══════════════════════════════════════
${freeSpotsContext}`;

      // ── Build dynamic system prompt from hotel bot config ──
      const bot = hotel.botConfig || {} as Partial<import('../lib/hotelConfig').BotConfig>;
      const botName = bot.botName || 'Concierge';
      const personality = bot.personality || 'friendly';
      const salesMode = bot.salesAggressiveness || 'balanced';
      const responseLen = bot.maxResponseLength || 'medium';
      const langInstr = !bot.language || bot.language === 'auto'
        ? `LANGUAGE RULES (CRITICAL):
- Always detect and respond in the same language the guest uses.
- If the guest writes in Portuguese, ALWAYS respond in European Portuguese (PT-PT), NEVER in Brazilian Portuguese (PT-BR).
- Use Portuguese from Portugal vocabulary and expressions: "telemóvel" (not "celular"), "autocarro" (not "ônibus"), "pequeno-almoço" (not "café da manhã"), "fixe" (not "legal"), "giro" (not "bonito"), "ecrã" (not "tela").
- Use "tu" form (informal) by default, not "você".
- Spelling must follow PT-PT rules: "facto" (not "fato"), "contacto" (not "contato"), "ótimo" not "ótimo" with BR pronunciation hints.
- If the guest writes in English, respond in English. If in Spanish, respond in Spanish. Etc.`
        : `Always respond in ${{pt:'European Portuguese (PT-PT, never Brazilian Portuguese)',en:'English',es:'Spanish',fr:'French',de:'German',it:'Italian'}[bot.language] || 'English'}.`;

      const personalityTraits: Record<string, string> = {
        premium: 'sophisticated, elegant, and refined — like a luxury hotel concierge at a 5-star property',
        casual: 'relaxed, fun, and approachable — like a cool local friend showing you around',
        friendly: 'warm, welcoming, and enthusiastic — genuinely happy to help every guest',
        professional: 'efficient, knowledgeable, and polished — focused on delivering excellent service',
        adventurous: 'energetic, passionate about exploration — always excited to suggest the next adventure',
      };
      const personalityDesc = bot.toneDescription || personalityTraits[personality] || personalityTraits.friendly;

      const salesInstr: Record<string, string> = {
        soft: 'Only suggest paid experiences when the guest specifically asks for recommendations. Focus on being helpful first.',
        balanced: 'Naturally weave experience recommendations into conversation when relevant. Be helpful but also guide toward bookings.',
        aggressive: 'Proactively recommend paid experiences at every opportunity. Create urgency and FOMO. Your goal is to maximize bookings.',
      };

      const lengthInstr: Record<string, string> = {
        short: 'Keep responses very brief — 1-2 sentences max. Be concise and direct.',
        medium: 'Keep responses moderate — 2-4 sentences. Conversational but focused.',
        long: 'Give detailed, thorough responses with full explanations when helpful.',
      };

      // Build knowledge base context
      const knowledgeCtx = (bot.knowledgeEntries || []).length > 0
        ? '\n\n═══ HOTEL KNOWLEDGE BASE ═══\n' + (bot.knowledgeEntries || []).map(
            (e: any) => `[${e.type?.toUpperCase() || 'INFO'}] ${e.title}:\n${e.content}`
          ).join('\n\n') + '\n═══ END KNOWLEDGE BASE ═══\nUse this knowledge to answer guest questions accurately. If a guest asks about something covered here, ALWAYS use this information.'
        : '';

      // Build restrictions
      const restrictionsCtx = (bot.restrictions || []).filter((r: string) => r.trim()).length > 0
        ? '\n\n🚫 RESTRICTIONS — NEVER do these:\n' + (bot.restrictions || []).filter((r: string) => r.trim()).map((r: string) => '- ' + r).join('\n')
        : '';

      // Custom instructions
      const customInstr = bot.customInstructions
        ? '\n\n📋 CUSTOM INSTRUCTIONS FROM HOTEL:\n' + bot.customInstructions
        : '';

      const systemPrompt = `You are ${botName}, the AI concierge at ${hotel.name} hotel. Your personality: ${personalityDesc}.

${langInstr}

HOTEL INFO:
- Name: ${hotel.name}
- Location: ${hotel.location}
- Tagline: ${hotel.tagline}

${contextualInfo}

${zoneContext}

${salesInstr[salesMode] || salesInstr.balanced}
${lengthInstr[responseLen] || lengthInstr.medium}
${customInstr}
${restrictionsCtx}
${knowledgeCtx}

🎯 CONVERSATION FLOW:

STEP 1 - DISCOVERY (First 1-2 messages):
Ask questions to understand what the guest wants:
- "What brings you to ${hotel.location} - adventure, culture, food, or relaxation?"
- "Who are you traveling with?"
- "What type of experiences excite you most?"

NEVER recommend anything until you know their interests!

STEP 2 - RECOMMEND PAID EXPERIENCES WITH VISUAL CARDS:
Once you know what they want, recommend matching PAID EXPERIENCES.

🚨 FORMAT for paid experiences (shows beautiful visual cards):

"Perfect for [their interest]! Check these out:

EXPERIENCE_IDS: [5, 12, 23]

Which one catches your eye?"

STEP 3 - FREE ALTERNATIVES (Only if asked or budget-conscious):
If the guest prefers free options:

"Here's an amazing free alternative:

FREE_SPOT_IDS: [F13]

Want more free options?"

STEP 4 - EVENTS (When asked about events/shows/concerts):
"Here are some events happening:

EVENT_IDS: [agenda-197328]

Which sounds interesting?"

🚨 CRITICAL MATCHING RULES — YOU MUST FOLLOW THESE PERFECTLY:

📌 RULE 1 — ALWAYS USE THE ⭐ TOP MATCHES SECTION FIRST:
The catalog has a "🎯 TOP MATCHES" section pre-filtered for this guest. ALWAYS check there first and prioritize those experiences. They are the most relevant to what the guest is asking.

📌 RULE 2 — MATCH BY TAGS, NEVER BY VIBES:
When a guest asks for a specific activity, find experiences whose TAGS contain matching keywords:
   - "diving" / "scuba" / "mergulho" → Tags: Scuba Diving, Diving, Underwater, First Dive
   - "surf" / "surfing" → Tags: Surf, Surfing, Waves, Water Sports, Surf School
   - "kayak" / "canoeing" → Tags: Kayak, Water Sports, Coastal
   - "snorkel" → Tags: Snorkeling, Marine Life, Sea Caves
   - "cooking" / "cook" / "cozinhar" → Tags: Cooking Class, Culinary, Workshop, Hands-On
   - "food" / "eat" / "tasting" / "comida" → Tags: Food Tour, Tastings, Culinary, Foodie
   - "wine" / "vinho" → Tags: Wine, Wine Tour, Wine Tasting, Winery
   - "pastel de nata" / "pasteis" → Tags: Pastel de Nata, Baking, Portuguese Pastry
   - "fado" / "music" → Tags: Fado, Live Music, Portuguese Music
   - "spa" / "massage" / "wellness" → Tags: Spa, Massage, Wellness, Relaxation
   - "adventure" / "aventura" / "adrenaline" → Tags: Adventure, Adrenaline, Off-Road, Extreme
   - "romantic" / "couples" / "romântico" → Tags: Romantic, Couples, Sunset, Intimate
   - "paragliding" / "parapente" → Tags: Paragliding, Flying, Aerial, Tandem
   - "climbing" / "escalada" → Tags: Rock Climbing, Climbing, Coastal Cliffs
   - "fishing" / "pesca" → Tags: Fishing, Deep Sea, Sport Fishing
   - "horse" / "horseback" / "cavalo" → Tags: Horseback Riding, Horse
   - "bike" / "cycling" / "bicicleta" → Tags: E-Bike, Electric Bike, Cycling
   - "jeep" / "4x4" / "safari" → Tags: Jeep, 4x4, Off-Road, Safari
   - "buggy" → Tags: Buggy, Off-Road
   - "quad" / "atv" → Tags: Quad, ATV, Off-Road
   - "balloon" / "balão" → Tags: Hot Air Balloon, Balloon, Aerial
   - "helicopter" / "helicóptero" → Tags: Helicopter, Aerial, VIP
   - "skydiving" → Tags: Indoor Skydiving, Wind Tunnel
   - "hike" / "hiking" / "caminhada" → Tags: Hiking, Nature, Coastal
   - "cave" / "caving" / "gruta" → Tags: Caving, Caves, Underground
   - "escape room" / "escape game" → Tags: Escape Room, Escape Game, Puzzle
   - "tile" / "azulejo" → Tags: Azulejo, Tile Painting, Workshop
   - "art" / "street art" → Tags: Street Art, Art, Urban Art, Murals
   - "photography" / "photo" / "fotografia" → Tags: Photography, Photowalk
   - "sketch" / "drawing" → Tags: Sketching, Drawing, Art
   - "dolphin" / "golfinhos" → Tags: Dolphins, Wildlife, Marine Biology
   - "bird" / "birdwatching" → Tags: Birdwatching, Birds, Nature Reserve
   - "aquarium" / "oceanário" → Tags: Aquarium, Oceanário, Marine Life
   - "sunset" / "pôr do sol" → Tags: Sunset, Golden Hour, Romantic
   - "family" / "kids" / "children" / "família" → Tags: Family Friendly, Kids, Educational
   - "rain" / "indoor" / "chuva" → Tags: Indoor, Rainy Day, Museum, Workshop
   - "night" / "evening" / "noite" → Tags: Night Tour, Evening, Night Life
   - "dinner" / "restaurant" → Tags: Dinner, Restaurant, Dining
   - "cabaret" / "show" → Tags: Cabaret, Show, Night Life
   - "history" / "museum" / "história" → Tags: History, Heritage, Cultural, Museum
   - "theatre" / "theater" → Tags: Theatre, Immersive, Performance
   - "luxury" / "vip" → Tags: Luxury, VIP, Private
   - "free tour" → Tags: Free Tour

📌 RULE 3 — PRECISION OVER RECALL:
NEVER recommend an experience that doesn't genuinely match. Mistakes to avoid:
   ❌ Caving is NOT diving/scuba. ❌ Hiking is NOT surfing. ❌ A food tour is NOT a cooking class.
   ❌ A sunset cruise is NOT a sailing lesson. ❌ An escape game is NOT an outdoor adventure.
   ✅ Only recommend experiences whose tags ACTUALLY contain the relevant keywords.

📌 RULE 4 — SINTRA & CASCAIS & DAY TRIPS:
When someone asks about Sintra or Cascais, show ALL relevant experiences (day trips, jeep tours, e-bike tours, etc.) — don't just show one.

📌 RULE 5 — MULTIPLE MATCHES = SHOW VARIETY:
When several experiences match, show 2-4 options from different price ranges or styles. Let the guest choose.

📌 RULE 6 — HONEST WHEN NO MATCH:
If NO experience in the catalog matches, be honest: "We don't have that exact experience yet, but here are some similar options..." Never force a bad match.

📌 RULE 7 — CONVERSATION FLOW:
- NEVER recommend in the first message — ask questions first (unless they directly ask for a specific activity)
- When they ask for something specific ("I want to surf"), skip discovery and go straight to matching
- ALWAYS end with a question to keep the conversation flowing

📌 RULE 8 — FORMAT:
- Use EXPERIENCE_IDS for paid experiences, FREE_SPOT_IDS for free spots, EVENT_IDS for events
- Let visual cards show photos/details — keep your text SHORT and personal
- Write COMPLETE, COHESIVE sentences — never break text awkwardly
- When asked about events, use EVENT_IDS — never say you can't access event data

📌 RULE 9 — LANGUAGE MATCHING:
The guest may write in Portuguese, English, Spanish, French, etc. ALWAYS understand the intent regardless of language and match to the right experiences. "Quero mergulhar" = diving. "Quero ir à praia" = beach activities.

AVAILABLE EVENTS (${todayEvents.length}):
${todayEvents.length > 0 ? todayEvents.map((e: any) => '[' + e.id + '] ' + e.name + ' - ' + e.date + ' at ' + e.venue).join('\n') : 'No events currently loaded'}

Remember: Use IDs and let the visual cards do the work!`;

      const response = await openai.chat.completions.create({
        model: 'gpt-4o',
        messages: [
          { role: 'system', content: systemPrompt },
          ...messages.map(m => ({ role: m.role, content: m.text })),
          { role: 'user', content: userMessage.text }
        ],
        temperature: 0.3,
        max_tokens: 700
      });

      const aiText = response.choices[0]?.message?.content || "I'm having a moment - mind trying that again?";
      
      // Extract paid experience IDs
      const expIdsMatch = aiText.match(/EXPERIENCE_IDS:\s*\[([\d,\s]+)\]/);
      const experienceIds = expIdsMatch 
        ? expIdsMatch[1].split(',').map(id => parseInt(id.trim())).filter(id => !isNaN(id))
        : [];
      
      // Extract free spot IDs
      const freeIdsMatch = aiText.match(/FREE_SPOT_IDS:\s*\[([F\d,\s]+)\]/);
      const freeSpotIds = freeIdsMatch
        ? freeIdsMatch[1].split(',').map(id => {
            const num = parseInt(id.trim().replace('F', ''));
            return isNaN(num) ? null : num;
          }).filter(id => id !== null) as number[]
        : [];
      
      // Extract event IDs  
      const eventIdsMatch = aiText.match(/EVENT_IDS:\s*\[([a-zA-Z0-9\-,\s]+)\]/);
      const eventIds = eventIdsMatch
        ? eventIdsMatch[1].split(',').map(id => id.trim()).filter(id => id.length > 0)
        : [];
      
      // Clean text removing all ID markers
      const cleanText = aiText
        .replace(/EXPERIENCE_IDS:\s*\[[^\]]+\]/g, '')
        .replace(/FREE_SPOT_IDS:\s*\[[^\]]+\]/g, '')
        .replace(/EVENT_IDS:\s*\[[^\]]+\]/g, '')
        .trim();

      setMessages(prev => [...prev, { 
        id: (Date.now() + 1).toString(), 
        role: 'assistant', 
        text: cleanText,
        experienceIds: experienceIds.length > 0 ? experienceIds : undefined,
        freeSpotIds: freeSpotIds.length > 0 ? freeSpotIds : undefined,
        eventIds: eventIds.length > 0 ? eventIds : undefined
      }]);
      
      // Extract memories after every 2-3 conversations
      const newConversationCount = (memory?.conversationCount || 0) + 1;
      if (newConversationCount % 2 === 0) {
        try {
          await extractAndSaveMemories([...messages, userMessage, { 
            id: (Date.now() + 1).toString(), 
            role: 'assistant', 
            text: cleanText 
          }], openai);
        } catch (memErr) {
          console.warn('[Memories] extraction failed silently:', memErr);
        }
      } else {
        // Just update conversation count
        await updateMemory({ 
          conversationCount: newConversationCount 
        });
      }
      
    } catch (error: any) {
      console.error("Chat error:", error);
      console.error("Error details:", {
        message: error?.message,
        status: error?.status,
        code: error?.code,
        type: error?.type
      });
      let errorMsg: string;
      if (error?.message === 'OpenAI API key not configured') {
        errorMsg = "⚠️ The AI concierge isn't configured yet. Please set up the OpenAI API key.";
      } else if (error?.status === 401 || error?.code === 'invalid_api_key') {
        errorMsg = "⚠️ There's an issue with the AI configuration. Please check the API key.";
      } else if (error?.status === 429) {
        errorMsg = "I'm getting too many requests right now. Give me a moment and try again!";
      } else if (error?.code === 'context_length_exceeded' || error?.message?.includes('maximum context')) {
        errorMsg = "I'm trying to process too much information. Let me simplify — what are you looking for?";
      } else {
        errorMsg = "Oops, lost my train of thought. Can you try that again?";
      }
      setMessages(prev => [...prev, { 
        id: (Date.now() + 1).toString(), 
        role: 'assistant', 
        text: errorMsg 
      }]);
    } finally {
      setIsLoading(false);
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  };

  const handleReset = () => {
    setMessages([]);
    setInput('');
  };

  return (
    <div className="flex flex-col h-full relative bg-white">
      {/* Mobile Full Screen Header with Back Button */}
      {isMobileFullScreen && (
        <div className="sticky top-0 z-10 backdrop-blur-md border-b border-slate-200/40 px-4 py-3 flex items-center gap-3" style={{ backgroundColor: "color-mix(in srgb, var(--hotel-surface, #FAFAF8) 95%, transparent)" }}>
          <button
            onClick={onCloseMobileChat}
            className="p-2 -ml-1 hover:bg-white/60 rounded-full transition-colors"
          >
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M19 12H5M12 19l-7-7 7-7"/>
            </svg>
          </button>
          <div className="flex items-center gap-3">
            <img 
              src={hotel?.conciergeAvatarUrl || 'https://storage.googleapis.com/bored_tourist_media/images/hotel.webp'} 
              alt={hotel?.name || 'Concierge'}
              className="w-9 h-9 rounded-full object-cover border border-slate-200/60"
            />
            <div>
              <div className="text-sm font-medium text-slate-900">
                {hotel?.name || 'Concierge'}
              </div>
              <div className="text-[11px] text-slate-500 font-light tracking-wide">AI Concierge</div>
            </div>
          </div>
        </div>
      )}



      {/* Messages Area - Show on mobile full screen or desktop */}
      <div className={`flex-1 overflow-y-auto px-3 md:px-6 md:px-10 py-2 md:py-4 no-scrollbar ${isMobileFullScreen ? 'block' : 'hidden md:block'}`}>
        {messages.length === 0 ? (
          <div className="h-full flex flex-col justify-center items-center text-center space-y-6">
            <div className="w-32 h-32 rounded-2xl flex items-center justify-center mb-4 overflow-hidden bg-white border border-slate-200/60 shadow-sm">
              <img 
                src={hotel?.conciergeAvatarUrl || 'https://storage.googleapis.com/bored_tourist_media/images/hotel.webp'} 
                alt={hotel?.name || 'Concierge'}
                className="w-full h-full object-cover"
              />
            </div>
            <h1 className="text-3xl md:text-4xl text-slate-900 font-light tracking-tight leading-tight">
              {hotel.welcomeTitle || 'Welcome to'} <br/>
              <span className="font-serif italic">{hotel.welcomeSubtitle || hotel.name}</span>
            </h1>
            <p className="text-slate-600 font-light max-w-md text-base leading-relaxed">
              {hotel.welcomeDescription || "I'm your digital concierge. Ask me anything about the city, or let me find your next adventure."}
            </p>
            <div className="flex flex-wrap justify-center gap-2 mt-4 w-full px-4">
              {(hotel.quickSuggestions || [
                { emoji: '🗓️', label: '2 Day Itinerary', prompt: 'What do you recommend for a 2 day stay?' },
                { emoji: '👨‍👩‍��‍👦', label: 'Family Activities', prompt: 'What can I do as a family of 4?' },
                { emoji: '🤿', label: 'Diving Spots', prompt: 'We want to do dive, where can we go?' },
              ]).map((sug, i) => (
                <button key={i} onClick={() => setInput(sug.prompt)} className="px-6 py-2.5 bg-white hover:bg-slate-50 border border-slate-200/60 rounded-full text-[13px] font-medium tracking-wide text-slate-600 transition-colors mb-2">
                  {sug.emoji} {sug.label}
                </button>
              ))}
            </div>
          </div>
        ) : (
          <div className="space-y-6">
            {messages.map((msg) => (
              <div key={msg.id} className={`flex gap-4 ${msg.role === 'user' ? 'flex-row-reverse' : ''}`}>
                <div className={`w-8 h-8 rounded-full flex items-center justify-center shrink-0 overflow-hidden ${msg.role === 'user' ? 'bg-slate-900 text-white' : 'bg-white border border-slate-200/60'}`}>
                  {msg.role === 'user' ? (
                    <User size={16} />
                  ) : (
                    <img 
                      src={hotel?.conciergeAvatarUrl || 'https://storage.googleapis.com/bored_tourist_media/images/hotel.webp'} 
                      alt={hotel?.name || 'Concierge'}
                      className="w-full h-full object-cover"
                    />
                  )}
                </div>
                <div className="flex-1 max-w-[85%]">
                  <div className={`rounded-2xl p-4 text-sm leading-relaxed ${
                    msg.role === 'user' 
                      ? 'bg-white text-slate-900 rounded-tr-none font-light border border-slate-200/60' 
                      : 'bg-white border border-slate-200/60 text-slate-700 rounded-tl-none shadow-sm font-light'
                  }`}>
                    {msg.role === 'assistant' ? (
                      <div className="space-y-3">
                        {msg.text.split('\n\n').map((paragraph, idx) => {
                          // Check if it's a numbered list item with emoji
                          if (paragraph.match(/^\d+️⃣/)) {
                            const lines = paragraph.split('\n');
                            const titleLine = lines[0];
                            
                            // Extract emoji, title and metadata
                            const match = titleLine.match(/^(\d+️⃣)\s*\*\*([^*]+)\*\*(.*)$/);
                            if (match) {
                              const [, emoji, title, metadata] = match;
                              
                              // Try to find matching FREE_SPOT to get image - more flexible matching
                              let freeSpot = FREE_SPOTS.find(spot => {
                                const spotWords = spot.title.toLowerCase().split(' ');
                                const titleLower = title.toLowerCase();
                                // Check if title contains key words from spot name
                                return spotWords.some(word => word.length > 3 && titleLower.includes(word)) ||
                                       titleLower.includes(spot.title.toLowerCase().substring(0, 10));
                              });
                              
                              // If we have freeSpotIds in this message, try to match by position
                              if (!freeSpot && msg.freeSpotIds && msg.freeSpotIds.length > 0) {
                                // Match by index in the list (1️⃣ = first free spot, etc)
                                const emojiNumber = parseInt(emoji.charAt(0));
                                if (emojiNumber && msg.freeSpotIds[emojiNumber - 1]) {
                                  freeSpot = FREE_SPOTS.find(spot => spot.id === msg.freeSpotIds[emojiNumber - 1]);
                                }
                              }
                              
                              return (
                                <div key={idx} className="bg-white rounded-xl overflow-hidden border border-slate-200/60 hover:border-slate-300 transition-colors shadow-sm">
                                  {freeSpot?.imageUrl && (
                                    <div className="h-32 w-full overflow-hidden bg-slate-100">
                                      <img 
                                        src={freeSpot.imageUrl} 
                                        alt={title}
                                        className="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
                                      />
                                    </div>
                                  )}
                                  <div className="p-4">
                                    <div className="flex items-start gap-2 mb-2">
                                      <span className="text-2xl leading-none">{emoji}</span>
                                      <div className="flex-1">
                                        <div className="font-medium text-slate-900 text-base leading-tight">{title}</div>
                                        <div className="text-xs text-slate-500 mt-0.5 font-light">{metadata.trim()}</div>
                                      </div>
                                    </div>
                                    <div className="space-y-1 ml-8">
                                      {lines.slice(1).map((line, i) => {
                                        if (line.trim().startsWith('→')) {
                                          return (
                                            <div key={i} className="flex items-start gap-2 text-xs text-slate-600 font-light">
                                              <span className="text-slate-400 font-normal mt-0.5">→</span>
                                              <span className="flex-1">{line.replace('→', '').trim()}</span>
                                            </div>
                                          );
                                        }
                                        return null;
                                      })}
                                    </div>
                                  </div>
                                </div>
                              );
                            }
                          }
                          
                          // Regular paragraph - parse bold text
                          return (
                            <p key={idx} className="text-slate-700 leading-relaxed">
                              {paragraph.split(/(\*\*[^*]+\*\*)/).map((part, i) => {
                                if (part.startsWith('**') && part.endsWith('**')) {
                                  return <strong key={i} className="font-bold text-slate-900">{part.slice(2, -2)}</strong>;
                                }
                                return <span key={i}>{part}</span>;
                              })}
                            </p>
                          );
                        })}
                      </div>
                    ) : (
                      msg.text
                    )}
                  </div>
                  
                  {msg.experienceIds && msg.experienceIds.length > 0 && (
                    <div className="mt-3 space-y-3">
                      {msg.experienceIds.map(expId => {
                        const exp = experiences.find(e => e.id === expId);
                        if (!exp) return null;
                        
                        const imageUrl = exp.imageUrl || exp.thumbnail || (exp.images && exp.images[0]);
                        
                        return (
                          <div 
                            key={expId} 
                            onClick={() => onExperienceClick?.(exp)}
                            className="bg-white border-2 border-emerald-200 rounded-xl overflow-hidden hover:border-emerald-400 hover:shadow-lg transition-all group cursor-pointer"
                          >
                            {/* Thumbnail */}
                            {imageUrl && (
                              <div className="h-40 w-full overflow-hidden bg-slate-200">
                                <img 
                                  src={imageUrl} 
                                  alt={exp.title} 
                                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                                />
                              </div>
                            )}
                            
                            {/* Content */}
                            <div className="p-4">
                              <h4 className="font-bold text-base text-slate-900 mb-2 group-hover:text-emerald-600 transition-colors">
                                {exp.title}
                              </h4>
                              <p className="text-sm text-slate-600 line-clamp-2">
                                {exp.shortDescription || exp.description}
                              </p>
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  )}
                  
                  {msg.freeSpotIds && msg.freeSpotIds.length > 0 && (
                    <div className="mt-3 space-y-3">
                      {msg.freeSpotIds.map(spotId => {
                        const baseSpot = FREE_SPOTS.find(s => s.id === spotId);
                        if (!baseSpot) return null;
                        // Use enriched data if available, otherwise use base data
                        const spot = enrichedSpots.get(spotId) || baseSpot;
                        return (
                          <div 
                            key={`free-${spotId}`}
                            onClick={() => setSelectedFreeSpot(spot)}
                            className="bg-white border-2 border-blue-200 rounded-xl overflow-hidden hover:border-blue-400 hover:shadow-lg transition-all group cursor-pointer"
                          >
                            {/* Thumbnail */}
                            <div className="h-40 w-full overflow-hidden bg-slate-200 relative">
                              <img 
                                src={spot.imageUrl} 
                                alt={spot.title} 
                                className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                              />
                              <span className="absolute top-3 left-3 text-xs font-black text-white bg-blue-600 px-3 py-1.5 rounded-full shadow-lg">
                                FREE
                              </span>
                            </div>
                            
                            {/* Content */}
                            <div className="p-4">
                              <h4 className="font-bold text-base text-slate-900 mb-2 group-hover:text-blue-600 transition-colors">
                                {spot.title}
                              </h4>
                              <p className="text-sm text-slate-600 line-clamp-2">
                                {spot.description}
                              </p>
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  )}
                  
                  {msg.eventIds && msg.eventIds.length > 0 && (
                    <div className="mt-3 grid grid-cols-1 md:grid-cols-2 gap-4">
                      {msg.eventIds.map(eventId => {
                        const event = todayEvents.find(e => e.id === eventId);
                        if (!event) return null;
                        
                        return <EventCard key={eventId} event={event} />;
                      })}
                    </div>
                  )}
                </div>
              </div>
            ))}
            {isLoading && (
               <div className="flex gap-4">
                  <div className="w-8 h-8 rounded-full bg-white border border-slate-200/60 flex items-center justify-center shrink-0 overflow-hidden">
                    <img 
                      src={hotel?.conciergeAvatarUrl || 'https://storage.googleapis.com/bored_tourist_media/images/hotel.webp'} 
                      alt={hotel?.name || 'Concierge'}
                      className="w-full h-full object-cover"
                    />
                  </div>
                  <div className="bg-white border border-slate-200/60 rounded-2xl rounded-tl-none p-4 shadow-sm flex items-center gap-2">
                    <div className="w-2 h-2 bg-slate-400 rounded-full animate-bounce" />
                    <div className="w-2 h-2 bg-slate-400 rounded-full animate-bounce [animation-delay:0.1s]" />
                    <div className="w-2 h-2 bg-slate-400 rounded-full animate-bounce [animation-delay:0.2s]" />
                  </div>
               </div>
            )}
            <div ref={messagesEndRef} />
          </div>
        )}
      </div>

      <div className="p-3 md:p-6 md:p-10 pt-2 border-t border-slate-200/40" style={{ backgroundColor: "var(--hotel-surface, #FAFAF8)", paddingBottom: 'max(12px, env(safe-area-inset-bottom))' }}>
        <div className="relative group">
          <textarea
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="What do you want to do?"
            className="w-full bg-white border border-slate-200/60 focus:border-slate-400 rounded-2xl md:rounded-3xl pl-4 md:pl-6 pr-12 md:pr-14 py-3 md:py-4 min-h-[50px] md:min-h-[60px] max-h-[80px] md:max-h-[120px] resize-none outline-none text-sm md:text-base text-slate-900 font-light placeholder-slate-400 transition-colors shadow-sm focus:shadow-md"
            rows={1}
          />
          <div className="absolute right-2 md:right-3 bottom-2 md:bottom-3 flex items-center gap-2">
            <button
              onClick={handleSend}
              disabled={!input.trim() || isLoading}
              className="p-2 bg-slate-900 text-white rounded-full hover:bg-slate-700 disabled:opacity-50 disabled:hover:bg-slate-900 transition-colors"
            >
              <Send size={16} className="md:hidden" />
              <Send size={18} className="hidden md:block" />
            </button>
          </div>
        </div>
        <div className="mt-2 md:mt-4 flex items-center justify-between text-[10px] md:text-xs text-slate-400 font-light tracking-wide px-2 hidden md:flex">
          <div className="flex items-center gap-1">
            <MapPin size={12} />
            <span>{hotel?.location || 'Portugal'}</span>
          </div>
          <span>Powered by Bored AI</span>
        </div>
      </div>

      {/* Free Spot Modal */}
      {selectedFreeSpot && (
        <FreeSpotModal 
          spot={selectedFreeSpot} 
          onClose={() => setSelectedFreeSpot(null)} 
        />
      )}
    </div>
  );
};

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
        maxGroupSize: exp.max_group_size,
        highlights: exp.highlights || [],
        importantInfo: exp.important_info,
        cancellationPolicy: exp.cancellation_policy,
        videoUrl: exp.video_url,
        imageUrl: exp.images && exp.images.length > 0 ? exp.images[0] : null,
        thumbnail: exp.images && exp.images.length > 0 ? exp.images[0] : null,
        images: exp.images || []
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
        model: 'gpt-4-turbo-preview',
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
      const openai = new OpenAI({
        apiKey: import.meta.env.VITE_OPENAI_API_KEY || 'sk-proj-your-key-here',
        dangerouslyAllowBrowser: true
      });
      
      const experiencesContext = experiences.map((exp, idx) => 
        `[${exp.id}] ${exp.title} (${exp.category}) - €${exp.price}, ${exp.duration}, ${exp.location}. ${exp.short_description || ''}`
      ).join('\n');
      
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

      // Group experiences by geographic zones for better recommendations
      const lisboaCentro = experiences.filter(e => 
        e.location.includes('Alfama') || e.location.includes('Baixa') || 
        e.location.includes('Bairro Alto') || e.location.includes('Mouraria') ||
        e.location.includes('Principe Real') || e.location.includes('Chiado') ||
        e.location.includes('Lisbon') && !e.location.includes('Setúbal') && !e.location.includes('Sintra')
      );
      
      const belem = experiences.filter(e => e.location.includes('Belém'));
      const sintra = experiences.filter(e => e.location.includes('Sintra'));
      const arrabida = experiences.filter(e => e.location.includes('Setúbal') || e.location.includes('Arrábida'));
      const parqueDasNacoes = experiences.filter(e => e.location.includes('Parque das Nações'));
      
      const zoneContext = `
GEOGRAPHIC ZONES (for proximity-based recommendations):

LISBOA CENTRO (5-15 min from hotel):
${lisboaCentro.map(e => `[${e.id}] ${e.title} - €${e.price}, ${e.duration}, ${e.location}`).join('\n')}

BELÉM (20-30 min from hotel):
${belem.map(e => `[${e.id}] ${e.title} - €${e.price}, ${e.duration}, ${e.location}`).join('\n')}

PARQUE DAS NAÇÕES (25-35 min from hotel):
${parqueDasNacoes.map(e => `[${e.id}] ${e.title} - €${e.price}, ${e.duration}, ${e.location}`).join('\n')}

SINTRA (45-60 min from hotel):
${sintra.map(e => `[${e.id}] ${e.title} - €${e.price}, ${e.duration}, ${e.location}`).join('\n')}

ARRÁBIDA/SETÚBAL (60-90 min from hotel):
${arrabida.map(e => `[${e.id}] ${e.title} - €${e.price}, ${e.duration}, ${e.location}`).join('\n')}

FREE SPOTS:
${freeSpotsContext}`;

      const systemPrompt = `You're a passionate concierge at Vila Galé Opera hotel. Your PRIMARY GOAL: sell our premium experiences with VISUAL CARDS while providing exceptional service.

HOTEL LOCATION: Tv. do Conde da Ponte, 1300-141 Lisboa (near Campo Pequeno)

${contextualInfo}

${zoneContext}

🎯 MANDATORY CONVERSATION FLOW:

STEP 1 - DISCOVERY (First 1-2 messages):
Ask questions to understand what they want:
- "What brings you to Lisbon - adventure, culture, food, or relaxation?"
- "Who are you traveling with?"
- "What type of experiences excite you most?"

NEVER recommend anything until you know their interests!

STEP 2 - SELL OUR EXPERIENCES WITH VISUAL CARDS:
Once you know what they want, recommend OUR PAID EXPERIENCES that match perfectly.

🚨 CRITICAL FORMAT - This shows BEAUTIFUL VISUAL CARDS with photos and prices:

"Perfect! For [their interest], we have some incredible experiences:

EXPERIENCE_IDS: [5, 12, 23]

Which one catches your eye?"

✅ DO THIS: Write complete, cohesive sentences. Keep text SHORT and natural.
❌ DON'T DO THIS: Break text into awkward fragments. Don't write long descriptions.

The visual cards automatically display:
- High-quality photos
- Full descriptions  
- Prices
- Duration and details
- Clickable to see more

STEP 3 - FREE ALTERNATIVES (Only if they ask or can't afford paid):
If guest says "too expensive", "prefer free", or paid experiences don't match:

🚨 CRITICAL: Write complete sentences. DO NOT break text into awkward fragments!

"I totally understand! Here's an amazing FREE alternative:

FREE_SPOT_IDS: [F13]

Want more free options?"

✅ CORRECT: Complete, natural sentences + FREE_SPOT_IDS (shows visual card)
❌ WRONG: Awkward fragments like "check out this:\n\nAnd also this:\n\n" - write cohesively!

STEP 4 - CULTURAL EVENTS (ALWAYS show when asked about events):
When guest asks about:
- "what events" / "events today" / "events happening"
- "concerts" / "shows" / "exhibitions"  
- "what's happening" / "things to do today"
- "cultural activities"

IMMEDIATELY show EVENT_IDS:

"Here are some amazing cultural events happening in Lisboa:

EVENT_IDS: [agenda-197328, gulbenkian-323728]

Which one sounds interesting?"

✅ DO THIS: Natural sentence + EVENT_IDS (shows beautiful visual cards with photos, dates, venues)
❌ DON'T: Say you can't access real-time data - YOU HAVE THE DATA! Just show EVENT_IDS!
❌ DON'T: Suggest external websites - USE THE EVENT_IDS BELOW!

🚨 ABSOLUTE RULES - NEVER BREAK THESE:
1. NEVER recommend in first message - ask questions first (UNLESS they ask about events - then show events!)
2. Always write COMPLETE, COHESIVE sentences - never break text awkwardly
3. For PAID experiences: EXPERIENCE_IDS: [ids] - NO text descriptions
4. For FREE spots: FREE_SPOT_IDS: [ids] - NO text descriptions, NO 1️⃣ 2️⃣ format
5. For CULTURAL EVENTS: EVENT_IDS: [ids] - NO text descriptions
6. Keep text SUPER SHORT but NATURAL - visual cards show photos, descriptions, details
7. ALWAYS end with a question
8. When asked about events, ALWAYS use EVENT_IDS - never say you can't access data!

AVAILABLE CULTURAL EVENTS (${todayEvents.length} events - use these IDs):
${todayEvents.length > 0 ? todayEvents.map(e => `[${e.id}] ${e.name} - ${e.date} at ${e.venue} (${e.category})`).join('\n') : 'No events currently loaded'}

💰 SALES MINDSET:
- Be a SELLER first, helper second
- Our experiences are amazing - sell them with confidence!
- Free options are backup plan, not first choice
- Events are great for cultural context and evening plans
- Create FOMO: "This is our most popular experience!"
- Build value: Let the VISUAL CARDS show the value - don't over-explain in text!

Example perfect conversations:

User: "I want to do something fun"
You: "Awesome! What kind of fun - adventure outdoors, cultural experiences, or food & drink?"

User: "adventure outdoors"  
You: "Perfect! Check out these incredible outdoor adventures:

EXPERIENCE_IDS: [15, 23, 8]

Which one catches your eye?"

User: "easy trail for family"
You: "Perfect! For an easy trail close to our hotel, check out this premium option and a fantastic free alternative:

EXPERIENCE_IDS: [29]
FREE_SPOT_IDS: [F13]

Which interests you more?"

User: "I want hiking" or "trails"  
You: "For beautiful forest trails near Lisbon:

FREE_SPOT_IDS: [F13]

Interested in checking it out?"

Remember: NEVER write descriptions - just use IDs and let the visual cards do the work!`;

      const response = await openai.chat.completions.create({
        model: 'gpt-4-turbo-preview',
        messages: [
          { role: 'system', content: systemPrompt },
          ...messages.map(m => ({ role: m.role, content: m.text })),
          { role: 'user', content: userMessage.text }
        ],
        temperature: 0.8,
        max_tokens: 300
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
        await extractAndSaveMemories([...messages, userMessage, { 
          id: (Date.now() + 1).toString(), 
          role: 'assistant', 
          text: cleanText 
        }], openai);
      } else {
        // Just update conversation count
        await updateMemory({ 
          conversationCount: newConversationCount 
        });
      }
      
    } catch (error) {
      console.error("Chat error:", error);
      setMessages(prev => [...prev, { 
        id: (Date.now() + 1).toString(), 
        role: 'assistant', 
        text: "Oops, lost my train of thought. Can you try that again?" 
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
    <div className="flex flex-col h-full bg-[#FAFAF8] relative">
      {/* Mobile Full Screen Header with Back Button */}
      {isMobileFullScreen && (
        <div className="sticky top-0 z-10 bg-[#FAFAF8]/95 backdrop-blur-md border-b border-slate-200/40 px-6 py-4 flex items-center gap-3">
          <button
            onClick={onCloseMobileChat}
            className="p-2 hover:bg-white/60 rounded-full transition-colors"
          >
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M19 12H5M12 19l-7-7 7-7"/>
            </svg>
          </button>
          <div className="flex items-center gap-3">
            <img 
              src="https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg" 
              alt="Vila Gale Opera"
              className="w-10 h-10 rounded-full object-cover border border-slate-200/60"
            />
            <div>
              <div className="text-sm font-medium text-slate-900">
                Vila Gale Opera
              </div>
              <div className="text-[11px] text-slate-500 font-light tracking-wide">AI Concierge</div>
            </div>
          </div>
        </div>
      )}

      {/* Regular Header (Desktop or Mobile Bottom) */}
      {!isMobileFullScreen && (
        <div className="p-3 md:p-6 md:pb-0 pb-0 border-b md:border-0 border-slate-200/30">
          <div className="flex items-center gap-3 mb-2 md:mb-8">
             <img 
               src="https://storage.googleapis.com/bored_tourist_media/images/WhatsApp%20Image%202026-02-11%20at%2000.12.20.jpeg" 
             alt="Vila Gale Opera"
             onClick={handleReset}
             className="h-8 md:h-10 w-auto object-contain cursor-pointer hover:opacity-80 transition-opacity"
           />
          </div>
        </div>
      )}

      {/* Messages Area - Show on mobile full screen or desktop */}
      <div className={`flex-1 overflow-y-auto px-3 md:px-6 md:px-10 py-2 md:py-4 no-scrollbar ${isMobileFullScreen ? 'block' : 'hidden md:block'}`}>
        {messages.length === 0 ? (
          <div className="h-full flex flex-col justify-center items-center text-center space-y-6">
            <div className="w-32 h-32 rounded-2xl flex items-center justify-center mb-4 overflow-hidden bg-white border border-slate-200/60 shadow-sm">
              <img 
                src="https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg" 
                alt="Vila Gale Opera"
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
                      src="https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg" 
                      alt="Vila Gale"
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
                      src="https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg" 
                      alt="Vila Gale"
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

      <div className="p-3 md:p-6 md:p-10 pt-2 bg-[#FAFAF8] border-t border-slate-200/40">
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
             <span>Lisbon, Portugal</span>
          </div>
          <span>Powered by GPT-4</span>
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

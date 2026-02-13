import React, { useState, useRef, useEffect } from 'react';
import { Send, Bot, User, MapPin } from 'lucide-react';
import OpenAI from 'openai';
import { supabase } from '../lib/supabase';
import { ExperienceDisplay } from '../types';
import { useUserMemories } from '../hooks/useUserMemories';
import { DetailModal } from './DetailModal';
import FreeSpotModal from './FreeSpotModal';
import { getCachedPlaceDetails, getPhotoUrl, searchPlaceByName } from '../lib/googlePlaces';

interface Message {
  id: string;
  role: 'user' | 'assistant';
  text: string;
  experienceIds?: number[];
  freeSpotIds?: number[];
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
  const messagesEndRef = useRef<HTMLDivElement>(null);
  
  // Memory hook
  const { memory, updateMemory } = useUserMemories(userId);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

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

🚨 ABSOLUTE RULES - NEVER BREAK THESE:
1. NEVER recommend in first message - ask questions first
2. Always write COMPLETE, COHESIVE sentences - never break text awkwardly
3. For PAID experiences: EXPERIENCE_IDS: [ids] - NO text descriptions
4. For FREE spots: FREE_SPOT_IDS: [ids] - NO text descriptions, NO 1️⃣ 2️⃣ format
5. Keep text SUPER SHORT but NATURAL - visual cards show photos, descriptions, details
6. ALWAYS end with a question
7. Mix paid + free in ONE sentence: "Check out this premium option and a fantastic free alternative:"

💰 SALES MINDSET:
- Be a SELLER first, helper second
- Our experiences are amazing - sell them with confidence!
- Free options are backup plan, not first choice
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
      
      // Clean text removing both ID markers
      const cleanText = aiText
        .replace(/EXPERIENCE_IDS:\s*\[[^\]]+\]/g, '')
        .replace(/FREE_SPOT_IDS:\s*\[[^\]]+\]/g, '')
        .trim();

      setMessages(prev => [...prev, { 
        id: (Date.now() + 1).toString(), 
        role: 'assistant', 
        text: cleanText,
        experienceIds: experienceIds.length > 0 ? experienceIds : undefined,
        freeSpotIds: freeSpotIds.length > 0 ? freeSpotIds : undefined
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
    <div className="flex flex-col h-full bg-white relative">
      {/* Mobile Full Screen Header with Back Button */}
      {isMobileFullScreen && (
        <div className="sticky top-0 z-10 bg-white border-b border-slate-200 px-4 py-3 flex items-center gap-3">
          <button
            onClick={onCloseMobileChat}
            className="p-2 hover:bg-slate-100 rounded-full transition-colors"
          >
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M19 12H5M12 19l-7-7 7-7"/>
            </svg>
          </button>
          <div className="flex items-center gap-3">
            <img 
              src="https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg" 
              alt="Vila Gale Opera"
              className="w-10 h-10 rounded-full object-cover border-2 border-emerald-100"
            />
            <div>
              <div className="text-sm font-bold text-slate-900">
                <span className="text-transparent bg-clip-text bg-gradient-to-r from-emerald-600 to-teal-500">Vila Gale Opera</span>
              </div>
              <div className="text-xs text-slate-500">AI Concierge</div>
            </div>
          </div>
        </div>
      )}

      {/* Regular Header (Desktop or Mobile Bottom) */}
      {!isMobileFullScreen && (
        <div className="p-3 md:p-6 md:pb-0 pb-0 border-b md:border-0 border-slate-100">
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
            <div className="w-32 h-32 rounded-2xl flex items-center justify-center mb-4 overflow-hidden bg-slate-100 shadow-lg">
              <img 
                src="https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg" 
                alt="Vila Gale Opera"
                className="w-full h-full object-cover"
              />
            </div>
            <h1 className="text-3xl md:text-4xl font-black text-slate-900 tracking-tight uppercase leading-tight">
              Welcome to <br/>
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-emerald-600 to-teal-500">Vila Gale Opera</span>
            </h1>
            <p className="text-slate-500 font-medium max-w-md text-lg">
              I'm your digital concierge. Ask me anything about the city, or let me find your next adventure.
            </p>
            <div className="flex flex-wrap justify-center gap-2 mt-4 w-full px-4">
              <button onClick={() => setInput("What do you recommend for a 2 day stay?")} className="px-4 py-2 bg-slate-100 hover:bg-slate-200 border border-slate-200 rounded-full text-xs font-bold uppercase tracking-wider text-slate-600 transition-colors mb-2">
                🗓️ 2 Day Itinerary
              </button>
              <button onClick={() => setInput("What can I do as a family of 4?")} className="px-4 py-2 bg-slate-100 hover:bg-slate-200 border border-slate-200 rounded-full text-xs font-bold uppercase tracking-wider text-slate-600 transition-colors mb-2">
                👨‍👩‍👧‍👦 Family Activities
              </button>
              <button onClick={() => setInput("We want to do dive, where can we go?")} className="px-4 py-2 bg-slate-100 hover:bg-slate-200 border border-slate-200 rounded-full text-xs font-bold uppercase tracking-wider text-slate-600 transition-colors mb-2">
                🤿 Diving Spots
              </button>
            </div>
          </div>
        ) : (
          <div className="space-y-6">
            {messages.map((msg) => (
              <div key={msg.id} className={`flex gap-4 ${msg.role === 'user' ? 'flex-row-reverse' : ''}`}>
                <div className={`w-8 h-8 rounded-full flex items-center justify-center shrink-0 overflow-hidden ${msg.role === 'user' ? 'bg-black text-white' : 'bg-white border-2 border-emerald-100'}`}>
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
                      ? 'bg-slate-100 text-slate-900 rounded-tr-none font-medium' 
                      : 'bg-white border-2 border-slate-100 text-slate-700 rounded-tl-none shadow-sm'
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
                                <div key={idx} className="bg-gradient-to-br from-slate-50 to-slate-100/50 rounded-xl overflow-hidden border-2 border-slate-200 hover:border-emerald-300 transition-colors">
                                  {freeSpot?.imageUrl && (
                                    <div className="h-32 w-full overflow-hidden bg-slate-200">
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
                                        <div className="font-bold text-slate-900 text-base leading-tight">{title}</div>
                                        <div className="text-xs text-slate-500 mt-0.5">{metadata.trim()}</div>
                                      </div>
                                    </div>
                                    <div className="space-y-1 ml-8">
                                      {lines.slice(1).map((line, i) => {
                                        if (line.trim().startsWith('→')) {
                                          return (
                                            <div key={i} className="flex items-start gap-2 text-xs text-slate-600">
                                              <span className="text-emerald-500 font-bold mt-0.5">→</span>
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
                </div>
              </div>
            ))}
            {isLoading && (
               <div className="flex gap-4">
                  <div className="w-8 h-8 rounded-full bg-white border-2 border-emerald-100 flex items-center justify-center shrink-0 overflow-hidden">
                    <img 
                      src="https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg" 
                      alt="Vila Gale"
                      className="w-full h-full object-cover"
                    />
                  </div>
                  <div className="bg-white border-2 border-slate-100 rounded-2xl rounded-tl-none p-4 shadow-sm flex items-center gap-2">
                    <div className="w-2 h-2 bg-emerald-500 rounded-full animate-bounce" />
                    <div className="w-2 h-2 bg-emerald-500 rounded-full animate-bounce [animation-delay:0.1s]" />
                    <div className="w-2 h-2 bg-emerald-500 rounded-full animate-bounce [animation-delay:0.2s]" />
                  </div>
               </div>
            )}
            <div ref={messagesEndRef} />
          </div>
        )}
      </div>

      <div className="p-3 md:p-6 md:p-10 pt-2 bg-white">
        <div className="relative group">
          <textarea
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="What do you want to do?"
            className="w-full bg-slate-50 border-2 border-slate-200 focus:border-black rounded-2xl md:rounded-3xl pl-4 md:pl-6 pr-12 md:pr-14 py-3 md:py-4 min-h-[50px] md:min-h-[60px] max-h-[80px] md:max-h-[120px] resize-none outline-none text-sm md:text-base text-slate-900 font-medium placeholder-slate-400 transition-colors shadow-sm focus:shadow-md"
            rows={1}
          />
          <div className="absolute right-2 md:right-3 bottom-2 md:bottom-3 flex items-center gap-2">
            <button 
              onClick={handleSend}
              disabled={!input.trim() || isLoading}
              className="p-2 bg-black text-white rounded-full hover:bg-emerald-500 disabled:opacity-50 disabled:hover:bg-black transition-colors"
            >
              <Send size={16} className="md:hidden" />
              <Send size={18} className="hidden md:block" />
            </button>
          </div>
        </div>
        <div className="mt-2 md:mt-4 flex items-center justify-between text-[10px] md:text-xs text-slate-400 font-bold uppercase tracking-wider px-2 hidden md:flex">
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

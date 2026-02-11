import React, { useState, useRef, useEffect } from 'react';
import { Send, Bot, User, MapPin } from 'lucide-react';
import OpenAI from 'openai';
import { supabase } from '../lib/supabase';
import { ExperienceDisplay } from '../types';

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
}

const FREE_SPOTS: FreeSpot[] = [
  {
    id: 1,
    title: "Time Out Market",
    description: "A lively food hall where everyone can pick their favorite bite! With local Portuguese food stalls and international options, it's a vibrant (and delicious) spot for lunch or dinner with family.",
    imageUrl: "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800",
    rating: 4.4,
    category: "Food & Dining",
    location: "Cais do Sodré (Lisboa Centro - 10min from hotel)"
  },
  {
    id: 2,
    title: "Tram 28",
    description: "Hop on the iconic yellow tram for a classic Lisbon adventure—ride through the city's historic quarters, up and down hills, and past famous sights. Kids love the vintage trams, and it's a fun way to see the city together.",
    imageUrl: "https://images.unsplash.com/photo-1585208798174-6cedd86e019a?w=800",
    rating: 4.1,
    category: "Attraction",
    location: "Various stops (Lisboa Centro)"
  },
  {
    id: 3,
    title: "Castelo de São Jorge",
    description: "Explore castle walls, towers, gardens, and some of the best city views! The castle is full of history and space for kids to run around, and you can have a family picnic overlooking Lisbon.",
    imageUrl: "https://images.unsplash.com/photo-1585208798174-6cedd86e019a?w=800",
    rating: 4.5,
    category: "Attraction",
    location: "Alfama (Lisboa Centro - 15min from hotel)"
  },
  {
    id: 4,
    title: "Pastéis de Belém",
    description: "A must for families with a sweet tooth! Try the famous pastéis de nata (custard tarts) at this historic bakery—fresh out of the oven, they're a treat for all ages.",
    imageUrl: "https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800",
    rating: 4.6,
    category: "Food & Dining",
    location: "Belém (25min from hotel)"
  },
  {
    id: 5,
    title: "Oceanário de Lisboa",
    description: "One of the largest indoor aquariums in the world, this spot is a hit with families! See over 15,000 sea creatures from all over the globe and interactive exhibits that are both fun and educational for kids.",
    imageUrl: "https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800",
    rating: 4.6,
    category: "Attraction",
    location: "Parque das Nações (30min from hotel)"
  },
  {
    id: 6,
    title: "Miradouro da Graça",
    description: "Stunning sunset viewpoint with a local vibe. Perfect for photos and enjoying the city panorama with a drink from the terrace café.",
    imageUrl: "https://images.unsplash.com/photo-1555881400-74d7acaacd8b?w=800",
    rating: 4.7,
    category: "Viewpoint",
    location: "Graça (Lisboa Centro - 15min from hotel)"
  },
  {
    id: 7,
    title: "LX Factory",
    description: "Vibrant cultural and creative hub in a repurposed industrial complex. Street art, unique shops, trendy cafes, and cool bookstores to explore.",
    imageUrl: "https://images.unsplash.com/photo-1513342961520-28b8a0d64604?w=800",
    rating: 4.5,
    category: "Attraction",
    location: "Alcântara (20min from hotel, near Belém)"
  },
  {
    id: 8,
    title: "Alfama District",
    description: "Lisbon's oldest neighborhood with narrow winding streets, colorful tiles, and authentic fado music. Perfect for wandering and feeling the soul of the city.",
    imageUrl: "https://images.unsplash.com/photo-1599056095104-4fd9536b7bbf?w=800",
    rating: 4.8,
    category: "Neighborhood",
    location: "Alfama (Lisboa Centro - 15min from hotel)"
  }
];

interface ChatSectionProps {
  onExperienceClick?: (experience: ExperienceDisplay) => void;
}

export const ChatSection: React.FC<ChatSectionProps> = ({ onExperienceClick }) => {
  const [messages, setMessages] = useState<Message[]>([]);
  const [input, setInput] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [experiences, setExperiences] = useState<any[]>([]);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  };

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
        `[F${spot.id}] ${spot.title} (${spot.category}) - FREE, ${spot.location}. ${spot.description}`
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

      const systemPrompt = `You're a local Lisbon concierge at Vila Galé Opera hotel. Keep responses ULTRA SHORT - max 2 sentences.

HOTEL LOCATION: Tv. do Conde da Ponte, 1300-141 Lisboa (near Campo Pequeno)

${zoneContext}

CRITICAL RULES FOR RECOMMENDATIONS:
1. NEVER mix far zones in same day - respect travel time
2. Group by proximity: Lisboa Centro + Belém OK, but NEVER Arrábida + Graça
3. If morning in Sintra, suggest another Sintra activity - don't send them back to Lisboa Centro
4. Consider guest's time: far zones (Sintra/Arrábida) need 4+ hours total with travel
5. First message: Ask ONE question about their vibe
6. Max 1-2 sentences always
7. Only recommend after knowing: who's traveling + interests + style + timeframe
8. When recommending PAID: end with EXPERIENCE_IDS: [id1, id2]
9. When recommending FREE: end with FREE_SPOT_IDS: [F1, F2, F3]
10. Can mix both: EXPERIENCE_IDS: [123] FREE_SPOT_IDS: [F1, F5]

SMART GROUPING EXAMPLES:
✅ GOOD: Alfama walk (F8) + Fado show (Lisboa Centro) + Miradouro da Graça (F6)
✅ GOOD: Morning in Sintra (45min away) + afternoon Sintra activity
✅ GOOD: Belém pastéis (F4) + Monument tour (Belém) + LX Factory (F7) nearby
❌ BAD: Paragliding Arrábida (90min) + Miradouro Graça (Lisboa) - TOO FAR APART
❌ BAD: Sintra morning + Setúbal afternoon - guest would spend 3h just traveling

Example responses:
"What kind of vibe are you after - adventure, culture, food?"
"Nice! Are you traveling solo or with others?"
"Perfect! Here's what I'd do: FREE_SPOT_IDS: [F2, F6] EXPERIENCE_IDS: [123]"

Keep it SHORT. Let the cards do the talking.`;

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

      <div className="flex-1 overflow-y-auto px-3 md:px-6 md:px-10 py-2 md:py-4 no-scrollbar hidden md:block">
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
                  <div className={`rounded-2xl p-4 text-sm font-medium leading-relaxed ${
                    msg.role === 'user' 
                      ? 'bg-slate-100 text-slate-900 rounded-tr-none' 
                      : 'bg-white border-2 border-slate-100 text-slate-600 rounded-tl-none shadow-sm'
                  }`}>
                    {msg.text}
                  </div>
                  
                  {msg.experienceIds && msg.experienceIds.length > 0 && (
                    <div className="mt-3 space-y-2">
                      {msg.experienceIds.map(expId => {
                        const exp = experiences.find(e => e.id === expId);
                        if (!exp) return null;
                        return (
                          <div 
                            key={expId} 
                            onClick={() => onExperienceClick?.(exp)}
                            className="bg-white border-2 border-emerald-100 rounded-xl overflow-hidden hover:border-emerald-300 transition-all shadow-sm hover:shadow-md group cursor-pointer"
                          >
                            <div className="flex gap-3 p-3">
                              <div className="w-20 h-20 bg-slate-100 rounded-lg shrink-0 overflow-hidden">
                                {exp.thumbnail && (
                                  <img src={exp.thumbnail} alt={exp.title} className="w-full h-full object-cover" />
                                )}
                              </div>
                              <div className="flex-1 min-w-0">
                                <h4 className="font-bold text-sm text-slate-900 mb-1 line-clamp-1 group-hover:text-emerald-600 transition-colors">
                                  {exp.title}
                                </h4>
                                <p className="text-xs text-slate-500 mb-2 line-clamp-2">
                                  {exp.short_description}
                                </p>
                                <div className="flex items-center gap-3 text-xs">
                                  <span className="font-bold text-emerald-600">€{exp.price}</span>
                                  <span className="text-slate-400">•</span>
                                  <span className="text-slate-500">{exp.duration}</span>
                                  {exp.rating && (
                                    <>
                                      <span className="text-slate-400">•</span>
                                      <span className="text-slate-500">⭐ {exp.rating}</span>
                                    </>
                                  )}
                                </div>
                              </div>
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  )}
                  
                  {msg.freeSpotIds && msg.freeSpotIds.length > 0 && (
                    <div className="mt-3 space-y-2">
                      {msg.freeSpotIds.map(spotId => {
                        const spot = FREE_SPOTS.find(s => s.id === spotId);
                        if (!spot) return null;
                        return (
                          <div 
                            key={`free-${spotId}`}
                            className="bg-white border-2 border-blue-100 rounded-xl overflow-hidden hover:border-blue-300 transition-all shadow-sm hover:shadow-md group cursor-pointer"
                          >
                            <div className="flex gap-3 p-3">
                              <div className="w-20 h-20 bg-slate-100 rounded-lg shrink-0 overflow-hidden">
                                <img src={spot.imageUrl} alt={spot.title} className="w-full h-full object-cover" />
                              </div>
                              <div className="flex-1 min-w-0">
                                <div className="flex items-start justify-between gap-2">
                                  <h4 className="font-bold text-sm text-slate-900 mb-1 line-clamp-1 group-hover:text-blue-600 transition-colors">
                                    {spot.title}
                                  </h4>
                                  <span className="text-xs font-black text-blue-600 bg-blue-50 px-2 py-0.5 rounded-full whitespace-nowrap">FREE</span>
                                </div>
                                <p className="text-xs text-slate-500 mb-2 line-clamp-2">
                                  {spot.description}
                                </p>
                                <div className="flex items-center gap-2 text-xs">
                                  <span className="text-slate-500">{spot.category}</span>
                                  <span className="text-slate-400">•</span>
                                  <span className="text-slate-500">⭐ {spot.rating}</span>
                                </div>
                              </div>
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
    </div>
  );
};

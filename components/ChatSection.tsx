import React, { useState, useRef, useEffect } from 'react';
import { Send, Paperclip, Bot, User, Sparkles, MapPin } from 'lucide-react';
import { GoogleGenAI } from "@google/genai";
import { EXPERIENCES } from '../mockData';

interface Message {
  id: string;
  role: 'user' | 'model';
  text: string;
}

export const ChatSection: React.FC = () => {
  const [messages, setMessages] = useState<Message[]>([]);
  const [input, setInput] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  const handleSend = async () => {
    if (!input.trim() || isLoading) return;

    const userMessage: Message = { id: Date.now().toString(), role: 'user', text: input };
    setMessages(prev => [...prev, userMessage]);
    setInput('');
    setIsLoading(true);

    try {
      // Initialize Gemini
      const ai = new GoogleGenAI({ apiKey: process.env.API_KEY });
      
      // Context for the AI
      const context = `
        You are the "Bored Tourist" Concierge for a hip hotel in Lisbon/Sintra. 
        Your goal is to help guests find cool experiences from our catalog.
        
        Here is our current catalog of experiences (JSON):
        ${JSON.stringify(EXPERIENCES.map(e => ({ title: e.title, category: e.category, price: e.price, description: e.description })))}
        
        Style Guide:
        - Be witty, energetic, and helpful. 
        - Don't sound like a robot. Sound like a cool local friend.
        - Recommend specific experiences from the catalog provided above if they fit the user's request.
        - If the user asks about something not in the catalog, give a general cool answer about the city but try to pivot back to our experiences.
        - Keep answers concise (under 100 words).
      `;

      const response = await ai.models.generateContent({
        model: 'gemini-3-flash-preview',
        contents: [
          { role: 'user', parts: [{ text: context + "\n\nUser Question: " + userMessage.text }] }
        ],
      });

      const aiText = response.text || "I'm having a little trouble connecting to the matrix right now. Try again?";

      setMessages(prev => [...prev, { id: (Date.now() + 1).toString(), role: 'model', text: aiText }]);
    } catch (error) {
      console.error("Chat error:", error);
      setMessages(prev => [...prev, { id: (Date.now() + 1).toString(), role: 'model', text: "Oops, my brain froze. Mind trying that again?" }]);
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

  return (
    <div className="flex flex-col h-full bg-white relative">
      {/* Branding / Header - Compact on mobile */}
      <div className="p-3 md:p-6 md:pb-0 pb-0 border-b md:border-0 border-slate-100">
        <div className="flex items-center gap-2 mb-2 md:mb-8">
           <div className="w-6 h-6 md:w-8 md:h-8 bg-black rounded flex items-center justify-center text-white text-sm md:text-lg font-black shadow-md">
                B
           </div>
           <span className="text-base md:text-xl font-black tracking-tighter text-slate-900 uppercase italic">Bored Tourist.</span>
        </div>
      </div>

      {/* Chat Area */}
      <div className="flex-1 overflow-y-auto px-3 md:px-6 md:px-10 py-2 md:py-4 no-scrollbar hidden md:block">
        {messages.length === 0 ? (
          <div className="h-full flex flex-col justify-center items-center text-center space-y-6">
            <div className="w-24 h-24 rounded-full flex items-center justify-center mb-4 overflow-hidden bg-white shadow-lg">
              <img 
                src="https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg" 
                alt="Vila Gale Opera"
                className="w-full h-full object-contain p-2"
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
                <div className={`w-8 h-8 rounded-full flex items-center justify-center shrink-0 ${msg.role === 'user' ? 'bg-black text-white' : 'bg-emerald-100 text-emerald-600'}`}>
                  {msg.role === 'user' ? <User size={16} /> : <Bot size={16} />}
                </div>
                <div className={`max-w-[85%] rounded-2xl p-4 text-sm font-medium leading-relaxed ${
                  msg.role === 'user' 
                    ? 'bg-slate-100 text-slate-900 rounded-tr-none' 
                    : 'bg-white border-2 border-slate-100 text-slate-600 rounded-tl-none shadow-sm'
                }`}>
                  {msg.text}
                </div>
              </div>
            ))}
            {isLoading && (
               <div className="flex gap-4">
                  <div className="w-8 h-8 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center shrink-0">
                    <Bot size={16} />
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

      {/* Input Area */}
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
          <span>Powered by Gemini</span>
        </div>
      </div>
    </div>
  );
};

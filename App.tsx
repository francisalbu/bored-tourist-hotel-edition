import React, { useState, useMemo } from 'react';
import { CategoryFilter } from './components/CategoryFilter';
import { VideoCard } from './components/VideoCard';
import { DetailModal } from './components/DetailModal';
import { ChatSection } from './components/ChatSection';
import { MemoriesPanel } from './components/MemoriesPanel';
import { ExperienceDisplay } from './types';
import { Menu, Globe, User, Loader2, Brain, Bot } from 'lucide-react';
import { useExperiences, useCategories } from './hooks/useExperiences';
import { useUserMemories } from './hooks/useUserMemories';

export default function App() {
  const [selectedCategory, setSelectedCategory] = useState<string>('all');
  const [selectedExperience, setSelectedExperience] = useState<ExperienceDisplay | null>(null);
  const [showMemories, setShowMemories] = useState(false);
  const [mobileFullScreenChat, setMobileFullScreenChat] = useState(false);
  
  const { experiences, loading, error } = useExperiences();
  const categories = useCategories();
  
  // User memories - using a default guest session ID
  const userId = 'guest-session-' + (localStorage.getItem('guestSessionId') || (() => {
    const id = Math.random().toString(36).substring(7);
    localStorage.setItem('guestSessionId', id);
    return id;
  })());
  
  const { memory, loading: memoryLoading, downloadMemories } = useUserMemories(userId);

  const filteredExperiences = useMemo(() => {
    if (selectedCategory === 'all') return experiences;
    return experiences.filter(exp => exp.category === selectedCategory);
  }, [selectedCategory, experiences]);

  return (
    <div className="h-screen w-full bg-slate-50 text-slate-900 font-sans selection:bg-emerald-200 selection:text-emerald-900 flex flex-col md:flex-row overflow-hidden">
      
      {/* DESKTOP: LEFT PANEL - Chat / Concierge */}
      <div className="hidden md:flex md:w-[45%] lg:w-[40%] xl:w-[35%] h-full border-r border-slate-200 z-10 shadow-xl">
        <ChatSection onExperienceClick={setSelectedExperience} userId={userId} />
      </div>
      
      {/* DESKTOP: RIGHT PANEL - Memories (Toggle) */}
      {showMemories && (
        <div className="hidden md:flex md:w-[35%] lg:w-[30%] h-full border-l border-slate-700 z-10 shadow-xl">
          <MemoriesPanel 
            memory={memory}
            loading={memoryLoading}
            onDownload={downloadMemories}
            onAddMemory={() => {
              // Could open a modal to manually add memories
              alert('Coming soon: Add custom memories');
            }}
          />
        </div>
      )}

      {/* MOBILE & DESKTOP: Video Feed */}
      <div className="flex-1 h-full bg-slate-50 overflow-y-auto relative flex flex-col pb-32 md:pb-0">
        
        {/* Header */}
        <div className="sticky top-0 z-30 bg-slate-50/95 backdrop-blur-md px-4 md:px-6 py-3 md:py-4 border-b border-slate-200">
           <div className="flex items-center justify-between">
              <div className="flex flex-col">
                <span className="text-[10px] md:text-xs font-bold uppercase tracking-widest text-slate-400">Discover</span>
                <div className="flex items-center gap-1">
                  <span className="font-black text-base md:text-lg tracking-tight">Lisbon & Surroundings</span>
                  <Globe size={12} className="text-emerald-600 md:hidden" />
                  <Globe size={14} className="text-emerald-600 hidden md:block" />
                </div>
              </div>

              <div className="flex items-center gap-2 md:gap-4">
                <button 
                  onClick={() => setShowMemories(!showMemories)}
                  className="hidden md:flex items-center gap-2 px-4 py-2 bg-white border-2 border-slate-200 rounded-full text-xs font-bold uppercase tracking-wider hover:border-pink-500 transition-colors"
                >
                   <Brain size={14} className={showMemories ? 'text-pink-500' : ''} />
                   <span className={showMemories ? 'text-pink-500' : ''}>
                     {showMemories ? 'Hide Memories' : 'My Memories'}
                   </span>
                   {memory && memory.memories.length > 0 && (
                     <span className="bg-pink-500 text-white text-[10px] font-bold px-1.5 py-0.5 rounded-full">
                       {memory.memories.length}
                     </span>
                   )}
                </button>
                <button className="hidden sm:flex items-center gap-2 px-4 py-2 bg-white border-2 border-slate-200 rounded-full text-xs font-bold uppercase tracking-wider hover:border-black transition-colors">
                   <User size={14} />
                   <span>My Account</span>
                </button>
                <button className="md:hidden p-2 text-slate-900">
                  <Menu size={20} />
                </button>
              </div>
           </div>
        </div>

        {/* Filters Sticky Bar */}
        <div className="sticky top-[57px] md:top-[73px] z-20 bg-slate-50/95 backdrop-blur-md pb-3 md:pb-4 pt-2 px-4 md:px-6 border-b border-slate-100/50">
           <CategoryFilter 
                categories={categories}
                selectedCategory={selectedCategory}
                onSelectCategory={setSelectedCategory}
           />
        </div>

        {/* Content Grid */}
        <div className="flex-1 p-6 pb-24">
           {/* Loading State */}
           {loading && (
             <div className="flex items-center justify-center py-20">
               <Loader2 className="w-8 h-8 animate-spin text-emerald-600" />
               <span className="ml-3 text-slate-600 font-bold">Loading experiences...</span>
             </div>
           )}

           {/* Error State */}
           {error && (
             <div className="py-20 text-center border-2 border-dashed border-red-200 rounded-3xl bg-red-50">
               <p className="text-red-600 font-bold">Error: {error}</p>
               <button onClick={() => window.location.reload()} className="mt-2 text-red-600 font-black text-sm uppercase">Retry</button>
             </div>
           )}

           {/* Content */}
           {!loading && !error && (
             <>
               {/* Section Title */}
               <div className="flex items-center gap-3 mb-6">
                  <h2 className="text-2xl font-black text-slate-900 uppercase tracking-tighter">
                    {selectedCategory === 'all' ? "Today's Inspo" : categories.find(c => c.id === selectedCategory)?.label}
                  </h2>
                  <span className="px-2 py-0.5 bg-emerald-100 text-emerald-800 text-[10px] font-bold uppercase tracking-wider rounded-full">
                     {filteredExperiences.length} Results
                  </span>
               </div>

               <div className="grid grid-cols-1 min-[450px]:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-4">
                  {filteredExperiences.map((experience) => (
                    <VideoCard 
                      key={experience.id} 
                      experience={experience} 
                      onClick={setSelectedExperience} 
                    />
                  ))}
               </div>
               
               {filteredExperiences.length === 0 && (
                 <div className="py-20 text-center border-2 border-dashed border-slate-200 rounded-3xl">
                    <p className="text-slate-400 font-bold">No experiences found in this category.</p>
                    <button onClick={() => setSelectedCategory('all')} className="mt-2 text-emerald-600 font-black text-sm uppercase">Clear Filters</button>
                 </div>
               )}

               {/* Footer - Hidden on mobile */}
               <div className="mt-20 pt-10 border-t border-slate-200 text-center hidden md:block">
                  <p className="text-slate-400 text-xs font-bold uppercase tracking-widest">© 2024 Bored Tourist Hotel Edition</p>
               </div>
             </>
           )}
        </div>

      </div>

      {/* MOBILE ONLY: Full Screen Chat */}
      {mobileFullScreenChat && (
        <div className="md:hidden fixed inset-0 z-50 bg-white">
          <ChatSection 
            userId={userId} 
            onExperienceClick={setSelectedExperience}
            isMobileFullScreen={true}
            onCloseMobileChat={() => setMobileFullScreenChat(false)}
          />
        </div>
      )}

      {/* MOBILE ONLY: Chat Button */}
      {!mobileFullScreenChat && (
        <button
          onClick={() => setMobileFullScreenChat(true)}
          className="md:hidden fixed bottom-6 right-6 z-40 w-16 h-16 bg-white border-2 border-emerald-200 rounded-full shadow-2xl flex items-center justify-center hover:border-emerald-400 transition-all overflow-hidden"
        >
          <img 
            src="https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg"
            alt="Vila Gale Concierge"
            className="w-full h-full object-cover"
          />
        </button>
      )}

      {/* Detail Modal */}
      {selectedExperience && (
        <DetailModal 
          experience={selectedExperience} 
          onClose={() => setSelectedExperience(null)} 
        />
      )}
    </div>
  );
}

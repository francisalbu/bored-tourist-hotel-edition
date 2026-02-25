import React, { useState, useMemo } from 'react';
import { CategoryFilter } from './components/CategoryFilter';
import { VideoCard } from './components/VideoCard';
import { DetailModal } from './components/DetailModal';
import { ChatSection } from './components/ChatSection';
import { MemoriesPanel } from './components/MemoriesPanel';
import { HotelPicks } from './components/HotelPicks';
import { PreArrivalCreator } from './components/PreArrivalCreator';
import { ExperienceDisplay } from './types';
import { Menu, User, Loader2, Sparkles } from 'lucide-react';
import { useExperiences, useCategories } from './hooks/useExperiences';
import { useUserMemories } from './hooks/useUserMemories';
import { HotelProvider, useHotel } from './contexts/HotelContext';

type AppView = 'discover' | 'pre-arrival';

function AppContent() {
  const hotel = useHotel();
  const [currentView, setCurrentView] = useState<AppView>('discover');
  const [selectedCategory, setSelectedCategory] = useState<string>('all');
  const [selectedExperience, setSelectedExperience] = useState<ExperienceDisplay | null>(null);
  const [showMemories, setShowMemories] = useState(false);
  const [showHotelPicks, setShowHotelPicks] = useState(false);
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

  // Render Pre-Arrival Creator view
  if (currentView === 'pre-arrival') {
    return (
      <div className="h-screen w-full flex flex-col overflow-hidden" style={{ backgroundColor: 'var(--hotel-bg)' }}>
        <PreArrivalCreator
          onBack={() => setCurrentView('discover')}
          onExperienceClick={(exp) => {
            setCurrentView('discover');
            setTimeout(() => setSelectedExperience(exp), 50);
          }}
        />
      </div>
    );
  }

  return (
    <div className="h-screen w-full text-slate-900 font-sans selection:bg-emerald-200 selection:text-emerald-900 flex flex-col md:flex-row overflow-hidden" style={{ backgroundColor: 'var(--hotel-bg, #FAFAF8)' }}>
      
      {/* DESKTOP: LEFT PANEL - Chat / Concierge */}
      <div className="hidden md:flex md:w-[45%] lg:w-[40%] xl:w-[35%] h-full border-r border-slate-200/40 z-10">
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
      <div className="flex-1 h-full overflow-y-auto relative flex flex-col pb-32 md:pb-0" style={{ backgroundColor: 'var(--hotel-bg, #FAFAF8)' }}>
        
        {/* Header */}
        <div className="sticky top-0 z-30 backdrop-blur-md px-4 md:px-12 py-4 md:py-8 border-b border-slate-200/40" style={{ backgroundColor: 'color-mix(in srgb, var(--hotel-bg, #FAFAF8) 95%, transparent)' }}>
           <div className="flex items-center justify-between">
              <div className="flex flex-col">
                <span className="text-[9px] md:text-[10px] uppercase tracking-[0.4em] text-slate-400 mb-1 md:mb-2 font-medium">{hotel.tagline}</span>
                <div className="flex items-center gap-2">
                  <span className="text-xl md:text-3xl text-slate-900 font-light tracking-tight">{hotel.location}</span>
                </div>
              </div>

              <div className="flex items-center gap-1.5 md:gap-4">
                <button 
                  onClick={() => setCurrentView('pre-arrival')}
                  className="flex items-center gap-1.5 md:gap-2 px-3 md:px-6 py-2 md:py-2.5 text-[11px] md:text-[13px] font-medium rounded-full transition-all tracking-wide hover:bg-slate-50 border border-slate-200/60 bg-white text-slate-600"
                >
                  <span>Pre-Arrival</span>
                </button>
                <button 
                  onClick={() => setShowHotelPicks(!showHotelPicks)}
                  className="hidden md:flex items-center gap-2 px-6 py-2.5 text-[13px] font-medium rounded-full transition-all tracking-wide hover:bg-slate-50 border border-slate-200/60 bg-white"
                >
                   <Sparkles size={15} strokeWidth={1.5} className={showHotelPicks ? 'text-slate-900' : 'text-slate-400'} />
                   <span className={showHotelPicks ? 'text-slate-900' : 'text-slate-600'}>
                     {showHotelPicks ? 'Hide Picks' : 'Hotel Picks'}
                   </span>
                </button>
                <button className="hidden md:flex items-center gap-2 px-6 py-2.5 text-[13px] font-medium rounded-full transition-all tracking-wide hover:bg-slate-50 border border-slate-200/60 bg-white text-slate-600">
                   <User size={15} strokeWidth={1.5} />
                   <span>My Account</span>
                </button>
              </div>
           </div>
        </div>

        {/* Filters Sticky Bar */}
        <div className="sticky top-[72px] md:top-[108px] z-20 backdrop-blur-md pb-3 md:pb-8 pt-3 md:pt-4 px-4 md:px-12" style={{ backgroundColor: 'color-mix(in srgb, var(--hotel-bg, #FAFAF8) 95%, transparent)' }}>
           <CategoryFilter 
                categories={categories}
                selectedCategory={selectedCategory}
                onSelectCategory={setSelectedCategory}
           />
        </div>

        {/* Content Grid */}
        <div className="flex-1 px-4 md:px-12 pb-24">
           {/* Hotel Picks View */}
           {showHotelPicks ? (
             <HotelPicks onExperienceClick={setSelectedExperience} />
           ) : (
             <>
               {/* Loading State */}
               {loading && (
                 <div className="flex items-center justify-center py-32">
                   <Loader2 className="w-7 h-7 animate-spin text-slate-400" strokeWidth={1.5} />
                   <span className="ml-4 text-slate-500 font-light text-sm tracking-wide">Loading experiences...</span>
                 </div>
               )}

               {/* Error State */}
               {error && (
                 <div className="py-32 text-center border border-slate-200/60 rounded-2xl bg-white">
                   <p className="text-slate-600 font-light">Error: {error}</p>
                   <button onClick={() => window.location.reload()} className="mt-4 px-6 py-2.5 text-[13px] font-medium rounded-full transition-all tracking-wide bg-slate-900 text-white shadow-sm">Retry</button>
                 </div>
               )}

               {/* Content */}
               {!loading && !error && (
             <>
               {/* Section Title */}
               <div className="flex items-center gap-3 md:gap-4 mb-6 md:mb-10">
                  <h2 className="text-2xl md:text-4xl text-slate-900 font-light tracking-tight">
                    {selectedCategory === 'all' ? "Today's Inspiration" : categories.find(c => c.id === selectedCategory)?.label}
                  </h2>
                  <span className="px-2.5 py-0.5 md:px-3 md:py-1 bg-slate-100 text-slate-600 text-[10px] md:text-[11px] font-medium tracking-wide rounded-full">
                     {filteredExperiences.length}
                  </span>
               </div>

               <div className="grid grid-cols-1 min-[450px]:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 2xl:grid-cols-4 gap-3 min-[450px]:gap-4 md:gap-5">
                  {filteredExperiences.map((experience) => (
                    <VideoCard 
                      key={experience.id} 
                      experience={experience} 
                      onClick={setSelectedExperience} 
                    />
                  ))}
               </div>
               
               {filteredExperiences.length === 0 && (
                 <div className="py-32 text-center border border-slate-200/60 rounded-2xl bg-white">
                    <p className="text-slate-500 font-light">No experiences found in this category.</p>
                    <button onClick={() => setSelectedCategory('all')} className="mt-4 px-6 py-2.5 text-[13px] font-medium rounded-full transition-all tracking-wide bg-slate-900 text-white shadow-sm">Clear Filters</button>
                 </div>
               )}

               {/* Footer - Hidden on mobile */}
           </>
           )}
               <div className="mt-32 pt-12 border-t border-slate-200/40 text-center hidden md:block">
                  <p className="text-slate-400 text-[10px] font-light uppercase tracking-[0.3em]">© 2024 Bored Tourist Hotel Edition</p>
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
          className="md:hidden fixed left-1/2 -translate-x-1/2 z-40 flex items-center gap-2.5 bg-white border border-slate-200/60 rounded-full shadow-lg px-4 py-2.5 hover:shadow-xl transition-all"
          style={{ bottom: 'max(20px, calc(env(safe-area-inset-bottom) + 8px))' }}
        >
          <div className="w-9 h-9 rounded-full overflow-hidden flex-shrink-0">
            <img 
              src={hotel.conciergeAvatarUrl || 'https://storage.googleapis.com/bored_tourist_media/images/473801429_1013077440848496_8087265659102202312_n.jpg'}
              alt={`${hotel.name} Concierge`}
              className="w-full h-full object-cover"
            />
          </div>
          <span className="text-sm font-medium text-slate-700">Ask me anything</span>
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

export default function App() {
  return (
    <HotelProvider>
      <AppContent />
    </HotelProvider>
  );
}

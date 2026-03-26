import React, { useState, useMemo, useEffect } from 'react';
import { CategoryFilter } from './components/CategoryFilter';
import { VideoCard } from './components/VideoCard';
import { DetailModal } from './components/DetailModal';
import { ChatSection } from './components/ChatSection';
import { MemoriesPanel } from './components/MemoriesPanel';
import { HotelPicks } from './components/HotelPicks';
import { PreArrivalCreator } from './components/PreArrivalCreator';
import { ExperienceDisplay } from './types';
import { Menu, X, Loader2, Sparkles, ChevronRight, Plane, Search, ArrowUpDown } from 'lucide-react';
import { useExperiences, useCategories } from './hooks/useExperiences';
import { useUserMemories } from './hooks/useUserMemories';
import { HotelProvider, useHotel } from './contexts/HotelContext';
import { useSmartSeer }            from './lib/smartseer/use-smartseer';
import { SmartBanner }             from './components/SmartSeer/SmartBanner';
import { PersonaDebugPanel }       from './components/SmartSeer/PersonaDebugPanel';

type AppView = 'discover' | 'pre-arrival';

function AppContent() {
  const hotel = useHotel();
  const [currentView, setCurrentView] = useState<AppView>('discover');
  const [selectedCategory, setSelectedCategory] = useState<string>('all');
  const [selectedExperience, setSelectedExperience] = useState<ExperienceDisplay | null>(null);
  const [showMemories, setShowMemories] = useState(false);
  const [showHotelPicks, setShowHotelPicks] = useState(false);
  const [mobileFullScreenChat, setMobileFullScreenChat] = useState(false);
  const [showDrawer, setShowDrawer] = useState(false);
  const [videoLightboxOpen, setVideoLightboxOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const [priceSort, setPriceSort] = useState<'none' | 'asc' | 'desc'>('none');

  // Detect ?exp= immediately (synchronous) so we can suppress the grid flash
  const [pendingExpId] = useState<string | null>(
    () => new URLSearchParams(window.location.search).get('exp')
  );
  
  const { experiences, loading, error } = useExperiences();
  const allCategories = useCategories();

  // SmartSeer — only active for hotels with smartseerEnabled = true (e.g. lisbon-hostel)
  const smartSeer = useSmartSeer({
    hotelId:     hotel.id,
    experiences,
    enabled:     hotel.smartseerEnabled ?? false,
  });

  // Deep-link: sync selectedExperience with ?exp= query param
  const openExperience = (exp: ExperienceDisplay | null) => {
    setSelectedExperience(exp);
    if (exp) {
      const url = new URL(window.location.href);
      url.searchParams.set('exp', String(exp.id));
      window.history.pushState({}, '', url.toString());
    } else {
      const url = new URL(window.location.href);
      url.searchParams.delete('exp');
      window.history.replaceState({}, '', url.toString());
    }
  };

  // On load: auto-open experience if ?exp= is in the URL
  useEffect(() => {
    if (!experiences.length || !pendingExpId) return;
    const found = experiences.find(e => String(e.id) === pendingExpId);
    if (found) setSelectedExperience(found);
  }, [experiences, pendingExpId]);

  // Only show categories that have at least one experience (plus 'all' and dividers)
  const categories = useMemo(() => {
    const populated = new Set(experiences.map(e => e.category));
    return allCategories.filter(cat =>
      cat.id === 'all' || cat.id === '_divider' || populated.has(cat.id)
    );
  }, [allCategories, experiences]);

  // If the selected category has no experiences (e.g. after hotel switch), reset to 'all'
  useEffect(() => {
    if (selectedCategory === 'all') return;
    const populated = new Set(experiences.map(e => e.category));
    if (!populated.has(selectedCategory)) setSelectedCategory('all');
  }, [experiences, selectedCategory]);
  
  // User memories - using a default guest session ID
  const userId = 'guest-session-' + (localStorage.getItem('guestSessionId') || (() => {
    const id = Math.random().toString(36).substring(7);
    localStorage.setItem('guestSessionId', id);
    return id;
  })());
  
  const { memory, loading: memoryLoading, downloadMemories } = useUserMemories(userId);

  // Set Viator affiliate cookie via hidden iframe on first load
  useEffect(() => {
    const cookieKey = 'viator_affiliate_set';
    if (!sessionStorage.getItem(cookieKey)) {
      const iframe = document.createElement('iframe');
      iframe.src = 'https://www.viator.com/Lisbon/d538-ttd?pid=P00285354&mcid=42383&medium=link';
      iframe.style.cssText = 'width:0;height:0;border:none;position:absolute;left:-9999px;';
      iframe.setAttribute('aria-hidden', 'true');
      iframe.setAttribute('tabindex', '-1');
      iframe.setAttribute('sandbox', 'allow-same-origin allow-scripts');
      iframe.onload = () => {
        console.log('✅ Viator affiliate cookie iframe loaded successfully');
        console.log('   PID: P00285354 | MCID: 42383');
        console.log('   Cookie window: 30 days from now');
      };
      iframe.onerror = () => {
        console.warn('⚠️ Viator affiliate iframe failed to load — cookie may not be set');
      };
      document.body.appendChild(iframe);
      sessionStorage.setItem(cookieKey, '1');
      // Remove iframe after cookie is set
      setTimeout(() => {
        iframe.remove();
        console.log('🧹 Viator affiliate iframe removed from DOM');
      }, 5000);
    } else {
      console.log('ℹ️ Viator affiliate cookie already set this session');
    }
  }, []);

  const filteredExperiences = useMemo(() => {
    let result = selectedCategory === 'all' ? smartSeer.ranked : smartSeer.ranked.filter(exp => exp.category === selectedCategory);
    
    // Search filter
    if (searchQuery.trim()) {
      const q = searchQuery.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
      result = result.filter(exp => {
        const title = (exp.title || '').toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
        const desc = (exp.description || '').toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
        const location = (exp.location || '').toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
        const tags = Array.isArray((exp as any).tags) ? (exp as any).tags.join(' ').toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '') : '';
        return title.includes(q) || desc.includes(q) || location.includes(q) || tags.includes(q);
      });
    }
    
    // Price sorting
    if (priceSort !== 'none') {
      result = [...result].sort((a, b) => priceSort === 'asc' ? a.price - b.price : b.price - a.price);
    }
    
    return result;
  }, [selectedCategory, smartSeer.ranked, searchQuery, priceSort]);

  // Render Pre-Arrival Creator view
  if (currentView === 'pre-arrival') {
    return (
      <div className="h-screen w-full flex flex-col overflow-hidden" style={{ backgroundColor: 'var(--hotel-bg)' }}>
        <PreArrivalCreator
          onBack={() => setCurrentView('discover')}
          onExperienceClick={(exp) => {
            setCurrentView('discover');
            setTimeout(() => openExperience(exp), 50);
          }}
        />
      </div>
    );
  }

  // If a deep-link ?exp= is pending and experiences haven't loaded yet,
  // show a full-screen spinner so the grid never flashes before the modal opens
  const deepLinkLoading = pendingExpId && !selectedExperience && (loading || !experiences.length);

  if (deepLinkLoading) {
    return (
      <div className="h-screen w-full flex items-center justify-center" style={{ backgroundColor: 'var(--hotel-bg, #FAFAF8)' }}>
        <Loader2 className="w-8 h-8 animate-spin text-slate-400" strokeWidth={1.5} />
      </div>
    );
  }

  return (
    <div className="h-screen w-full text-slate-900 font-sans selection:bg-emerald-200 selection:text-emerald-900 flex flex-col md:flex-row overflow-hidden" style={{ backgroundColor: 'var(--hotel-bg, #FAFAF8)' }}>
      
      {/* DESKTOP: LEFT PANEL - Chat / Concierge */}
      <div className="hidden md:flex md:w-[45%] lg:w-[40%] xl:w-[35%] h-full border-r border-slate-200/40 z-10 bg-white">
        <ChatSection onExperienceClick={openExperience} userId={userId} />
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
        <div className="sticky top-0 z-30 backdrop-blur-md px-4 md:px-12 py-3 md:py-4 border-b border-slate-200/40" style={{ backgroundColor: 'color-mix(in srgb, var(--hotel-bg, #FAFAF8) 95%, transparent)' }}>
           <div className="flex items-center justify-between">
              <div className="flex flex-col">
                <span className="text-[11px] md:text-[13px] uppercase tracking-[0.4em] text-slate-500 font-medium">{hotel.tagline}</span>
              </div>

              <button 
                onClick={() => setShowDrawer(true)}
                className="flex items-center justify-center w-10 h-10 md:w-11 md:h-11 rounded-full hover:bg-slate-100 transition-colors border border-slate-200/60 bg-white"
              >
                <Menu size={18} strokeWidth={2} className="text-slate-700" />
              </button>
           </div>
        </div>

        {/* Filters Sticky Bar */}
        <div className="sticky top-[57px] md:top-[73px] z-20 backdrop-blur-md pb-3 md:pb-6 pt-3 md:pt-4 px-4 md:px-12" style={{ backgroundColor: 'color-mix(in srgb, var(--hotel-bg, #FAFAF8) 95%, transparent)' }}>
           <CategoryFilter 
                categories={categories}
                selectedCategory={selectedCategory}
                onSelectCategory={(id) => { setSelectedCategory(id); setSearchQuery(''); setPriceSort('none'); }}
           />
           
           {/* Search Bar + Price Sort */}
           <div className="flex items-center gap-2 mt-3">
             <div className="relative flex-1">
               <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
               <input
                 type="text"
                 value={searchQuery}
                 onChange={(e) => setSearchQuery(e.target.value)}
                 placeholder="Search experiences..."
                 className="w-full pl-9 pr-8 py-2 md:py-2.5 bg-white border border-slate-200/60 rounded-full text-[13px] font-light text-slate-800 placeholder-slate-400 outline-none focus:border-slate-400 transition-colors"
               />
               {searchQuery && (
                 <button
                   onClick={() => setSearchQuery('')}
                   className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600"
                 >
                   <X size={14} />
                 </button>
               )}
             </div>
             <button
               onClick={() => setPriceSort(prev => prev === 'none' ? 'asc' : prev === 'asc' ? 'desc' : 'none')}
               className={`flex items-center gap-1.5 px-3 md:px-4 py-2 md:py-2.5 rounded-full text-[12px] md:text-[13px] font-medium tracking-wide border transition-all whitespace-nowrap ${
                 priceSort !== 'none'
                   ? 'bg-slate-900 text-white border-transparent'
                   : 'bg-white text-slate-600 border-slate-200/60 hover:bg-slate-50'
               }`}
             >
               <ArrowUpDown size={14} />
               <span className="hidden min-[450px]:inline">{priceSort === 'asc' ? '€ Low → High' : priceSort === 'desc' ? '€ High → Low' : 'Price'}</span>
               <span className="min-[450px]:hidden">{priceSort === 'asc' ? '€↑' : priceSort === 'desc' ? '€↓' : '€'}</span>
             </button>
           </div>
        </div>

        {/* Content Grid */}
        <div className="flex-1 px-4 md:px-12 pb-24">
           {/* Hotel Picks View */}
           {showHotelPicks ? (
             <HotelPicks onExperienceClick={openExperience} />
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
               {/* SmartSeer Banner — only when active and loaded */}
               {!smartSeer.loading && smartSeer.smartMessage && (
                 <div className="mb-6">
                   <SmartBanner
                     message={smartSeer.smartMessage}
                     persona={smartSeer.topPersona as any}
                     context={smartSeer.context}
                     onCtaClick={() => { setSelectedCategory('all'); setSearchQuery(''); setPriceSort('none'); }}
                   />
                 </div>
               )}

               {/* Section Title */}
               <div className="flex items-center gap-3 md:gap-4 mb-6 md:mb-10">
                  <h2 className="text-2xl md:text-4xl text-slate-900 font-light tracking-tight">
                    {searchQuery.trim()
                      ? `Results for "${searchQuery}"`
                      : selectedCategory === 'all'
                        ? "Today's Inspiration"
                        : categories.find(c => c.id === selectedCategory)?.label}
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
                      onClick={openExperience}
                      onVideoLightbox={setVideoLightboxOpen}
                    />
                  ))}
               </div>
               
               {filteredExperiences.length === 0 && (
                 <div className="py-32 text-center border border-slate-200/60 rounded-2xl bg-white">
                    <p className="text-slate-500 font-light">
                      {searchQuery.trim()
                        ? `No experiences found for "${searchQuery}".`
                        : 'No experiences found in this category.'}
                    </p>
                    <button onClick={() => { setSelectedCategory('all'); setSearchQuery(''); setPriceSort('none'); }} className="mt-4 px-6 py-2.5 text-[13px] font-medium rounded-full transition-all tracking-wide bg-slate-900 text-white shadow-sm">Clear Filters</button>
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
            onExperienceClick={openExperience}
            isMobileFullScreen={true}
            onCloseMobileChat={() => setMobileFullScreenChat(false)}
          />
        </div>
      )}

      {/* MOBILE ONLY: Chat Button - hidden when video lightbox or detail modal is open */}
      {!mobileFullScreenChat && !videoLightboxOpen && !selectedExperience && (
        <button
          onClick={() => setMobileFullScreenChat(true)}
          className="md:hidden fixed left-1/2 -translate-x-1/2 z-40 flex items-center gap-2.5 bg-white border border-slate-200/60 rounded-full shadow-lg px-4 py-2.5 hover:shadow-xl transition-all"
          style={{ bottom: 'max(20px, calc(env(safe-area-inset-bottom) + 8px))' }}
        >
          <div className="w-9 h-9 rounded-full overflow-hidden flex-shrink-0">
            <img 
              src={hotel.conciergeAvatarUrl || 'https://storage.googleapis.com/bored_tourist_media/images/hotel.webp'}
              alt={`${hotel.name} Concierge`}
              className="w-full h-full object-cover"
            />
          </div>
          <span className="text-sm font-medium text-slate-700">Ask me anything</span>
        </button>
      )}

      {/* ─── Side Drawer ─── */}
      {showDrawer && (
        <>
          {/* Backdrop */}
          <div 
            className="fixed inset-0 z-[60] bg-black/40 backdrop-blur-sm transition-opacity"
            onClick={() => setShowDrawer(false)}
          />
          {/* Drawer panel */}
          <div className="fixed top-0 right-0 bottom-0 z-[61] w-[280px] sm:w-[320px] bg-white shadow-2xl flex flex-col animate-slide-in-right">
            {/* Drawer header */}
            <div className="flex items-center justify-between px-5 py-5 border-b border-slate-100">
              <span className="text-[14px] font-semibold text-slate-800 tracking-tight">{hotel.name}</span>
              <button 
                onClick={() => setShowDrawer(false)}
                className="w-8 h-8 flex items-center justify-center rounded-full hover:bg-slate-100 transition-colors"
              >
                <X size={18} strokeWidth={2} className="text-slate-500" />
              </button>
            </div>

            {/* Drawer items */}
            <div className="flex-1 overflow-y-auto py-4 px-3">
              {/* Pre-Arrival Planner */}
              <button
                onClick={() => { setShowDrawer(false); setCurrentView('pre-arrival'); }}
                className="w-full flex items-center gap-3 px-3 py-3 rounded-xl hover:bg-slate-50 transition-colors text-left group"
              >
                <div className="w-8 h-8 rounded-lg bg-emerald-50 flex items-center justify-center flex-shrink-0">
                  <Plane size={15} className="text-emerald-600" />
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-[13px] font-medium text-slate-800">Pre-Arrival Planner</p>
                  <p className="text-[11px] text-slate-400">Plan your stay before you arrive</p>
                </div>
                <ChevronRight size={14} className="text-slate-300 group-hover:text-slate-400 flex-shrink-0" />
              </button>
            </div>

            {/* Drawer footer */}
            <div className="px-5 py-5 border-t border-slate-100">
              <p className="text-[10px] text-slate-300 uppercase tracking-[0.2em] text-center">Powered by Bored Tourist</p>
            </div>
          </div>
        </>
      )}

      {/* Detail Modal */}
      {selectedExperience && (
        <DetailModal 
          experience={selectedExperience} 
          onClose={() => openExperience(null)} 
        />
      )}

      {/* SmartSeer Debug Panel — visible only with ?debug=smartseer */}
      <PersonaDebugPanel
        session={smartSeer.session}
        personaScores={smartSeer.personaScores}
        topPersona={smartSeer.topPersona}
        context={smartSeer.context}
        loading={smartSeer.loading}
      />
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

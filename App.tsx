import React, { useState, useMemo } from 'react';
import { CategoryFilter } from './components/CategoryFilter';
import { VideoCard } from './components/VideoCard';
import { DetailModal } from './components/DetailModal';
import { ChatSection } from './components/ChatSection';
import { ExperienceDisplay } from './types';
import { Menu, Globe, User, Loader2 } from 'lucide-react';
import { useExperiences, useCategories } from './hooks/useExperiences';

export default function App() {
  const [selectedCategory, setSelectedCategory] = useState<string>('all');
  const [selectedExperience, setSelectedExperience] = useState<ExperienceDisplay | null>(null);
  
  const { experiences, loading, error } = useExperiences();
  const categories = useCategories();

  const filteredExperiences = useMemo(() => {
    if (selectedCategory === 'all') return experiences;
    return experiences.filter(exp => exp.category === selectedCategory);
  }, [selectedCategory, experiences]);

  return (
    <div className="h-screen w-full bg-white text-slate-900 font-sans selection:bg-emerald-200 selection:text-emerald-900 flex flex-col md:flex-row overflow-hidden">
      
      {/* LEFT PANEL: Chat / Concierge */}
      <div className="w-full md:w-[45%] lg:w-[40%] xl:w-[35%] h-full border-r border-slate-200 z-10 shadow-xl md:shadow-none">
        <ChatSection />
      </div>

      {/* RIGHT PANEL: Video Feed */}
      <div className="flex-1 h-full bg-slate-50 overflow-y-auto relative flex flex-col">
        
        {/* Header Overlay (Mobile Menu + Desktop Actions) */}
        <div className="sticky top-0 z-30 bg-slate-50/95 backdrop-blur-md px-6 py-4 border-b border-slate-200 flex items-center justify-between">
           <div className="flex flex-col">
              <span className="text-xs font-bold uppercase tracking-widest text-slate-400">Discover</span>
              <div className="flex items-center gap-1 cursor-pointer hover:opacity-70 transition-opacity">
                <span className="font-black text-lg tracking-tight">Lisbon & Surroundings</span>
                <Globe size={14} className="text-emerald-600" />
              </div>
           </div>

           <div className="flex items-center gap-4">
              <button className="hidden sm:flex items-center gap-2 px-4 py-2 bg-white border-2 border-slate-200 rounded-full text-xs font-bold uppercase tracking-wider hover:border-black transition-colors">
                 <User size={14} />
                 <span>My Account</span>
              </button>
              <button className="sm:hidden p-2 text-slate-900">
                <Menu size={24} />
              </button>
           </div>
        </div>

        {/* Filters Sticky Bar */}
        <div className="sticky top-[73px] z-20 bg-slate-50/95 backdrop-blur-md pb-4 pt-2 px-6 border-b border-slate-100/50">
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

               {/* Simple Footer for Right Panel */}
               <div className="mt-20 pt-10 border-t border-slate-200 text-center">
                  <p className="text-slate-400 text-xs font-bold uppercase tracking-widest">© 2024 Bored Tourist Hotel Edition</p>
               </div>
             </>
           )}
        </div>

      </div>

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

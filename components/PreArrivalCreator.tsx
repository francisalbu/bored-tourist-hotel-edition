import React, { useState, useMemo, useRef, useCallback } from 'react';
import {
  ArrowLeft,
  Clock,
  Star,
  Play,
  ChevronRight,
  Check,
  RotateCcw,
  User,
  Users,
  Leaf,
  Zap,
  Utensils,
  Moon,
  Camera,
  Heart,
  Bike,
  SlidersHorizontal,
} from 'lucide-react';
import { useExperiences } from '../hooks/useExperiences';
import { useHotel } from '../contexts/HotelContext';
import { ExperienceDisplay } from '../types';
import { ChatSection } from './ChatSection';

// ─── Types ────────────────────────────────────────────────────────────────────

interface GuestInfo {
  name: string;
  hotel: string;
  checkIn: string;
  checkOut: string;
  guests: number;
  nights: number;
}

interface QuizAnswers {
  styles: string[];
  group: string;
  budget: string;
  energy: string;
}

// ─── Quiz Question Definitions ────────────────────────────────────────────────

const STYLE_OPTIONS = [
  { id: 'adventure', label: 'Adventure',    icon: Zap,      categories: ['Outdoors', 'Sports', 'Micro Adventures'] },
  { id: 'culture',   label: 'Culture',       icon: Camera,   categories: ['Culture Dive', 'Time Stories'] },
  { id: 'food',      label: 'Food & Wine',   icon: Utensils, categories: ['Local Cooking'] },
  { id: 'nature',    label: 'Nature',        icon: Leaf,     categories: ['Outdoors'] },
  { id: 'nightlife', label: 'Nightlife',     icon: Moon,     categories: ['Night Explorer'] },
  { id: 'wellness',  label: 'Slow & Easy',   icon: Heart,    categories: ['Mind & Body', 'Outdoors'] },
];

const GROUP_OPTIONS = [
  { id: 'solo',    label: 'Just me',           icon: User },
  { id: 'couple',  label: 'Couple',            icon: Heart },
  { id: 'family',  label: 'Family with kids',  icon: Users },
  { id: 'friends', label: 'Group of friends',  icon: Zap },
];

const BUDGET_OPTIONS = [
  { id: 'budget',  label: 'Up to €40',   sub: 'Great value',         max: 40 },
  { id: 'mid',     label: '€40 – €100',  sub: 'Best selection',      min: 40,  max: 100 },
  { id: 'premium', label: '€100+',       sub: 'Premium & exclusive', min: 100 },
];

const ENERGY_OPTIONS = [
  { id: 'easy',     label: 'Easy going',   sub: 'Leisurely pace',       icon: Heart },
  { id: 'moderate', label: 'Moderate',     sub: 'Some walking / effort', icon: Bike },
  { id: 'active',   label: 'Very active',  sub: 'Push your limits',     icon: Zap },
];

// ─── Scoring ──────────────────────────────────────────────────────────────────

function scoreExperience(exp: ExperienceDisplay, answers: QuizAnswers): number {
  let score = 0;
  for (const styleId of answers.styles) {
    const opt = STYLE_OPTIONS.find((s) => s.id === styleId);
    if (opt?.categories.some((c) => exp.category.toLowerCase().includes(c.toLowerCase()))) {
      score += 30;
    }
  }
  const budget = BUDGET_OPTIONS.find((b) => b.id === answers.budget);
  if (budget) {
    const inRange =
      (budget.min === undefined || exp.price >= budget.min) &&
      (budget.max === undefined || exp.price <= budget.max);
    score += inRange ? 20 : -10;
  }
  const durationHours = parseFloat(exp.duration) || 2;
  if (answers.energy === 'easy' && durationHours <= 2) score += 10;
  if (answers.energy === 'moderate' && durationHours > 1 && durationHours <= 4) score += 10;
  if (answers.energy === 'active' && durationHours > 3) score += 10;
  if (answers.group === 'family' && exp.maxGroupSize && exp.maxGroupSize >= 4) score += 5;
  if (answers.group === 'couple' && durationHours <= 3) score += 5;
  return score;
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

function readGuestFromUrl(): GuestInfo {
  const p = new URLSearchParams(window.location.search);
  return {
    name:    p.get('name')    || 'Alex Johnson',
    hotel:   p.get('hotel')   || 'Vila Galé Ópera',
    checkIn: p.get('checkin') || '2026-06-18',
    checkOut:p.get('checkout')|| '2026-06-22',
    guests:  parseInt(p.get('guests') || '3', 10),
    nights:  parseInt(p.get('nights') || '4', 10),
  };
}

function formatDate(iso: string) {
  return new Date(iso).toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric' });
}

// ─── Experience Card ──────────────────────────────────────────────────────────

function ExperienceCard({
  experience,
  onClick,
}: {
  experience: ExperienceDisplay;
  onClick: (e: ExperienceDisplay) => void;
}) {
  const videoRef = useRef<HTMLVideoElement>(null);
  const [playing, setPlaying] = useState(false);

  const onEnter = () => videoRef.current?.play().then(() => setPlaying(true)).catch(() => {});
  const onLeave = () => {
    if (videoRef.current) { videoRef.current.pause(); videoRef.current.currentTime = 0; }
    setPlaying(false);
  };

  return (
    <div className="group cursor-pointer" onMouseEnter={onEnter} onMouseLeave={onLeave} onClick={() => onClick(experience)}>
      <div className="relative aspect-[3/4] overflow-hidden rounded-2xl bg-slate-900 shadow-sm group-hover:shadow-lg transition-shadow duration-300">
        {experience.videoUrl && (
          <video ref={videoRef} src={experience.videoUrl}
            className={`absolute inset-0 w-full h-full object-cover transition-opacity duration-300 ${playing ? 'opacity-100' : 'opacity-0'}`}
            muted loop playsInline />
        )}
        <img src={experience.imageUrl} alt={experience.title}
          className={`absolute inset-0 w-full h-full object-cover transition-transform duration-700 group-hover:scale-105 ${playing ? 'opacity-0' : 'opacity-100'}`}
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/10 to-transparent" />
        <div className={`absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-12 h-12 rounded-full bg-white/15 backdrop-blur-sm flex items-center justify-center text-white transition-all ${playing ? 'opacity-0 scale-150' : 'opacity-100'}`}>
          <Play size={16} fill="currentColor" className="ml-0.5" strokeWidth={0} />
        </div>
        <div className="absolute bottom-0 left-0 right-0 p-4">
          <h3 className="text-white font-medium text-[14px] leading-tight mb-2 line-clamp-2">{experience.title}</h3>
          <div className="flex items-end justify-between gap-2">
            <div className="flex items-center gap-2 text-white/60 text-[11px]">
              <span className="flex items-center gap-1"><Clock size={10} strokeWidth={2} />{experience.duration}</span>
              <span className="flex items-center gap-1"><Star size={10} className="text-amber-400" fill="currentColor" strokeWidth={0} />{experience.rating}</span>
            </div>
            <div className="text-right">
              <div className="text-white/50 text-[9px] uppercase tracking-wider">From</div>
              <div className="text-white text-lg font-semibold leading-none">€{Math.round(experience.price)}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────────

interface PreArrivalCreatorProps {
  onBack?: () => void;
  onExperienceClick?: (experience: ExperienceDisplay) => void;
}

type Screen = 'welcome' | 'quiz' | 'results';

export function PreArrivalCreator({ onBack, onExperienceClick }: PreArrivalCreatorProps) {
  const hotel = useHotel();
  const { experiences } = useExperiences();
  const guest = useMemo(readGuestFromUrl, []);

  const [screen, setScreen] = useState<Screen>('welcome');
  const [quizStep, setQuizStep] = useState(0);
  const [answers, setAnswers] = useState<QuizAnswers>({ styles: [], group: '', budget: '', energy: '' });
  const [activeTab, setActiveTab] = useState<string>('for-you');
  const [showChat, setShowChat] = useState(false);

  const totalSteps = 4;

  const scoredExperiences = useMemo(() => {
    if (answers.styles.length === 0) return experiences;
    return [...experiences]
      .map((e) => ({ exp: e, score: scoreExperience(e, answers) }))
      .sort((a, b) => b.score - a.score)
      .map((x) => x.exp);
  }, [experiences, answers]);

  const TABS = useMemo(() => {
    return ['For You', ...new Set(experiences.map((e) => e.category))].slice(0, 7);
  }, [experiences]);

  const displayedExperiences = useMemo(() => {
    if (activeTab === 'for-you') return scoredExperiences;
    return experiences.filter((e) => e.category.toLowerCase() === activeTab.toLowerCase());
  }, [activeTab, scoredExperiences, experiences]);

  const toggleStyle = useCallback((id: string) => {
    setAnswers((prev) => ({
      ...prev,
      styles: prev.styles.includes(id) ? prev.styles.filter((s) => s !== id) : [...prev.styles, id],
    }));
  }, []);

  const canAdvance = () => {
    if (quizStep === 0) return answers.styles.length > 0;
    if (quizStep === 1) return answers.group !== '';
    if (quizStep === 2) return answers.budget !== '';
    if (quizStep === 3) return answers.energy !== '';
    return false;
  };

  const nextStep = () => {
    if (quizStep < totalSteps - 1) setQuizStep(quizStep + 1);
    else { setScreen('results'); setActiveTab('for-you'); }
  };

  const prevStep = () => {
    if (quizStep > 0) setQuizStep(quizStep - 1);
    else setScreen('welcome');
  };

  const resetQuiz = () => {
    setAnswers({ styles: [], group: '', budget: '', energy: '' });
    setQuizStep(0);
    setScreen('quiz');
  };

  // ─── WELCOME ───────────────────────────────────────────────────────────────
  if (screen === 'welcome') {
    return (
      <div className="h-full overflow-y-auto" style={{ backgroundColor: 'var(--hotel-bg)' }}>
        {/* Chat panel — left side on desktop, full screen on mobile */}
        {showChat && (
          <div className="fixed inset-0 z-50 flex">
            {/* Backdrop (click to close) */}
            <div
              className="hidden md:block absolute inset-0 bg-black/30 backdrop-blur-sm"
              onClick={() => setShowChat(false)}
            />
            {/* Panel */}
            <div
              className="relative z-10 w-full md:w-[480px] lg:w-[520px] h-full bg-white shadow-2xl flex flex-col"
              style={{ animation: 'slideInLeft 0.25s cubic-bezier(0.32,0.72,0,1)' }}
            >
              <ChatSection
                userId={`pre-arrival-${guest.name.replace(/\s+/g, '-').toLowerCase()}`}
                onExperienceClick={(exp) => {
                  setShowChat(false);
                  onExperienceClick?.(exp);
                }}
                isMobileFullScreen={true}
                onCloseMobileChat={() => setShowChat(false)}
              />
            </div>
          </div>
        )}

        {/* Top bar */}
        <div className="flex items-center justify-between px-6 md:px-12 py-5 border-b border-slate-200/40">
          {onBack
            ? <button onClick={onBack} className="flex items-center gap-2 text-slate-500 hover:text-slate-900 transition-colors text-sm"><ArrowLeft size={16} strokeWidth={1.5} />Back</button>
            : <div />
          }
          <div className="flex items-center gap-3">
            <button
              onClick={() => setShowChat(true)}
              className="flex items-center gap-2 px-4 py-2 rounded-full text-[13px] font-medium border border-slate-200/60 bg-white text-slate-600 hover:bg-slate-50 transition-all shadow-sm"
            >
              <span>💬</span>
              Ask our AI concierge
            </button>
            <span className="text-sm font-medium text-slate-400">{hotel.name}</span>
          </div>
        </div>

        <div className="max-w-6xl mx-auto px-6 md:px-12 py-10">
          {/* Welcome header — single line */}
          <div className="mb-8">
            <h1 className="text-2xl md:text-3xl text-slate-900 font-light leading-tight">
              Welcome, <em className="not-italic font-semibold" style={{ fontFamily: 'var(--hotel-font-heading)' }}>{guest.name}</em>
            </h1>
            <div className="flex items-center gap-5 mt-2 text-slate-400 text-sm font-light flex-wrap">
              <span className="flex items-center gap-1.5"><Clock size={12} strokeWidth={1.5} />{guest.nights} nights · {formatDate(guest.checkIn)} → {formatDate(guest.checkOut)}</span>
              <span className="flex items-center gap-1.5"><Users size={12} strokeWidth={1.5} />{guest.guests} {guest.guests === 1 ? 'guest' : 'guests'}</span>
            </div>
            <p className="mt-3 text-slate-500 text-[14px] font-light leading-relaxed">
              We're delighted to have you at <span className="text-slate-700 font-medium">{guest.hotel}</span>, we've put together a curated selection of experiences for your stay.
            </p>
          </div>

          {/* Personalise CTA — prominent inline card */}
          <div
            className="rounded-2xl p-5 mb-8 cursor-pointer group transition-all hover:opacity-95 hover:shadow-xl shadow-lg"
            style={{ backgroundColor: 'var(--hotel-primary)' }}
            onClick={() => setScreen('quiz')}
          >
            <div className="flex items-center justify-between gap-4">
              <div className="flex items-center gap-4">
                <div className="w-10 h-10 rounded-full bg-white/15 flex items-center justify-center flex-shrink-0">
                  <SlidersHorizontal size={17} strokeWidth={2} className="text-white" />
                </div>
                <div>
                  <p className="text-white font-semibold text-[15px] leading-snug">Personalise your experience</p>
                  <p className="text-white/55 text-[12px] mt-0.5">4 quick questions · we'll rank everything to match your style</p>
                </div>
              </div>
              <div className="flex items-center gap-2 flex-shrink-0">
                {['Style', 'Group', 'Budget', 'Pace'].map((label) => (
                  <span key={label} className="hidden sm:block text-[10px] text-white/40 bg-white/10 px-2 py-0.5 rounded-full">{label}</span>
                ))}
                <div className="w-8 h-8 rounded-full bg-white/15 flex items-center justify-center group-hover:bg-white/25 transition-colors">
                  <ChevronRight size={16} strokeWidth={2} className="text-white" />
                </div>
              </div>
            </div>
          </div>

          {/* Activities grid — all clickable */}
          <div className="flex items-center justify-between mb-5">
            <h2 className="text-lg font-medium text-slate-700">
              All experiences
              <span className="ml-2 text-sm font-normal text-slate-400">{experiences.length}</span>
            </h2>
          </div>
          <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4">
            {experiences.map((exp) => (
              <ExperienceCard key={exp.id} experience={exp} onClick={onExperienceClick ?? (() => {})} />
            ))}
          </div>
        </div>
      </div>
    );
  }

  // ─── QUIZ ──────────────────────────────────────────────────────────────────
  if (screen === 'quiz') {
    return (
      <div className="h-full overflow-y-auto" style={{ backgroundColor: 'var(--hotel-bg)' }}>
        <div className="flex items-center justify-between px-6 md:px-12 py-5 border-b border-slate-200/40">
          <button onClick={prevStep} className="flex items-center gap-2 text-slate-500 hover:text-slate-900 transition-colors text-sm">
            <ArrowLeft size={16} strokeWidth={1.5} />Back
          </button>
          <div className="flex items-center gap-1.5">
            {Array.from({ length: totalSteps }).map((_, i) => (
              <div key={i} className="h-1 rounded-full transition-all duration-300"
                style={{ width: i === quizStep ? '24px' : '8px', backgroundColor: i <= quizStep ? 'var(--hotel-primary)' : '#e2e8f0' }} />
            ))}
          </div>
          <span className="text-xs text-slate-400">{quizStep + 1} / {totalSteps}</span>
        </div>

        <div className="max-w-2xl mx-auto px-6 py-12 md:py-20">

          {quizStep === 0 && (
            <div>
              <p className="text-[11px] uppercase tracking-[0.2em] text-slate-400 mb-3">Step 1 of 4</p>
              <h2 className="text-2xl md:text-3xl font-semibold text-slate-900 mb-2">What kind of experiences are you drawn to?</h2>
              <p className="text-slate-400 text-sm mb-8">Select all that apply</p>
              <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
                {STYLE_OPTIONS.map(({ id, label, icon: Icon }) => {
                  const selected = answers.styles.includes(id);
                  return (
                    <button key={id} onClick={() => toggleStyle(id)}
                      className={`relative flex flex-col items-center gap-3 p-5 rounded-2xl border-2 transition-all duration-200 ${selected ? 'border-transparent shadow-lg' : 'border-slate-200/60 bg-white hover:border-slate-300'}`}
                      style={selected ? { backgroundColor: 'var(--hotel-primary)' } : {}}>
                      {selected && (
                        <div className="absolute top-2.5 right-2.5 w-5 h-5 rounded-full bg-white/20 flex items-center justify-center">
                          <Check size={11} strokeWidth={2.5} color="white" />
                        </div>
                      )}
                      <Icon size={22} strokeWidth={1.5} style={{ color: selected ? 'white' : 'var(--hotel-primary)' }} />
                      <span className={`text-sm font-medium ${selected ? 'text-white' : 'text-slate-700'}`}>{label}</span>
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          {quizStep === 1 && (
            <div>
              <p className="text-[11px] uppercase tracking-[0.2em] text-slate-400 mb-3">Step 2 of 4</p>
              <h2 className="text-2xl md:text-3xl font-semibold text-slate-900 mb-2">Who's joining you?</h2>
              <p className="text-slate-400 text-sm mb-8">We'll tailor group-friendly options</p>
              <div className="grid grid-cols-2 gap-3">
                {GROUP_OPTIONS.map(({ id, label, icon: Icon }) => {
                  const selected = answers.group === id;
                  return (
                    <button key={id} onClick={() => setAnswers((p) => ({ ...p, group: id }))}
                      className={`relative flex flex-col items-center gap-3 p-5 rounded-2xl border-2 transition-all duration-200 ${selected ? 'border-transparent shadow-lg' : 'border-slate-200/60 bg-white hover:border-slate-300'}`}
                      style={selected ? { backgroundColor: 'var(--hotel-primary)' } : {}}>
                      {selected && (
                        <div className="absolute top-2.5 right-2.5 w-5 h-5 rounded-full bg-white/20 flex items-center justify-center">
                          <Check size={11} strokeWidth={2.5} color="white" />
                        </div>
                      )}
                      <Icon size={22} strokeWidth={1.5} style={{ color: selected ? 'white' : 'var(--hotel-primary)' }} />
                      <span className={`text-sm font-medium ${selected ? 'text-white' : 'text-slate-700'}`}>{label}</span>
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          {quizStep === 2 && (
            <div>
              <p className="text-[11px] uppercase tracking-[0.2em] text-slate-400 mb-3">Step 3 of 4</p>
              <h2 className="text-2xl md:text-3xl font-semibold text-slate-900 mb-2">What's your budget per activity?</h2>
              <p className="text-slate-400 text-sm mb-8">Per person</p>
              <div className="flex flex-col gap-3">
                {BUDGET_OPTIONS.map(({ id, label, sub }) => {
                  const selected = answers.budget === id;
                  return (
                    <button key={id} onClick={() => setAnswers((p) => ({ ...p, budget: id }))}
                      className={`flex items-center justify-between px-6 py-5 rounded-2xl border-2 transition-all duration-200 ${selected ? 'border-transparent shadow-lg' : 'border-slate-200/60 bg-white hover:border-slate-300'}`}
                      style={selected ? { backgroundColor: 'var(--hotel-primary)' } : {}}>
                      <div className="text-left">
                        <div className={`text-base font-semibold ${selected ? 'text-white' : 'text-slate-800'}`}>{label}</div>
                        <div className={`text-xs mt-0.5 ${selected ? 'text-white/70' : 'text-slate-400'}`}>{sub}</div>
                      </div>
                      <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center ${selected ? 'border-white bg-white/20' : 'border-slate-300'}`}>
                        {selected && <Check size={11} strokeWidth={3} color="white" />}
                      </div>
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          {quizStep === 3 && (
            <div>
              <p className="text-[11px] uppercase tracking-[0.2em] text-slate-400 mb-3">Step 4 of 4</p>
              <h2 className="text-2xl md:text-3xl font-semibold text-slate-900 mb-2">How active do you like to be?</h2>
              <p className="text-slate-400 text-sm mb-8">Helps us match the right pace</p>
              <div className="flex flex-col gap-3">
                {ENERGY_OPTIONS.map(({ id, label, sub, icon: Icon }) => {
                  const selected = answers.energy === id;
                  return (
                    <button key={id} onClick={() => setAnswers((p) => ({ ...p, energy: id }))}
                      className={`flex items-center gap-5 px-6 py-5 rounded-2xl border-2 transition-all duration-200 ${selected ? 'border-transparent shadow-lg' : 'border-slate-200/60 bg-white hover:border-slate-300'}`}
                      style={selected ? { backgroundColor: 'var(--hotel-primary)' } : {}}>
                      <Icon size={22} strokeWidth={1.5} style={{ color: selected ? 'white' : 'var(--hotel-primary)' }} />
                      <div className="text-left flex-1">
                        <div className={`text-base font-semibold ${selected ? 'text-white' : 'text-slate-800'}`}>{label}</div>
                        <div className={`text-xs mt-0.5 ${selected ? 'text-white/70' : 'text-slate-400'}`}>{sub}</div>
                      </div>
                      <div className={`w-5 h-5 rounded-full border-2 flex items-center justify-center ${selected ? 'border-white bg-white/20' : 'border-slate-300'}`}>
                        {selected && <Check size={11} strokeWidth={3} color="white" />}
                      </div>
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          <div className="mt-10 flex justify-end">
            <button
              onClick={nextStep}
              disabled={!canAdvance()}
              className="flex items-center gap-2 px-8 py-3.5 rounded-full text-[14px] font-semibold text-white transition-all disabled:opacity-30 disabled:cursor-not-allowed hover:opacity-90 shadow-md"
              style={{ backgroundColor: 'var(--hotel-primary)' }}
            >
              {quizStep < totalSteps - 1 ? 'Continue' : 'Show my experiences'}
              <ChevronRight size={16} strokeWidth={2} />
            </button>
          </div>
        </div>
      </div>
    );
  }

  // ─── RESULTS ───────────────────────────────────────────────────────────────
  const hasPersonalised = answers.styles.length > 0;

  return (
    <div className="h-full overflow-y-auto" style={{ backgroundColor: 'var(--hotel-bg)' }}>
      {/* Chat panel */}
      {showChat && (
        <div className="fixed inset-0 z-50 flex">
          <div className="hidden md:block absolute inset-0 bg-black/30 backdrop-blur-sm" onClick={() => setShowChat(false)} />
          <div className="relative z-10 w-full md:w-[480px] lg:w-[520px] h-full bg-white shadow-2xl flex flex-col" style={{ animation: 'slideInLeft 0.25s cubic-bezier(0.32,0.72,0,1)' }}>
            <ChatSection
              userId={`pre-arrival-${guest.name.replace(/\s+/g, '-').toLowerCase()}`}
              onExperienceClick={(exp) => { setShowChat(false); onExperienceClick?.(exp); }}
              isMobileFullScreen={true}
              onCloseMobileChat={() => setShowChat(false)}
            />
          </div>
        </div>
      )}

      <div className="flex items-center justify-between px-6 md:px-12 py-5 border-b border-slate-200/40">
        <button onClick={() => setScreen('welcome')} className="flex items-center gap-2 text-slate-500 hover:text-slate-900 transition-colors text-sm">
          <ArrowLeft size={16} strokeWidth={1.5} />Back
        </button>
        <div className="flex items-center gap-3">
          <button
            onClick={() => setShowChat(true)}
            className="flex items-center gap-2 px-4 py-2 rounded-full text-[13px] font-medium border border-slate-200/60 bg-white text-slate-600 hover:bg-slate-50 transition-all shadow-sm"
          >
            <span>💬</span>
            Ask our AI concierge
          </button>
          <span className="text-sm font-medium text-slate-400">{hotel.name}</span>
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-6 md:px-12 py-12">
        {/* Header strip */}
        <div className="mb-10 flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4">
          <div>
            <p className="text-[10px] uppercase tracking-[0.4em] text-slate-400 mb-2">
              {guest.nights} nights · {formatDate(guest.checkIn)}
            </p>
            <h1 className="text-3xl md:text-4xl font-light text-slate-900 leading-tight">
              {hasPersonalised
                ? <>Curated for <em className="not-italic font-semibold" style={{ fontFamily: 'var(--hotel-font-heading)' }}>{guest.name.split(' ')[0]}</em></>
                : <>Welcome, <em className="not-italic font-semibold" style={{ fontFamily: 'var(--hotel-font-heading)' }}>{guest.name.split(' ')[0]}</em></>
              }
            </h1>
            {hasPersonalised && (
              <p className="text-slate-400 text-sm mt-1.5">
                Based on your preferences · {displayedExperiences.length} experiences
              </p>
            )}
          </div>
          <button
            onClick={resetQuiz}
            className="flex items-center gap-2 px-5 py-2.5 rounded-full text-[13px] font-medium bg-white border border-slate-200/60 text-slate-600 hover:bg-slate-50 transition-all self-start sm:self-auto whitespace-nowrap"
          >
            <RotateCcw size={13} strokeWidth={2} />
            {hasPersonalised ? 'Adjust preferences' : 'Personalise'}
          </button>
        </div>

        {/* Category tabs */}
        <div className="flex overflow-x-auto gap-2 mb-8 pb-1 no-scrollbar">
          {TABS.map((tab) => {
            const id = tab === 'For You' ? 'for-you' : tab;
            const isActive = activeTab === id;
            return (
              <button key={id} onClick={() => setActiveTab(id)}
                className={`px-5 py-2 text-[13px] font-medium rounded-full whitespace-nowrap transition-all border ${isActive ? 'border-transparent shadow-sm' : 'bg-white text-slate-600 border-slate-200/60 hover:bg-slate-50'}`}
                style={isActive ? { backgroundColor: 'var(--hotel-primary)', color: 'var(--hotel-primary-text)' } : {}}>
                {tab}
              </button>
            );
          })}
        </div>

        {/* Grid */}
        {displayedExperiences.length === 0 ? (
          <div className="py-24 text-center text-slate-400 font-light">No experiences found for this filter.</div>
        ) : (
          <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4">
            {displayedExperiences.map((exp) => (
              <ExperienceCard key={exp.id} experience={exp} onClick={onExperienceClick ?? (() => {})} />
            ))}
          </div>
        )}
      </div>
    </div>
  );
}

import { TAG_WEIGHTS, CATEGORY_WEIGHTS, PersonaScore, PersonaKey, emptyPersonaScore } from './personas';

export type ScoringEventType =
  | 'click' | 'scroll_pause' | 'hover' | 'booking_start'
  | 'card_dismiss' | 'fast_scroll' | 'scroll_skip';

export type ScoringEvent = {
  type:         ScoringEventType;
  experienceId: string;
  tags:         string[];
  category:     string;
  price:        number;
  durationH:    number;
  timestamp:    number;
};

const EVENT_MULTIPLIER: Record<ScoringEventType, number> = {
  booking_start:  3.0,
  click:          1.5,
  scroll_pause:   1.0,
  hover:          0.5,
  card_dismiss:  -2.0,
  fast_scroll:   -0.5,
  scroll_skip:   -1.0,
};

export const NEGATIVE_EVENTS = new Set<ScoringEventType>(['card_dismiss', 'fast_scroll', 'scroll_skip']);

export function isNegativeEvent(type: ScoringEventType): boolean {
  return NEGATIVE_EVENTS.has(type);
}

export function scoreEvent(current: PersonaScore, event: ScoringEvent): PersonaScore {
  const updated    = { ...current };
  const multiplier = EVENT_MULTIPLIER[event.type];

  for (const tag of event.tags) {
    const weights = TAG_WEIGHTS[tag];
    if (!weights) continue;
    for (const [persona, pts] of Object.entries(weights) as [PersonaKey, number][]) {
      updated[persona] = Math.max(0, (updated[persona] ?? 0) + pts * multiplier);
    }
  }

  const catWeights = CATEGORY_WEIGHTS[event.category];
  if (catWeights) {
    for (const [persona, pts] of Object.entries(catWeights) as [PersonaKey, number][]) {
      updated[persona] = Math.max(0, (updated[persona] ?? 0) + pts * multiplier);
    }
  }

  return updated;
}

export type SessionSignals = {
  accessHour:      number;
  isWeekday:       boolean;
  originCountry:   string;
  spendingProfile: 'premium' | 'mid' | 'budget';
};

export function applySessionBoosters(signals: SessionSignals): PersonaScore {
  const scores = emptyPersonaScore();

  if (signals.isWeekday && signals.accessHour >= 9 && signals.accessHour <= 17) {
    scores.digital_nomad += 25;
  }

  const LONG_HAUL = ['US', 'CA', 'JP', 'AU', 'CN', 'KR', 'BR', 'MX', 'IN', 'SG', 'ZA', 'AR'];
  if (LONG_HAUL.includes(signals.originCountry)) {
    scores.culture_buff += 20; scores.nature_lover += 10; scores.adrenaline_junkie += 10;
  }

  if (['NO', 'SE', 'FI', 'DK', 'IS'].includes(signals.originCountry)) {
    scores.nature_lover += 25; scores.adrenaline_junkie += 15; scores.chill_foodie += 10;
  }

  if (['DE', 'NL', 'BE', 'PL', 'CZ', 'AT', 'HU', 'RO'].includes(signals.originCountry)) {
    scores.social_butterfly += 15; scores.budget_explorer += 15;
  }

  if (['GB', 'IE'].includes(signals.originCountry)) {
    scores.social_butterfly += 20; scores.adrenaline_junkie += 10;
  }

  if (['ES', 'FR', 'IT'].includes(signals.originCountry)) {
    scores.chill_foodie += 20; scores.culture_buff += 15;
  }

  if (signals.spendingProfile === 'budget')  { scores.budget_explorer  += 30; }
  if (signals.spendingProfile === 'premium') { scores.chill_foodie += 15; scores.adrenaline_junkie += 10; }

  return scores;
}

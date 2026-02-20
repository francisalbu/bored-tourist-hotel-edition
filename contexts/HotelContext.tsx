import React, { createContext, useContext, useEffect, useState } from 'react';
import { HotelConfig, getHotelConfig, fetchHotelConfigFromDB } from '../lib/hotelConfig';

const HotelContext = createContext<HotelConfig | null>(null);

/**
 * Wraps the app and injects the active hotel's CSS variables + Google Fonts.
 * 
 * On mount:
 *  1. Immediately uses the local fallback config (zero latency)
 *  2. Fetches the latest config from Supabase (managed via Dashboard)
 *  3. If Supabase returns data, swaps in the live config + re-injects CSS
 *
 * All theme tokens are available as CSS custom properties on :root:
 *   --hotel-primary, --hotel-accent, --hotel-bg, etc.
 */
export function HotelProvider({ children }: { children: React.ReactNode }) {
  const [config, setConfig] = useState<HotelConfig>(getHotelConfig());

  // Fetch live config from Supabase (Dashboard-managed)
  useEffect(() => {
    let cancelled = false;
    async function loadRemoteConfig() {
      const remote = await fetchHotelConfigFromDB();
      if (remote && !cancelled) {
        setConfig(remote);
      }
    }
    loadRemoteConfig();
    return () => { cancelled = true; };
  }, []);

  // Inject CSS variables + Google Fonts whenever config changes
  useEffect(() => {
    // ── 1. Load Google Fonts (only non-system fonts) ──────────────────────
    const fontsNeeded = [
      ...new Set([config.theme.fontHeading, config.theme.fontBody]),
    ].filter(
      (f) =>
        f !== 'Inter' &&
        f !== 'system-ui' &&
        f !== 'sans-serif' &&
        f !== '-apple-system'
    );

    if (fontsNeeded.length > 0) {
      const existing = document.getElementById('hotel-google-fonts');
      if (existing) existing.remove();

      const link = document.createElement('link');
      link.id = 'hotel-google-fonts';
      link.rel = 'stylesheet';
      link.href =
        'https://fonts.googleapis.com/css2?' +
        fontsNeeded
          .map(
            (f) =>
              `family=${f.replace(/ /g, '+')}:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400`
          )
          .join('&') +
        '&display=swap';
      document.head.appendChild(link);
    }

    // ── 2. Inject CSS variables + font overrides ──────────────────────────
    const existing = document.getElementById('hotel-theme-vars');
    if (existing) existing.remove();

    const style = document.createElement('style');
    style.id = 'hotel-theme-vars';
    style.textContent = `
      :root {
        --hotel-primary:       ${config.theme.primaryColor};
        --hotel-primary-text:  ${config.theme.primaryTextColor};
        --hotel-accent:        ${config.theme.accentColor};
        --hotel-bg:            ${config.theme.backgroundColor};
        --hotel-surface:       ${config.theme.surfaceColor};
        --hotel-font-heading:  '${config.theme.fontHeading}', sans-serif;
        --hotel-font-body:     '${config.theme.fontBody}', sans-serif;
      }
      body {
        background-color: ${config.theme.backgroundColor};
        font-family: var(--hotel-font-body);
      }
      h1, h2, h3, h4, h5, h6 {
        font-family: var(--hotel-font-heading);
      }
    `;
    document.head.appendChild(style);
  }, [config]); // re-run whenever config changes (initial + after Supabase fetch)

  return (
    <HotelContext.Provider value={config}>{children}</HotelContext.Provider>
  );
}

/** Access the active hotel config from any component inside HotelProvider. */
export function useHotel(): HotelConfig {
  const ctx = useContext(HotelContext);
  if (!ctx) throw new Error('useHotel must be used within <HotelProvider>');
  return ctx;
}

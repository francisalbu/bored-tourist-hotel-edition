import type { VercelRequest, VercelResponse } from '@vercel/node';

/**
 * Affiliate Redirect Endpoint (Viator, GetYourGuide, etc.)
 *
 * WHY THIS EXISTS:
 * 1. iOS/Android Universal Links — if the user has the Viator/GYG app
 *    installed, clicking a direct link opens the app's HOME SCREEN instead
 *    of the specific experience. JS-based navigation from a page on our
 *    own domain bypasses app interception.
 *
 * 2. Viator "You selected" landing page — when Viator detects affiliate
 *    params (?pid=…) in the product URL it shows an intermediate city
 *    listing page ("Explore Lisbon / You selected …") instead of taking
 *    the user straight to the activity. The fix is a two-step flow:
 *      a) Load a hidden <iframe> pointing to viator.com/?pid=…&mcid=…
 *         This sets the Viator affiliate cookie.
 *      b) Once the cookie is set, redirect to the CLEAN product URL
 *         (without affiliate params). The cookie ensures commission
 *         is still tracked for any booking made.
 *
 * 3. Per-hotel tracking — each hotel gets a unique mcid so we can identify
 *    in the Viator dashboard which hotel originated each booking and pay
 *    commissions correctly.
 *    mcid mapping (also create these in Viator Partner Portal):
 *      homing           → homing
 *      wot-caparica     → wot-caparica
 *      wot-lagos        → wot-lagos
 *      wot-porto        → wot-porto
 *      pedralva         → pedralva
 *      horta-moura      → horta-moura
 *
 * Usage: /api/viator-redirect?url=<encoded_affiliate_url>&hotelId=<hotel_id>&expId=<exp_id>
 */

const ALLOWED_DOMAINS = [
  'www.viator.com',
  'viator.com',
  'www.getyourguide.com',
  'getyourguide.com',
];

const VIATOR_PID          = 'P00285354';
const VIATOR_MCID_DEFAULT = '42383';
// Params that must be stripped from product URL to avoid "You selected" page
const VIATOR_STRIP_PARAMS = ['pid', 'mcid', 'medium', 'api_version'];

/**
 * Map hotelId → Viator mcid.
 * These mcids must also be created in the Viator Partner Portal
 * (https://supplier.viator.com → Partner Tools → Campaigns).
 * Until they're created there, Viator will fall back to default tracking
 * but they WILL appear as the campaign label in our own click_log table.
 */
const HOTEL_MCID_MAP: Record<string, string> = {
  'homing':                       'homing',
  'wot-soul-costa-da-caparica':   'wot-caparica',
  'wot-soul-lagos-montemar':      'wot-lagos',
  'wot-soul-porto':               'wot-porto',
  'aldeiadapedralva':             'pedralva',
  'hortadamoura':                 'horta-moura',
  'vila-gale':                    'vila-gale',
  'pestana':                      'pestana',
  'bairro-alto':                  'bairro-alto',
};

function getMcid(hotelId?: string): string {
  if (!hotelId) return VIATOR_MCID_DEFAULT;
  return HOTEL_MCID_MAP[hotelId] || hotelId;
}

/** Build the Viator affiliate cookie-setter URL with the correct mcid */
function viatorCookieUrl(hotelId?: string): string {
  const mcid = getMcid(hotelId);
  return `https://www.viator.com/en-GB/?pid=${VIATOR_PID}&mcid=${encodeURIComponent(mcid)}&medium=link`;
}

/** Log click to Supabase for internal tracking — uses direct REST fetch (reliable in serverless) */
async function logClick(hotelId: string, expId: string, url: string, mcid: string) {
  const supabaseUrl = process.env.SUPABASE_URL;
  const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!supabaseUrl || !supabaseKey) {
    console.error('[affiliate_click_log] Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY');
    return;
  }
  try {
    const resp = await fetch(`${supabaseUrl}/rest/v1/affiliate_click_log`, {
      method: 'POST',
      headers: {
        'apikey':        supabaseKey,
        'Authorization': `Bearer ${supabaseKey}`,
        'Content-Type':  'application/json',
        'Prefer':        'return=minimal',
      },
      body: JSON.stringify({
        hotel_id:    hotelId || 'unknown',
        exp_id:      expId   || null,
        mcid,
        destination: url.substring(0, 500),
        clicked_at:  new Date().toISOString(),
      }),
    });
    if (!resp.ok) {
      const txt = await resp.text();
      console.error('[affiliate_click_log] Insert failed:', resp.status, txt);
    } else {
      console.log('[affiliate_click_log] ✅ Logged:', { hotelId, mcid, expId });
    }
  } catch (e) {
    console.error('[affiliate_click_log] Exception:', e);
  }
}

/** Inject utm_campaign into GYG URL so bookings are traceable per hotel */
function buildGygUrl(raw: string, hotelId?: string): string {
  if (!hotelId) return raw;
  try {
    const u = new URL(raw);
    u.searchParams.set('utm_campaign', hotelId);
    return u.toString();
  } catch {
    return raw;
  }
}

/** Remove Viator affiliate query params from a product URL */
function cleanViatorUrl(raw: string): string {
  try {
    const u = new URL(raw);
    VIATOR_STRIP_PARAMS.forEach(p => u.searchParams.delete(p));
    // Remove trailing '?' if no params remain
    return u.toString().replace(/\?$/, '');
  } catch {
    return raw;
  }
}

function escapeHtml(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;');
}

function escapeJs(s: string): string {
  return s
    .replace(/\\/g, '\\\\')
    .replace(/"/g, '\\"')
    .replace(/'/g, "\\'");
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  const rawUrl  = (req.query.url    as string) || '';
  const hotelId  = (req.query.hotelId as string) || '';
  const expId    = (req.query.expId   as string) || '';

  // Validate the URL
  let targetUrl: URL;
  try {
    targetUrl = new URL(rawUrl);
  } catch {
    return res.status(400).json({ error: 'Invalid URL' });
  }

  if (!ALLOWED_DOMAINS.includes(targetUrl.hostname)) {
    return res.status(400).json({ error: 'Redirect domain not allowed' });
  }

  const isViator = targetUrl.hostname.includes('viator.com');
  const isGYG    = targetUrl.hostname.includes('getyourguide.com');

  // For Viator: strip affiliate params so we land on the product directly
  // (cookie is set via hidden iframe instead — avoids "You selected" page)
  // For GYG: inject utm_campaign so bookings are traceable per hotel
  const finalUrl   = isViator ? cleanViatorUrl(rawUrl)
                   : isGYG    ? buildGygUrl(rawUrl, hotelId)
                   : rawUrl;
  const mcid       = getMcid(hotelId);
  const safeFinal  = escapeHtml(finalUrl);
  const jsFinal    = escapeJs(finalUrl);
  const safeCookie = escapeHtml(viatorCookieUrl(hotelId));

  // Await log BEFORE sending response — in serverless, fire-and-forget gets killed
  if (hotelId) await logClick(hotelId, expId, finalUrl, mcid);

  res.setHeader('Content-Type', 'text/html; charset=utf-8');
  res.setHeader('Cache-Control', 'no-store');

  res.send(`<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta name="robots" content="noindex,nofollow">
  <title>Opening booking page…</title>
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;
         display:flex;align-items:center;justify-content:center;
         height:100vh;background:#f9fafb;color:#374151}
    .wrap{text-align:center;padding:24px}
    .spin{width:28px;height:28px;border:3px solid #e5e7eb;border-top-color:#16a34a;
          border-radius:50%;animation:r .6s linear infinite;margin:0 auto 16px}
    @keyframes r{to{transform:rotate(360deg)}}
    p{font-size:15px;line-height:1.5}
    a{color:#16a34a;text-decoration:underline;font-size:13px}
  </style>
</head>
<body>
  <div class="wrap">
    <div class="spin"></div>
    <p>Opening booking page…</p>
    <p style="margin-top:12px">
      <a href="${safeFinal}">Click here if not redirected</a>
    </p>
  </div>
${isViator ? `
  <!--
    Step 1 — hidden iframe sets the Viator affiliate cookie.
    Once it fires onload we redirect to the clean product URL.
    Fallback timer (2 s) handles browsers that block cross-origin onload.
  -->
  <iframe
    id="affframe"
    src="${safeCookie}"
    style="position:absolute;width:0;height:0;border:0;opacity:0;pointer-events:none"
    onload="onCookieReady()"
  ></iframe>
  <script>
    var done = false;
    function go() {
      if (done) return;
      done = true;
      // Step 2 — JS redirect bypasses iOS Universal Links AND lands on product
      window.location.replace("${jsFinal}");
    }
    function onCookieReady() {
      // Short extra pause so cookie is fully written before navigation
      setTimeout(go, 300);
    }
    // Safety fallback — redirect even if iframe never fires (e.g. Safari ITP)
    setTimeout(go, 2000);
  </script>
` : `
  <script>
    // Non-Viator (GYG etc.) — direct JS redirect bypasses Universal Links
    setTimeout(function(){ window.location.replace("${jsFinal}"); }, 400);
  </script>
`}
</body>
</html>`);
}

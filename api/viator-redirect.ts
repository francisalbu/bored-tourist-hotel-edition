import type { VercelRequest, VercelResponse } from '@vercel/node';

/**
 * Affiliate Redirect Endpoint (Viator, GetYourGuide, etc.)
 *
 * WHY THIS EXISTS:
 * On mobile, if the user has the Viator/GYG app installed, clicking a
 * direct link triggers iOS Universal Links / Android App Links, which
 * opens the app's home screen instead of the specific experience.
 *
 * By loading an intermediate HTML page on OUR domain first, and then
 * redirecting via JavaScript, we bypass app interception — JS-based
 * navigation from a loaded page does NOT trigger universal links.
 *
 * Usage: /api/viator-redirect?url=<encoded_affiliate_url>
 */

const ALLOWED_DOMAINS = [
  'www.viator.com',
  'viator.com',
  'www.getyourguide.com',
  'getyourguide.com',
];

export default function handler(req: VercelRequest, res: VercelResponse) {
  let rawUrl = (req.query.url as string) || '';

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

  // Force Viator URLs to English locale
  if (targetUrl.hostname.includes('viator.com')) {
    // Remove any existing language prefix like /pt/, /es/, /fr/ etc.
    targetUrl.pathname = targetUrl.pathname.replace(/^\/[a-z]{2}(-[A-Z]{2})?\//, '/en-US/');
    // If no language prefix was present, add /en-US/ prefix
    if (!targetUrl.pathname.startsWith('/en-US/')) {
      targetUrl.pathname = '/en-US' + targetUrl.pathname;
    }
    rawUrl = targetUrl.toString();
  }

  // Escape for safe HTML / JS embedding
  const safeUrl = rawUrl
    .replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;');

  const jsUrl = rawUrl
    .replace(/\\/g, '\\\\')
    .replace(/"/g, '\\"')
    .replace(/'/g, "\\'");

  // Serve an HTML page that redirects via JS (bypasses universal links)
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
      <a href="${safeUrl}">Click here if not redirected</a>
    </p>
  </div>
  <script>
    // JS redirect does NOT trigger iOS Universal Links / Android App Links
    // Small delay ensures the page is fully loaded first
    setTimeout(function(){window.location.replace("${jsUrl}");},400);
  </script>
</body>
</html>`);
}

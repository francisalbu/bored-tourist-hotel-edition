#!/usr/bin/env python3
"""
Fetch GetYourGuide product details by scraping pages and generate SQL INSERT statements.
"""
import json, sys, time, re, urllib.request, urllib.error, html

PARTNER_ID = "BONZK5E"
START_DISPLAY_ORDER = 69

PRODUCTS = [
    {"id": "1222088", "url": "https://www.getyourguide.com/en-gb/cascais-l100/cascais-walking-tour-t1222088/", "category": "Culture Dive"},
    {"id": "405960", "url": "https://www.getyourguide.com/en-gb/portinho-da-arrabida-l122090/lisbon-kayaking-and-snorkeling-adventure-t405960/", "category": "Outdoors"},
    {"id": "643599", "url": "https://www.getyourguide.com/en-gb/ericeira-l2085/ericeira-5-day-beginner-surf-course-t643599/", "category": "Sports"},
    {"id": "402144", "url": "https://www.getyourguide.com/en-gb/sintra-l99/sintra-historical-jeep-adventure-palaces-secret-routes-t402144/", "category": "Micro Adventures"},
    {"id": "746991", "url": "https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-nighttime-city-lights-river-cruise-t746991/", "category": "Outdoors"},
    {"id": "848419", "url": "https://www.getyourguide.com/en-gb/lisbon-l42/from-lisbon-nazare-big-waves-medieval-obidos-small-group-t848419/", "category": "Culture Dive"},
    {"id": "472888", "url": "https://www.getyourguide.com/en-gb/lisbon-l42/lisboa-a-morte-do-corvo-new-immersive-theatre-not-spoken-t472888/", "category": "Culture Dive"},
    {"id": "458631", "url": "https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-birdwatching-boat-tour-on-tagus-natural-reserve-t458631/", "category": "Outdoors"},
    {"id": "404717", "url": "https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-city-of-spies-guided-walking-tour-t404717/", "category": "Culture Dive"},
    {"id": "847040", "url": "https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-by-night-guided-walking-tour-the-unholy-secrets-t847040/", "category": "Culture Dive"},
    {"id": "64012", "url": "https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-12-minutes-helicopter-flight-t64012/", "category": "Micro Adventures"},
    {"id": "1073679", "url": "https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-vegan-food-and-culture-walking-tour-with-tastings-t1073679/", "category": "Local Cooking"},
    {"id": "777691", "url": "https://www.getyourguide.com/en-gb/lisbon-l42/lisbon-erotic-cabaret-show-and-dinner-t777691/", "category": "Culture Dive"},
    {"id": "698863", "url": "https://www.getyourguide.com/en-gb/lisbon-l42/antique-car-tour-t698863/", "category": "Culture Dive"},
    {"id": "417419", "url": "https://www.getyourguide.com/en-gb/sesimbra-l4957/lisbon-try-scuba-diving-in-arrabida-marine-reserve-wphotos-t417419/", "category": "Outdoors"},
]

def fetch_page(url):
    """Fetch a GYG page and return the HTML."""
    req = urllib.request.Request(url, headers={
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "en-GB,en;q=0.9",
    })
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            return resp.read().decode('utf-8', errors='replace')
    except Exception as e:
        print(f"  ERROR fetching: {e}", file=sys.stderr)
        return None

def extract_json_ld(html_text):
    """Extract JSON-LD structured data from the page."""
    patterns = re.findall(r'<script[^>]*type="application/ld\+json"[^>]*>(.*?)</script>', html_text, re.DOTALL)
    results = []
    for p in patterns:
        try:
            data = json.loads(p)
            results.append(data)
        except:
            pass
    return results

def extract_meta(html_text, prop):
    """Extract meta tag content."""
    m = re.search(rf'<meta[^>]*(?:property|name)="{prop}"[^>]*content="([^"]*)"', html_text)
    if m: return html.unescape(m.group(1))
    return ''

def extract_title(html_text):
    """Extract title from the page."""
    # Try og:title first
    t = extract_meta(html_text, 'og:title')
    if t:
        # Remove " | GetYourGuide" suffix
        t = re.sub(r'\s*\|\s*GetYourGuide.*$', '', t)
        return t.strip()
    m = re.search(r'<h1[^>]*>(.*?)</h1>', html_text, re.DOTALL)
    if m:
        return html.unescape(re.sub(r'<[^>]+>', '', m.group(1)).strip())
    return ''

def extract_price(html_text):
    """Extract price from the page."""
    # Look for price in JSON-LD
    for data in extract_json_ld(html_text):
        if isinstance(data, dict):
            offers = data.get('offers', {})
            if isinstance(offers, dict):
                p = offers.get('price') or offers.get('lowPrice')
                if p: return float(p)
            elif isinstance(offers, list):
                for o in offers:
                    p = o.get('price') or o.get('lowPrice')
                    if p: return float(p)
    # Fallback: look for "From €XX" or "€XX" pattern
    m = re.search(r'(?:From|from)\s*(?:€|EUR)\s*([\d,.]+)', html_text)
    if m: return float(m.group(1).replace(',', '.'))
    m = re.search(r'(?:€|EUR)\s*([\d,.]+)\s*per\s*person', html_text)
    if m: return float(m.group(1).replace(',', '.'))
    return 0

def extract_rating(html_text):
    """Extract rating from JSON-LD or page."""
    for data in extract_json_ld(html_text):
        if isinstance(data, dict):
            ar = data.get('aggregateRating', {})
            if ar:
                return float(ar.get('ratingValue', 0)), int(ar.get('reviewCount', 0))
    # Fallback from page content
    m = re.search(r'([\d.]+)\s*(?:out of 5|/5|of 5)\s*(?:stars?)?\s*[\s\S]*?(\d+)\s*(?:reviews|avaliações)', html_text)
    if m: return float(m.group(1)), int(m.group(2))
    return 0, 0

def extract_duration(html_text):
    """Extract duration from page."""
    # Look for duration patterns
    m = re.search(r'Duration[:\s]*([\d]+(?:\.\d+)?)\s*(?:–\s*[\d.]+\s*)?(?:hours?|h)', html_text, re.IGNORECASE)
    if m:
        h = float(m.group(1))
        if h >= 8: return 'Full day'
        if h == int(h): return f"{int(h)}h"
        mins = int(h * 60)
        return f"{mins // 60}h {mins % 60}min"
    m = re.search(r'Duration[:\s]*([\d]+)\s*(?:–\s*\d+\s*)?minutes?', html_text, re.IGNORECASE)
    if m: return f"{m.group(1)}min"
    m = re.search(r'Duration[:\s]*([\d]+)\s*days?', html_text, re.IGNORECASE)
    if m: return f"{m.group(1)} days"
    # Try from JSON-LD
    for data in extract_json_ld(html_text):
        if isinstance(data, dict):
            dur = data.get('duration', '')
            if dur:
                # ISO 8601 duration like PT2H30M
                hm = re.match(r'PT(?:(\d+)H)?(?:(\d+)M)?', dur)
                if hm:
                    h = int(hm.group(1) or 0)
                    m = int(hm.group(2) or 0)
                    if h >= 8: return 'Full day'
                    if h and m: return f"{h}h {m}min"
                    if h: return f"{h}h"
                    return f"{m}min"
    return '3h'

def extract_description(html_text):
    """Extract description from meta or page."""
    desc = extract_meta(html_text, 'og:description')
    if not desc:
        desc = extract_meta(html_text, 'description')
    if desc:
        desc = html.unescape(desc).strip()
    return desc or ''

def extract_images(html_text):
    """Extract image URLs from the page."""
    imgs = []
    # Look for GYG CDN image URLs
    pattern = re.findall(r'https://cdn\.getyourguide\.com/img/tour/[a-f0-9]+\.(?:jpeg|jpg|png)', html_text)
    seen = set()
    for img in pattern:
        if img not in seen:
            seen.add(img)
            imgs.append(img + '/145.jpg')
            if len(imgs) >= 5:
                break
    if not imgs:
        # Try og:image
        og = extract_meta(html_text, 'og:image')
        if og:
            imgs.append(og)
    return imgs

def extract_coordinates(html_text):
    """Extract lat/lon from Google Maps link or page."""
    m = re.search(r'maps\.google\.com/\?q=@([\d.-]+),([\d.-]+)', html_text)
    if m:
        return float(m.group(1)), float(m.group(2))
    m = re.search(r'"latitude":\s*([\d.-]+).*?"longitude":\s*([\d.-]+)', html_text)
    if m:
        return float(m.group(1)), float(m.group(2))
    return 38.7223, -9.1393

def extract_highlights(html_text):
    """Extract highlights from the page."""
    highlights = []
    # Look for highlights section
    m = re.search(r'Highlights.*?<ul[^>]*>(.*?)</ul>', html_text, re.DOTALL | re.IGNORECASE)
    if m:
        items = re.findall(r'<li[^>]*>(.*?)</li>', m.group(1), re.DOTALL)
        for item in items[:7]:
            clean = re.sub(r'<[^>]+>', '', item).strip()
            if clean:
                highlights.append(clean[:100])
    return highlights

def extract_included(html_text):
    """Extract what's included from the page."""
    included = []
    m = re.search(r'(?:What.s included|Includes|Inclui).*?<ul[^>]*>(.*?)</ul>', html_text, re.DOTALL | re.IGNORECASE)
    if m:
        items = re.findall(r'<li[^>]*>(.*?)</li>', m.group(1), re.DOTALL)
        for item in items[:7]:
            clean = re.sub(r'<[^>]+>', '', item).strip()
            if clean:
                included.append(clean[:100])
    return included

def extract_languages(html_text):
    """Extract languages."""
    langs = []
    lang_names = ['English', 'Portuguese', 'Spanish', 'French', 'German', 'Italian', 'Dutch']
    for lang in lang_names:
        if re.search(rf'\b{lang}\b', html_text):
            langs.append(lang)
    return langs if langs else ['English']

def extract_meeting_point(html_text):
    """Extract meeting point / address."""
    m = re.search(r'Meeting point.*?(?:<p[^>]*>|<div[^>]*>)(.*?)(?:</p>|</div>)', html_text, re.DOTALL | re.IGNORECASE)
    if m:
        clean = re.sub(r'<[^>]+>', '', m.group(1)).strip()
        return clean[:300]
    return ''

def esc(s):
    return s.replace("'", "''")

def build_affiliate_url(original_url, product_id):
    """Build a clean affiliate URL with partner_id."""
    # Clean URL: remove ranking_uuid and date params
    base = re.sub(r'\?.*$', '', original_url)
    # Ensure trailing slash
    if not base.endswith('/'):
        base += '/'
    return f"{base}?partner_id={PARTNER_ID}"

def main():
    sqls = []
    sqls.append(f"""-- ============================================
-- Batch GYG-2: Add {len(PRODUCTS)} GetYourGuide experiences to Supabase
-- Partner ID: {PARTNER_ID}
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================
""")

    for i, prod in enumerate(PRODUCTS):
        url = prod["url"]
        aid = prod["id"]
        print(f"[{i+1}/{len(PRODUCTS)}] Fetching t{aid}...", file=sys.stderr)
        
        page = fetch_page(url)
        if not page:
            print(f"  SKIP t{aid}", file=sys.stderr)
            continue
        time.sleep(1.5)  # Be polite

        title = extract_title(page)
        if not title:
            print(f"  SKIP t{aid} — no title found", file=sys.stderr)
            continue

        desc = extract_description(page)
        if len(desc) > 800:
            desc = desc[:797] + '...'
        short_desc = desc[:200] if desc else ''

        price = round(extract_price(page), 2)
        rating_raw, reviews = extract_rating(page)
        rating = round(rating_raw, 1)
        duration = extract_duration(page)
        lat, lon = extract_coordinates(page)
        imgs = extract_images(page)
        highlights = extract_highlights(page)
        included = extract_included(page)
        langs = extract_languages(page)
        address = extract_meeting_point(page)

        if not highlights:
            highlights = [title]
        if not included:
            included = [title]

        display_order = START_DISPLAY_ORDER + i
        aff_url = build_affiliate_url(url, aid)

        sql = f"""-- {i+1}) {title} (t{aid})
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  '{esc(title)}',
  '{esc(desc)}',
  '{esc(short_desc)}',
  'Lisbon',
  '{esc(address)}',
  {lat},
  {lon},
  {price},
  'EUR',
  '{duration}',
  NULL,
  '{esc(prod["category"])}',
  '{imgs[0] if imgs else ""}',
  '{json.dumps(imgs)}'::jsonb,
  '{json.dumps([esc(h) for h in highlights], ensure_ascii=False)}'::jsonb,
  '{json.dumps([esc(x) for x in included], ensure_ascii=False)}'::jsonb,
  '{json.dumps(langs)}'::jsonb,
  'Free cancellation up to 24h before',
  {rating},
  {reviews},
  'Lisbon',
  true,
  {display_order},
  '{aff_url}',
  'GetYourGuide'
);
"""
        sqls.append(sql)
        print(f"  ✅ {title} — €{price}, {rating}★, {reviews} reviews", file=sys.stderr)

    print('\n'.join(sqls))

if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""
Fetch experiences for Viana do Castelo Batch 1:
  - 2 Viator products (via API)
  - 4 GetYourGuide products (via page scraping)
Generates SQL INSERT statements.
"""
import json, sys, time, re, urllib.request, urllib.error, html as html_module

# ── Credentials ──────────────────────────────────────────────────────────────
VIATOR_API_KEY = "0a9b6163-6d27-4f03-bab6-e5debd3d7a8c"
GYG_PARTNER_ID = "BONZK5E"

START_DISPLAY_ORDER = 142
DEFAULT_LAT = 41.6931
DEFAULT_LON = -8.8340   # Viana do Castelo

LANG_MAP = {
    'en': 'English', 'pt': 'Portuguese', 'es': 'Spanish', 'fr': 'French',
    'de': 'German', 'it': 'Italian', 'nl': 'Dutch', 'ja': 'Japanese',
    'zh': 'Chinese', 'ko': 'Korean', 'ru': 'Russian', 'ar': 'Arabic',
}

# ── Product list ──────────────────────────────────────────────────────────────
VIATOR_PRODUCTS = [
    {
        "code": "176562P1",
        "dest_code": "27331",
        "url_path": "Tour-4X4-Discovering-the-Serra-dArga-in-Alto-Minho",
        "category": "Micro Adventures",
    },
    {
        "code": "63975P3",
        "dest_code": "26879",
        "url_path": "CITY-and-MOUNTAIN-BIKE-TOUR",
        "category": "Sports",
    },
]

GYG_PRODUCTS = [
    {
        "id": "912608",
        "url": "https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/viana-do-castelo-clay-ceramics-and-tea-workshop-t912608/",
        "category": "Learn & Create",
    },
    {
        "id": "568688",
        "url": "https://www.getyourguide.com/en-gb/ponte-de-lima-l146813/can-am-experience-t568688/",
        "category": "Micro Adventures",
    },
    {
        "id": "1223540",
        "url": "https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/viana-do-castelo-wakeboarding-experience-at-feelviana-t1223540/",
        "category": "Sports",
    },
    {
        "id": "546491",
        "url": "https://www.getyourguide.com/en-gb/viana-do-castelo-l165161/horseback-riding-tour-t546491/",
        "category": "Outdoors",
    },
]

# ── Helpers ───────────────────────────────────────────────────────────────────
def esc(s):
    return s.replace("'", "''")

def fmt_dur(mins):
    if not mins:
        return '3h'
    if mins >= 480:
        return 'Full day'
    if mins >= 60:
        h = mins // 60
        m = mins % 60
        return f"{h}h{f' {m}min' if m else ''}"
    return f"{mins}min"

# ── Viator API ────────────────────────────────────────────────────────────────
def viator_get(url):
    req = urllib.request.Request(url, headers={
        "exp-api-key": VIATOR_API_KEY,
        "Accept": "application/json;version=2.0",
        "Accept-Language": "en",
    })
    try:
        with urllib.request.urlopen(req) as resp:
            return json.loads(resp.read().decode())
    except urllib.error.HTTPError as e:
        print(f"  VIATOR ERROR {e.code}: {url}", file=sys.stderr)
        return None

def viator_fetch_product(code):
    return viator_get(f"https://api.viator.com/partner/products/{code}")

def viator_fetch_price(code):
    d = viator_get(f"https://api.viator.com/partner/availability/schedules/{code}?currency=EUR")
    if not d:
        return 0
    for item in d.get('bookableItems', []):
        for season in item.get('seasons', []):
            for pr in season.get('pricingRecords', []):
                for pd in pr.get('pricingDetails', []):
                    if pd.get('ageBand') == 'ADULT':
                        return pd['price']['original']['recommendedRetailPrice']
    return 0

def build_viator_sql(prod, data, price, display_order):
    code = prod["code"]
    title = data.get('title', '')
    desc = data.get('description', '')
    desc = re.sub(r'<[^>]+>', '', desc).replace('&amp;', '&').replace('&nbsp;', ' ').strip()
    desc = re.sub(r'\s+', ' ', desc)
    if len(desc) > 800:
        desc = desc[:797] + '...'
    short_desc = desc[:200]

    itin_dur = data.get('itinerary', {}).get('duration', {})
    dur_mins = itin_dur.get('fixedDurationInMinutes', 0)
    if not dur_mins:
        dur_mins = data.get('duration', {}).get('fixedDurationInMinutes', 0)
    if not dur_mins:
        dur_mins = itin_dur.get('variableDurationFromMinutes', 0)

    rating = round(data.get('reviews', {}).get('combinedAverageRating', 0), 1)
    reviews = data.get('reviews', {}).get('totalReviews', 0)

    incs = [x.get('otherDescription') or x.get('typeDescription', '') for x in data.get('inclusions', [])]
    incs = [x for x in incs if x]

    langs = sorted(set([
        LANG_MAP.get(lg.get('language', ''), lg.get('language', ''))
        for lg in data.get('languageGuides', [])
    ]))
    if not langs:
        langs = ['English']

    imgs = []
    for img in data.get('images', [])[:5]:
        for v in img.get('variants', []):
            if v.get('width', 0) >= 700:
                imgs.append(v['url'])
                break

    start_desc = ''
    lat, lon = DEFAULT_LAT, DEFAULT_LON
    for s in data.get('logistics', {}).get('start', []):
        start_desc = s.get('description', '')[:300]
        loc = s.get('location', {})
        ref = loc.get('ref')
        if ref == 'POINT':
            lat = loc.get('point', {}).get('latitude', lat)
            lon = loc.get('point', {}).get('longitude', lon)
        elif loc.get('address', {}).get('latitude'):
            lat = loc['address']['latitude']
            lon = loc['address']['longitude']
        break

    highlights = []
    for item in data.get('itinerary', {}).get('itineraryItems', [])[:7]:
        desc_h = item.get('description', '')
        name_h = item.get('pointOfInterestLocation', {}).get('location', {}).get('name', '')
        if name_h:
            highlights.append(name_h)
        elif desc_h:
            clean = re.sub(r'<[^>]+>', '', desc_h).strip()
            if clean and len(clean) < 200:
                highlights.append(clean[:100])
    if not highlights:
        highlights = [title]

    affiliate_url = (
        f"https://www.viator.com/en-GB/tours/Porto/{prod['url_path']}"
        f"/d{prod['dest_code']}-{code}?pid=P00285354&mcid=42383&medium=link"
    )
    location_str = start_desc[:100] if start_desc else 'Viana do Castelo'

    return f"""-- Viator: {title} ({code})
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
  '{esc(location_str)}',
  '{esc(start_desc[:300])}',
  {lat},
  {lon},
  {price},
  'EUR',
  '{fmt_dur(dur_mins)}',
  NULL,
  '{esc(prod["category"])}',
  '{imgs[0] if imgs else ""}',
  '{json.dumps(imgs)}'::jsonb,
  '{json.dumps([esc(h) for h in highlights], ensure_ascii=False)}'::jsonb,
  '{json.dumps([esc(x) for x in incs], ensure_ascii=False)}'::jsonb,
  '{json.dumps(langs)}'::jsonb,
  'Free cancellation up to 24h before',
  {rating},
  {reviews},
  'Viana do Castelo',
  true,
  {display_order},
  '{affiliate_url}',
  'Viator'
);
"""

# ── GYG scraping ──────────────────────────────────────────────────────────────
def gyg_fetch_page(url):
    req = urllib.request.Request(url, headers={
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "en-GB,en;q=0.9",
    })
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            return resp.read().decode('utf-8', errors='replace')
    except Exception as e:
        print(f"  GYG ERROR fetching: {e}", file=sys.stderr)
        return None

def gyg_extract_json_ld(html_text):
    patterns = re.findall(r'<script[^>]*type="application/ld\+json"[^>]*>(.*?)</script>', html_text, re.DOTALL)
    results = []
    for p in patterns:
        try:
            results.append(json.loads(p))
        except:
            pass
    return results

def gyg_extract_meta(html_text, prop):
    m = re.search(rf'<meta[^>]*(?:property|name)="{prop}"[^>]*content="([^"]*)"', html_text)
    if m:
        return html_module.unescape(m.group(1))
    return ''

def gyg_extract_title(html_text):
    t = gyg_extract_meta(html_text, 'og:title')
    if t:
        t = re.sub(r'\s*\|\s*GetYourGuide.*$', '', t)
        return t.strip()
    return ''

def gyg_extract_price(html_text):
    for data in gyg_extract_json_ld(html_text):
        if isinstance(data, dict):
            offers = data.get('offers', {})
            if isinstance(offers, dict):
                p = offers.get('price') or offers.get('lowPrice')
                if p:
                    return float(p)
            elif isinstance(offers, list):
                for o in offers:
                    p = o.get('price') or o.get('lowPrice')
                    if p:
                        return float(p)
    m = re.search(r'(?:From|from)\s*(?:€|EUR)\s*([\d,.]+)', html_text)
    if m:
        return float(m.group(1).replace(',', '.'))
    return 0

def gyg_extract_rating(html_text):
    for data in gyg_extract_json_ld(html_text):
        if isinstance(data, dict):
            ar = data.get('aggregateRating', {})
            if ar:
                return round(float(ar.get('ratingValue', 0)), 1), int(ar.get('reviewCount', 0))
    return 0, 0

def gyg_extract_duration(html_text):
    for data in gyg_extract_json_ld(html_text):
        if isinstance(data, dict):
            dur = data.get('duration', '')
            if dur:
                hm = re.match(r'PT(?:(\d+)H)?(?:(\d+)M)?', dur)
                if hm:
                    h = int(hm.group(1) or 0)
                    m = int(hm.group(2) or 0)
                    if h >= 8:
                        return 'Full day'
                    if h and m:
                        return f"{h}h {m}min"
                    if h:
                        return f"{h}h"
                    return f"{m}min"
    m = re.search(r'Duration[:\s]*([\d]+(?:\.\d+)?)\s*(?:–\s*[\d.]+\s*)?(?:hours?|h)', html_text, re.IGNORECASE)
    if m:
        h = float(m.group(1))
        if h >= 8:
            return 'Full day'
        mins = int(h * 60)
        return f"{mins // 60}h {mins % 60}min" if mins % 60 else f"{mins // 60}h"
    return '3h'

def gyg_extract_description(html_text):
    desc = gyg_extract_meta(html_text, 'og:description') or gyg_extract_meta(html_text, 'description')
    return html_module.unescape(desc).strip() if desc else ''

def gyg_extract_images(html_text):
    imgs = []
    pattern = re.findall(r'https://cdn\.getyourguide\.com/img/tour/[a-f0-9]+\.(?:jpeg|jpg|png)', html_text)
    seen = set()
    for img in pattern:
        if img not in seen:
            seen.add(img)
            imgs.append(img + '/145.jpg')
            if len(imgs) >= 5:
                break
    if not imgs:
        og = gyg_extract_meta(html_text, 'og:image')
        if og:
            imgs.append(og)
    return imgs

def gyg_extract_highlights(html_text):
    highlights = []
    m = re.search(r'Highlights.*?<ul[^>]*>(.*?)</ul>', html_text, re.DOTALL | re.IGNORECASE)
    if m:
        items = re.findall(r'<li[^>]*>(.*?)</li>', m.group(1), re.DOTALL)
        for item in items[:7]:
            clean = re.sub(r'<[^>]+>', '', item).strip()
            if clean:
                highlights.append(clean[:100])
    return highlights

def gyg_extract_included(html_text):
    included = []
    m = re.search(r'(?:What.s included|Includes|Inclui).*?<ul[^>]*>(.*?)</ul>', html_text, re.DOTALL | re.IGNORECASE)
    if m:
        items = re.findall(r'<li[^>]*>(.*?)</li>', m.group(1), re.DOTALL)
        for item in items[:7]:
            clean = re.sub(r'<[^>]+>', '', item).strip()
            if clean:
                included.append(clean[:100])
    return included

def gyg_extract_languages(html_text):
    langs = []
    for lang in ['English', 'Portuguese', 'Spanish', 'French', 'German', 'Italian']:
        if re.search(rf'\b{lang}\b', html_text):
            langs.append(lang)
    return langs if langs else ['English']

def gyg_extract_coordinates(html_text):
    m = re.search(r'"latitude":\s*([\d.-]+).*?"longitude":\s*([\d.-]+)', html_text)
    if m:
        return float(m.group(1)), float(m.group(2))
    return DEFAULT_LAT, DEFAULT_LON

def build_gyg_affiliate_url(url):
    base = re.sub(r'\?.*$', '', url).rstrip('/') + '/'
    return f"{base}?partner_id={GYG_PARTNER_ID}"

def build_gyg_sql(prod, page, display_order):
    aid = prod["id"]
    title = gyg_extract_title(page)
    if not title:
        return None, title
    desc = gyg_extract_description(page)
    if len(desc) > 800:
        desc = desc[:797] + '...'
    short_desc = desc[:200]
    price = round(gyg_extract_price(page), 2)
    rating, reviews = gyg_extract_rating(page)
    duration = gyg_extract_duration(page)
    lat, lon = gyg_extract_coordinates(page)
    imgs = gyg_extract_images(page)
    highlights = gyg_extract_highlights(page) or [title]
    included = gyg_extract_included(page) or [title]
    langs = gyg_extract_languages(page)
    aff_url = build_gyg_affiliate_url(prod["url"])

    sql = f"""-- GYG: {title} (t{aid})
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
  'Viana do Castelo',
  '',
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
  'Viana do Castelo',
  true,
  {display_order},
  '{aff_url}',
  'GetYourGuide'
);
"""
    return sql, title, price, rating, reviews

# ── Main ──────────────────────────────────────────────────────────────────────
def main():
    sqls = []
    sqls.append("""-- ============================================
-- Viana do Castelo Batch 1: 6 experiences (2 Viator + 4 GYG)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================
""")

    display_order = START_DISPLAY_ORDER

    # ── Viator products ──────────────────────────────────────────────────────
    for prod in VIATOR_PRODUCTS:
        code = prod["code"]
        print(f"[Viator] Fetching {code}...", file=sys.stderr)
        data = viator_fetch_product(code)
        if not data:
            print(f"  SKIP {code}", file=sys.stderr)
            display_order += 1
            continue
        time.sleep(0.3)
        price = viator_fetch_price(code)
        time.sleep(0.3)
        sql = build_viator_sql(prod, data, price, display_order)
        sqls.append(sql)
        title = data.get('title', code)
        rating = round(data.get('reviews', {}).get('combinedAverageRating', 0), 1)
        reviews = data.get('reviews', {}).get('totalReviews', 0)
        print(f"  ✅ {title} — €{price}, {rating}★, {reviews} reviews", file=sys.stderr)
        display_order += 1

    # ── GYG products ─────────────────────────────────────────────────────────
    for prod in GYG_PRODUCTS:
        aid = prod["id"]
        print(f"[GYG] Fetching t{aid}...", file=sys.stderr)
        page = gyg_fetch_page(prod["url"])
        if not page:
            print(f"  SKIP t{aid}", file=sys.stderr)
            display_order += 1
            continue
        time.sleep(1.5)
        sql, title, price, rating, reviews = build_gyg_sql(prod, page, display_order)
        if not sql:
            print(f"  SKIP t{aid} — no title", file=sys.stderr)
            display_order += 1
            continue
        sqls.append(sql)
        print(f"  ✅ {title} — €{price}, {rating}★, {reviews} reviews", file=sys.stderr)
        display_order += 1

    print('\n'.join(sqls))

if __name__ == "__main__":
    main()

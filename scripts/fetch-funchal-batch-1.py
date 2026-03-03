#!/usr/bin/env python3
"""
Fetch experiences for Funchal Batch 1:
  - 8 Viator products (via API)
Generates SQL INSERT statements.
"""
import json, sys, time, re, urllib.request, urllib.error, html as html_module

# ── Credentials ──────────────────────────────────────────────────────────────
VIATOR_API_KEY = "0a9b6163-6d27-4f03-bab6-e5debd3d7a8c"

START_DISPLAY_ORDER = 181
DEFAULT_LAT = 32.6669
DEFAULT_LON = -16.9241  # Funchal, Madeira

LANG_MAP = {
    'en': 'English', 'pt': 'Portuguese', 'es': 'Spanish', 'fr': 'French',
    'de': 'German', 'it': 'Italian', 'nl': 'Dutch', 'ja': 'Japanese',
    'zh': 'Chinese', 'ko': 'Korean', 'ru': 'Russian', 'ar': 'Arabic',
}

# ── Product list ──────────────────────────────────────────────────────────────
VIATOR_PRODUCTS = [
    {
        "code": "43786P1",
        "dest_code": "5392",
        "url_path": "Madeira-Exquisite-Food-on-Foot-Tours",
        "city_slug": "Madeira",
        "category": "Food & Drinks",
    },
    {
        "code": "112367P38",
        "dest_code": "22388",
        "url_path": "AROUND-THE-ISLAND-TWO-DAYS-TOUR",
        "city_slug": "Funchal",
        "category": "Micro Adventures",
    },
    {
        "code": "192925P1",
        "dest_code": "5392",
        "url_path": "Sunrise-At-Pico-Do-Arieiro-Hike-To-Pico-Ruivo",
        "city_slug": "Madeira",
        "category": "Outdoors",
    },
    {
        "code": "125569P1",
        "dest_code": "22388",
        "url_path": "Jeep-Tours-4x4",
        "city_slug": "Funchal",
        "category": "Micro Adventures",
    },
    {
        "code": "16720P4",
        "dest_code": "22388",
        "url_path": "Northern-Wonders-Jeep-Tour",
        "city_slug": "Funchal",
        "category": "Micro Adventures",
    },
    {
        "code": "23523P1",
        "dest_code": "50841",
        "url_path": "Whale-and-Dolphin-Watching-or-Swim-with-Dolphins-in-Madeira",
        "city_slug": "Calheta",
        "category": "Outdoors",
    },
    {
        "code": "23651P5",
        "dest_code": "5392",
        "url_path": "Madeira-Nuns-Valley-Tour",
        "city_slug": "Madeira",
        "category": "Culture",
    },
    {
        "code": "10440P2",
        "dest_code": "22388",
        "url_path": "History-Tellers",
        "city_slug": "Funchal",
        "category": "Culture",
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
        f"https://www.viator.com/en-GB/tours/{prod['city_slug']}/{prod['url_path']}"
        f"/d{prod['dest_code']}-{code}?pid=P00285354&mcid=42383&medium=link"
    )
    location_str = start_desc[:100] if start_desc else 'Funchal'

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
  'Funchal',
  true,
  {display_order},
  '{affiliate_url}',
  'Viator'
);
"""

# ── Main ──────────────────────────────────────────────────────────────────────
def main():
    sqls = []
    sqls.append("""-- ============================================
-- Funchal Batch 1: 8 experiences (all Viator)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================
""")

    display_order = START_DISPLAY_ORDER

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

    print('\n'.join(sqls))

if __name__ == "__main__":
    main()

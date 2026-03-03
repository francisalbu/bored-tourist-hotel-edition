#!/usr/bin/env python3
"""
Fetch Viator products for Porto Batch 5 and generate SQL INSERT statements.
"""
import json, sys, time, re, urllib.request, urllib.error

API_KEY = "0a9b6163-6d27-4f03-bab6-e5debd3d7a8c"

LANG_MAP = {
    'en': 'English', 'pt': 'Portuguese', 'es': 'Spanish', 'fr': 'French',
    'de': 'German', 'it': 'Italian', 'nl': 'Dutch', 'ja': 'Japanese',
    'zh': 'Chinese', 'ko': 'Korean', 'ru': 'Russian', 'ar': 'Arabic',
}

PRODUCTS = [
    {"code": "194996P4",  "category": "Outdoors",        "url_path": "Rabelo-Tour"},
    {"code": "66616P4",   "category": "Outdoors",        "url_path": "Geres-National-Park-Nature-and-Countryside"},
    {"code": "19333P1",   "category": "Local Cooking",   "url_path": "Portuguese-Gastronomy-Guided-Workshop-in-Porto"},
    {"code": "7812P85",   "category": "Local Cooking",   "url_path": "Secret-Food-Tours-Porto"},
    {"code": "405446P1",  "category": "Culture Dive",    "url_path": "Caminhe-pelo-Porto-e-descubra-a-historia-LGBTQIA"},
    {"code": "168365P4",  "category": "Culture Dive",    "url_path": "Best-of-Porto-Walking-Tour"},
]

START_DISPLAY_ORDER = 128
DEFAULT_LAT = 41.1579
DEFAULT_LON = -8.6291

def api_get(url):
    req = urllib.request.Request(url, headers={
        "exp-api-key": API_KEY,
        "Accept": "application/json;version=2.0",
        "Accept-Language": "en",
    })
    try:
        with urllib.request.urlopen(req) as resp:
            return json.loads(resp.read().decode())
    except urllib.error.HTTPError as e:
        print(f"  ERROR {e.code}: {url}", file=sys.stderr)
        return None

def fetch_product(code):
    return api_get(f"https://api.viator.com/partner/products/{code}")

def fetch_price(code):
    d = api_get(f"https://api.viator.com/partner/availability/schedules/{code}?currency=EUR")
    if not d:
        return 0
    for item in d.get('bookableItems', []):
        for season in item.get('seasons', []):
            for pr in season.get('pricingRecords', []):
                for pd in pr.get('pricingDetails', []):
                    if pd.get('ageBand') == 'ADULT':
                        return pd['price']['original']['recommendedRetailPrice']
    return 0

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

def main():
    sqls = []
    sqls.append(f"""-- ============================================
-- Porto Batch 5: {len(PRODUCTS)} Viator experiences in Porto
-- Products: {', '.join(p['code'] for p in PRODUCTS)}
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================
""")

    for i, prod in enumerate(PRODUCTS):
        code = prod["code"]
        print(f"[{i+1}/{len(PRODUCTS)}] Fetching {code}...", file=sys.stderr)
        data = fetch_product(code)
        if not data:
            print(f"  SKIP {code}", file=sys.stderr)
            continue
        time.sleep(0.3)
        price = fetch_price(code)
        time.sleep(0.3)

        title = data.get('title', '')
        desc = data.get('description', '')
        desc = re.sub(r'<[^>]+>', '', desc).replace('&amp;', '&').replace('&nbsp;', ' ').strip()
        desc = re.sub(r'\s+', ' ', desc)
        if len(desc) > 800:
            desc = desc[:797] + '...'

        short_desc = desc[:200] if desc else ''

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

        cancel_str = 'Free cancellation up to 24h before'

        max_t = data.get('maxTravelersPerBooking')
        if not max_t:
            for opt in data.get('productOptions', []):
                max_t = opt.get('maxTravelersPerBooking')
                if max_t:
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

        display_order = START_DISPLAY_ORDER + i
        affiliate_url = (
            f"https://www.viator.com/en-GB/tours/Porto/{prod['url_path']}"
            f"/d26879-{code}?pid=P00285354&mcid=42383&medium=link"
        )

        max_str = str(max_t) if max_t else 'NULL'
        location_str = start_desc[:100] if start_desc else 'Porto'

        sql = f"""-- {i+1}) {title} ({code})
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
  {max_str},
  '{esc(prod["category"])}',
  '{imgs[0] if imgs else ""}',
  '{json.dumps(imgs)}'::jsonb,
  '{json.dumps([esc(h) for h in highlights], ensure_ascii=False)}'::jsonb,
  '{json.dumps([esc(x) for x in incs], ensure_ascii=False)}'::jsonb,
  '{json.dumps(langs)}'::jsonb,
  '{cancel_str}',
  {rating},
  {reviews},
  'Porto',
  true,
  {display_order},
  '{affiliate_url}',
  'Viator'
);
"""
        sqls.append(sql)
        print(f"  ✅ {title} — €{price}, {rating}★, {reviews} reviews", file=sys.stderr)

    print('\n'.join(sqls))

if __name__ == "__main__":
    main()

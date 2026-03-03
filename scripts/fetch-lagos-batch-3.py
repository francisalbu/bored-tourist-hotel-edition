#!/usr/bin/env python3
"""
Fetch experiences for Lagos Batch 3:
  - 6 GetYourGuide products (via page scraping)
Generates SQL INSERT statements.
"""
import json, sys, time, re, urllib.request, urllib.error, html as html_module

# ── Credentials ──────────────────────────────────────────────────────────────
GYG_PARTNER_ID = "BONZK5E"

START_DISPLAY_ORDER = 175
DEFAULT_LAT = 37.1027
DEFAULT_LON = -8.6731   # Lagos, Algarve

# ── Product list ──────────────────────────────────────────────────────────────
GYG_PRODUCTS = [
    {
        "id": "803488",
        "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/market-tour-cooking-class-algarve-s-seafood-cataplana-t803488/",
        "category": "Food & Drinks",
    },
    {
        "id": "572142",
        "url": "https://www.getyourguide.com/en-gb/barao-de-sao-joao-l129458/lagos-a-walk-with-a-rescued-horse-by-your-side-on-our-land-t572142/",
        "category": "Outdoors",
    },
    {
        "id": "170718",
        "url": "https://www.getyourguide.com/en-gb/algarve-l66/silves-caldas-and-monchique-full-day-tour-t170718/",
        "category": "Culture",
    },
    {
        "id": "408315",
        "url": "https://www.getyourguide.com/en-gb/algarve-l66/marina-de-lagos-ponta-da-piedade-kayaking-tour-t408315/",
        "category": "Micro Adventures",
    },
    {
        "id": "942200",
        "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/half-day-jeep-sunset-safari-with-portuguese-wine-t942200/",
        "category": "Micro Adventures",
    },
    {
        "id": "708921",
        "url": "https://www.getyourguide.com/en-gb/monchique-l92405/monchique-silves-guided-day-trip-t708921/",
        "category": "Culture",
    },
]

# ── Helpers ───────────────────────────────────────────────────────────────────
def esc(s):
    return s.replace("'", "''")

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
        return None, title, 0, 0, 0
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
  'Lagos',
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
  'Lagos',
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
-- Lagos Batch 3: 6 experiences (all GYG)
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================
""")

    display_order = START_DISPLAY_ORDER

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

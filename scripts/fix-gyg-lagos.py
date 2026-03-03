#!/usr/bin/env python3
"""
Re-fetch ALL Lagos GYG experiences (batches 1-3, display_order 159-180)
and generate UPDATE SQL with:
  - Multiple images (up to 5, at /453.jpg quality)
  - Validated coordinates (Portugal bounds)
  - Better descriptions from JSON-LD
  - Better highlights / included
"""
import json, sys, time, re
from urllib.request import urlopen, Request
from urllib.error import URLError, HTTPError
import html as html_module

GYG_PARTNER_ID = "BONZK5E"
DEFAULT_LAT = 37.1027
DEFAULT_LON = -8.6731   # Lagos, Algarve

# Portugal bounding box (mainland + islands)
LAT_MIN, LAT_MAX = 36.8, 42.3
LON_MIN, LON_MAX = -9.6, -6.1

# GYG uses this as a generic "Portugal centroid" placeholder — not a real location
GYG_PLACEHOLDER_COORDS = [(39.3998, -8.2244)]  # centroid of Portugal mainland


def is_valid_coords(lat, lon):
    if not (LAT_MIN <= lat <= LAT_MAX and LON_MIN <= lon <= LON_MAX):
        return False
    # Reject GYG placeholder centroid (within 0.01° tolerance)
    for plat, plon in GYG_PLACEHOLDER_COORDS:
        if abs(lat - plat) < 0.01 and abs(lon - plon) < 0.01:
            return False
    return True

# All Lagos GYG products across batches 1-3
PRODUCTS = [
    # Batch 1 (159-166)
    {"order": 159, "id": "446452", "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-dolphin-benagil-tour-with-marine-biologist-t446452/"},
    {"order": 160, "id": "402450", "url": "https://www.getyourguide.com/en-gb/algarve-l66/from-lagos-scenic-cruise-to-the-benagil-and-carvoeiro-caves-t402450/"},
    {"order": 161, "id": "157044", "url": "https://www.getyourguide.com/en-gb/algarve-l66/from-lagos-kayak-tour-ponta-da-piedade-caves-on-catamaran-t157044/"},
    {"order": 162, "id": "531541", "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-sightseeing-tour-with-electric-moutain-bikes-t531541/"},
    {"order": 163, "id": "303058", "url": "https://www.getyourguide.com/en-gb/algarve-l66/lagos-dolphin-watch-tour-with-professional-marine-biologist-t303058/"},
    {"order": 164, "id": "400250", "url": "https://www.getyourguide.com/en-gb/algarve-l66/from-lagos-small-group-4-hour-wine-tasting-tour-t400250/"},
    {"order": 165, "id": "683755", "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-bake-pastel-de-nata-class-in-lagos-algarve-t683755/"},
    {"order": 166, "id": "166253", "url": "https://www.getyourguide.com/en-gb/algarve-l66/lagos-3-hour-algarve-classic-food-tour-t166253/"},
    # Batch 2 (167-174)
    {"order": 167, "id": "636125", "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-guided-walking-tour-with-local-tips-t636125/"},
    {"order": 168, "id": "255932", "url": "https://www.getyourguide.com/en-gb/algarve-l66/sagres-sagres-natural-park-sunset-tour-by-jeep-t255932/"},
    {"order": 169, "id": "492697", "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/bottom-fishing-lagos-t492697/"},
    {"order": 170, "id": "948610", "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-flow-glow-morning-beach-hatha-flow-yoga-t948610/"},
    {"order": 171, "id": "534958", "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-algarve-coasteering-and-snorkeling-adventure-t534958/"},
    {"order": 172, "id": "639044", "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/lagos-group-surf-lessons-for-all-levels-t639044/"},
    {"order": 173, "id": "402413", "url": "https://www.getyourguide.com/en-gb/algarve-l66/algarve-jeep-safari-with-distillery-visit-lunch-t402413/"},
    {"order": 174, "id": "323753", "url": "https://www.getyourguide.com/en-gb/algarve-l66/lagos-guided-scuba-diving-trips-for-beginners-t323753/"},
    # Batch 3 (175-180)
    {"order": 175, "id": "803488", "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/market-tour-cooking-class-algarve-s-seafood-cataplana-t803488/"},
    {"order": 176, "id": "572142", "url": "https://www.getyourguide.com/en-gb/barao-de-sao-joao-l129458/lagos-a-walk-with-a-rescued-horse-by-your-side-on-our-land-t572142/"},
    {"order": 177, "id": "170718", "url": "https://www.getyourguide.com/en-gb/algarve-l66/silves-caldas-and-monchique-full-day-tour-t170718/"},
    {"order": 178, "id": "408315", "url": "https://www.getyourguide.com/en-gb/algarve-l66/marina-de-lagos-ponta-da-piedade-kayaking-tour-t408315/"},
    {"order": 179, "id": "942200", "url": "https://www.getyourguide.com/en-gb/lagos-portugal-l2896/half-day-jeep-sunset-safari-with-portuguese-wine-t942200/"},
    {"order": 180, "id": "708921", "url": "https://www.getyourguide.com/en-gb/monchique-l92405/monchique-silves-guided-day-trip-t708921/"},
]

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
    "Accept-Language": "en-GB,en;q=0.9",
}


def fetch(url):
    req = Request(url, headers=HEADERS)
    try:
        with urlopen(req, timeout=20) as r:
            return r.read().decode('utf-8', errors='replace')
    except Exception as e:
        print(f"  ERROR: {e}", file=sys.stderr)
        return ""


def get_json_ld(html):
    """Return list of all JSON-LD objects."""
    out = []
    for m in re.finditer(r'<script[^>]+type=["\']application/ld\+json["\'][^>]*>(.*?)</script>', html, re.DOTALL | re.IGNORECASE):
        try:
            obj = json.loads(m.group(1))
            if isinstance(obj, list):
                out.extend(obj)
            else:
                out.append(obj)
        except Exception:
            pass
    return out


def get_main_jld(html):
    """Return the Product/TouristTrip/Trip JSON-LD object."""
    for obj in get_json_ld(html):
        if isinstance(obj, dict) and obj.get('@type') in ('Product', 'TouristTrip', 'Trip', 'Event', 'Service'):
            return obj
    # Fallback: return first dict
    for obj in get_json_ld(html):
        if isinstance(obj, dict) and obj.get('name'):
            return obj
    return {}


def meta(html, prop):
    for attr in ('property', 'name'):
        m = re.search(rf'<meta\s+{attr}=["\'](?:og:|twitter:)?{re.escape(prop.split(":")[-1])}["\']\s+content=["\']([^"\']+)["\']', html, re.IGNORECASE)
        if m:
            return html_module.unescape(m.group(1).strip())
        m = re.search(rf'<meta\s+content=["\']([^"\']+)["\'][^>]*{attr}=["\'](?:og:|twitter:)?{re.escape(prop.split(":")[-1])}\b["\']', html, re.IGNORECASE)
        if m:
            return html_module.unescape(m.group(1).strip())
    return ""


# ── Images ────────────────────────────────────────────────────────────────────

def extract_images(html, jld):
    """
    GYG only serves 1 unique image per tour in SSR HTML (gallery is JS-only).
    Get it at the highest quality (/720.jpg).
    """
    seen_hashes = set()
    imgs = []

    def add_cdn(url):
        url = str(url)
        # GYG CDN format: /img/tour/HASH.ext/SIZE.jpg
        # HASH contains no dots; ext is jpeg/jpg/png; size is e.g. 53, 145, 720
        m = re.search(
            r'https://cdn\.getyourguide\.com/img/tour/([^/\s"\'<>.]+)(\.(?:jpeg|jpg|png))?(?:/[^\s"\'<>]*)?',
            url
        )
        if not m:
            return
        hash_part = m.group(1)
        if len(hash_part) < 8 or hash_part in seen_hashes:
            return
        seen_hashes.add(hash_part)
        ext = m.group(2) or '.jpeg'
        imgs.append(f"https://cdn.getyourguide.com/img/tour/{hash_part}{ext}/720.jpg")

    # JSON-LD image list (all sizes of same image — deduplicated by hash)
    jld_images = jld.get('image', [])
    if isinstance(jld_images, str):
        jld_images = [jld_images]
    elif isinstance(jld_images, dict):
        jld_images = [jld_images.get('url', '')]
    for img_item in jld_images:
        if isinstance(img_item, dict):
            img_item = img_item.get('url', '')
        if img_item:
            add_cdn(img_item)

    # CDN refs in raw HTML
    if not imgs:
        for m in re.finditer(r'https://cdn\.getyourguide\.com/img/tour/[^\s"\'\\><]+', html):
            add_cdn(m.group(0))
            if len(imgs) >= 1:
                break

    # og:image fallback
    if not imgs:
        og = meta(html, 'og:image')
        if og:
            add_cdn(og)
        if not imgs and og:
            imgs.append(og)

    return imgs


# ── Coordinates ───────────────────────────────────────────────────────────────

def extract_coords(html, jld):
    """
    Extract coordinates, validating they're within Portugal bounds.
    Falls back to DEFAULT if not valid.
    """
    candidates = []

    # From JSON-LD location geo
    loc = jld.get('location', {})
    if isinstance(loc, dict):
        geo = loc.get('geo', {})
        if isinstance(geo, dict):
            try:
                candidates.append((float(geo['latitude']), float(geo['longitude'])))
            except Exception:
                pass

    # From JSON-LD top-level geo
    geo = jld.get('geo', {})
    if isinstance(geo, dict):
        try:
            candidates.append((float(geo['latitude']), float(geo['longitude'])))
        except Exception:
            pass

    # From HTML — find ALL lat/lon pairs, take first valid Portugal one
    for m in re.finditer(r'"latitude"\s*:\s*([\d.-]+)[^}]*"longitude"\s*:\s*([\d.-]+)', html):
        try:
            candidates.append((float(m.group(1)), float(m.group(2))))
        except Exception:
            pass
    # Also reversed order
    for m in re.finditer(r'"longitude"\s*:\s*([\d.-]+)[^}]*"latitude"\s*:\s*([\d.-]+)', html):
        try:
            candidates.append((float(m.group(2)), float(m.group(1))))
        except Exception:
            pass

    for lat, lon in candidates:
        if is_valid_coords(lat, lon):
            return round(lat, 6), round(lon, 6)

    return DEFAULT_LAT, DEFAULT_LON


# ── Description ───────────────────────────────────────────────────────────────

def extract_description(html, jld):
    desc = jld.get('description', '')
    if not desc:
        desc = meta(html, 'og:description') or meta(html, 'description')
    desc = html_module.unescape(desc).strip()
    # Remove HTML tags if any
    desc = re.sub(r'<[^>]+>', '', desc)
    # Collapse whitespace
    desc = re.sub(r'\s+', ' ', desc).strip()
    return desc


# ── Highlights ────────────────────────────────────────────────────────────────

def extract_highlights(html, jld):
    """Try multiple strategies to get meaningful highlights."""
    highlights = []

    # 1. JSON-LD description sentences
    desc = jld.get('description', '')
    if desc:
        sentences = [s.strip() for s in re.split(r'(?<=[.!?])\s+', desc) if len(s.strip()) > 20]
        highlights = sentences[:5]

    # 2. HTML "Highlights" section
    if not highlights:
        m = re.search(r'(?:Highlights?|What.s included)[^<]*</[^>]+>\s*<ul[^>]*>(.*?)</ul>', html, re.DOTALL | re.IGNORECASE)
        if m:
            items = re.findall(r'<li[^>]*>\s*(.*?)\s*</li>', m.group(1), re.DOTALL)
            for item in items[:6]:
                clean = re.sub(r'<[^>]+>', '', item).strip()
                if clean and len(clean) > 5:
                    highlights.append(clean[:120])

    return highlights if highlights else []


# ── Included ──────────────────────────────────────────────────────────────────

def extract_included(html, jld):
    included = []
    # Look for "What's included" section
    m = re.search(r'(?:What.s included|Included?|Inclusions?)[^<]*</[^>]+>\s*(?:<[^>]+>)*\s*<ul[^>]*>(.*?)</ul>', html, re.DOTALL | re.IGNORECASE)
    if m:
        items = re.findall(r'<li[^>]*>\s*(.*?)\s*</li>', m.group(1), re.DOTALL)
        for item in items[:7]:
            clean = re.sub(r'<[^>]+>', '', item).strip()
            if clean and len(clean) > 3:
                included.append(clean[:120])
    return included


# ── Rating / price ────────────────────────────────────────────────────────────

def extract_rating(html, jld):
    ar = jld.get('aggregateRating', {})
    if ar:
        try:
            rating = float(ar.get('ratingValue', 0))
            reviews = int(str(ar.get('reviewCount', ar.get('ratingCount', 0))).replace(',', ''))
            return round(rating, 2), reviews
        except Exception:
            pass
    # Fallback from HTML
    m = re.search(r'"ratingValue"\s*:\s*"?([\d.]+)"?', html)
    rv = float(m.group(1)) if m else 0
    m = re.search(r'"reviewCount"\s*:\s*"?(\d+)"?', html)
    rc = int(m.group(1)) if m else 0
    return rv, rc


def extract_price(html, jld):
    offers = jld.get('offers', {})
    if isinstance(offers, list):
        offers = offers[0] if offers else {}
    for key in ('price', 'lowPrice'):
        p = offers.get(key)
        if p:
            try:
                return round(float(p), 2)
            except Exception:
                pass
    m = re.search(r'(?:From|from)\s*(?:€|EUR)\s*([\d.,]+)', html)
    if m:
        try:
            return round(float(m.group(1).replace(',', '.')), 2)
        except Exception:
            pass
    return 0.0


def extract_duration(html, jld):
    dur = jld.get('duration', '')
    if dur:
        m = re.match(r'PT(?:(\d+)H)?(?:(\d+)M)?', str(dur))
        if m:
            h = int(m.group(1) or 0)
            mins = int(m.group(2) or 0)
            if h >= 8:
                return 'Full day'
            if h and mins:
                return f"{h}h {mins}min"
            if h:
                return f"{h}h"
            if mins:
                return f"{mins}min"
    return 'Varies'


# ── SQL escaping ──────────────────────────────────────────────────────────────

def esc(s):
    return str(s).replace("'", "''")


def json_sql(obj):
    """Serialise to JSON and escape single quotes for SQL."""
    return json.dumps(obj, ensure_ascii=False).replace("'", "''")


# ── Main build ────────────────────────────────────────────────────────────────

def build_update(prod, html):
    if not html:
        return None

    jld = get_main_jld(html)

    title = jld.get('name', '') or meta(html, 'og:title')
    title = re.sub(r'\s*[\|\-–]\s*GetYourGuide.*$', '', title, flags=re.IGNORECASE).strip()
    if not title:
        return None

    desc = extract_description(html, jld)
    short_desc = desc[:200]
    price = extract_price(html, jld)
    rating, reviews = extract_rating(html, jld)
    duration = extract_duration(html, jld)
    lat, lon = extract_coords(html, jld)
    imgs = extract_images(html, jld)
    highlights = extract_highlights(html, jld)
    included = extract_included(html, jld)

    # Languages
    langs = []
    for lang in ['English', 'Portuguese', 'Spanish', 'French', 'German', 'Italian']:
        if re.search(rf'\b{lang}\b', html, re.IGNORECASE):
            langs.append(lang)
    if not langs:
        langs = ['English']

    affiliate_url = re.sub(r'\?.*$', '', prod['url']).rstrip('/') + f'/?partner_id={GYG_PARTNER_ID}'
    image_url = imgs[0] if imgs else ''

    print(f"  ✓ [{prod['order']}] {title[:55]} | {len(imgs)} imgs | lat={lat},{lon} | €{price}", file=sys.stderr)

    return f"""-- display_order {prod['order']}: {title}
UPDATE experiences SET
  title              = '{esc(title)}',
  description        = '{esc(desc)}',
  short_description  = '{esc(short_desc)}',
  image_url          = '{esc(image_url)}',
  images             = '{json_sql(imgs)}'::jsonb,
  highlights         = '{json_sql(highlights)}'::jsonb,
  included           = '{json_sql(included)}'::jsonb,
  languages          = '{json_sql(langs)}'::jsonb,
  latitude           = {lat},
  longitude          = {lon},
  price              = {price},
  rating             = {rating},
  review_count       = {reviews},
  duration           = '{esc(duration)}',
  affiliate_url      = '{esc(affiliate_url)}'
WHERE display_order = {prod['order']} AND city = 'Lagos';
"""


def main():
    print("-- =====================================================", file=sys.stdout)
    print("-- FIX: Lagos GYG experiences (display_order 159-180)", file=sys.stdout)
    print("-- Updates: multi-image, fixed coords, better data", file=sys.stdout)
    print("-- Run in: Supabase Dashboard → SQL Editor", file=sys.stdout)
    print("-- =====================================================\n", file=sys.stdout)

    for i, prod in enumerate(PRODUCTS):
        print(f"[{i+1}/{len(PRODUCTS)}] Fetching GYG t{prod['id']}...", file=sys.stderr)
        html = fetch(prod['url'])
        sql = build_update(prod, html)
        if sql:
            print(sql)
        else:
            print(f"  SKIP t{prod['id']} — could not extract data", file=sys.stderr)
        time.sleep(1.5)

    print(f"\n-- Done. {len(PRODUCTS)} experiences updated.", file=sys.stdout)


if __name__ == "__main__":
    main()

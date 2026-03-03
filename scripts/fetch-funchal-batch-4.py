#!/usr/bin/env python3
"""
Funchal Batch 4: 7 GYG experiences
display_order: 205–211
city: Funchal
"""

import json, sys, time, re
from urllib.request import urlopen, Request
from urllib.error import URLError, HTTPError
import html as html_module

GYG_PARTNER = "BONZK5E"
DEFAULT_LAT = 32.6669
DEFAULT_LON = -16.9241
START_DISPLAY_ORDER = 205
CITY = "Funchal"

GYG_EXPERIENCES = [
    "https://www.getyourguide.com/en-gb/madeira-l67/madeira-jeep-tour-with-zipline-swing-and-volcanic-pools-t1096528/",
    "https://www.getyourguide.com/en-gb/funchal-l1026/funchal-transfer-pr1-pico-do-arieiro-pico-ruivo-trail-t427484/",
    "https://www.getyourguide.com/en-gb/madeira-l67/caldeirao-verde-queimadas-pr9-transfer-hike-t482482/",
    "https://www.getyourguide.com/en-gb/madeira-l67/madeira-island-bodyboard-experience-t57009/",
    "https://www.getyourguide.com/en-gb/madeira-l67/madeira-off-road-buggy-driving-experience-t416695/",
    "https://www.getyourguide.com/en-gb/madeira-l67/porto-moniz-diving-with-sharks-and-rays-in-madeira-aquarium-t406731/",
    "https://www.getyourguide.com/en-gb/madeira-l67/madeira-surf-lesson-at-porto-da-cruz-t560222/",
]

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
    "Accept-Language": "en-GB,en;q=0.9",
}


def fetch_url(url):
    req = Request(url, headers=HEADERS)
    try:
        with urlopen(req, timeout=20) as r:
            return r.read().decode("utf-8", errors="replace")
    except (HTTPError, URLError) as e:
        print(f"  ERROR fetching {url}: {e}", file=sys.stderr)
        return ""


def extract_json_ld(html):
    pattern = r'<script[^>]+type=["\']application/ld\+json["\'][^>]*>(.*?)</script>'
    for m in re.finditer(pattern, html, re.DOTALL | re.IGNORECASE):
        try:
            data = json.loads(m.group(1))
            if isinstance(data, list):
                for item in data:
                    if isinstance(item, dict) and item.get("@type") in ("Product", "TouristTrip", "Event", "Trip"):
                        return item
            elif isinstance(data, dict) and data.get("@type") in ("Product", "TouristTrip", "Event", "Trip"):
                return data
        except Exception:
            pass
    return None


def meta(html, prop):
    for attr in ("property", "name"):
        m = re.search(rf'<meta\s+{attr}=["\']{re.escape(prop)}["\']\s+content=["\']([^"\']*)["\']', html, re.IGNORECASE)
        if m:
            return html_module.unescape(m.group(1).strip())
        m = re.search(rf'<meta\s+content=["\']([^"\']*)["\'][^>]*{attr}=["\']{re.escape(prop)}["\']', html, re.IGNORECASE)
        if m:
            return html_module.unescape(m.group(1).strip())
    return ""


def parse_duration(text):
    if not text:
        return "Varies"
    text = str(text)
    m = re.search(r'PT(?:(\d+)H)?(?:(\d+)M)?', text)
    if m:
        h, mins = m.group(1), m.group(2)
        if h and mins:
            return f"{h}h {mins}min"
        if h:
            return f"{h}h"
        if mins:
            return f"{mins}min"
    if re.search(r'\d', text):
        return text[:50]
    return "Varies"


def gyg_tour_id(url):
    m = re.search(r'-t(\d+)/?', url)
    return m.group(1) if m else "unknown"


def infer_category(title, desc):
    text = (title + " " + desc).lower()
    if any(w in text for w in ("surf", "bodyboard", "dive", "diving", "scuba", "snorkel", "coasteer", "swim")):
        return "Sports"
    if any(w in text for w in ("jeep", "buggy", "atv", "quad", "off-road", "offroad", "4x4", "zipline", "zip line")):
        return "Micro Adventures"
    if any(w in text for w in ("hike", "levada", "trail", "walk", "trek", "mountain")):
        return "Outdoors"
    if any(w in text for w in ("fado", "wine", "food", "culture", "museum", "history", "art")):
        return "Culture"
    if any(w in text for w in ("transfer", "taxi", "bus", "shuttle")):
        return "Transport"
    return "Outdoors"


def sql_str(val):
    if val is None:
        return "NULL"
    return "'" + str(val).replace("'", "''") + "'"


def build_gyg_sql(url, display_order):
    tid = gyg_tour_id(url)
    print(f"  Fetching GYG t{tid}...", file=sys.stderr)
    html = fetch_url(url)
    if not html:
        return None

    jld = extract_json_ld(html)

    # Title
    title = ""
    if jld:
        title = jld.get("name", "")
    if not title:
        title = meta(html, "og:title") or meta(html, "twitter:title")
    title = re.sub(r'\s*[\|\-–]\s*GetYourGuide.*$', '', title, flags=re.IGNORECASE).strip()

    # Description
    desc = ""
    if jld:
        desc = jld.get("description", "")
    if not desc:
        desc = meta(html, "og:description") or meta(html, "description") or meta(html, "twitter:description")
    desc = html_module.unescape(desc).strip()

    short_desc = desc[:200] if desc else title

    # Price
    price = 0.0
    if jld:
        offers = jld.get("offers", {})
        if isinstance(offers, list):
            offers = offers[0] if offers else {}
        p = offers.get("price", offers.get("lowPrice", 0))
        try:
            price = float(p)
        except Exception:
            price = 0.0
    if price == 0.0:
        m2 = re.search(r'"price"\s*:\s*"?([\d.]+)"?', html)
        if m2:
            try:
                price = float(m2.group(1))
            except Exception:
                pass
    if price == 0.0:
        m2 = re.search(r'From\s*€\s*([\d.,]+)', html)
        if m2:
            try:
                price = float(m2.group(1).replace(',', '.'))
            except Exception:
                pass

    # Rating & reviews
    rating = 0.0
    review_count = 0
    if jld:
        agg = jld.get("aggregateRating", {})
        try:
            rating = float(agg.get("ratingValue", 0))
        except Exception:
            pass
        try:
            review_count = int(str(agg.get("reviewCount", agg.get("ratingCount", 0))).replace(",", ""))
        except Exception:
            pass

    # Duration
    duration = "Varies"
    if jld:
        duration = parse_duration(jld.get("duration", ""))
    if duration == "Varies":
        m2 = re.search(r'"duration"\s*:\s*"([^"]+)"', html)
        if m2:
            duration = parse_duration(m2.group(1))

    # Image
    image_url = ""
    if jld:
        img = jld.get("image", "")
        if isinstance(img, list):
            img = img[0] if img else ""
        if isinstance(img, dict):
            img = img.get("url", "")
        image_url = img
    if not image_url:
        image_url = meta(html, "og:image") or meta(html, "twitter:image")

    # Lat/lon
    lat = DEFAULT_LAT
    lon = DEFAULT_LON
    if jld:
        loc = jld.get("location", {})
        if isinstance(loc, dict):
            geo = loc.get("geo", {})
            if isinstance(geo, dict):
                try:
                    lat = float(geo.get("latitude", DEFAULT_LAT))
                    lon = float(geo.get("longitude", DEFAULT_LON))
                except Exception:
                    pass

    # Location text
    location_text = CITY
    if jld:
        loc = jld.get("location", {})
        if isinstance(loc, dict):
            loc_name = loc.get("name", "")
            addr = loc.get("address", {})
            if isinstance(addr, dict):
                loc_name = addr.get("addressLocality", loc_name) or loc_name
            if loc_name:
                location_text = loc_name

    # Highlights
    highlights = []
    if jld:
        raw_hl = jld.get("description", "")
        if raw_hl:
            sentences = [s.strip() for s in re.split(r'[.\n]', raw_hl) if len(s.strip()) > 20]
            highlights = sentences[:4]
    if not highlights:
        highlights = [f"Explore {location_text}", "Places to see", "Things to do"]

    # Included
    included = ["Explore " + location_text, "Places to see", "Things to do"]

    # Languages
    languages = ["English", "Portuguese", "Spanish", "French", "German", "Italian"]

    # Affiliate URL
    base = url.split("?")[0].rstrip("/")
    affiliate_url = f"{base}/?partner_id={GYG_PARTNER}"

    # Category
    category = infer_category(title, desc)

    images_json = json.dumps([image_url]) if image_url else "[]"
    highlights_json = json.dumps(highlights)
    included_json = json.dumps(included)
    languages_json = json.dumps(languages)

    print(f"  ✓ t{tid}: {title[:60]} — €{price}, {rating}★, {review_count} reviews", file=sys.stderr)

    return f"""-- GYG: {title} (t{tid})
INSERT INTO experiences (
  operator_id, title, description, short_description, location, address,
  latitude, longitude, price, currency, duration, max_group_size, category,
  image_url, images, highlights, included, languages,
  cancellation_policy, rating, review_count, city,
  is_active, display_order, affiliate_url, affiliate_provider
) VALUES (
  40,
  {sql_str(title)},
  {sql_str(desc)},
  {sql_str(short_desc)},
  {sql_str(location_text)},
  '',
  {lat},
  {lon},
  {price},
  'EUR',
  {sql_str(duration)},
  NULL,
  {sql_str(category)},
  {sql_str(image_url)},
  '{images_json}'::jsonb,
  '{highlights_json.replace("'", "''")}'::jsonb,
  '{included_json.replace("'", "''")}'::jsonb,
  '{languages_json}'::jsonb,
  'Free cancellation up to 24h before',
  {rating},
  {review_count},
  '{CITY}',
  true,
  {display_order},
  {sql_str(affiliate_url)},
  'GetYourGuide'
);
"""


def main():
    print("-- ============================================", file=sys.stdout)
    print(f"-- Funchal Batch 4: {len(GYG_EXPERIENCES)} GYG experiences", file=sys.stdout)
    print("-- Run this in: Supabase Dashboard → SQL Editor", file=sys.stdout)
    print("-- ============================================", file=sys.stdout)
    print("", file=sys.stdout)

    order = START_DISPLAY_ORDER
    for url in GYG_EXPERIENCES:
        sql = build_gyg_sql(url, order)
        if sql:
            print(sql, file=sys.stdout)
        order += 1
        time.sleep(1.2)

    print(f"\nAll done. display_order {START_DISPLAY_ORDER}–{order - 1}", file=sys.stderr)


if __name__ == "__main__":
    main()

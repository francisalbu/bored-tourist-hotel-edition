#!/usr/bin/env python3
"""
Fetch Viator product details and generate SQL INSERT statements.
"""

import json
import sys
import time
import urllib.request
import urllib.error

API_KEY = "0a9b6163-6d27-4f03-bab6-e5debd3d7a8c"
BASE_URL = "https://api.viator.com/partner/products"

# Products from CSV (excluding 156455P1 and 5560182P5 which are already inserted)
PRODUCTS = [
    {"code": "5383SINTRACASCAIS", "category": "Culture Dive", "url_path": "Sintra-and-Cascais-Small-Group-Day-Trip-from-Lisbon"},
    {"code": "268183P3", "category": "Culture Dive", "url_path": "Alfama-Tour-Lisbon-Old-Town"},
    {"code": "5383GOURMET", "category": "Local Cooking", "url_path": "Lisbon-Small-Group-Gourmet-Portuguese-Food-and-Wine-Tour"},
    {"code": "15420P3", "category": "Outdoors", "url_path": "Lisbon-2-Hour-Small-Group-Sailing-Tour"},
    {"code": "54249P2", "category": "Outdoors", "url_path": "Lisbon-Traditional-Boats-Sunset-Cruise"},
    {"code": "88294P1", "category": "Local Cooking", "url_path": "Taste-of-Portugal-17-tastings-tour"},
    {"code": "5519168P1", "category": "Micro Adventures", "url_path": "Escape-Room-in-the-Heart-of-Lisbon"},
    {"code": "66870P1", "category": "Local Cooking", "url_path": "Arrabida-Wine-Tour"},
    {"code": "116939P8", "category": "Outdoors", "url_path": "Dolphin-Watching-Lisbon"},
    {"code": "203526P19", "category": "Local Cooking", "url_path": "Lisbon-Awakens-A-Culinary-Crossroads-Reborn-with-Culinary-Backstreets"},
    {"code": "11392P1", "category": "Local Cooking", "url_path": "Private-Setubal-Region-Wine-Tasting-Tour-Full-Day-from-Lisbon"},
    {"code": "86153P1", "category": "Local Cooking", "url_path": "Pastel-de-Nata-Workshop-at-REAL-Bakery"},
    {"code": "304603P1", "category": "Sports", "url_path": "All-Inclusive-Kayak-Adventure"},
    {"code": "160709P1", "category": "Sports", "url_path": "The-Surf-Instructor"},
    {"code": "263176P1", "category": "Culture Dive", "url_path": "Lisbon-Street-Art-Walk-and-Workshop"},
    {"code": "325678P1", "category": "Local Cooking", "url_path": "Traditional-Portuguese-Cooking-Class"},
    {"code": "400715P1", "category": "Culture Dive", "url_path": "An-intimate-live-Fado-music-show-with-our-amazing-artists"},
    {"code": "69837P1", "category": "Outdoors", "url_path": "Relaxing-Time-in-a-sailboat-A-different-way-to-look-at-Lisbon"},
    {"code": "66870P4", "category": "Outdoors", "url_path": "Arrabida-Jeep-tour-to-the-most-beautiful-beach-of-Europe"},
    {"code": "14060P13", "category": "Culture Dive", "url_path": "The-Slave-Trade-in-Lisbon-A-historical-walking-tour"},
    {"code": "325678P3", "category": "Local Cooking", "url_path": "Portuguese-Petiscos-Cooking-Class"},
    {"code": "5636223P1", "category": "Learn & Create", "url_path": "Lisbon-Painting-Workshop-in-Majolica"},
    {"code": "5614014P2", "category": "Learn & Create", "url_path": "Lisbon-Street-Photography-Photowalks"},
    {"code": "164947P46", "category": "Learn & Create", "url_path": "Lisbon-Sketching-Tour-Discover-Hidden-Views-and-Art"},
    {"code": "7842P37", "category": "Learn & Create", "url_path": "Private-Lisbon-Photography-Walking-Tour-with-a-Professional-Photographer"},
    {"code": "268183P7", "category": "Culture Dive", "url_path": "Age-of-Discoveries-Walking-Tour-Belem"},
]

def fetch_product(product_code):
    """Fetch product details from Viator API."""
    url = f"{BASE_URL}/{product_code}"
    req = urllib.request.Request(url, headers={
        "exp-api-key": API_KEY,
        "Accept": "application/json;version=2.0",
        "Accept-Language": "en",
    })
    try:
        with urllib.request.urlopen(req) as resp:
            return json.loads(resp.read().decode())
    except urllib.error.HTTPError as e:
        print(f"  ERROR fetching {product_code}: {e.code} {e.reason}", file=sys.stderr)
        return None

def get_duration_str(data):
    """Extract duration string from API data."""
    dur = data.get("duration", {})
    if dur.get("fixedDurationInMinutes"):
        mins = dur["fixedDurationInMinutes"]
        if mins >= 60:
            h = mins // 60
            m = mins % 60
            return f"{h}h{f' {m}min' if m else ''}"
        return f"{mins}min"
    if dur.get("variableDurationFromMinutes") and dur.get("variableDurationToMinutes"):
        from_m = dur["variableDurationFromMinutes"]
        to_m = dur["variableDurationToMinutes"]
        def fmt(m):
            if m >= 60:
                h = m // 60
                rm = m % 60
                return f"{h}h{f' {rm}min' if rm else ''}"
            return f"{m}min"
        return f"{fmt(from_m)} - {fmt(to_m)}"
    return "3h"

def get_images(data):
    """Extract up to 5 image URLs from product data."""
    images = []
    for img in data.get("images", []):
        for variant in img.get("variants", []):
            if variant.get("width", 0) >= 700:
                images.append(variant["url"])
                break
        if len(images) >= 5:
            break
    return images

def get_price(data):
    """Extract price from product data."""
    pricing = data.get("pricingInfo", {})
    summary = pricing.get("summary", {})
    from_price = summary.get("fromPrice")
    if from_price:
        return round(float(from_price), 2)
    return 0

def get_reviews(data):
    """Extract rating and review count."""
    reviews = data.get("reviews", {})
    rating = reviews.get("combinedAverageRating", 0)
    count = reviews.get("totalReviews", 0)
    return round(float(rating), 1), int(count)

def get_max_group(data):
    """Extract max travelers."""
    for detail in data.get("bookingConfirmationSettings", {}).get("bookingCutoffType", []):
        pass
    max_t = data.get("maxTravelersPerBooking", None)
    return max_t

def get_highlights(data):
    """Extract highlights/inclusions."""
    highlights = []
    for item in data.get("highlights", []):
        highlights.append(item)
    if not highlights:
        for item in data.get("whatToExpect", []):
            desc = item.get("description", "")
            if desc:
                highlights.append(desc[:120])
    return highlights[:7]

def get_inclusions(data):
    """Extract what's included."""
    included = []
    for item in data.get("inclusions", []):
        desc = item.get("otherDescription") or item.get("typeDescription", "")
        if desc:
            included.append(desc)
    return included[:6]

def get_languages(data):
    """Extract available languages."""
    langs = set()
    for lg in data.get("languageGuides", []):
        lang = lg.get("language", "")
        if lang:
            langs.add(lang)
    if not langs:
        langs.add("English")
    return sorted(langs)

def get_location(data):
    """Extract location details."""
    logistics = data.get("logistics", {})
    start = logistics.get("start", [])
    lat, lon, address = 38.7223, -9.1393, "Lisbon"
    location_name = "Lisbon"
    
    if start:
        first = start[0]
        loc = first.get("location", {})
        ref = loc.get("ref", {})
        if "coordinates" in ref:
            lat = ref["coordinates"].get("latitude", lat)
            lon = ref["coordinates"].get("longitude", lon)
        addr = loc.get("address", {})
        if addr:
            street = addr.get("street", "")
            city = addr.get("city", "Lisbon")
            postcode = addr.get("postcode", "")
            address = f"{street}, {postcode} {city}".strip(", ")
            location_name = city or "Lisbon"
    
    return lat, lon, address, location_name

def escape_sql(s):
    """Escape single quotes for SQL."""
    if s is None:
        return ""
    return str(s).replace("'", "''")

def json_array(items):
    """Format a Python list as a SQL jsonb literal."""
    escaped = []
    for item in items:
        escaped.append(escape_sql(item).replace('"', '\\"'))
    inner = ",".join([f'"{item}"' for item in escaped])
    return f"'[{inner}]'::jsonb"

def main():
    all_data = []
    
    for i, prod in enumerate(PRODUCTS):
        code = prod["code"]
        print(f"[{i+1}/{len(PRODUCTS)}] Fetching {code}...", file=sys.stderr)
        data = fetch_product(code)
        if data:
            all_data.append((prod, data))
        else:
            print(f"  SKIPPING {code}", file=sys.stderr)
        
        # Rate limit - be nice to the API
        if i < len(PRODUCTS) - 1:
            time.sleep(0.5)
    
    print(f"\nFetched {len(all_data)}/{len(PRODUCTS)} products successfully.\n", file=sys.stderr)
    
    # Generate SQL
    print("-- ============================================")
    print("-- Viator experiences - batch insert")
    print("-- Auto-generated from Viator Partner API")
    print("-- Run this in: Supabase Dashboard → SQL Editor")
    print("-- ============================================")
    print()
    print("-- Ensure Viator operator exists (run add-viator-experiences.sql first if not done)")
    print("-- This script assumes operator_id = 40 for Viator")
    print()
    
    display_order = 5  # Starting after existing 3 and 4
    
    for prod, data in all_data:
        code = prod["code"]
        category = prod["category"]
        url_path = prod["url_path"]
        
        title = escape_sql(data.get("title", code))
        description = escape_sql(data.get("description", ""))
        # Clean HTML from description
        import re
        description = re.sub(r'<[^>]+>', '', description)
        description = description.replace('&amp;', '&').replace('&nbsp;', ' ').replace('\n', ' ').strip()
        if len(description) > 500:
            description = description[:497] + "..."
        
        # Short description from overview or first 200 chars of description
        overview = data.get("overview", "")
        overview = re.sub(r'<[^>]+>', '', overview)
        overview = overview.replace('&amp;', '&').replace('&nbsp;', ' ').replace('\n', ' ').strip()
        short_desc = escape_sql(overview[:250]) if overview else escape_sql(description[:250])
        
        lat, lon, address, location_name = get_location(data)
        address = escape_sql(address)
        location_name_esc = escape_sql(location_name)
        
        price = get_price(data)
        duration = get_duration_str(data)
        max_group = data.get("maxTravelersPerBooking") or 12
        
        images = get_images(data)
        image_url = escape_sql(images[0]) if images else ""
        
        rating, review_count = get_reviews(data)
        highlights = get_highlights(data)
        included = get_inclusions(data)
        languages = get_languages(data)
        
        cancellation = "Free cancellation up to 24h before"
        # Check actual cancellation policy
        cancel_policy = data.get("cancellationPolicy", {})
        if cancel_policy.get("type") == "STANDARD":
            cancellation = "Free cancellation up to 24h before"
        elif cancel_policy.get("type") == "ALL_SALES_FINAL":
            cancellation = "No refunds"
        
        # Build the clean direct URL
        affiliate_url = f"https://www.viator.com/en-GB/tours/Lisbon/{url_path}/d538-{code}"
        
        # Format images as jsonb
        images_json = json.dumps(images)
        highlights_json = json.dumps(highlights)
        included_json = json.dumps(included)
        languages_json = json.dumps(languages)
        
        # Escape for SQL (double up single quotes in JSON strings)
        images_sql = escape_sql(images_json)
        highlights_sql = escape_sql(highlights_json)
        included_sql = escape_sql(included_json)
        languages_sql = escape_sql(languages_json)
        
        print(f"-- {code}: {data.get('title', code)}")
        print(f"INSERT INTO experiences (")
        print(f"  operator_id, title, description, short_description, location, address,")
        print(f"  latitude, longitude, price, currency, duration, max_group_size, category,")
        print(f"  image_url, images, highlights, included, languages,")
        print(f"  cancellation_policy, rating, review_count, city,")
        print(f"  is_active, display_order, affiliate_url, affiliate_provider")
        print(f") VALUES (")
        print(f"  40,")
        print(f"  '{title}',")
        print(f"  '{description}',")
        print(f"  '{short_desc}',")
        print(f"  '{location_name_esc}',")
        print(f"  '{address}',")
        print(f"  {lat},")
        print(f"  {lon},")
        print(f"  {price},")
        print(f"  'EUR',")
        print(f"  '{duration}',")
        print(f"  {max_group},")
        print(f"  '{category}',")
        print(f"  '{image_url}',")
        print(f"  '{images_sql}'::jsonb,")
        print(f"  '{highlights_sql}'::jsonb,")
        print(f"  '{included_sql}'::jsonb,")
        print(f"  '{languages_sql}'::jsonb,")
        print(f"  '{cancellation}',")
        print(f"  {rating},")
        print(f"  {review_count},")
        print(f"  'Lisbon',")
        print(f"  true,")
        print(f"  {display_order},")
        print(f"  '{affiliate_url}',")
        print(f"  'Viator'")
        print(f");")
        print()
        
        display_order += 1

if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""
Fetch Viator products and generate high-quality SQL INSERT statements.
Uses both /products and /availability/schedules endpoints.
"""
import json, sys, time, re, urllib.request, urllib.error

API_KEY = "0a9b6163-6d27-4f03-bab6-e5debd3d7a8c"

LANG_MAP = {
    'en': 'English', 'pt': 'Portuguese', 'es': 'Spanish', 'fr': 'French',
    'de': 'German', 'it': 'Italian', 'nl': 'Dutch', 'ja': 'Japanese',
    'zh': 'Chinese', 'ko': 'Korean', 'ru': 'Russian', 'ar': 'Arabic',
}

PRODUCTS = [
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
        print(f"  ERROR: {e.code}", file=sys.stderr)
        return None

def fetch_product(code):
    return api_get(f"https://api.viator.com/partner/products/{code}")

def fetch_price(code):
    d = api_get(f"https://api.viator.com/partner/availability/schedules/{code}?currency=EUR")
    if not d: return 0
    for item in d.get('bookableItems', []):
        for season in item.get('seasons', []):
            for pr in season.get('pricingRecords', []):
                for pd in pr.get('pricingDetails', []):
                    if pd.get('ageBand') == 'ADULT':
                        return pd['price']['original']['recommendedRetailPrice']
    return 0

def main():
    results = []
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
        
        # Extract fields
        title = data.get('title', '')
        desc = data.get('description', '')
        desc = re.sub(r'<[^>]+>', '', desc).replace('&amp;', '&').replace('&nbsp;', ' ').strip()
        desc = re.sub(r'\s+', ' ', desc)
        
        itin_dur = data.get('itinerary', {}).get('duration', {})
        dur_mins = itin_dur.get('fixedDurationInMinutes', 0)
        if not dur_mins:
            dur_mins = data.get('duration', {}).get('fixedDurationInMinutes', 0)
        if not dur_mins:
            dur_mins = itin_dur.get('variableDurationFromMinutes', 0)
        
        rating = round(data.get('reviews', {}).get('combinedAverageRating', 0), 1)
        reviews = data.get('reviews', {}).get('totalReviews', 0)
        
        incs = [i.get('otherDescription') or i.get('typeDescription', '') for i in data.get('inclusions', [])]
        incs = [x for x in incs if x]
        
        langs = sorted(set([LANG_MAP.get(lg.get('language', ''), lg.get('language', '')) for lg in data.get('languageGuides', [])]))
        if not langs: langs = ['English']
        
        imgs = []
        for img in data.get('images', [])[:5]:
            for v in img.get('variants', []):
                if v.get('width', 0) >= 700:
                    imgs.append(v['url'])
                    break
        
        start_desc = ''
        for s in data.get('logistics', {}).get('start', []):
            start_desc = s.get('description', '')[:300]
            break
        
        cancel = data.get('cancellationPolicy', {}).get('type', 'STANDARD')
        
        max_t = data.get('maxTravelersPerBooking')
        # Try to get from itinerary info
        if not max_t:
            for opt in data.get('productOptions', []):
                max_t = opt.get('maxTravelersPerBooking')
                if max_t: break
        
        results.append({
            'code': code,
            'category': prod['category'],
            'url_path': prod['url_path'],
            'title': title,
            'description': desc,
            'duration_mins': dur_mins,
            'price': price,
            'rating': rating,
            'reviews': reviews,
            'inclusions': incs,
            'languages': langs,
            'images': imgs,
            'start_desc': start_desc,
            'cancel_type': cancel,
            'max_travelers': max_t,
        })
    
    # Output as JSON for processing
    print(json.dumps(results, indent=2, ensure_ascii=False))

if __name__ == "__main__":
    main()

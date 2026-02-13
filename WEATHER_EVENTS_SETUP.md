# Weather & Events Integration

## 🌤️ Open-Meteo Weather (100% FREE!)

**No API Key Required!** ✨

We use [Open-Meteo](https://open-meteo.com/) - a completely free weather API that doesn't require any API key or registration.

### Features Enabled:
- ☀️ Real-time weather for Lisbon
- 🌡️ Temperature & conditions
- 🌧️ Precipitation data (rain detection)
- 💨 Wind speed
- ⏰ Time-based recommendations
- 🎯 Context-aware suggestions (rainy day → indoor activities)

### How It Works:
```javascript
// Automatic weather updates every 30 minutes
// Lisbon coordinates: 38.7223° N, 9.1393° W
const response = await fetch(
  'https://api.open-meteo.com/v1/forecast?latitude=38.7223&longitude=-9.1393&current=temperature_2m,precipitation,weathercode,windspeed_10m&timezone=Europe/Lisbon'
);
```

**No setup needed!** The weather integration works out of the box. 🚀

## 🎭 Cultural Events APIs (100% FREE!)

**No API Keys Required!** ✨

### 1. Agenda LX - Lisboa Cultural Calendar

Official Lisboa cultural calendar API maintained by Câmara Municipal de Lisboa.

**Features:**
- 🎪 Real cultural events across Lisboa
- 🎵 Concerts, exhibitions, theater, cinema, dance
- 🏛️ Museums, guided tours, workshops
- 📅 Events for the next 7 days
- 🎨 Categories: música, artes, teatro, cinema, dança, literatura, visitas guiadas

**API Endpoint:**
```javascript
fetch('https://www.agendalx.pt/wp-json/agendalx/v1/events', {
  headers: { 'User-Agent': 'BoredTourist/1.0' }
});
```

### 2. Fundação Gulbenkian

Major cultural institution with concerts, exhibitions, and activities.

**Features:**
- 🎼 Classical and contemporary concerts
- 🖼️ Art exhibitions and museum events
- 🎓 Conferences and educational activities
- 🎭 Dance, theater, and performances
- 📍 All at Av. de Berna, 45A, Lisboa

**API Endpoint:**
```javascript
fetch('https://gulbenkian.pt/wp-json/wp/v2/events?per_page=20', {
  headers: { 'User-Agent': 'BoredTourist/1.0' }
});
```

**Event Data Includes:**
- Event name, subtitle, and description
- Session dates and times
- Venue name and location
- Category (music, art, conference, activity)
- Direct link to event details
- Ticket availability info

**No setup needed!** Both events integrations work out of the box. 🚀

## 🤖 How It Works

The AI concierge now considers:

### ⏰ **Time Context**
- **Morning (6am-12pm):** Breakfast spots, early tours, hiking
- **Afternoon (12pm-5pm):** Museums, sightseeing, lunch
- **Evening (5pm-9pm):** Sunset views, dinner, pre-nightlife
- **Night (9pm+):** Bars, restaurants, nightlife

### 🌤️ **Weather Context**
- **☀️ Sunny & Hot (>25°C):** Beach, water activities, shaded gardens
- **☁️ Cloudy/Cool:** All outdoor activities, comfortable walking
- **☔ Rainy:** Indoor museums, food halls, wine tasting

### 🎭 **Events Context**
- Recommends dinner near concert venues
- Suggests pre-event activities
- Coordinates timing with events

## Example Smart Recommendations

```
User: "What should I do today?"

AI Context Awareness:
- Time: 10:30 AM (Morning)
- Weather: 28°C, Sunny ☀️
- Events: Concert at LX Factory tonight

AI Response:
"Good morning! It's a beautiful sunny day (28°C)! 
How about a morning at the beach followed by 
lunch near LX Factory? There's a great concert 
there tonight!"
```

## 📊 Future Enhancements

- [ ] Weather forecasts (3-day ahead)
- [ ] Sunset/sunrise times
- [ ] Beach conditions & water temperature
- [ ] Traffic & transport updates
- [ ] Local festival calendar
- [ ] Restaurant availability integration

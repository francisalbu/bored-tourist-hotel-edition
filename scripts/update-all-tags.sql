-- ============================================
-- UPDATE TAGS FOR ALL 104 EXPERIENCES
-- Tags are used by the AI concierge chat to match
-- guest requests to the right experiences.
-- Run this in: Supabase Dashboard → SQL Editor
-- ============================================

-- 3) Lisbon Small-Group Food Tour: Eat & Drink Like a Local
UPDATE experiences SET tags = '["Food Tour", "Tastings", "Portuguese Cuisine", "Baixa", "Small Group", "Walking Tour", "Local Food", "Wine", "Culinary", "Authentic"]'::jsonb WHERE display_order = 3;

-- 4) Winner 2025 Undiscovered Lisbon Food & Wine Tour by Eating Europe
UPDATE experiences SET tags = '["Food Tour", "Award-Winning", "Tastings", "Baixa", "Mouraria", "Wine", "Bacalhau", "Fado House", "Small Group", "Authentic"]'::jsonb WHERE display_order = 4;

-- 5) Sintra & Cascais Small-Group Day Trip from Lisbon
UPDATE experiences SET tags = '["Sintra", "Cascais", "Day Trip", "Pena Palace", "Cabo da Roca", "Small Group", "Scenic", "Coastal", "Full Day", "Minivan"]'::jsonb WHERE display_order = 5;

-- 6) Alfama Walking Tour — Lisbon's Old Town
UPDATE experiences SET tags = '["Walking Tour", "Alfama", "History", "Viewpoints", "Cathedral", "Free Tour", "Old Town", "Cultural", "Guided Tour", "Hidden Gems"]'::jsonb WHERE display_order = 6;

-- 7) Lisbon Small-Group Food & Wine Walking Tour
UPDATE experiences SET tags = '["Food Tour", "Wine", "Tastings", "Baixa", "Small Group", "Cheese", "Pastries", "Walking Tour", "Culinary", "Foodie"]'::jsonb WHERE display_order = 7;

-- 8) Lisbon Sunset & Wine Sailing Tour
UPDATE experiences SET tags = '["Sunset", "Sailing", "Wine", "Tagus River", "Belém", "Romantic", "Couples", "River", "Scenic", "Golden Hour"]'::jsonb WHERE display_order = 8;

-- 9) Lisbon Traditional Boat Sunset Cruise with Fado & Wine
UPDATE experiences SET tags = '["Sunset", "Cruise", "Fado", "Live Music", "Wine", "Traditional Boats", "Tagus River", "Romantic", "Praça do Comércio", "Authentic"]'::jsonb WHERE display_order = 9;

-- 10) Lisbon Traditional Boats Sunset Cruise with Wine & Fado
UPDATE experiences SET tags = '["Sunset", "Cruise", "Boat", "Tagus River", "Wine", "Fado", "Romantic", "Couples", "Traditional Boats", "Live Music", "River"]'::jsonb WHERE display_order = 10;

-- 11) Award-Winning Lisbon Food Tour: 17 Tastings in Alfama & Mouraria
UPDATE experiences SET tags = '["Food Tour", "Tastings", "Alfama", "Mouraria", "Award-Winning", "Walking Tour", "Portuguese Cuisine", "Street Food", "Local Food", "Culinary"]'::jsonb WHERE display_order = 11;

-- 12) Escape Hunt Lisbon: Live Escape Room Adventure
UPDATE experiences SET tags = '["Escape Room", "Puzzle", "Indoor", "Team Building", "Groups", "Fun", "Adventure", "Rainy Day", "Interactive", "Mystery"]'::jsonb WHERE display_order = 12;

-- 13) Private Arrábida Wine Tour: Family Wineries, Cheese & Coastal Views
UPDATE experiences SET tags = '["Wine Tour", "Wine Tasting", "Arrábida", "Cheese", "Private", "Scenic", "Countryside", "Coastal Views", "Winery", "Gourmet"]'::jsonb WHERE display_order = 13;

-- 14) Dolphin Watching Ocean Safari with a Marine Biologist
UPDATE experiences SET tags = '["Dolphins", "Wildlife", "Ocean", "Safari", "Marine Biology", "Boat", "Nature", "Family Friendly", "Animals", "Atlantic"]'::jsonb WHERE display_order = 14;

-- 15) Lisbon Awakens: A Culinary Crossroads by Culinary Backstreets
UPDATE experiences SET tags = '["Food Tour", "Culinary", "Estrela", "Modern Cuisine", "Walking Tour", "Tastings", "Multicultural", "Foodie", "Portuguese Cuisine", "Brunch"]'::jsonb WHERE display_order = 15;

-- 16) Private Setúbal Wine Region Tour: Wineries, Cheese & Full Lunch
UPDATE experiences SET tags = '["Wine Tour", "Wine Tasting", "Setúbal", "Cheese", "Private", "Lunch", "Countryside", "Winery", "Gourmet", "Day Trip"]'::jsonb WHERE display_order = 16;

-- 17) Pastel de Nata Masterclass at a Real Bakery in Downtown Lisbon
UPDATE experiences SET tags = '["Cooking Class", "Pastel de Nata", "Baking", "Workshop", "Portuguese Pastry", "Downtown", "Hands-On", "Culinary", "Traditional", "Foodie"]'::jsonb WHERE display_order = 17;

-- 18) Award-Winning Kayak & Coasteering Adventure in Arrábida with Lunch
UPDATE experiences SET tags = '["Kayak", "Coasteering", "Arrábida", "Adventure", "Adrenaline", "Cliff Jumping", "Lunch", "All-Inclusive", "Beach", "Ocean"]'::jsonb WHERE display_order = 18;

-- 19) Surf Lesson in Costa da Caparica with Transport & Photos
UPDATE experiences SET tags = '["Surf", "Surfing", "Lesson", "Costa da Caparica", "Beach", "Waves", "Beginner", "Transport", "Photos", "Water Sports"]'::jsonb WHERE display_order = 19;

-- 20) Lisbon Street Art Walking Tour & Workshop
UPDATE experiences SET tags = '["Street Art", "Graffiti", "Walking Tour", "Urban Art", "Workshop", "Creative", "Murals", "Alternative", "Art", "Culture"]'::jsonb WHERE display_order = 20;

-- 21) Traditional Portuguese Cooking Class in Lisbon
UPDATE experiences SET tags = '["Cooking Class", "Portuguese Cuisine", "Hands-On", "Traditional", "Workshop", "Culinary", "Foodie", "Local Food", "Learn", "Indoor"]'::jsonb WHERE display_order = 21;

-- 22) Intimate Live Fado Show with Port Wine at Lisboa em Fado
UPDATE experiences SET tags = '["Fado", "Live Music", "Port Wine", "Intimate", "Cultural", "Traditional", "Evening", "Performance", "Portuguese Music", "Romantic"]'::jsonb WHERE display_order = 22;

-- 23) Relaxing Sailboat Cruise on the Tagus with Wine & Snacks
UPDATE experiences SET tags = '["Sailing", "Sailboat", "Cruise", "Tagus River", "Wine", "Relaxing", "Romantic", "Couples", "River", "Scenic"]'::jsonb WHERE display_order = 23;

-- 24) Arrábida Safari: Europe
UPDATE experiences SET tags = '["4x4", "Jeep", "Safari", "Arrábida", "Off-Road", "Adventure", "Convertible", "Nature", "Scenic", "Day Trip"]'::jsonb WHERE display_order = 24;

-- 25) The Slave Trade in Lisbon: Historical Walking Tour
UPDATE experiences SET tags = '["History", "Walking Tour", "Slave Trade", "Colonial History", "Educational", "Cultural", "Heritage", "Guided Tour", "Thought-Provoking", "Downtown"]'::jsonb WHERE display_order = 25;

-- 26) Portuguese Petiscos Cooking Class in Lisbon
UPDATE experiences SET tags = '["Cooking Class", "Petiscos", "Tapas", "Portuguese Cuisine", "Hands-On", "Workshop", "Small Plates", "Culinary", "Foodie", "Social"]'::jsonb WHERE display_order = 26;

-- 27) Portuguese Tile Painting Workshop: Majólica Technique
UPDATE experiences SET tags = '["Workshop", "Tile Painting", "Azulejo", "Art", "Creative", "Hands-On", "Traditional", "Ceramic", "Souvenir", "Learn"]'::jsonb WHERE display_order = 27;

-- 28) Lisbon Street Photography Photowalk with a Pro Photographer
UPDATE experiences SET tags = '["Photography", "Photowalk", "Walking Tour", "Street Photography", "Creative", "Learn", "Professional", "Art", "Urban", "Light"]'::jsonb WHERE display_order = 28;

-- 29) Lisbon Sketching Tour: Hidden Views & Urban Art with a Local Artist
UPDATE experiences SET tags = '["Sketching", "Art", "Drawing", "Urban Art", "Creative", "Walking Tour", "Artist", "Hidden Gems", "Learn", "Scenic"]'::jsonb WHERE display_order = 29;

-- 30) Lisbon Photography Masterclass: Private Lesson with a Pro
UPDATE experiences SET tags = '["Photography", "Masterclass", "Private", "Professional", "Learn", "Creative", "Art", "Urban", "Light", "One-on-One"]'::jsonb WHERE display_order = 30;

-- 31) Age of Discoveries Free Walking Tour in Belém
UPDATE experiences SET tags = '["Walking Tour", "Belém", "History", "Discoveries", "Free Tour", "Monuments", "Heritage", "Cultural", "Guided Tour", "Architecture"]'::jsonb WHERE display_order = 31;

-- 32) Arrábida Wine Tour: Wineries, Tastings & Tile Workshop (Small Group)
UPDATE experiences SET tags = '["Wine Tour", "Wine Tasting", "Arrábida", "Tile Workshop", "Small Group", "Cheese", "Pastries", "Countryside", "Winery", "Day Trip"]'::jsonb WHERE display_order = 32;

-- 33) Lisbon Surf Experience: Hidden Spots with a Local Surfer
UPDATE experiences SET tags = '["Surf", "Surfing", "Hidden Spots", "Local Guide", "Beach", "Waves", "Authentic", "Water Sports", "Adventure", "Ocean"]'::jsonb WHERE display_order = 33;

-- 34) Setúbal Wine Tour: Visit & Tasting at 2 Wineries
UPDATE experiences SET tags = '["Wine Tour", "Wine Tasting", "Setúbal", "Winery", "Day Trip", "Countryside", "Gourmet", "Tasting", "Vineyard", "Portuguese Wine"]'::jsonb WHERE display_order = 34;

-- 35) Kayak & Snorkel Adventure in Arrábida from Lisbon
UPDATE experiences SET tags = '["Kayak", "Snorkeling", "Arrábida", "Adventure", "Beach", "Ocean", "Sea Caves", "Nature", "Water Sports", "Day Trip"]'::jsonb WHERE display_order = 35;

-- 36) All-Inclusive Kayak Adventure in Sesimbra & Arrábida
UPDATE experiences SET tags = '["Kayak", "Sesimbra", "Arrábida", "All-Inclusive", "Adventure", "Beach", "Nature", "Water Sports", "Scenic", "Cliffs"]'::jsonb WHERE display_order = 36;

-- 37) Portuguese Cooking Class: 3-Course Meal with Local Chef
UPDATE experiences SET tags = '["Cooking Class", "Portuguese Cuisine", "3-Course Meal", "Local Chef", "Hands-On", "Traditional", "Culinary", "Foodie", "Workshop", "Dinner"]'::jsonb WHERE display_order = 37;

-- 38) Portuguese Cooking Experience: Fish, Meat & Dessert with Drinks
UPDATE experiences SET tags = '["Cooking Class", "Portuguese Cuisine", "Fish", "Meat", "Dessert", "Drinks", "Hands-On", "Culinary", "Workshop", "Full Menu"]'::jsonb WHERE display_order = 38;

-- 39) Óbidos: Medieval Tales, Secret Spots & Ginjinha Tasting
UPDATE experiences SET tags = '["Óbidos", "Medieval", "Day Trip", "Ginjinha", "Walking Tour", "Historic Town", "Secret Spots", "Cultural", "Charming", "Village"]'::jsonb WHERE display_order = 39;

-- 40) Alentejo Day Trip: Évora, Roman Temple & Megalithic Cromlech
UPDATE experiences SET tags = '["Alentejo", "Évora", "Day Trip", "UNESCO", "Roman Temple", "History", "Megalithic", "Private", "Countryside", "Heritage"]'::jsonb WHERE display_order = 40;

-- 41) Dolphin Watching in Lisbon with a Marine Biologist
UPDATE experiences SET tags = '["Dolphins", "Wildlife", "Marine Biology", "Boat", "Nature", "Ocean", "Family Friendly", "Animals", "Atlantic", "Conservation"]'::jsonb WHERE display_order = 41;

-- 42) Corinthia Signature Massage: Luxury Spa Experience in Lisbon
UPDATE experiences SET tags = '["Spa", "Massage", "Luxury", "Wellness", "Relaxation", "Corinthia", "Pampering", "Couples", "Indulgent", "Self-Care"]'::jsonb WHERE display_order = 42;

-- 43) Coasteering in Arrábida: Cliff Jumps, Zip-Lines & Wild Swimming
UPDATE experiences SET tags = '["Coasteering", "Cliff Jumping", "Zip-Line", "Wild Swimming", "Arrábida", "Adrenaline", "Adventure", "Extreme", "Ocean", "Outdoors"]'::jsonb WHERE display_order = 43;

-- 44) Fátima, Batalha, Nazaré & Óbidos: Full-Day Small Group Tour
UPDATE experiences SET tags = '["Fátima", "Nazaré", "Óbidos", "Batalha", "Day Trip", "Small Group", "Religious", "Big Waves", "Historic", "Full Day"]'::jsonb WHERE display_order = 44;

-- 45) Sintra, Pena Palace, Cabo da Roca & Cascais: Small Group Day Tour
UPDATE experiences SET tags = '["Sintra", "Pena Palace", "Cabo da Roca", "Cascais", "Day Trip", "Small Group", "Palaces", "Scenic", "Landmarks", "Full Day"]'::jsonb WHERE display_order = 45;

-- 46) Lisbon (Post-Colonial Kitchen Food Tour)
UPDATE experiences SET tags = '["Food Tour", "Post-Colonial", "Multicultural", "Tastings", "Walking Tour", "Cultural", "Diverse Cuisine", "History", "Culinary", "Alternative"]'::jsonb WHERE display_order = 46;

-- 47) Lisbon Fado Night: Walking Tour, Dinner & Live Music Show
UPDATE experiences SET tags = '["Fado", "Live Music", "Dinner", "Walking Tour", "Evening", "Traditional", "Cultural", "Portuguese Music", "Night Tour", "Romantic"]'::jsonb WHERE display_order = 47;

-- 48) Sintra & Cascais 4x4 Land Rover Panoramic Private Tour
UPDATE experiences SET tags = '["4x4", "Land Rover", "Sintra", "Cascais", "Off-Road", "Private", "Panoramic", "Adventure", "Scenic", "Micro Adventure"]'::jsonb WHERE display_order = 48;

-- 49) Lisbon Sunset Sailing Cruise with Drinks & Portuguese Tapas
UPDATE experiences SET tags = '["Sunset", "Sailing", "Cruise", "Tagus River", "Tapas", "Drinks", "Romantic", "Couples", "River", "Golden Hour"]'::jsonb WHERE display_order = 49;

-- 50) Lisbon by Night: Authentic Fado Show, Dinner & Panoramic Tour
UPDATE experiences SET tags = '["Fado", "Night Tour", "Dinner", "Panoramic", "Live Music", "Traditional", "Cultural", "Evening", "Portuguese Music", "Romantic"]'::jsonb WHERE display_order = 50;

-- 51) Lisbon Oceanario: Aquarium Entrance Ticket
UPDATE experiences SET tags = '["Aquarium", "Oceanário", "Family Friendly", "Indoor", "Marine Life", "Animals", "Kids", "Rainy Day", "Parque das Nações", "Educational"]'::jsonb WHERE display_order = 51;

-- 52) Private Safari Tour to Espichel Cape & West Coast Wild Beaches
UPDATE experiences SET tags = '["Jeep", "Safari", "Espichel Cape", "Wild Beaches", "Private", "Off-Road", "Nature", "Adventure", "Coastal", "Scenic"]'::jsonb WHERE display_order = 52;

-- 53) "Lisbon by Night" up to 6 people, private tour
UPDATE experiences SET tags = '["Night Tour", "Private", "City Tour", "Evening", "Small Group", "Viewpoints", "Illuminated", "Sightseeing", "Lisbon", "Scenic"]'::jsonb WHERE display_order = 53;

-- 54) Fado Musical Experience with Portuguese Wine & Appetizers
UPDATE experiences SET tags = '["Fado", "Live Music", "Wine", "Appetizers", "Cultural", "Traditional", "Evening", "Performance", "Intimate", "Portuguese Music"]'::jsonb WHERE display_order = 54;

-- 55) Balloon Ride with Complimentary Drink from Coruche
UPDATE experiences SET tags = '["Balloon", "Hot Air Balloon", "Aerial", "Scenic", "Sunrise", "Adventure", "Adrenaline", "Countryside", "Unique", "Bucket List"]'::jsonb WHERE display_order = 55;

-- 56) From Lisbon: Óbidos & Nazaré Giant Waves, Ginja & Small Group
UPDATE experiences SET tags = '["Óbidos", "Nazaré", "Big Waves", "Day Trip", "Small Group", "Ginjinha", "Medieval", "Coastal", "Sightseeing", "Full Day"]'::jsonb WHERE display_order = 56;

-- 57) Sunset sailboat tour in Lisbon with green wine
UPDATE experiences SET tags = '["Sunset", "Sailing", "Sailboat", "Green Wine", "Tagus River", "Romantic", "Couples", "Relaxing", "River", "Scenic"]'::jsonb WHERE display_order = 57;

-- 58) Half day Spa Water Therapy experience at THE SPA at Corinthia Lisbon
UPDATE experiences SET tags = '["Spa", "Water Therapy", "Wellness", "Luxury", "Relaxation", "Corinthia", "Half Day", "Pampering", "Pool", "Self-Care"]'::jsonb WHERE display_order = 58;

-- 59) Private Traditional Portuguese Cooking Class in Lisbon with Paula
UPDATE experiences SET tags = '["Cooking Class", "Private", "Portuguese Cuisine", "Home Cooking", "Traditional", "Hands-On", "Culinary", "Intimate", "Foodie", "Personal"]'::jsonb WHERE display_order = 59;

-- 60) Half-Day Kayak Tour in Sesimbra
UPDATE experiences SET tags = '["Kayak", "Sesimbra", "Half Day", "Nature", "Beach", "Ocean", "Water Sports", "Scenic", "Cliffs", "Outdoors"]'::jsonb WHERE display_order = 60;

-- 61) Jewish Sephardic history in Lisbon
UPDATE experiences SET tags = '["History", "Jewish Heritage", "Sephardic", "Walking Tour", "Cultural", "Educational", "Small Group", "Heritage", "Religious", "Guided Tour"]'::jsonb WHERE display_order = 61;

-- 62) Jurassic Hiking tour to footprints of dinosaur in Espichel Cape
UPDATE experiences SET tags = '["Hiking", "Dinosaur", "Jurassic", "Espichel Cape", "Nature", "Fossils", "Coastal", "Adventure", "Educational", "Unique"]'::jsonb WHERE display_order = 62;

-- 63) Hiking tour to the highest limestone cliff of continental Europe
UPDATE experiences SET tags = '["Hiking", "Cliff", "Nature", "Coastal", "Adventure", "Scenic", "Outdoors", "Exercise", "Panoramic Views", "Challenging"]'::jsonb WHERE display_order = 63;

-- 64) Lisbon: Fado Show With Wine and History
UPDATE experiences SET tags = '["Fado", "Live Music", "Wine", "History", "Cultural", "Traditional", "Evening", "Performance", "Portuguese Music", "Intimate"]'::jsonb WHERE display_order = 64;

-- 65) Belém District and the Salazar Dictatorship Legacy - Private Walking Tour
UPDATE experiences SET tags = '["History", "Belém", "Dictatorship", "Walking Tour", "Private", "Political History", "Cultural", "Educational", "20th Century", "Guided Tour"]'::jsonb WHERE display_order = 65;

-- 66) Évora and Monsaraz from Lisbon
UPDATE experiences SET tags = '["Alentejo", "Évora", "Monsaraz", "Day Trip", "Private", "UNESCO", "Wine", "History", "Village", "Countryside"]'::jsonb WHERE display_order = 66;

-- 67) Kayak and Snorkeling Adventure in Lisbon
UPDATE experiences SET tags = '["Kayak", "Snorkeling", "Arrábida", "Adventure", "Ocean", "Nature", "Water Sports", "Beach", "Marine Life", "Day Trip"]'::jsonb WHERE display_order = 67;

-- 68) Lisbon: Tandem Paragliding Flight
UPDATE experiences SET tags = '["Paragliding", "Tandem", "Adrenaline", "Aerial", "Beach", "Adventure", "Extreme", "Flying", "Scenic", "Bucket List"]'::jsonb WHERE display_order = 68;

-- 69) Lisbon: Cascais Walking Tour
UPDATE experiences SET tags = '["Walking Tour", "Cascais", "History", "Coastal", "Sightseeing", "Cultural", "Ocean", "Guided Tour", "Architecture", "Town"]'::jsonb WHERE display_order = 69;

-- 70) Lisbon: Kayaking and Snorkeling Adventure
UPDATE experiences SET tags = '["Kayak", "Snorkeling", "Arrábida", "Adventure", "Nature", "Water Sports", "Beach", "Ocean", "Sea Caves", "Marine Life"]'::jsonb WHERE display_order = 70;

-- 71) Ericeira: 5-Day Beginner Surf Course
UPDATE experiences SET tags = '["Surf", "Surfing", "Ericeira", "Course", "Beginner", "Multi-Day", "Beach", "Waves", "Water Sports", "Surf School"]'::jsonb WHERE display_order = 71;

-- 72) Sintra Historical Jeep Adventure - Palaces & Secret Routes
UPDATE experiences SET tags = '["Jeep", "4x4", "Sintra", "Palaces", "Adventure", "Secret Routes", "Off-Road", "Historical", "Scenic", "Nature"]'::jsonb WHERE display_order = 72;

-- 73) Lisbon Night Cruise: Illuminated Sights on the Tagus River
UPDATE experiences SET tags = '["Night Cruise", "Boat", "Tagus River", "Illuminated", "Evening", "Romantic", "Scenic", "River", "Sightseeing", "Couples"]'::jsonb WHERE display_order = 73;

-- 74) From Lisbon: Nazare Big Waves & Óbidos Small Group Tour
UPDATE experiences SET tags = '["Nazaré", "Big Waves", "Óbidos", "Day Trip", "Small Group", "Coastal", "Medieval", "Sightseeing", "Full Day", "Surf"]'::jsonb WHERE display_order = 74;

-- 75) Lisboa - A Morte do Corvo, new immersive theatre, not spoken
UPDATE experiences SET tags = '["Theatre", "Immersive", "Performance", "Art", "Cultural", "Non-Verbal", "Evening", "Indoor", "Unique", "Creative"]'::jsonb WHERE display_order = 75;

-- 76) Lisbon: Tagus Estuary Nature Reserve Birdwatching Boat Tour
UPDATE experiences SET tags = '["Birdwatching", "Nature Reserve", "Boat", "Tagus Estuary", "Wildlife", "Nature", "Ecological", "Family Friendly", "Birds", "Conservation"]'::jsonb WHERE display_order = 76;

-- 77) Lisbon: City of Spies Guided Walking Tour
UPDATE experiences SET tags = '["Walking Tour", "Spies", "WWII", "History", "Mystery", "Guided Tour", "Cultural", "Espionage", "Downtown", "Storytelling"]'::jsonb WHERE display_order = 77;

-- 78) Lisbon by Night: Guided Walking Tour - The Unholy Secrets
UPDATE experiences SET tags = '["Night Tour", "Walking Tour", "Dark History", "Mystery", "Evening", "Gothic", "Guided Tour", "Storytelling", "Alternative", "Secrets"]'::jsonb WHERE display_order = 78;

-- 79) Lisbon: Helicopter Tour over Belem
UPDATE experiences SET tags = '["Helicopter", "Aerial", "Belém", "Scenic", "Luxury", "Adrenaline", "Panoramic Views", "Bucket List", "VIP", "Unique"]'::jsonb WHERE display_order = 79;

-- 80) Lisbon: Vegan Food and Culture Walking Tour with Tastings
UPDATE experiences SET tags = '["Vegan", "Food Tour", "Tastings", "Walking Tour", "Plant-Based", "Cultural", "Healthy", "Culinary", "Alternative", "Sustainable"]'::jsonb WHERE display_order = 80;

-- 81) Lisbon: Erotic Cabaret Show and Dinner
UPDATE experiences SET tags = '["Cabaret", "Dinner", "Show", "Evening", "Entertainment", "Performance", "Adults Only", "Night Life", "Dining", "Unique"]'::jsonb WHERE display_order = 81;

-- 82) Antique Car Tour
UPDATE experiences SET tags = '["Vintage Car", "Electric", "City Tour", "Sightseeing", "Retro", "Scenic", "Unique", "Photo Opportunity", "Leisurely", "Lisbon"]'::jsonb WHERE display_order = 82;

-- 83) Lisbon: Try Scuba Diving in Arrábida Marine Reserve w/photos
UPDATE experiences SET tags = '["Scuba Diving", "Diving", "Arrábida", "Underwater", "Marine Reserve", "Beginner", "Photos", "Ocean", "Water Sports", "Adventure"]'::jsonb WHERE display_order = 83;

-- 84) From Lisbon: Horseback Riding on Comporta Beach
UPDATE experiences SET tags = '["Horseback Riding", "Horse", "Comporta", "Beach", "Nature Reserve", "Scenic", "Romantic", "Couples", "Outdoors", "Animals"]'::jsonb WHERE display_order = 84;

-- 85) Lisbon Self-Drive Sightseeing Tour in an Electric Car
UPDATE experiences SET tags = '["Electric Car", "Self-Drive", "GoCar", "Sightseeing", "City Tour", "GPS Audio", "Fun", "Eco-Friendly", "Unique", "Freedom"]'::jsonb WHERE display_order = 85;

-- 86) Lisbon/Sintra: Indoor Skydiving Experience
UPDATE experiences SET tags = '["Indoor Skydiving", "Wind Tunnel", "Adrenaline", "Adventure", "Family Friendly", "Indoor", "Rainy Day", "Extreme", "Flying", "Unique"]'::jsonb WHERE display_order = 86;

-- 87) Cascais: Deep Sea Fishing Trip
UPDATE experiences SET tags = '["Fishing", "Deep Sea", "Cascais", "Boat", "Ocean", "Atlantic", "Relaxing", "Outdoor", "Sport Fishing", "Day Trip"]'::jsonb WHERE display_order = 87;

-- 88) Ah Amália Living Experience — Immersive Fado Exhibition
UPDATE experiences SET tags = '["Fado", "Exhibition", "Amália", "Immersive", "Cultural", "Indoor", "Museum", "History", "Portuguese Music", "Sensory"]'::jsonb WHERE display_order = 88;

-- 89) Lisbon: Guided Coast Kayak Tour
UPDATE experiences SET tags = '["Kayak", "Coast", "Guided Tour", "Beach", "Ocean", "Scenic", "Water Sports", "Outdoors", "Coastal", "Adventure"]'::jsonb WHERE display_order = 89;

-- 90) From Lisbon: Guided Quad Tour Along the Atlantic Coast
UPDATE experiences SET tags = '["Quad", "ATV", "Atlantic Coast", "Off-Road", "Adventure", "Adrenaline", "Guided Tour", "Scenic", "Outdoors", "Micro Adventure"]'::jsonb WHERE display_order = 90;

-- 91) Lisbon: Climbing Experience on Ponte 25 de Abril
UPDATE experiences SET tags = '["Climbing", "Rock Climbing", "Bridge", "Ponte 25 de Abril", "Adrenaline", "Adventure", "Panoramic Views", "Unique", "All Levels", "Outdoors"]'::jsonb WHERE display_order = 91;

-- 92) Sintra: Treasure Hunt & Walking Tour "The King's Secret"
UPDATE experiences SET tags = '["Treasure Hunt", "Puzzle", "Sintra", "Self-Guided", "Walking Tour", "Mystery", "Family Friendly", "Interactive", "Historical", "Fun"]'::jsonb WHERE display_order = 92;

-- 93) Portuguese Tile Workshop — Create Your Own Azulejo
UPDATE experiences SET tags = '["Workshop", "Azulejo", "Tile Painting", "Art", "Creative", "Hands-On", "Souvenir", "Portuguese Culture", "Learn", "Craft"]'::jsonb WHERE display_order = 93;

-- 94) Lisbon: Guided Off-Road Buggy Ride
UPDATE experiences SET tags = '["Buggy", "Off-Road", "Adventure", "Adrenaline", "Tagus River", "Scenic", "Guided", "Outdoors", "Micro Adventure", "Thrilling"]'::jsonb WHERE display_order = 94;

-- 95) Caving in Arrábida Natural Park
UPDATE experiences SET tags = '["Caving", "Caves", "Arrábida", "Underground", "Adventure", "Nature", "Geological", "Exploration", "Day Trip", "Unique"]'::jsonb WHERE display_order = 95;

-- 96) Lisbon: Immersive Escape Game with Live Actors
UPDATE experiences SET tags = '["Escape Game", "Live Actors", "Puzzle", "Interactive", "Walking Tour", "Mystery", "Old Town", "Team Building", "Fun", "Immersive"]'::jsonb WHERE display_order = 96;

-- 97) Surf Lesson on Praia de Carcavelos
UPDATE experiences SET tags = '["Surf", "Surfing", "Lesson", "Carcavelos", "Beach", "Waves", "Beginner", "Water Sports", "Wetsuit", "Small Group"]'::jsonb WHERE display_order = 97;

-- 98) Countryside Food Tour on a Vintage Citroën 2CV
UPDATE experiences SET tags = '["Vintage Car", "Citroën 2CV", "Food Tour", "Countryside", "Sintra", "Ericeira", "Organic", "Scenic", "Small Group", "Nostalgic"]'::jsonb WHERE display_order = 98;

-- 99) Sintra & Cascais E-Bike Guided Tour
UPDATE experiences SET tags = '["E-Bike", "Electric Bike", "Sintra", "Cascais", "Cycling", "Guided Tour", "Scenic", "Eco-Friendly", "Pastries", "Nature"]'::jsonb WHERE display_order = 99;

-- 100) Lisbon: Kickstart Street Art Walking Tour
UPDATE experiences SET tags = '["Street Art", "Graffiti", "Walking Tour", "Urban Art", "Murals", "Alternative", "Art", "Culture", "Hidden Gems", "Photography"]'::jsonb WHERE display_order = 100;

-- 101) Lisbon Hills E-Bike Tour — Alfama, Mouraria & Baixa
UPDATE experiences SET tags = '["E-Bike", "Electric Bike", "Alfama", "Mouraria", "Baixa", "Hills", "City Tour", "Cycling", "Viewpoints", "Small Group"]'::jsonb WHERE display_order = 101;

-- 102) Cascais: 3.5-Hour Rock Climbing Experience
UPDATE experiences SET tags = '["Rock Climbing", "Climbing", "Cascais", "Coastal Cliffs", "Adventure", "All Levels", "Outdoors", "Adrenaline", "Scenic", "Exercise"]'::jsonb WHERE display_order = 102;

-- 103) Sesimbra: First Scuba Diving Experience in the Ocean
UPDATE experiences SET tags = '["Scuba Diving", "Diving", "Sesimbra", "Underwater", "Ocean", "Beginner", "Marine Life", "Water Sports", "Adventure", "First Dive"]'::jsonb WHERE display_order = 103;

-- 104) Paragliding near Lisbon — No Experience Required
UPDATE experiences SET tags = '["Paragliding", "Tandem", "Flying", "Aerial", "Adrenaline", "Adventure", "Coastal", "Scenic", "Bucket List", "Extreme"]'::jsonb WHERE display_order = 104;

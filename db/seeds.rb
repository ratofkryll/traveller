# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

puts "Starting seed..."

# Delete existing data

puts "Deleting existing data..."

Itinerary.destroy_all
UserTrip.destroy_all
Trip.destroy_all
Review.destroy_all
User.destroy_all
Attraction.destroy_all
City.destroy_all

# Reset primary key sequences

puts "Resetting keys..."

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

# CITIES

puts "Finding or creating cities..."

city1 = City.create!({
  name: "Vancouver",
  country: "Canada",
  description: "Vancouver, a bustling west coast seaport in British Columbia, is among Canada’s densest, most ethnically diverse cities. A popular filming location, it’s surrounded by mountains, and also has thriving art, theatre and music scenes. Vancouver Art Gallery is known for its works by regional artists, while the Museum of Anthropology houses preeminent First Nations collections.",
  language: "English",
  currency: "CAD",
  transit: "https://www.translink.ca/",
  emergency_phone: "911",
  time_zone: "PST (UTC-8h)",
  tipping_custom: "15-18%",
  image: "cities/city_vancouver1.jpg"
})
city2 = City.create!({
  name: "Montreal",
  country: "Canada",
  description: "Montréal is the largest city in Canada's Québec province. It’s set on an island in the Saint Lawrence River and named after Mt. Royal, the triple-peaked hill at its heart. Its boroughs, many of which were once independent cities, include neighbourhoods ranging from cobblestoned, French colonial Vieux-Montréal – with the Gothic Revival Notre-Dame Basilica at its centre – to bohemian Plateau.",
  language: "French/English",
  currency: "CAD",
  transit: "http://www.stm.info/en",
  emergency_phone: "911",
  time_zone: "EST (UTC-5h)",
  tipping_custom: "15-18%",
  image: "cities/city_montreal.jpg"
})
city3 = City.create!({
  name: "London",
  country: "United Kingdom",
  description: "London, the capital of England and the United Kingdom, is a 21st-century city with history stretching back to Roman times. At its centre stand the imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of British monarch coronations. Across the Thames River, the London Eye observation wheel provides panoramic views of the South Bank cultural complex, and the entire city.",
  language: "English",
  currency: "GBP",
  transit: "https://tfl.gov.uk/",
  emergency_phone: "999",
  time_zone: "GMT (UTC+0h)",
  tipping_custom: "Usually 12.75% added to your bill.",
  image: "cities/city_london.jpg"
})
city4 = City.create!({
  name: "Boston",
  country: "U.S.A.",
  description: "Boston is Massachusetts’ capital and largest city. Founded in 1630, it’s one of the oldest cities in the U.S. The key role it played in the American Revolution is highlighted on the Freedom Trail, a 2.5-mile walking route of historic sites that tells the story of the nation’s founding. One stop, former meeting house Faneuil Hall, is a popular marketplace.",
  language: "English",
  currency: "USD",
  transit: "https://www.mbta.com/",
  emergency_phone: "911",
  time_zone: "EST (UTC-5h)",
  tipping_custom: "15-20%",
  image: "cities/city_boston.jpg"
})
city5 = City.create!({
  name: "Los Angeles",
  country: "U.S.A.",
  description: "Los Angeles is a sprawling Southern California city and the center of the nation’s film and television industry. Near its iconic Hollywood sign, studios such as Paramount Pictures, Universal and Warner Brothers offer behind-the-scenes tours. On Hollywood Boulevard, TCL Chinese Theatre displays celebrities’ hand- and footprints, the Walk of Fame honors thousands of luminaries and vendors sell maps to stars’ homes.",
  language: "English",
  currency: "USD",
  transit: "https://www.metro.net/",
  emergency_phone: "911",
  time_zone: "EST (UTC-8h)",
  tipping_custom: "15-20%",
  image: "cities/city_losangeles.jpg"
})
city6 = City.create!({
  name: "Toronto",
  country: "Canada",
  description: "Toronto, the capital of the province of Ontario, is a major Canadian city along Lake Ontario’s northwestern shore. It's a dynamic metropolis with a core of soaring skyscrapers, all dwarfed by the iconic, free-standing CN Tower. Toronto also has many green spaces, from the orderly oval of Queen’s Park to 400-acre High Park and its trails, sports facilities and zoo.",
  language: "English",
  currency: "CAD",
  transit: "http://www.ttc.ca/",
  emergency_phone: "911",
  time_zone: "EST (UTC-5h)",
  tipping_custom: "15-18%",
  image: "cities/city_toronto.jpg"
})
city7 = City.create!({
  name: "Chicago",
  country: "U.S.A.",
  description: "Chicago, on Lake Michigan in Illinois, is among the largest cities in the U.S. Famed for its bold architecture, it has a skyline punctuated by skyscrapers such as the iconic John Hancock Center, 1,451-ft. Willis Tower (formerly the Sears Tower) and the neo-Gothic Tribune Tower. The city is also renowned for its museums, including the Art Institute of Chicago with its noted Impressionist and Post-Impressionist works.",
  language: "English",
  currency: "USD",
  transit: "https://www.transitchicago.com/",
  emergency_phone: "911",
  time_zone: "EST (UTC-6h)",
  tipping_custom: "15-20%",
  image: "cities/city_chicago.jpg"
})
city8 = City.create!({
  name: "Paris",
  country: "France",
  description: "Paris, France's capital, is a major European city and a global center for art, fashion, gastronomy and culture. Its 19th-century cityscape is crisscrossed by wide boulevards and the River Seine. Beyond such landmarks as the Eiffel Tower and the 12th-century, Gothic Notre-Dame cathedral, the city is known for its cafe culture and designer boutiques along the Rue du Faubourg Saint-Honoré.",
  language: "French",
  currency: "EUR",
  transit: "https://www.ratp.fr/en",
  emergency_phone: "112",
  time_zone: "CEST (UTC+1h)",
  tipping_custom: "Suggested 10-15%",
  image: "cities/city_paris.jpg"
})
city9 = City.create!({
  name: "Sydney",
  country: "Australia",
  description: "Sydney, capital of New South Wales and one of Australia's largest cities, is best known for its harbourfront Sydney Opera House, with a distinctive sail-like design. Massive Darling Harbour and the smaller Circular Quay port are hubs of waterside life, with the arched Harbour Bridge and esteemed Royal Botanic Garden nearby. Sydney Tower’s outdoor platform, the Skywalk, offers 360-degree views of the city and suburbs.",
  language: "English",
  currency: "AUD",
  transit: "https://transportnsw.info/",
  emergency_phone: "000",
  time_zone: "AET (UTC+11h)",
  tipping_custom: "Suggested 10-15%",
  image: "cities/city_sydney.jpg"
})

# ATTRACTIONS

puts "Creating attractions..."

## Vancouver Attraction Data

city1.attractions.create!({
  name: "Capilano Suspension Bridge",
  address: "3735 Capilano Rd",
  address_city: "North Vancouver",
  address_postcode: "V7R 4J1",
  website: "https://www.capbridge.com/",
  facebook: "https://www.facebook.com/capilanosuspensionbridgepark/",
  instagram: "https://www.instagram.com/capilanosuspensionbridge/?hl=en",
  twitter: "https://twitter.com/capsuspbridge",
  description: "Explore one of the most popular visitor attractions in Vancouver today! Experience Cliffwalk, Treetops Adventure, and the legendary Suspension Bridge. Kids under 6 free. Canyon Lights On Now. Destinations: Suspension Bridge, Cliffwalk, Treetop Adventures, Story Centre, The Living Forest.",
  monday_hours: "9am - 6pm",
  tuesday_hours: "9am - 6pm",
  wednesday_hours: "9am - 6pm",
  thursday_hours: "9am - 6pm",
  friday_hours: "9am - 6pm",
  saturday_hours: "9am - 6pm",
  sunday_hours: "9am - 6pm",
  image: "attractions/vancouver-capilano.jpg",
  categories: ["nature", "child-friendly"],
  google_place: "EjZDYXBpbGFubyBTdXNwZW5zaW9uIEJyaWRnZSwgV2VzdCBWYW5jb3V2ZXIsIEJDLCBDYW5hZGEiLiosChQKEgk1aGXkzW-GVBEPrirpurG0mxIUChIJ03ztPxVuhlQRleuQB-vSjUY",
  public: true,
  featured: true
})

city1.attractions.create!({
  name: "Vancouver Aquarium",
  address: "845 Avison Way",
  address_city: "Vancouver",
  address_postcode: "V6G 3E2",
  website: "https://www.vanaqua.org/",
  facebook: "https://www.facebook.com/vanaqua/",
  instagram: "https://www.instagram.com/vanaqua/",
  twitter: "https://twitter.com/vanaqua",
  description: "With a worldwide reputation as a leading marine science centre, the Vancouver Aquarium was the country’s first public aquarium when it opened in 1956, and is Canada’s largest. It is home to more than 70,000 animals, more than 60,000 children take advantage of its school programs each year, and each year it welcomes more than 1 million visitors from around the world.",
  monday_hours: "10am - 5pm",
  tuesday_hours: "10am - 5pm",
  wednesday_hours: "10am - 5pm",
  thursday_hours: "10am - 5pm",
  friday_hours: "10am - 5pm",
  saturday_hours: "10am - 5pm",
  sunday_hours: "10am - 5pm",
  image: "attractions/vancouver-aqua.jpg",
  categories: ["nature", "child-friendly"],
  google_place: "ChIJp2zKeo1xhlQRWOMOmCcWJV8",
  public: true,
  featured: true
})

city1.attractions.create!({
  name: "Grouse Mountain",
  address: "6400 Nancy Greene Way",
  address_city: "North Vancouver",
  address_postcode: "V7R 4K9",
  website: "https://www.grousemountain.com/",
  facebook: "https://www.facebook.com/grousemountain",
  instagram: "https://www.instagram.com/grousemountain/",
  twitter: "https://twitter.com/grousemountain",
  description: "Rising 1,250 metres (4,100 feet) above Vancouver and just 15 minutes from the city’s downtown core, is the vast alpine playground of Grouse Mountain.  The iconic Red Skyride gives visitors and locals alike the opportunity to see the jaw-dropping majestic nature of B.C. unfold in front of them during the 8 minute ride from the Valley Station to the summit.",
  monday_hours: "9am - 10pm",
  tuesday_hours: "9am - 10pm",
  wednesday_hours: "9am - 10pm",
  thursday_hours: "9am - 10pm",
  friday_hours: "9am - 10pm",
  saturday_hours: "9am - 10pm",
  sunday_hours: "9am - 10pm",
  image: "attractions/vancouver-grouse.jpg",
  categories: ["nature", "child-friendly", "viewpoint"],
  google_place: "ChIJNz7rZoVvhlQR9kZL6IxEY00",
  public: true,
  featured: true
})

city1.attractions.create!({
  name: "VanDusen Botanical Garden",
  address: "5251 Oak St",
  address_city: "Vancouver",
  address_postcode: "V6M 4H1",
  website: "http://vandusengarden.org/",
  facebook: "https://www.facebook.com/vandusenbotanicalgarden",
  instagram: "https://www.instagram.com/vandusengarden/?hl=ense",
  twitter: "https://twitter.com/vandusengdn",
  description: "
  View across one of the ponds, to the mountains north of Vancouver

  Autumn colours at VanDusen Botanical Garden, 2011
  In 1970 the Vancouver Foundation, the British Columbia provincial government, and the city of Vancouver signed an agreement to provide the funding to develop a public garden on part of the old Shaughnessy Golf Course.",
  monday_hours: "10am - 3pm",
  tuesday_hours: "10am - 3pm",
  wednesday_hours: "10am - 3pm",
  thursday_hours: "10am - 3pm",
  friday_hours: "10am - 3pm",
  saturday_hours: "10am - 3pm",
  sunday_hours: "10am - 3pm",
  image: "attractions/vancouver-vandusen.jpg",
  categories: ["nature", "child-friendly", "garden"],
  google_place: "ChIJwW3HeIZzhlQRVxJgWI8VjAg",
  public: true,
  featured: true
})

city1.attractions.create!({
  name: "Flyover Canada",
  address: "201 - 999 Canada Place",
  address_city: "Vancouver",
  address_postcode: "V6C 3E1",
  website: "https://www.flyovercanada.com/",
  facebook: "https://www.facebook.com/flyovercanada/",
  instagram: "https://www.instagram.com/flyovercanada/?hl=en",
  twitter: "https://twitter.com/FlyOverCanada",
  description: "FlyOver Canada utilizes state-of-the-art technology to give you the feeling of flight. You will hang suspended, feet dangling, before a 20-metre spherical screen while our film whisks you away on an exhilarating 8-minute journey across Canada, from east to west. Special effects, including wind, mist and scents, combine with the ride’s motion to create an unforgettable experience.",
  monday_hours: "10am - 9pm",
  tuesday_hours: "10am - 9pm",
  wednesday_hours: "10am - 9pm",
  thursday_hours: "10am - 9pm",
  friday_hours: "10am - 9pm",
  saturday_hours: "10am - 9pm",
  sunday_hours: "10am - 9pm",
  image: "attractions/vancouver-fly-over.jpg",
  categories: ["child-friendly"],
  google_place: "ChIJA4o63IJxhlQRw62GaRizNKQ",
  public: true,
  featured: true
})

city1.attractions.create!({
  name: "Vancouver Lookout",
  address: "555 W Hastings St",
  address_city: "Vancouver",
  address_postcode: "V6B 4N6",
  website: "http://vancouverlookout.com/",
  facebook: "http://www.facebook.com/Vancouverlookout",
  instagram: "https://www.instagram.com/vancouverlookout/",
  twitter: "http://twitter.com/VanLookout",
  description: "Harbour Centre and the Vancouver Lookout are part of the fabric of the city, a staple of Vancouver’s skyline since 1977 and the tallest, solely commercial building in Vancouver. The iconic ‘flying saucer’ shaped observation deck lights up at night, and during the holidays, it becomes a Christmas tree decorating the Vancouver skyline.",
  monday_hours: "9am - 9pm",
  tuesday_hours: "9am - 9pm",
  wednesday_hours: "9am - 9pm",
  thursday_hours: "9am - 9pm",
  friday_hours: "9am - 9pm",
  saturday_hours: "9am - 9pm",
  sunday_hours: "9am - 9pm",
  image: "attractions/vancouver-lookout.jpg",
  categories: ["child-friendly"],
  google_place: "ChIJfe2sYHhxhlQRoXvjMeNv3VA",
  public: true,
  featured: true
})

city1.attractions.create!({
  name: "Dr. Sun Yat-Sen Classical Chinese Garden",
  address: "578 Carrall St",
  address_city: "Vancouver",
  address_postcode: "V6B 5K2",
  website: "https://vancouverchinesegarden.com/",
  facebook: "https://www.facebook.com/vancouverchinesegarden/",
  instagram: "https://www.instagram.com/vancouverchinesegarden/",
  twitter: "https://twitter.com/vangarden?lang=en",
  description: "Situated in the heart of Vancouver’s historic Chinatown neighbourhood, Dr. Sun Yat-Sen Classical Chinese Garden is an oasis of tranquility and reflection amid the bustle of urban life. Modeled after the Ming Dynasty scholars’ gardens in the city of Suzhou, it became the first authentic full-scale Chinese garden built outside of China upon its completion in April 1986.",
  monday_hours: "Closed",
  tuesday_hours: "10am - 4:30pm",
  wednesday_hours: "10am - 4:30pm",
  thursday_hours: "10am - 4:30pm",
  friday_hours: "10am - 4:30pm",
  saturday_hours: "10am - 4:30pm",
  sunday_hours: "10am - 4:30pm",
  image: "attractions/vancouver-sun-yet.jpg",
  categories: ["child-friendly", "garden"],
  google_place: "ChIJ8ToMkXpxhlQRYqJG8pg7rQI",
  public: true,
  featured: true
})

city1.attractions.create!({
  name: "Vancouver Art Gallery",
  address: "750 Hornby St",
  address_city: "Vancouver",
  address_postcode: "V6Z 2H7",
  website: "http://www.vanartgallery.bc.ca/",
  facebook: "http://www.facebook.com/VancouverArtGallery",
  instagram: "https://instagram.com/vanartgallery",
  twitter: "http://twitter.com/VanArtGallery",
  description: "The Vancouver Art Gallery (VAG) is the fifth-largest art gallery in Canada, and the largest in Western Canada[citation needed. It is located at 750 Hornby Street in Vancouver, British Columbia. Its permanent collection of about 11,000 artworks includes more than 200 major works by Emily Carr, the Group of Seven, Jeff Wall, Harry Callahan and Marc Chagall.",
  monday_hours: "10am - 5pm",
  tuesday_hours: "10am - 9pm",
  wednesday_hours: "10am - 5pm",
  thursday_hours: "10am - 5pm",
  friday_hours: "10am - 5pm",
  saturday_hours: "10am - 5pm",
  sunday_hours: "10am - 5pm",
  image: "attractions/vancouver-vag.jpg",
  categories: ["gallery"],
  google_place: "ChIJwXz9f39xhlQRT3qxXAPDlbU",
  public: true,
  featured: true
})

city1.attractions.create!({
  name: "Science World",
  address: "1455 Quebec St",
  address_city: "Vancouver",
  address_postcode: "V6A 3Z7",
  website: "https://scienceworld.ca/",
  facebook: "https://www.facebook.com/scienceworldca",
  instagram: "https://instagram.com/scienceworldca",
  twitter: "https://twitter.com/scienceworldca",
  description: "Science World at Telus World of Science, Vancouver is a science centre run by a not-for-profit organization in Vancouver, British Columbia, Canada. It is located at the end of False Creek, and features many permanent interactive exhibits and displays, as well as areas with varying topics throughout the years.",
  monday_hours: "Closed",
  tuesday_hours: "10am - 5pm",
  wednesday_hours: "10am - 5pm",
  thursday_hours: "10am - 5pm",
  friday_hours: "10am - 5pm",
  saturday_hours: "10am - 6pm",
  sunday_hours: "10am - 6pm",
  image: "attractions/vancouver-science-world.jpg",
  categories: ["child-friendly"],
  google_place: "ChIJnZHwi2NxhlQRN3CYHzc3giE",
  public: true,
  featured: true
})

## Montreal Attraction Data

city2.attractions.create!({
  name: "Notre-Dame Basilica of Montreal",
  address: "110 Notre-Dame St W",
  address_city: "Montreal",
  address_postcode: "H2Y 1T2",
  website: "https://www.basiliquenotredame.ca/en/",
  facebook: "https://www.facebook.com/Basilique-Notre-Dame-de-Montr%C3%A9al-1894117630829404/",
  instagram: "https://www.instagram.com/basiliquenddm/",
  twitter: "https://twitter.com/BasiliqueD",
  description: "Notre-Dame Basilica is a basilica in the historic district of Old Montreal, in Montreal, Quebec, Canada. The church is located at 110 Notre-Dame Street West, at the corner of Saint Sulpice Street. It is located next to the Saint-Sulpice Seminary and faces the Place d'Armes square.",
  monday_hours: "N/A",
  tuesday_hours: "N/A",
  wednesday_hours: "N/A",
  thursday_hours: "N/A",
  friday_hours: "N/A",
  saturday_hours: "N/A",
  sunday_hours: "N/A",
  image: "attractions/montreal_notre_dame.jpg",
  categories: ["historical", "museum"],
  google_place: "ChIJPXGXWFcayUwRqpYNHZ_v_B8",
  public: true,
  featured: true
})

city2.attractions.create!({
  name: "Montreal Botanical Garden",
  address: "4101 Rue Sherbrooke E",
  address_city: "Montreal",
  address_postcode: "H1X 2B2",
  website: "http://espacepourlavie.ca/en/botanical-garden",
  facebook: "https://www.facebook.com/Espacepourlavie",
  instagram: "https://www.instagram.com/espacepourlavie/",
  twitter: "https://twitter.com/espacepourlavie",
  description: "The Montreal Botanical Garden is a large botanical garden in Montreal, Quebec, Canada comprising 75 hectares of thematic gardens and greenhouses.",
  monday_hours: "Closed",
  tuesday_hours: "9am - 5pm",
  wednesday_hours: "9am - 5pm",
  thursday_hours: "9am - 5pm",
  friday_hours: "9am - 5pm",
  saturday_hours: "9am - 5pm",
  sunday_hours: "9am - 5pm",
  image: "attractions/montreal_botanical_garden.jpg",
  categories: ["garden"],
  google_place: "ChIJx4O-WgkcyUwRc3W0WQK-oUI",
  public: true,
  featured: true
})

city2.attractions.create!({
  name: "The Montreal Museum of Fine Arts",
  address: "1380 Rue Sherbrooke W",
  address_city: "Montreal",
  address_postcode: "H3G 1J5",
  website: "https://www.mbam.qc.ca/en/",
  facebook: "https://www.facebook.com/mbamtl",
  instagram: "https://www.instagram.com/mbamtl/",
  twitter: "https://twitter.com/mbamtl",
  description: "The Montreal Museum of Fine Arts is an art museum in Montreal, Quebec, Canada. It is the city's largest museum and is amongst the most prominent in Canada. The museum is located on the historic Golden Square Mile stretch of Sherbrooke Street.",
  monday_hours: "Closed",
  tuesday_hours: "10am - 5pm",
  wednesday_hours: "10am - 9pm",
  thursday_hours: "10am - 5pm",
  friday_hours: "10am - 5pm",
  saturday_hours: "10am - 5pm",
  sunday_hours: "10am - 5pm",
  image: "attractions/montreal_museum_of_fine_arts.jpg",
  categories: ["museum"],
  google_place: "ChIJZcCSF0AayUwRsDVrEHZsydY",
  public: true,
  featured: true
})

city2.attractions.create!({
  name: "Saint Joseph's Oratory of Mount Royal",
  address: "3800 Queen Mary Rd",
  address_city: "Montreal",
  address_postcode: "H3V 1H6",
  website: "https://www.saint-joseph.org/en/",
  facebook: "https://www.facebook.com/osaintjoseph/",
  instagram: "https://www.instagram.com/osjmr/",
  twitter: "https://twitter.com/osjmr",
  description: "Saint Joseph's Oratory of Mount Royal is a Roman Catholic minor basilica and national shrine on Mount Royal's Westmount Summit in Montreal, Quebec. It is Canada's largest church and claims to have one of the largest domes in the world.",
  monday_hours: "N/A",
  tuesday_hours: "N/A",
  wednesday_hours: "N/A",
  thursday_hours: "N/A",
  friday_hours: "N/A",
  saturday_hours: "N/A",
  sunday_hours: "N/A",
  image: "attractions/montreal-st-joesephs.jpg",
  categories: ["historical", "museum"],
  google_place: "ChIJad-yd_oZyUwRQ20Rv84PQ0o",
  public: true,
  featured: true
})

city2.attractions.create!({
  name: "Biosphere Environmental Museum",
  address: "160 Chemin du Tour de l'isle",
  address_city: "Montreal",
  address_postcode: "H3C 4G8",
  website: "https://www.canada.ca/en/environment-climate-change/services/biosphere.html",
  facebook: "https://www.facebook.com/biospheremtl/",
  instagram: "https://www.instagram.com/parcjeandrapeau/",
  twitter: "https://twitter.com/biospheremtl",
  description: "The Biosphere is a museum dedicated to the environment. It is located at Parc Jean-Drapeau, on Saint Helen's Island in the former pavilion of the United States for the 1967 World Fair, Expo 67 in Montreal, Quebec, Canada. The museum's geodesic dome was designed by Buckminster Fuller.",
  monday_hours: "Closed",
  tuesday_hours: "Closed",
  wednesday_hours: "10am - 5pm",
  thursday_hours: "10am - 5pm",
  friday_hours: "10am - 5pm",
  saturday_hours: "10am - 5pm",
  sunday_hours: "10am - 5pm",
  image: "attractions/montreal-biosphere.jpg",
  categories: ["museum", "garden"],
  google_place: "ChIJscEBsAgbyUwRKVqf-G_mDi0",
  public: true,
  featured: true
})

city2.attractions.create!({
  name: "Redpath Museum",
  address: "859 Sherbrooke St W",
  address_city: "Montreal",
  address_postcode: "H3A 0C4",
  website: "https://www.mcgill.ca/redpath/",
  facebook: "https://www.facebook.com/RedpathMuseum/",
  instagram: "https://www.instagram.com/explore/locations/171558/musee-redpath-museum/",
  twitter: "https://twitter.com/redpathmuseum",
  description: "The Redpath Museum is a museum of natural history belonging to McGill University and located on the university's campus at 859 Sherbrooke Street West in Montreal, Quebec. It was built in 1882 as a gift from the sugar baron Peter Redpath.",
  monday_hours: "9am - 5pm",
  tuesday_hours: "9am - 5pm",
  wednesday_hours: "9am - 5pm",
  thursday_hours: "9am - 5pm",
  friday_hours: "9am - 5pm",
  saturday_hours: "11am - 5pm",
  sunday_hours: "11am - 5pm",
  image: "attractions/montreal-red-path.jpg",
  categories: ["museum"],
  google_place: "ChIJewCbJ0cayUwRkk-dMZ99ir4",
  public: true,
  featured: true
})

city2.attractions.create!({
  name: "Parc Olympique",
  address: "4141 Pierre-de Coubertin Ave",
  address_city: "Montreal",
  address_postcode: "H1V 3N7",
  website: "https://parcolympique.qc.ca/en/what-to-do/olympic-stadium/",
  facebook: "https://www.facebook.com/parcolympiquemontreal/",
  instagram: "https://www.instagram.com/parcolympique/",
  twitter: "https://twitter.com/parcolympique",
  description: "The Olympic Park is a district in Montreal, Quebec, Canada, which was home to many of the venues from the 1976 Summer Olympics. It is bound by Sherbrooke Street to the west, Viau Street to the north, Pierre de Coubertin Avenue to the east, and Pie-IX Boulevard to the south.",
  monday_hours: "N/A",
  tuesday_hours: "N/A",
  wednesday_hours: "N/A",
  thursday_hours: "N/A",
  friday_hours: "N/A",
  saturday_hours: "N/A",
  sunday_hours: "N/A",
  image: "attractions/montreal-parc-olympique.jpg",
  categories: ["viewpoint"],
  google_place: "ChIJW7Yg-QocyUwRz9D3Is02NQ4",
  public: true,
  featured: true
})

city2.attractions.create!({
  name: "Underground City",
  address: "747 Rue du Square-Victoria",
  address_city: "Montreal",
  address_postcode: "H2Y 3Y9",
  website: "https://montrealundergroundcity.com/",
  facebook: "https://www.facebook.com/MontrealUndergroundCity/",
  instagram: "https://www.instagram.com/explore/tags/montrealundergroundcity/?hl=en",
  twitter: "https://twitter.com/mtl_souterrain?lang=en",
  description: "RÉSO, commonly referred to as The Underground City (French: La ville souterraine), is the name applied to a series of interconnected office towers, hotels, shopping centres, residential and commercial complexes, convention halls, universities and performing arts venues that form the heart of Montreal's central business district.",
  monday_hours: "10am - 9pm",
  tuesday_hours: "10am - 9pm",
  wednesday_hours: "10am - 9pm",
  thursday_hours: "10am - 9pm",
  friday_hours: "10am - 9pm",
  saturday_hours: "10am - 6pm",
  sunday_hours: "10am - 5pm",
  image: "attractions/montreal-RESO.jpg",
  categories: ["shopping"],
  google_place: "ChIJZcWSvUQayUwRXr2czLB1oEA",
  public: true,
  featured: true
})

city2.attractions.create!({
  name: "Atwater Market",
  address: "138 Atwater Ave",
  address_city: "Montreal",
  address_postcode: "H4C 2H6",
  website: "https://www.marchespublics-mtl.com/en/marches/atwater-market/",
  facebook: "https://www.facebook.com/mpmontreal",
  instagram: "https://www.instagram.com/marchespublicsmtl/",
  twitter: "https://twitter.com/MarchePublicMtl",
  description: "Atwater Market is a market hall located in the Saint-Henri area of Montreal, Quebec, Canada. It opened in 1933. The interior market is home to many butchers and the Première Moisson bakery and restaurant.",
  monday_hours: "8am - 6pm",
  tuesday_hours: "8am - 6pm",
  wednesday_hours: "8am - 6pm",
  thursday_hours: "8am - 7pm",
  friday_hours: "8am - 8pm",
  saturday_hours: "8am - 5pm",
  sunday_hours: "8am - 5pm",
  image: "attractions/montreal-atwater.jpg",
  categories: ["shopping"],
  google_place: "ChIJD9akWHgayUwRy9872P6KvJA",
  public: true,
  featured: true
})

## London Attraction Data

city3.attractions.create!({
  name: "Big Ben",
  address: "Westminster",
  address_city: "London",
  address_postcode: "SW1A 0AA",
  website: "https://www.parliament.uk/bigben",
  facebook: "https://www.facebook.com/ukparliament/",
  instagram: "https://www.instagram.com/ukparliament/",
  twitter: "https://twitter.com/ukparliament?lang=en",
  description: "  Big Ben is the nickname for the Great Bell of the clock at the north end of the Palace of Westminster in London and is usually extended to refer to both the clock and the clock tower. The official name of the tower in which Big Ben is located was originally the Clock Tower, but it was renamed Elizabeth Tower in 2012 to mark the Diamond Jubilee of Elizabeth II.",
  monday_hours: "N/A",
  tuesday_hours: "N/A",
  wednesday_hours: "N/A",
  thursday_hours: "N/A",
  friday_hours: "N/A",
  saturday_hours: "N/A",
  sunday_hours: "N/A",
  image: "attractions/London-BigBen.jpg",
  categories: ["historical", "monument", "child-friendly"],
  google_place: "ChIJ2dGMjMMEdkgRqVqkuXQkj7c",
  public: true,
  featured: true
})

city3.attractions.create!({
  name: "Buckingham Palace",
  address: "Westminster",
  address_city: "London",
  address_postcode: "SW1A 1AA",
  website: "https://www.rct.uk/visit/the-state-rooms-buckingham-palace",
  facebook: "https://www.facebook.com/royalcollectiontrust/",
  instagram: "https://www.instagram.com/royalcollectiontrust/?hl=en",
  twitter: "https://twitter.com/rct?lang=en",
  description: "Buckingham Palace is the London residence and administrative headquarters of the monarch of the United Kingdom. Located in the City of Westminster, the palace is often at the centre of state occasions and royal hospitality. It has been a focal point for the British people at times of national rejoicing and mourning.",
  monday_hours: "9am - 7.30pm",
  tuesday_hours: "9am - 7.30pm",
  wednesday_hours: "9am - 7.30pm",
  thursday_hours: "9am - 7.30pm",
  friday_hours: "9am - 7.30pm",
  saturday_hours: "9am - 7.30pm",
  sunday_hours: "9am - 7.30pm",
  image: "attractions/london-buck-palace.jpg",
  categories: ["historical", "child-friendly"],
  google_place: "ChIJtV5bzSAFdkgRpwLZFPWrJgo",
  public: true,
  featured: true
})

city3.attractions.create!({
  name: "London Eye",
  address: "Lambeth",
  address_city: "London",
  address_postcode: "SE1 7PB",
  website: "https://www.londoneye.com/",
  facebook: "https://www.facebook.com/OfficialLondonEye/",
  instagram: "https://www.instagram.com/londoneye/",
  twitter: "https://twitter.com/TheLondonEye",
  description: "The structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft). When it opened to the public in 2000 it was the world's tallest Ferris wheel. Supported by an A-frame on one side only, the Eye is described by its operators as the world's tallest cantilevered observation wheel.",
  monday_hours: "10am - 7.30pm",
  tuesday_hours: "10am - 7.30pm",
  wednesday_hours: "10am - 7.30pm",
  thursday_hours: "10am - 7.30pm",
  friday_hours: "10am - 7.30pm",
  saturday_hours: "10am - 7.30pm",
  sunday_hours: "10am - 7.30pm",
  image: "attractions/london-eye.jpg",
  categories: ["viewpoint", "child-friendly"],
  google_place: "ChIJc2nSALkEdkgRkuoJJBfzkUI",
  public: true,
  featured: true
})

city3.attractions.create!({
  name: "Tower of London",
  address: "St Katharine's & Wapping",
  address_city: "London",
  address_postcode: "EX3N 4AB",
  website: "https://www.hrp.org.uk/tower-of-london/",
  facebook: "https://www.facebook.com/toweroflondon/",
  instagram: "https://www.instagram.com/historicroyalpalaces/",
  twitter: "https://twitter.com/TowerOfLondon",
  description: "The Tower of London, officially Her Majesty's Royal Palace and Fortress of the Tower of London, is a historic castle located on the north bank of the River Thames in central London.",
  monday_hours: "10am - 4:30pm",
  tuesday_hours: "9am - 4:30pm",
  wednesday_hours: "9am - 4:30pm",
  thursday_hours: "9am - 4:30pm",
  friday_hours: "9am - 4:30pm",
  saturday_hours: "9am - 4:30pm",
  sunday_hours: "10am - 4:30pm",
  image: "attractions/london-tower-of-london.jpg",
  categories: ["historical", "child-friendly"],
  google_place: "ChIJ3TgfM0kDdkgRZ2TV4d1Jv6g",
  public: true,
  featured: true
})

city3.attractions.create!({
  name: "Tower Bridge",
  address: "Tower Bridge Road",
  address_city: "London",
  address_postcode: "SE1 2UP",
  website: "https://www.towerbridge.org.uk/",
  facebook: "https://www.facebook.com/towerbridge/",
  instagram: "https://www.instagram.com/towerbridge/?hl=en",
  twitter: "https://twitter.com/TowerBridge?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor",
  description: "Tower Bridge is a combined bascule and suspension bridge in London built between 1886 and 1894. The bridge crosses the River Thames close to the Tower of London and has become an iconic symbol of London. Because of this, Tower Bridge is sometimes confused with London Bridge.",
  monday_hours: "9am - 5pm",
  tuesday_hours: "9am - 5pm",
  wednesday_hours: "9am - 5pm",
  thursday_hours: "9am - 5pm",
  friday_hours: "9am - 5pm",
  saturday_hours: "9am - 5pm",
  sunday_hours: "10am - 4:30pm",
  image: "attractions/london-tower-bridge.jpg",
  categories: ["historical", "viewpoint", "child-friendly"],
  google_place: "EhxUb3dlciBCcmlkZ2UsIFVuaXRlZCBLaW5nZG9tIi4qLAoUChIJi2vtr0gDdkgR9VZELRbHdpoSFAoSCamRx0IRO1oCEXoliDJDoPjE",
  public: true,
  featured: true
})

city3.attractions.create!({
  name: "The British Museum",
  address: "Great Russell Street, Bloomsbury",
  address_city: "London",
  address_postcode: "WC1B 3DG",
  website: "https://www.britishmuseum.org/",
  facebook: "https://www.facebook.com/britishmuseum/",
  instagram: "https://www.instagram.com/britishmuseum/",
  twitter: "https://twitter.com/britishmuseum",
  description: "The British Museum, located in the Bloomsbury area of London, in the United Kingdom, is a public institution dedicated to human history, art and culture. Its permanent collection numbers some 8 million works, and is among the largest and most comprehensive in existence having been widely sourced during the era of the British Empire.",
  monday_hours: "10am - 5:30pm",
  tuesday_hours: "10am - 5:30pm",
  wednesday_hours: "10am - 5:30pm",
  thursday_hours: "10am - 5:30pm",
  friday_hours: "10am - 8:30pm",
  saturday_hours: "10am - 5:30pm",
  sunday_hours: "10am - 5:30pm",
  image: "attractions/london-british-musuem.jpg",
  categories: ["historical", "child-friendly", "museum"],
  google_place: "ChIJB9OTMDIbdkgRp0JWbQGZsS8",
  public: true,
  featured: true
})

city3.attractions.create!({
  name: "Westminster Abbey",
  address: "20 Deans Yard, Westminster",
  address_city: "London",
  address_postcode: "SW1P 3PA",
  website: "https://www.westminster-abbey.org/",
  facebook: "https://www.facebook.com/WestminsterAbbeyLondon/",
  instagram: "https://www.instagram.com/westminsterabbeylondon/",
  twitter: "https://twitter.com/wabbey",
  description: "Westminster Abbey, formally titled the Collegiate Church of St Peter at Westminster, is a large, mainly Gothic abbey church in the City of Westminster, London, England, just to the west of the Palace of Westminster.",
  monday_hours: "9am - 3:30pm",
  tuesday_hours: "9am - 3:30pm",
  wednesday_hours: "9am - 6pm",
  thursday_hours: "9am - 3:30pm",
  friday_hours: "10am - 8:30pm",
  saturday_hours: "9am - 1:30pm",
  sunday_hours: "Closed",
  image: "attractions/london-westminster-abbey.jpg",
  categories: ["historical", "child-friendly"],
  google_place: "ChIJRUeRWcMEdkgRAO7ZzLCgDXA",
  public: true,
  featured: true
})

city3.attractions.create!({
  name: "St. Paul's Cathedral",
  address: "St. Paul's Churchyard",
  address_city: "London",
  address_postcode: "EC4M 8AD",
  website: "https://www.stpauls.co.uk/",
  facebook: "https://www.facebook.com/stpaulscathedral",
  instagram: "https://www.instagram.com/stpaulscathedrallondon/",
  twitter: "https://twitter.com/StPaulsLondon",
  description: "St Paul's Cathedral, London, is an Anglican cathedral, the seat of the Bishop of London and the mother church of the Diocese of London. It sits on Ludgate Hill at the highest point of the City of London and is a Grade I listed building.",
  monday_hours: "8:30am - 4:30pm",
  tuesday_hours: "8:30am - 4:30pm",
  wednesday_hours: "8:30am - 4:30pm",
  thursday_hours: "8:30am - 4:30pm",
  friday_hours: "8:30am - 4:30pm",
  saturday_hours: "8:30am - 4:30pm",
  sunday_hours: "Closed",
  image: "attractions/london-st-pauls.jpg",
  categories: ["historical", "viewpoint", "child-friendly", "monument"],
  google_place: "ChIJh7wHoqwEdkgR3l-vqQE1HTo",
  public: true,
  featured: true
})

city3.attractions.create!({
  name: "The Shard (The View)",
  address: "32 London Bridge Street",
  address_city: "London",
  address_postcode: "SE1 9SG",
  website: "https://www.theviewfromtheshard.com/",
  facebook: "https://www.facebook.com/TheShardLondon/",
  instagram: "https://www.instagram.com/shardview/",
  twitter: "https://twitter.com/TheShardLondon",
  description: "The Shard, also infrequently referred to as the Shard of Glass, Shard London Bridge and formerly London Bridge Tower, is a 95-story supertall skyscraper, designed by the Italian architect Renzo Piano, in Southwark, London, that forms part of the Shard Quarter development.",
  monday_hours: "10am - 8pm",
  tuesday_hours: "10am - 8pm",
  wednesday_hours: "10am - 8pm",
  thursday_hours: "10am - 10pm",
  friday_hours: "10am - 10pm",
  saturday_hours: "10am - 10pm",
  sunday_hours: "10am - 8pm",
  image: "attractions/london-the-shard.jpg",
  categories: ["viewpoint", "child-friendly"],
  google_place: "ChIJ03GSCloDdkgRe_s-p2vyvQA",
  public: true,
  featured: true
})

# USERS

puts "Creating users..."

60.times do |i|
  User.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  })
end

User.create({
  first_name: 'Gio',
  last_name: 'R',
  email: 'email@email.com',
  password: 'password',
  password_confirmation: 'password'
  })

# REVIEWS

puts "Creating reviews..."

100.times do |i|
  Review.create({
    user_id: rand(1..61),
    attraction_id: rand(1..27),
    review: Faker::VentureBros.quote,
    rating: rand(1..5)
  })
end


# TRIPS

puts "Creating trips..."

5.times do |i|
  Trip.create({
    name: Faker::VentureBros.organization,
    start_date: Faker::Date.between(60.days.ago, 30.days.ago),
    end_date: Faker::Date.between(29.days.ago, Date.today),
    public: true,
    featured: true
  })
end

# USER_TRIPS

puts "Linking trips to test user..."

5.times do |i|
  UserTrip.create({
    user_id: 61,
    trip_id: rand(1..5),
    role: 'creator'
  })
end

# ITINERARIES

puts "Creating itineraries..."

15.times do |i|
  Itinerary.create({
    name: Faker::HeyArnold.location,
    date: Faker::Date.between(60.days.ago, 30.days.ago),
    notes: Faker::HeyArnold.quote,
    public: true,
    featured: false,
    trip_id: rand(1..5)
    })
end

puts "Seed complete."

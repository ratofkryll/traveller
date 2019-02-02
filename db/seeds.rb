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
  name: "New York",
  country: "United States",
  description: "New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers. Its iconic sites include skyscrapers such as the Empire State Building and sprawling Central Park. Broadway theater is staged in neon-lit Times Square.",
  language: "English",
  currency: "USD",
  transit: "http://www.mta.info/nyct",
  emergency_phone: "911",
  time_zone: "EST (UTC-5h)",
  tipping_custom: "15-20%",
  image: "cities/city_newyork.jpg"
})
city5 = City.create!({
  name: "Los Angeles",
  country: "United States",
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

# ATTRACTIONS

puts "Creating attractions..."

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

# USERS

puts "Creating users..."

20.times do |i|
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
  password_confirmation: 'password',
  profile_pic: 'https://static.tvtropes.org/pmwiki/pub/images/rsz_superheroes2.png'
  })

# REVIEWS

puts "Creating reviews..."

50.times do |i|
  Review.create({
    user_id: rand(1..21),
    attraction_id: rand(1..3),
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
    user_id: 21,
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

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

puts "Seeding data..."

# CITIES

puts "Finding or creating cities..."

city1 = City.find_or_create_by!({
  name: "Vancouver",
  country: "Canada",
  description: Faker::Lovecraft.paragraph(3),
  language: "English",
  currency: "CAD",
  transit: "https://www.translink.ca/",
  emergency_phone: "911",
  time_zone: "PST (UTC-8h)",
  tipping_custom: "15-18%",
  image: "/cities/city_vancouver.jpg"
})
city2 = City.find_or_create_by!({
  name: "Montreal",
  country: "Canada",
  description: Faker::Lovecraft.paragraph(3),
  language: "French/English",
  currency: "CAD",
  transit: "http://www.stm.info/en",
  emergency_phone: "911",
  time_zone: "EST (UTC-5h)",
  tipping_custom: "15-18%",
  image: "/cities/city_montreal.jpg"
})
city3 = City.find_or_create_by!({
  name: "London",
  country: "England",
  description: Faker::Lovecraft.paragraph(3),
  language: "English",
  currency: "GBP",
  transit: "http://www.londontransit.ca/",
  emergency_phone: "999",
  time_zone: "GMT (UTC+0h)",
  tipping_custom: "Usually 12.75% added to your bill.",
  image: "/cities/city_london.jpg"
})

# ATTRACTIONS

puts "Creating attractions..."

Attraction.destroy_all

city2.attractions.create!({
  name: "Notre-Dame Basilica of Montreal",
  address: "110 Notre-Dame St W",
  postcode: "H2Y 1T2",
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
  image: "/attractions/montreal_notre_dame.jpg",
  categories: ["historical", "museum"],
  google_place: "ChIJPXGXWFcayUwRqpYNHZ_v_B8",
  public: true,
  featured: true
})

city2.attractions.create!({
  name: "Notre-Dame Basilica of Montreal",
  address: "110 Notre-Dame St W",
  postcode: "H2Y 1T2",
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
  image: "/attractions/montreal_notre_dame.jpg",
  categories: ["historical", "museum"],
  google_place: "ChIJPXGXWFcayUwRqpYNHZ_v_B8",
  public: true,
  featured: true
})

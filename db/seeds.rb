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
  image: "assets/images/city_vancouver.jpg"
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
  image: "assets/images/city_montreal.jpg"
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
  image: "assets/images/city_london.jpg"
})

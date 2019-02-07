require 'rails_helper'

RSpec.feature "AttractionsOnCities", type: :feature, js:true do

  before :each do
    @city = City.create(
        name: Faker::HarryPotter.location,
        country: Faker::HarryPotter.location,
        description: Faker::HarryPotter.quote,
        language: 'English',
        currency: 'CAD',
        transit: 'www.translink.ca',
        emergency_phone: '911',
        time_zone: 'PST (UTC-8h)',
        tipping_custom: '18%',
        image: 'cities/city_vancouver1.jpg'
      )

    10.times do |n|
      @city.attractions.create!(
        name: Faker::HarryPotter.spell,
        address: Faker::HarryPotter.spell,
        address_city: Faker::HarryPotter.location,
        address_postcode: "SE1 9SG",
        website: "https://www.theviewfromtheshard.com/",
        facebook: "https://www.facebook.com/TheShardLondon/",
        instagram: "https://www.instagram.com/shardview/",
        twitter: "https://twitter.com/TheShardLondon",
        description: Faker::HarryPotter.quote,
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
      )
    end

  end

  scenario "attractions are listed on the city page" do
    visit root_path
    first('div.city-card').click
    click_on('All')
    expect(page).to have_css '.attraction-card', count: 10
  end

end

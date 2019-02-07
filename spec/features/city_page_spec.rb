require 'rails_helper'

RSpec.feature "CityPages", type: :feature, js: true do

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
  end

  scenario "they see information about the city and attraactions" do
    visit root_path
    first('div.city-card').click
    expect(find('.all-city-info')).to have_content(@city.country)
  end

end

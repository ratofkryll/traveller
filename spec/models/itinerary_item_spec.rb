require 'rails_helper'

RSpec.describe ItineraryItem, type: :model do

  before :each do 
    @user = User.create(
      first_name: 'first',
      last_name: 'last',
      email: 'test@test.com',
      password: 'somepassword',
      password_confirmation: 'somepassword'
    )

    @trip = Trip.create(
      name: 'sometrip',
      start_date: Time.now + 1.days,
      end_date: Time.now + 3.days,
      public: 't',
      featured: 't'
    )

    @user_trip = UserTrip.create(
      user_id: @user.id,
      trip_id: @trip.id,
      role: ''
    )

    @itinerary = Itinerary.create(
      name: 'My itinerary',
      date: Time.now + 2.days,
      notes: 'Here are my notes',
      public: 't',
      featured: 't',
      trip_id: @trip.id
    )

    @city = City.create(
      name: 'Vancouver',
      country: 'Canada',
      description: 'This is a description.',
      language: 'English',
      currency: 'CAD',
      transit: 'www.translink.ca',
      emergency_phone: '911',
      time_zone: 'PST (UTC-8h)',
      tipping_custom: '18%',
      image: 'cities/city_vancouver1.jpg'
    )

    @attraction = Attraction.create(
      name: 'Some attraction',
      address: 'some address',
      address_city: 'Vancouver',
      address_postcode: 'V5X 3X9',
      website: 'www.google.com',
      facebook: 'myfacebook',
      instagram: 'asdfkj',
      twitter: 'tweeet',
      description: 'some description',
      monday_hours: '9:00 - 10:00',
      tuesday_hours: '9:00 - 10:00',
      wednesday_hours: '9:00 - 10:00',
      thursday_hours: '9:00 - 10:00',
      friday_hours: '9:00 - 10:00',
      saturday_hours: '9:00 - 10:00', 
      sunday_hours: '9:00 - 10:00',
      image: 'attractions/vancouver-capilano.jpg',
      categories: ["nature", "child-friendly"],
      google_place: 'skljdflksjdfk',
      city_id: @city.id,
      public: 't',
      featured: 't'
    )

    @itinerary_item = ItineraryItem.create(
      name: 'Item',
      notes: 'This is the first item',
      start_time: "08:25:00",
      end_time: "15:25:00",
      attraction_id: @attraction.id,
      itinerary_id: @itinerary.id
    )
  end

  describe 'Validations' do
    it "is valid with all fields" do
      expect(@itinerary_item).to be_valid
    end

    it "is valid with no attraction id" do
      @itinerary_item.attraction_id = nil
      expect(@itinerary_item).to be_valid
    end

    it "is valid with no name" do
      @itinerary_item.name = nil
      expect(@itinerary_item).to be_valid
    end

    it "is valid with no notes" do
      @itinerary_item.notes = nil
      expect(@itinerary_item).to be_valid
    end

    it "is not valid with no start time" do
      @itinerary_item.start_time = nil
      expect(@itinerary_item).to_not be_valid
    end

    it "is not valid with no end time" do
      @itinerary_item.end_time = nil
      expect(@itinerary_item).to_not be_valid
    end

    it "is not valid with no itinerary" do
      @itinerary_item.itinerary_id = nil
      expect(@itinerary_item).to_not be_valid
    end

    it "is not valid with no itinerary" do
      @itinerary_item.itinerary_id = nil
      expect(@itinerary_item).to_not be_valid
    end

    it "is not valid if end time is before start time" do
      @itinerary_item.start_time = "15:25:00"
      @itinerary_item.end_time = "14:25:00"
      expect(@itinerary_item).to_not be_valid
    end

  end

end

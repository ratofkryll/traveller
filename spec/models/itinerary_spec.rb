require 'rails_helper'

RSpec.describe Itinerary, type: :model do
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
  end

  describe 'Itinerary:Validations' do

    it "is valid with valid fields" do
      expect(@itinerary).to be_valid
    end

    it "is not valid with no name" do
      @itinerary.name = nil
      expect(@itinerary).to_not be_valid
    end

    it "is valid with no notes" do
      @itinerary.notes = nil
      expect(@itinerary).to be_valid
    end

    it "is valid with no date" do
      @itinerary.date = nil
      expect(@itinerary).to be_valid
    end

  end

end

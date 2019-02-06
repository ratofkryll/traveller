require 'rails_helper'

RSpec.describe Trip, type: :model do
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
      start_date: Time.now + 1,
      end_date: Time.now + 3,
      public: 't',
      featured: 't'
    )

    @user_trip = UserTrip.create(
      user_id: @user.id,
      trip_id: @trip.id,
      role: ''
    )
  end

  describe 'Trip:Validations' do

    it "is valid with valid fields" do
      expect(@trip).to be_valid
    end

    it "is not valid without a trip name" do
      @trip.name = nil
      expect(@trip).to_not be_valid
    end

  end

end

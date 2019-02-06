require 'rails_helper'

RSpec.describe Trip, type: :model do
  before :each do 
    @user = User.new(
      first_name: 'first',
      last_name: 'last',
      email: 'test@test.com',
      password: 'somepassword',
      password_confirmation: 'somepassword'
    )

    @trip = Trip.new(
      name: 'sometrip',
      start_date: Time.now + 1,
      end_date: Time.now + 3,
      public: 't',
      featured: 't'
    )

    @user_trip = UserTrip.new(
      user_id: @user.id,
      trip_id: @trip.id,
      role: ''
    )
  end

  describe 'Trip:Validations' do

    it "is valid with valid fields" do
      expect(@trip).to be_valid
    end

  end

  describe 'User trip:Validations' do

    it "is valid with valid fields" do
      expect(@user_trip).to be_valid
    end

  end

end

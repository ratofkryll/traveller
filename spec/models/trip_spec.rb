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

    current_user = @user

    @trip = Trip.create(
      name: 'sometrip',
      start_date: Time.now + 1.days,
      end_date: Time.now + 3.days,
      public: 't',
      featured: 't'
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

    it "is not valid without a start date" do
      @trip.start_date = nil
      expect(@trip).to_not be_valid
    end

    it "is not valid without a end date" do
      @trip.end_date = nil
      expect(@trip).to_not be_valid
    end

    it "is not valid if start date is later than end date" do
      @trip.end_date = Time.now
      @trip.start_date = Time.now + 3.days
      expect(@trip).to_not be_valid
    end

  end

end

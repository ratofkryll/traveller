require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do 
    @user = User.new(
      first_name: 'first',
      last_name: 'last',
      email: 'test@test.com',
      password: 'somepassword',
      password_confirmation: 'somepassword'
    )
  end

  describe 'Validations' do
    it "is valid with valid fields" do
      expect(@user).to be_valid
    end

    it "is not valid without an email address" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is not valid when passwords don't match" do
      @user.password_confirmation = "someotherpassword"
      expect(@user).to_not be_valid
    end

    it "is not valid with an empty pasword" do
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "is valid with no first name" do
      @user.first_name = nil
      expect(@user).to be_valid
    end

    it "is valid with no last name" do
      @user.last_name = nil
      expect(@user).to be_valid
    end

  end

end

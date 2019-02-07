require 'rails_helper'

RSpec.feature "AddTrips", type: :feature, js: true do

  before :each do
    @user = User.create(
      first_name: 'first',
      last_name: 'last',
      email: 'test@test.com',
      password: 'somepassword',
      password_confirmation: 'somepassword'
    )
  end

  scenario "user is able to add a trip" do
    visit '/users/sign_in'

    within 'form' do
      fill_in id: 'user_email', with: @user.email
      fill_in id: 'user_password', with: 'somepassword'
    end

    find('input[name="commit"]').click

    visit '/trips/new'

    within 'form' do
      fill_in id: 'trip_name', with: 'My trip'
      fill_in id: 'trip_start_date', with: Time.now + 1.days
      fill_in id: 'trip_end_date', with: Time.now + 5.days
    end

    find('input[name="commit"]').click
    expect(page).to have_content('My trip')

  end

end

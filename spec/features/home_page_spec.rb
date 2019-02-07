require 'rails_helper'

RSpec.feature "Visitor navigates to homepage", type: :feature, js: true do

  scenario "They see all cities" do
    visit root_path
  end

end

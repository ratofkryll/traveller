require 'test_helper'

class UserTripsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_trips_new_url
    assert_response :success
  end

  test "should get create" do
    get user_trips_create_url
    assert_response :success
  end

end

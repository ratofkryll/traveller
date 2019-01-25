require 'test_helper'

class ItineraryItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get itinerary_items_create_url
    assert_response :success
  end

  test "should get edit" do
    get itinerary_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get itinerary_items_update_url
    assert_response :success
  end

  test "should get show" do
    get itinerary_items_show_url
    assert_response :success
  end

  test "should get destroy" do
    get itinerary_items_destroy_url
    assert_response :success
  end

end

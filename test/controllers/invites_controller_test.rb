require 'test_helper'

class InvitesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get invites_create_url
    assert_response :success
  end

  test "should get new" do
    get invites_new_url
    assert_response :success
  end

  test "should get show" do
    get invites_show_url
    assert_response :success
  end

end

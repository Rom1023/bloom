require 'test_helper'

class CollaborationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get collaborations_new_url
    assert_response :success
  end

  test "should get create" do
    get collaborations_create_url
    assert_response :success
  end

end

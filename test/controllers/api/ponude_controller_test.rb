require "test_helper"

class Api::PonudeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_ponude_index_url
    assert_response :success
  end

  test "should get create" do
    get api_ponude_create_url
    assert_response :success
  end
end

require "test_helper"

class StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get stores_home_url
    assert_response :success
  end
end

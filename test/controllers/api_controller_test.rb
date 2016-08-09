require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get medal" do
    get api_medal_url
    assert_response :success
  end

end

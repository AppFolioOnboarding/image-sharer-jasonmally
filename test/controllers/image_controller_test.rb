require 'test_helper'

class ImageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get image_home_url
    assert_response :success
  end

end

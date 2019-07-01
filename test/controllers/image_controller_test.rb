require 'test_helper'

class ImageControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = Image.create!(name: 'Test Image', image_url: 'https://pixy.org/src/456/4564782.jpeg')
  end

  def test_home
    get root_path
    assert_response :ok
    assert_select '#header', 'All Saved Images'
  end

  def test_form
    get new_image_path
    assert_response :ok
    assert_select '#header', 'Save Image'
  end

  def test_create_success
    assert_difference('Image.count', 1) do
      image_params = { name: 'Second Test Image', image_url: 'https://i.imgur.com/CAujwlD.jpg', tag_list: 'forgot, what, this, image, was' }
      post image_index_path, params: { image: image_params }
    end
    assert_redirected_to image_path(Image.last)
    follow_redirect!
    assert_select '#tags', 'Tags: forgot, what, this, image, was'
  end

  def test_create_fail
    assert_no_difference('Image.count') do
      image_params = { name: 'Second Test Image', image_url: 'hts://i.imgur.com/CAujwlD.jpg' }
      post image_index_path, params: { image: image_params }
    end
    assert_response :unprocessable_entity
  end
end

require 'test_helper'

class ImageControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = Image.create!(name: 'TestImg1', image_url: 'https://'\
    'i.imgur.com/CAujwlD.jpg', tag_list: 'a, b')
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

  def test_tag_search
    get tagged_path('a')
    assert_response :ok
    assert_select '#header', 'Tagged Images'
  end

  def test_tag_search_none_found
    # we should still successfully reach the page
    get tagged_path('g')
    assert_response :ok
    assert_select '#header', 'Tagged Images'
  end

  def test_create_success
    assert_difference('Image.count', 1) do
      image_params = { name: 'TestImg2', image_url: 'https://i.imgur.com/CAujwlD.jpg', tag_list: 'a, b' }
      post image_index_path, params: { image: image_params }
    end
    assert_redirected_to image_path(Image.last)
    follow_redirect!
    assert_select '#tags', 'Tags: a, b'
  end

  def test_create_success_check_tag
    assert_difference('Image.count', 1) do
      image_params = { name: 'TestImg3', image_url: 'https://i.imgur.com/CAujwlD.jpg', tag_list: 'c, b' }
      post image_index_path, params: { image: image_params }
    end
    assert_redirected_to image_path(Image.last)
    follow_redirect!
    assert_select '#tags', 'Tags: c, b'

    # now we check whether we can navigate to the tagged images page after posting image
    get tagged_path('b')
    assert_response :ok

    # now we check whether both images tagged 'b' are present
    assert_select '#TestImg1', 'Tags: a, b'
    assert_select '#TestImg3', 'Tags: c, b'
  end

  def test_create_fail
    assert_no_difference('Image.count') do
      image_params = { name: 'Second Test Image', image_url: 'hts://i.imgur.com/CAujwlD.jpg' }
      post image_index_path, params: { image: image_params }
    end
    assert_response :unprocessable_entity
  end

  def test_delete_success
    assert_difference('Image.count', -1) do
      delete image_path(980_190_963)
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_select '#TestImg1', false
  end

  def test_delete_failure
    get root_path
    assert_no_difference('Image.count') do
      # this fails because no image has id = 12
      delete image_path(12)
    end
    assert_select '#TestImg1', 'Tags: a, b'
  end
end

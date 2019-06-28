require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_empty_image_params
    img = Image.new
    assert_not img.valid?
    assert_equal 'Please enter a title for your image.', img.errors.messages[:name].first
    assert_includes img.errors.messages[:image_url], 'Please enter a URL for your image.'
    assert_includes img.errors.messages[:image_url], 'This image URL is invalid.'
  end

  def test_empty_image_url
    img = Image.new(name: "woo this isn't real")
    assert_not img.valid?
    assert_includes img.errors.messages[:image_url], 'Please enter a URL for your image.'
    assert_includes img.errors.messages[:image_url], 'This image URL is invalid.'
  end

  def test_empty_image_name
    img = Image.new(image_url: 'https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg')
    assert_not img.valid?
    assert_equal 'Please enter a title for your image.', img.errors.messages[:name].first
  end

  def test_image_invalid_url
    img = Image.new(name: 'This is a title', image_url: 'htp:/www.wrong.com')
    assert_not img.valid?
    assert_equal 'This image URL is invalid.', img.errors.messages[:image_url].first
  end

  def test_valid_image
    img = Image.new(name: 'Finally!', image_url: 'https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg')
    assert img.valid?
  end
end

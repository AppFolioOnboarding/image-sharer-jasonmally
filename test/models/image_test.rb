require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test "Image 1. An image with no text or URL should not be accepted" do
    img = Image.new
    assert_not img.valid?
  end

  test "Image 2.1. An image missing a field should not be accepted" do
    img = Image.new({name: "woo this isn't real"})
    assert_not img.valid?
  end

  test "Image 2.2. An image missing a field should not be accepted" do
    img = Image.new({image_url: "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg"})
    assert_not img.valid?
  end

  test "Image 3. An image with an invalid URL should not be accepted" do
    img = Image.new({name: "This is a title", image_url: "htp:/www.wrong.com"})
    assert_not img.valid?
  end

  test "Image 4. An image with a title and a valid URL should be accepted" do
    img = Image.new({name: "Finally!", image_url: "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg"})
    assert img.valid?
  end
end

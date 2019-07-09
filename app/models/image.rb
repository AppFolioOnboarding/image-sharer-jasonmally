class Image < ApplicationRecord
  validates :name, presence: { message: 'Please enter a title for your image.' }
  validates :image_url, presence: { message: 'Please enter a URL for your image.' }
  validates :image_url, url: { message: 'This image URL is invalid.' }
  validates :tag_list, presence: { message: 'You cannot submit an image with no tags!'}
  acts_as_taggable_on :tags
end

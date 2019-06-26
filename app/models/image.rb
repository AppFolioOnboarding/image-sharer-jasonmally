class Image < ApplicationRecord
    validates :name, presence: {message: "Please enter a title for your image."}
    validates :image_url, presence: {message: "Please enter a URL for your image."}
    validates :image_url, url: {message: "This image URL is invalid."}
end

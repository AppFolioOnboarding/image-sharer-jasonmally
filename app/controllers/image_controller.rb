class ImageController < ApplicationController
  def new
    # @image = Image.new
  end
  def create
    @image = Image.new(valid_image_params)
    if @image.valid?
      @image.save
      redirect_to @image
    else
      #TODO: handle improperly formatted  URLS w/ nice error message
      pp @image.errors.messages
      render 'new'
    end
    
  end
  def show
    pp params
    @image = Image.find(valid_image_shown)
  end
  private
    def valid_image_params
      params.require(:image).permit(:name, :image_url)
    end
    def valid_image_shown
      params.require(:id)
    end
end

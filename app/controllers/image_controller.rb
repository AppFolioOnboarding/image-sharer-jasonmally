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
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @image = Image.find(valid_image_shown)
    rescue ActiveRecord::RecordNotFound
      @images = Image.all
      render 'index'
      return
    end
    @image.destroy!
    @images = Image.all
    redirect_to root_path
  end

  def show
    @image = Image.find(valid_image_shown)
  end

  def edit
    @image = Image.find(valid_image_shown)
    render 'update'
  end

  def update
    @image = Image.find(valid_image_shown)
    if params[:image]['tag_list'].empty?
      render 'show', status: :unprocessable_entity
      return
    end
    @image.update(tag_list: params[:image]['tag_list'])
    render 'show'
  end

  def index
    @images = Image.all
  end

  def tagged
    @images = (Image.tagged_with(params[:tag]) if params[:tag].present?)
  end

  private

  def valid_image_params
    params.require(:image).permit(:name, :image_url, :tag_list)
  end

  def valid_image_shown
    params.require(:id)
  end
end

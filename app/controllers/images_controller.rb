class ImagesController < ApplicationController
  def index 
    @images = Image.all
    render :index
  end

  def create
    images = Image.new(
      image_url: params[:image_url], 
      product_id: params[:product_id]
    )
    images.save
  end
end
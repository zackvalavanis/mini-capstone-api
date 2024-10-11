class ImagesController < ApplicationController
  def index 
    @images = Image.all
    render json: @images # Use JSON for API responses
  end

  def create
    image = Image.new(
      image_url: params[:image_url],
      product_id: params[:product_id]
    )
  
    if image.save
      render json: { message: 'Image created successfully', image: image }, status: :created
    else
      Rails.logger.error("Error creating image: #{image.errors.full_messages.join(", ")}")
      render json: { errors: image.errors.full_messages }, status: :unprocessable_entity
    end
  end
end

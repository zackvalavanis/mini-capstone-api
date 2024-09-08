class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end
  def show 
    @product = Product.find_by(id: params["id"])
    render :show
  end
  def create
    @product = Product.new(
      name: params[:name],
      inventory: params[:inventory],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
      )
    if @product.save
      render :show
    else 
      render json: { errors: @product.errors.full_messages }
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:product] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.save 
    render :show
  end

  def destroy 
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "The recipe has been removed."}
  end 
end
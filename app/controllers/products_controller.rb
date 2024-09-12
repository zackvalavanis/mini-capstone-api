class ProductsController < ApplicationController
  def index
    p "HERE IS CURRENT USER"
    p current_user
    p "THERE IS CURRENT USER"
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
      description: params[:description],
      supplier_id: params[:supplier_id]
      )
    if @product.save
      render :show
    else 
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    @product.save
    render template: "products/show"
  end

  def destroy 
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "The recipe has been removed."}
  end 
end
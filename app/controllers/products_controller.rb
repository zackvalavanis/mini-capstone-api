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

    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      supplier_id: params[:supplier_id] || @product.supplier_id,
      description: params[:description] || @product.description,
      inventory: params[:inventory] || @product.inventory,
      supplier_id: params[:supplier_id] || @product.supplier_id
    )
    render :show
  end

  def destroy 
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "The recipe has been removed."}
  end 
end
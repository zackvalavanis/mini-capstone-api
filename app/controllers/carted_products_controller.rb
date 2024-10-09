class CartedProductsController < ApplicationController
  def index
    carted_products = Carted_product.all
    render :index
  end 

  def delete 
    carted_product = Carted_product.find_by(id: params[:carted_product_id])
    carted_product.destroy 
    render json: { message: 'The product has been removed from the cart.'}
  end 

  def update
    carted_product = Carted_product.find_by(id: params[:carted_product_id])
    carted_product.update(
      user_id: params[:user_id] || carted_product.user_id, 
      product_id: params[:product_id] || carted_product.product_id, 
      quantity: params[:quantity] || carted_product.quantity, 
      order_id: params[:order_id] || carted_product.order_id, 
      status: params[:status] || carted_product.status
    )
  end 

  def create
    carted_product = Carted_product.new(
      user_id: params[:user_id], 
      product_id: params[:product_id], 
      quantity: params[:quantity], 
      order_id: params[:order_id], 
      status: params[:status]
    )
    carted_product.save 
  end 
end

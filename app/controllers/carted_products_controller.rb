class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(status:['carted', 'purchased'])
    render :index
  end   

  def delete 
    @carted_product = CartedProduct.find_by(id: params[:carted_product_id])
    @carted_product.destroy 
    render json: { message: 'The product has been removed from the cart.'}
  end 

  def update
    @carted_product = CartedProduct.find_by(id: params[:carted_product_id])
    @carted_product.update(
      user_id: params[:user_id] || @carted_product.user_id, 
      product_id: params[:product_id] || @carted_product.product_id, 
      quantity: params[:quantity] || @carted_product.quantity, 
      order_id: params[:order_id] || @carted_product.order_id, 
      status: params[:status] || @carted_product.status
    )
  end 

  def create
    @carted_product = CartedProduct.new(
      user_id: params[:user_id], 
      product_id: params[:product_id], 
      quantity: params[:quantity], 
      status: params[:status]
    )
    if @carted_product.save 
      render json: { message: @carted_product }, status: :created
    else 
      render json: { errors: @carted_product.errors.full_messages }, status: :bad_request
    end
  end 

  def destroy 
    @carted_product = CartedProduct.find_by(id: params[:id])
    render @carted_product
    @carted_product.update(status: 'removed');
  end 

end

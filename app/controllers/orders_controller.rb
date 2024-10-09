class OrdersController < ApplicationController

  def index 
    p "HERE IS CURRENT USER"
    p current_user
    p "THAT WAS CURRENT USER"
    @orders = Order.where(user_id: current_user.id)
    render :index
  end
  
  def show
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    render :show 
  end

  def create

    carted_products = CartedProduct.where(user_id: current_user.id, status:'carted')
    subtotal = carted_products.sum do |carted_product|
      product = Product.find(carted_product.product_id)
      carted_product.quantity * product.price
    end
      
    tax = subtotal * 0.10
    total = subtotal + tax

    @order = Order.new( 
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if @order.save
      CartedProduct.where(user_id: current_user.id, status: 'carted').update_all(order_id: @order.id, status: 'purchased')
      render json: { message: 'The order has been placed.', order: @order }, status: :created
    end
    render :show
  end

  def destroy 
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    @order.destroy 
    render json: { message: 'The order has been deleted.'}, status: :ok
  end

    
end
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

    product_id = CartedProduct.where(user_id: current_user, status:'carted').pluck(:product_id)
    subtotal = product.price * params[:quantity].to_i
    tax = subtotal * 0.10
    total = subtotal + tax


    @order = Order.new( 
      user_id: current_user.id,
      subtotal: 12,
      tax: 1,
      total: 13
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
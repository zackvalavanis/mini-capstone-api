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
    product = Product.find(params[:product_id]) 
    subtotal = product.price * params[:quantity].to_i
    tax = subtotal * 0.10
    total = subtotal + tax

    @order = Order.new( 
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order.save
    render :show
  end
end
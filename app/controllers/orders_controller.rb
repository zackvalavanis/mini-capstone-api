class OrdersController < ApplicationController
  def index 
    p "HERE IS CURRENT USER"
    p current_user
    p "THAT WAS CURRENT USER"
    @orders = Order.all
    render :index
  end
  
  def show
    @order = Order.find_by(id: params[:id])
    render :show 
  end

  def create
    product = Product.find(params[:product_id]) 
    subtotal = product.price * params[:quantity].to_i
    tax = subtotal * 0.10
    total = subtotal + tax

    orders = Order.new( 
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if orders.save
      render json: { message: 'The order has been submitted'}, status: :ok
    else 
      render json: {}, status: :unauthorized
    end
  end
end
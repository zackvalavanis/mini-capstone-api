class UsersController < ApplicationController
  def create
    user = User.new( 
      name: params[:name],
      email: params[:email],
      password: params[:password]
      )
    if user.save 
      render json: { message: 'User has been successfully created!'}, status: :created
    else 
      render json: { errors: user.errors.full_message}, status: :bad_request
    end 
  end

  def destroy 
    user = User.find_by(id: params[:id])
    user.delete
  end 
end
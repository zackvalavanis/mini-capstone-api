class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end
  def show 
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end
  def create
    @product = Product.new(
      name: "chips",
      price: 5,
      image_url: "https://images.thdstatic.com/productImages/b7cb9f9d-1bb8-4a6c-bc46-cfb65636accb/svn/snack-foods-32505-64_600.jpg",
      description: 'a bag of chips')
    @product.save
    render template: "products/show"
  end
end
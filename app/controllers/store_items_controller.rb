class StoreItemsController < ApplicationController
  def product_things
    @products = Product.all
    render template: "products/index"
end
end

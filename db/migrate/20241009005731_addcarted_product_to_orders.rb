class AddcartedProductToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :carted_product_id, :integer
  end
end

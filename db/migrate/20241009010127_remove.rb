class Remove < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :carted_product_id
  end
end

class Idtointeger < ActiveRecord::Migration[7.1]
  def change
    change_column :images, :product_id, 'integer USING CAST(product_id AS integer)'
  end
end

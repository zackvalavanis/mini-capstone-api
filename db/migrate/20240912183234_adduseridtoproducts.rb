class Adduseridtoproducts < ActiveRecord::Migration[7.1]
  def change
    add_column :prodcuts, :user_id, :integer
  end
end

class AddColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :inventory, :integer
  end
end

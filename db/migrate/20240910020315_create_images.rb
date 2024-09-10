class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :image_url
      t.string :product_id

      t.timestamps
    end
  end
end

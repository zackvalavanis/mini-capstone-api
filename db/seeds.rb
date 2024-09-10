# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# supplier1 = Supplier.new(
#   name: 'Jewel Osco',
#   email: 'JOsco@email.com',
#   phone_number: '5356455342'
# )
# supplier1.save 

# products = Product.new(
 
#     name: 'Animal Crackers'
#     price: 4.50
#     image_url: 
#     description: "Delicious Animal crackers"
#     created_at
#     updated_at
#     inventory
#     supplier_id
# )

# images = Image.new( 
#   image_url: "https://marvel-b1-cdn.bc0a.com/f00000000202513/www.fosterfarms.com/wp-content/uploads/960-72763-450959-RTC-CON-PCNCPCK-25PD_H.png",
#   product_id: 15
# )
# images.save 
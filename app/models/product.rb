class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true 
  validates :price, numericality: {greater_than: 0}
  validates :description, presence: true
  validates :supplier_id, presence: true
  
  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :users, through: :carted_product
  

  def is_discounted?
    if price <= 10
      p true
    else p false
    end
  end

  def tax 
    if price == nil 
      tax = 0 
    else tax = price * 0.09
    end
  end

  def total 
    if price.nil?
      0
    else
      price + tax
    end
  end

  def images_with_default 
    if images.length > 0 
      return images 
    else 
      return [
        {id: 100, image_url: 'https://i.pinimg.com/736x/09/8e/f6/098ef67a56c62b0ae7ec7b61edb9e006.jpg', created_at: Time.now, updated_at: Time.now}
      ]
    end  
  end 


end

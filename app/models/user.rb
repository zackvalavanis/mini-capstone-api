class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 20 } 
  

  has_many :orders
  has_many :products, through: :carted_product
  
end

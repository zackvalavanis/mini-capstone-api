class Product < ApplicationRecord
  # validates :name, presence: true, uniqueness: true 
  # validates :price, numericality: {greater_than: 6}
  # validates :description, presence: true
  # validates :supplier_id, presence: true

  belongs_to :supplier
  has_many :orders
  has_many :images

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
end

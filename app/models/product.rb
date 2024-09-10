class Product < ApplicationRecord
  validates :price, presence: true, numericality: { greater_than: 6}
  validates :name, presence: true, uniqueness: true 

  belongs_to :supplier

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

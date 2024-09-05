class Product < ApplicationRecord
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
    price + tax 
  end 
end
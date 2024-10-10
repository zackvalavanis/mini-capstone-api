class CategoryProduct < ApplicationRecord
  belongs_to :product
  has_many :images
  belongs_to :category
end

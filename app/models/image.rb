class Image < ApplicationRecord
  belongs_to :product
  belongs_to :carted_product
end

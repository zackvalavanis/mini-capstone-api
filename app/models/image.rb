class Image < ApplicationRecord
  belongs_to :product
  validates :image_url, presence: true
  validates :product_id, presence: true
end

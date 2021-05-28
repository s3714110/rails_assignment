class ColorProduct < ApplicationRecord
  belongs_to :product
  belongs_to :color
  validates :product_id, uniqueness: { scope: :color_id, message: 'record already exists' }
end

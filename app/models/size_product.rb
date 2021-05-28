class SizeProduct < ApplicationRecord
  belongs_to :product
  belongs_to :size
  validates :product_id, uniqueness: { scope: :size_id, message: 'record already exists' }
end

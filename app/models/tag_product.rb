class TagProduct < ApplicationRecord
  belongs_to :product
  belongs_to :tag
  validates :product_id, uniqueness: { scope: :tag_id, message: 'record already exists' }
end

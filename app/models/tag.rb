class Tag < ApplicationRecord
  has_many :products, through: :tag_products
  validates :name, presence: true, uniqueness: true
end

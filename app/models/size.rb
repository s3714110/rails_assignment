class Size < ApplicationRecord
  has_many :products, through: :size_products
  validates :name, presence: true, uniqueness: true
end

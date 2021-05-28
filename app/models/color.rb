class Color < ApplicationRecord
  has_many :products, through: :color_products
  validates :name, presence: true, uniqueness: true
end

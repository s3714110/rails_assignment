class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :subimgs
  has_many :colors, through: :color_products
  has_many :sizes, through: :size_products
  has_many :tags, through: :tag_products
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  validates :img_link, presence: true
  validates :popularity, presence: true
end

class Subimg < ApplicationRecord
  belongs_to :product
  validates :url, presence: true
end

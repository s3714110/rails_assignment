class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 25}
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive:false },
        format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 8, maximum: 20 },
        format: { with: /\A[a-z0-9\s]+\Z/i }
end

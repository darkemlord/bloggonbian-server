class User < ApplicationRecord
  has_secure_password
  has_many :posts
  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end

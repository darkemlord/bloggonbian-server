class User < ApplicationRecord
  has_secure_password
  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end

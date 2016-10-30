class User < ApplicationRecord
  has_many :reviews
  has_many :products, through: :reviews

  has_secure_password

  validates :email, uniqueness: true
  validates :email,:password,:password_confirmation presence: true
end

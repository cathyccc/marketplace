class User < ApplicationRecord
  has_many :reviews
  has_many :owned_products, class_name: "Product", dependent: :destroy
  has_many :products, through: :reviews
  has_many :carts
  has_many :cart_products, through: :carts

  has_secure_password

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :username,:email,:password,:password_confirmation, presence: true

end

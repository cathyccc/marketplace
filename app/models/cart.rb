class Cart < ApplicationRecord
  belongs_to :cart_owner, class_name: "User", foreign_key: "cart_owner_id"
  has_one :status
  has_many :cart_products
  has_many :products, through: :cart_products
end

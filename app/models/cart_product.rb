class CartProduct < ApplicationRecord
  has_many :users, through: :cart
  belongs_to :cart
  belongs_to :product
end

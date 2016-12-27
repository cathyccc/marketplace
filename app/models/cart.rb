class Cart < ApplicationRecord
  has_many :carts_products
  belongs_to :users

end

class Cart < ApplicationRecord
  belongs_to :purchased_product
  belongs_to :buyer
end

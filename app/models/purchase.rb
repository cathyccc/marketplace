class Purchase < ApplicationRecord
  belongs_to :purchased_product, class_name: "Product"
  belongs_to :buyer, class_name: "User"
end

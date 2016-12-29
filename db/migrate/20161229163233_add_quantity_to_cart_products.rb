class AddQuantityToCartProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_products, :quantity, :integer
  end
end

class Cart < ApplicationRecord
  has_many :carts_products
  belongs_to :users

  def create_cart
    @cart = Cart.new
    @cart.save
    # create cookie for current cart
    # session[:cart_id] = cart.id
  end

  def add_item(product_id)
    # want to create new row with product & cart per item added
    Product.carts.create


  #   item = items.where('product_id = ?', product_id)
  #   if item
  #     item.quantity + 1
  #     save
  #   else
  #     cart.items << Product.new(product_id: product_id, quantity: 1)
  #   end
  #   save
  end

end

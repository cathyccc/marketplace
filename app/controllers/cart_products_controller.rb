class CartProductsController < ApplicationController
  before_action :load_product, :current_user, :load_cart

  def create
    @cart_product = CartProduct.new
    @cart_product.cart_id = @cart.id
    @cart_product.product_id = @product.id
    @cart_product.save
  end
end

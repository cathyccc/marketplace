class CartController < ApplicationController
  before_action :current_user

  def show
    @cart = Cart.find_by(cart_owner_id: @current_user.id, status_id: 1)
    @cart_products = @cart.cart_products.all.to_a
    @subtotal = subtotal
  end

  def destroy
  end

  private
  def cart_params
    params.require(:cart).permit(:user_id,:status_id)
  end

  def subtotal
    @cart_products.inject(0) {|sum,item| sum+ Product.find(item.product_id).price_in_cents}
  end
end

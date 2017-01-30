class CartController < ApplicationController
  before_action :current_user

  def show
    @cart = Cart.find_by(cart_owner_id: @current_user.id, status_id: 1)
    @cart_products = @cart.cart_products.all.to_a
  end

  def destroy
  end

  private
  def cart_params
    params.require(:cart).permit(:user_id,:status_id)
  end
end

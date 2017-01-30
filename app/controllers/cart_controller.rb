class CartController < ApplicationController
  before_action :current_user, :load_cart

  def show
    @cart_products = @cart.cart_products.all.to_a
    @subtotal = subtotal
  end

  def update
    @cart.status_id = 2
    if @cart.save
      flash.now[:notice] = 'Items checked out!'
      redirect_to cart_path
    else
      render cart_path
    end

  end

  private
  def subtotal
    @cart_products.inject(0) {|sum,item| sum+ Product.find(item.product_id).price_in_cents}
  end
end

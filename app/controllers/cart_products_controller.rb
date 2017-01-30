class CartProductsController < ApplicationController
  before_action :load_cart, :load_product
  before_action :ensure_logged_in, only: [:create,:update, :destroy]

  def create
    @cart_product = @product.cart_products.create(cart_product_params)
    @cart_product.cart = @cart
    if @cart_product.save
      redirect_to product_path(params[:product_id])
    else
      render :product
    end
  end

  def update
  end

  def destroy
    @cart_product = @cart.cart_products.find_by(product_id: "#{@product.id}")
    @cart_product.destroy
    redirect_to product_path(params[:product_id])
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity, :cart_id, :product_id)
  end
end

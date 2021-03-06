class ProductsController < ApplicationController
  before_action :current_user

  def index
    @products = Product.all
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = Product.order("created_at DESC")
    end
  end

  def show
    @product = Product.find(params[:id])

    if session[:user_id] != nil
      load_cart
      @cart_product = @product.cart_products.build
    end

    # list all reviews
    @reviews = @product.reviews.all

    # add review
    # what you normally put in reviews#new
    @review = @product.reviews.build
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.owner = current_user
    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to products_url
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents, :product_image)
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # allows us to use current_user and current_order in views
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please sign in."
      redirect_to new_sessions_path
    end
  end

  # retrieve product_id from query params (for nested resource)
  def load_product
    @product = Product.find(params[:product_id])
  end

  # returns the first item or nil.
  def load_cart
    # look for cart with current_user_id
    # if none exist, create new cart
    @cart = Cart.find_by(cart_owner_id: session[:user_id], status_id: 1)
    if @cart == nil
      @cart = Cart.new
      @cart.cart_owner_id = current_user.id
      @cart.status_id = 1
      @cart.save
    end
  end


end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_cart
    @current_cart ||= User.find(session[:current_cart]) if session[:current_cart]
  end

  # allows us to use current_user in views
  helper_method :current_user

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please sign in."
      redirect_to new_sessions_path
    end
  end

  # retrieve product_id from query params
  def load_product
    @product = Product.find(params[:product_id])
  end

  def load_cart
    @cart = Cart.where(["user_id = ? and status = ?","#{@current_user.id}","active"]).first
    if @cart == []
      @cart = @current_user.carts.build
      session[:cart_id] = @cart.id
    end
  end

end

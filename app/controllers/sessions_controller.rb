class SessionsController < ApplicationController
  def new
  end

  def create
    # checks if user exists
    user = User.find_by(email:params[:email])

    # checks whether password matches with user email
    if user && user.authenticate(params[:password])
      # saves user in a cookie
      session[:user_id] = user.id
      redirect_to products_path, notice: "Signed in."
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "User logged out."
  end
end

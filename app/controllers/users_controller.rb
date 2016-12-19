class UsersController < ApplicationController
  def show
    @user = User.find(current_user)
    @products = owned_products_list.order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to products_path, notice: "Account successfully created."
    else
      render :new
    end
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation)
  end

  def owned_products_list
    Product.where("owner_id = ?", current_user)
  end
end

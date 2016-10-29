class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(param[:id])
    if @user.save
      redirect_to root
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end

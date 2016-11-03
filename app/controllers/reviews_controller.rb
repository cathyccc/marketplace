class ReviewsController < ApplicationController
  before_action :load_product
  before_action :ensure_logged_in, only: [:create,:destroy]

  def show
  end

  def create
    @review = @product.reviews.create(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(params[:product_id])
    else
      render :product
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(params[:product_id]), notice: 'Review removed.'
  end

  private
  def review_params
    params.require(:review).permit(:review_text,:product_id)
  end

  # retrieve product_id from query params
  def load_product
    @product = Product.find(params[:product_id])
  end

end

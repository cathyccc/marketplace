class ReviewsController < ApplicationController
  before_action :load_product

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.create(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(params[:id]), notice: 'Review added.'
    else
      render :product
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destory
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

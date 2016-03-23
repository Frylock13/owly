class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    CreateReview.new(@review, params[:rating]).call
    redirect_to :back
    flash[:success] = 'Спасибо за Ваш отзыв! Он будет опубликован после проверки модератором.'
  end

  private

  def review_params
    params.require(:review).permit(:name, :email, :text, :rating, :product_id)
  end
end

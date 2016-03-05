class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to :back
      flash[:success] = 'Отзыв успешно оставлен'
    else
      redirect_to :back
      flash[:success] = 'Произошла ошибка при добавлении отзыва'
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :email, :text, :rating, :product_id)
  end
end

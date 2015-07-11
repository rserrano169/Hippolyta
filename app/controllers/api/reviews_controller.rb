class Api::ReviewsController < ApplicationController
  def index
    @reviews = Review.find_by(product_id: params[:product_id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reviewer_id = current_user.id
    fail
    if @review.save

    else

    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :text, :product_id)
  end
end

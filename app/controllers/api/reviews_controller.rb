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

    if Review.find_by(
      reviewer_id: @review.reviewer_id,
      product_id: @review.product_id
    )
      redirect_to "/#new_review/current_user/purchased_products/#{@review.product_id}"
    elsif @review.save
      redirect_to "/#sellers/#{@review.product.seller.id}/products/#{@review.product_id}/review_created"
    else
      redirect_to "/#new_review/current_user/purchased_products/#{review_params[:product_id]}"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :text, :product_id)
  end
end

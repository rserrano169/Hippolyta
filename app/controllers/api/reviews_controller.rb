class ReviewsController < ApplicationController
  def index
    @reviews = Review.find_by(product_id: params[:product_id])
  end

  def show
    @review = Review.find(params[:id])
  end
end

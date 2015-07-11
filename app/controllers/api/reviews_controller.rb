class ReviewsController < ApplicationController
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
    @review = Review.new({})

    if @review.save

    else

    end
  end

  private

  def review_params
    
  end
end

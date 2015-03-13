class Api::ProductsController < ApplicationController

  def index
    @products = current_user.products
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    
  end

end

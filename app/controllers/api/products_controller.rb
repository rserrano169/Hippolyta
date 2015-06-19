class Api::ProductsController < ApplicationController
  def new
    @product = Product.new
    render :new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def index
    user = User.find(params[:user_id])
    @products = user.products
    render :index
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :sale_price,
      :original_price,
      :quantity,
      :description,
      :picture
    )
  end
end

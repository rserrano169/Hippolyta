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
    @product = current_user.products.new(product_params)

    if @product.save
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :sale_price,
      :original_price,
      :quantity,
      :description,
      :image_url,
      :picture
    )
  end

end

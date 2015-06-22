class Api::ProductsController < ApplicationController
  def new
    @product = Product.new
    render :new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      redirect_to "/#current_user/products"
    end
  end

  def show
    @product = Product.find(params[:id])
    render :show
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

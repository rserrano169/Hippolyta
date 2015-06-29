class Api::ProductsController < ApplicationController
  def new
    @product = Product.new
    render :new
  end

  def create
    @product = current_user.products.create(product_params)
    @tags = params[:product][:tags].split(", ")
    @tags.each do |tag|
      @product.tags.create({name: tag})
    end

    render :new
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

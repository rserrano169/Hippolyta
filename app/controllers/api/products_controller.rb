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
    @products = current_user.products
    render :index
  end

  def update
    @product = Product.find(params[:product_id])
    @cart = current_cart
    @cart.products << @product unless @cart.products.include?(@product)
    @cart.update_attributes({quantity: @cart.products.length})

    redirect_to root_url
  end

  def edit

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

class Api::ProductsController < ApplicationController

  def index
    @products = current_user.products
    render :index
  end

end

class SearchesController < ApplicationController

  def new
  end

  def create
    @search_results = Product.search(search_params[:keywords])

    redirect_to root_url
  end

  private

  def search_params
    params.require(:search).permit(:keywords)
  end

end

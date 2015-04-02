class Api::RootController < ApplicationController

  def create_search
    @search_results = Product.search(search_params[:keywords])

    render :search
  end

  def results
    @search_results

    render :search
  end

  private

  def search_params
    params.require(:search).permit(:keywords)
  end

end

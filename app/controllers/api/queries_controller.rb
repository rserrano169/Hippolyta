class Api::QueriesController < ApplicationController.rb

  def show
    current_user.nil? ? @query = Query.last : @query = current_user.queries.last

    @search_results = Product.search(@query.keywords)

    render :show
  end

end

class Api::QueriesController < ApplicationController

  def index
    current_user.nil? ? @query = Query.last : @query = current_user.queries.last

    @search_results = Product.search(@query.keywords)

    render :index
  end

end

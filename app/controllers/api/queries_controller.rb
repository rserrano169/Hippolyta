class Api::QueriesController < ApplicationController

  def index
    if current_user
      @query = current_user.queries.last
    else
      @query = Query.where(session_token: session[:guest_token]).last
    end

    @search_results = Product.search(@query.keywords)

    render :index
  end

end

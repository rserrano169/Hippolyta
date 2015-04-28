class QueriesController < ApplicationController

  def create
    current_user ? @querier_id = current_user.id : @querier_id = nil

    p "session token"
    p session[:user_token]
    p "guest token"
    p session[:guest_token]

    @query = Query.new({
      querier_id: @querier_id,
      keywords: query_params["keywords"]
    })

    if @query.save
      if current_user
        current_user.queries.first.delete if current_user.queries.length > 10
      end

      redirect_to "/#search_results"
    else
      redirect_to root_url
    end
  end

  private

  def query_params
    params.require(:query).permit(:keywords)
  end

end

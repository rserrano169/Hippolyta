class QueriesController < ApplicationController

  def create
    current_user ? @querier_id = current_user.id : @querier_id = nil

    @query = Query.create!({
      querier_id: @querier_id,
      keywords: query_params[keywords]
    })

    if current_user
      current_user.queries.first.delete if current_user.queries > 10
    end

    redirect_to "/#search_results"
  end

  private

  def query_params
    params.require(:query).permit(:keywords)
  end

end

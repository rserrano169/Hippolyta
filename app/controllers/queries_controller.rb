class QueriesController < ApplicationController

  def create
    current_user ? @querier_id = current_user.id : @querier_id = nil

    @query = Query.new({
      querier_id: @querier_id,
      keywords: query_params["keywords"]
    })

    if @query.save
      if current_user
        current_user.queries.first.delete if current_user.queries > 10
      end

      redirect_to "/#search_results"
    else
      redirect_to root_url(@root)
    end
  end

  private

  def query_params
    params.require(:query).permit(:keywords)
  end

end

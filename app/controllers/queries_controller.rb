class QueriesController < ApplicationController
  def create
    if current_user
      @querier_id = current_user.id
      @session_token = session[:user_token]
    else
      @querier_id = nil
      @session_token = session[:guest_token]
    end

    @query = Query.new({
      querier_id: @querier_id,
      session_token: @session_token,
      keywords: sanitize_this(query_params["keywords"])
    })

    if @query.save
      if current_user
        first_query = current_user.queries.first
        first_query.delete if current_user.queries.length > 10
      elsif Query.where(session_token: @session_token).length > 10
        Query.where(session_token: @session_token).first.delete
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

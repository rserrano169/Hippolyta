class CheckoutsController < ApplicationController

  def checkout
    if !signed_in?
      redirect_to new_session_url
    end
  end

end

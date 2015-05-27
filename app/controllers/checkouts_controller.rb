class CheckoutsController < ApplicationController

  def checkout
    if !signed_in?
      redirect_to "#sign_in"
    end
  end

end

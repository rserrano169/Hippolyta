class Api::CartsController < ApplicationController

  def create
    p "guest token"
    p session[:guest_token]
    p "user_token"
    p session[:user_token]

    redirect_to root_url
  end

  def index

  end

  def update

  end

  def edit

  end

end

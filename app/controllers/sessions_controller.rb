class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(
      params[:email],
      params[:password]
    )

    if @user
      sign_in(@user)
      redirect_to "/"
    else
      flash.now[:errors] =
        ["There was an error with your E-Mail/Password combination. Please try again."]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end

end

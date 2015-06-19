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
      redirect_to root_url
    else
      flash.now[:errors] =
        ["There was an error with your E-Mail/Password combination. Please try again."]
      render :new
    end
  end

  def demo_user_sign_in
    @user = User.find(1)

    sign_in(@user)
    redirect_to root_url
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      # render nothing: true
      render plain: "Success =)"
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password)
  end
end

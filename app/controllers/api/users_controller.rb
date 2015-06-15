class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    @user = current_user
    # @user = User.find(params[:id])
    render :show
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    render :show
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :created_at,
      :phone_number,
      :picture
    )
  end
end

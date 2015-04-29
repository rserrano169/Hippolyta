class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :current_user, :signed_in?

  private

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end

  def current_user
    return nil unless session[:user_token]
    @current_user ||= User.find_by(session_token: session[:user_token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    session[:user_token] = user.reset_session_token!
  end

  def sign_out
    current_user.reset_session_token!
    session[:user_token] = nil
  end

end

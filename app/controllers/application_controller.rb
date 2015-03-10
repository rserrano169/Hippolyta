class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by(session_token: session[:token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    session[:token] = user.reset_session_token!
  end

  def sign_out
    current_user.reset_session_token!
    session[:token] = SecureRandom.urlsafe_base64(16)
  end

end

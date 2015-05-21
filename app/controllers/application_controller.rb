class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user,
                :signed_in?,
                :current_cart,
                :money_string,
                :last_query,
                :sanitize_this

  private

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end

  def current_user
    return nil unless session[:user_token]
    @current_user ||= User.find_by(session_token: session[:user_token])
  end

  def current_cart
    if current_user
      Cart.find_by(buyer_id: current_user.id)
    else
      Cart.find_by(session_token: session[:guest_token])
    end
  end

  def last_query
    if current_user
      current_user.queries.last
    else
      Query.where(session_token: session[:guest_token]).last
    end
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    @last_query = last_query
    session[:user_token] = user.reset_session_token!
    current_user.queries << @last_query unless @last_query.nil?
  end

  def sign_out
    current_user.reset_session_token!
    session[:user_token] = nil
  end

  def money_string(num)
    return '0.00' if num == 0
    (num * 100).round.to_s.insert(-3, ".")
  end

  def sanitize_this(str)
    ActionController::Base.helpers.sanitize(str, tags: [], attributes: [])
  end

end

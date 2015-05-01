class RootController < ApplicationController

  def root
    session[:guest_token] ||= SecureRandom.urlsafe_base64(24)

    if current_user && !Cart.find_by(buyer_id: current_user.id)
      @cart = Cart.find_by(session_token: session[:guest_token])
      if !@cart
        @cart = Cart.new
      end

      @cart.update_attributes({
        buyer_id: current_user.id,
        session_token: session[:user_token]
      })
    elsif !current_user
      Cart.create({session_token: session[:guest_token]})
    end
  end

end

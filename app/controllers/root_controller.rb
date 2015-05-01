class RootController < ApplicationController

  def root
    session[:guest_token] ||= SecureRandom.urlsafe_base64(24)

    if !current_user
      Cart.create({session_token: session[:guest_token]})
    elsif !Cart.find_by(buyer_id: current_user.id)
      @cart = Cart.find_by(session_token: session[:guest_token])
    else
      @cart = Cart.find_by(buyer_id: current_user.id)
    end

    if @cart
      @cart.update_attributes({
        buyer_id: current_user.id,
        session_token: session[:user_token]
      })
    end
  end

end

class RootController < ApplicationController

  def root
    session[:guest_token] ||= SecureRandom.urlsafe_base64(24)

    if !current_user
      Cart.create({session_token: session[:guest_token]})
    elsif !Cart.find_by(buyer_id: current_user.id)
      @cart = Cart.find_by(session_token: session[:guest_token])
    else
      @cart = Cart.find_by(buyer_id: current_user.id)
      @guest_cart = Cart.find_by(session_token: session[:guest_token])

      if @guest_cart
        @cart.products += @guest_cart.products
        @guest_cart.cart_products.each do |g_cart_prod|

          overlap = @cart.cart_products.find_by({
            product_id: g_cart_prod.product_id
          })
          if overlap
            overlap.update_attributes({
              quantity: g_cart_prod.quantity
            })
          end
        end

        @guest_cart.destroy
      end
    end

    if @cart
      @cart.update_attributes({
        buyer_id: current_user.id,
        session_token: session[:user_token]
      })
    end
  end

end

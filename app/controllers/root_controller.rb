class RootController < ApplicationController

  def root
    session[:guest_token] ||= SecureRandom.urlsafe_base64(24)
  end

end

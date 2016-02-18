class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_session
  before_action :set_cart

  def check_session
    unless session[:guest_id]
      session[:guest_id] = SecureRandom.hex(6)
    end
  end

  def set_cart
    @cart_count = $redis.scard "cart#{session[:guest_id]}"
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_session
  before_action :get_cart_count

  def check_session
    unless session[:guest_id]
      session[:guest_id] = SecureRandom.hex(6)
    end
  end

  def get_cart_count
    cart_count_name = CartCountService.new("cart_#{session[:guest_id]}").send(:parse_cart_count_name)
    cart_count = $redis.get cart_count_name

    @cart_count =   if cart_count
                      cart_count
                    else
                      0
                    end
  end
end

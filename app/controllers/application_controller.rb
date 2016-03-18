class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :check_session

  def check_session
    unless session[:guest_id]
      session[:guest_id] = SecureRandom.hex(6)
    end
  end

  # Define methods for get cart_id, favorites_id, viewed_id. These components served the redis.
  components = %w( cart favorites viewed )
  
  components.each do |component|
    define_method "#{component}_id" do
      "#{component}_#{session[:guest_id]}"
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end

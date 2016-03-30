class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :check_session, :get_categories

  skip_before_filter :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end

  # Define methods for get cart_id, favorites_id, viewed_id. These components served the redis.
  components = %w( cart favorites viewed )
  
  components.each do |component|
    define_method "#{component}_id" do
      "#{component}_#{session[:guest_id]}"
    end
  end

  def check_session
    unless session[:guest_id]
      session[:guest_id] = SecureRandom.hex(6)
    end
  end

  def access_denied(exception)
    redirect_to root_path
  end

  def get_categories
    @categories = Category.only_parents.manual_sort if not admin_page?
  end

  private

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def admin_page?
    params[:controller].split('/').first == 'admin'
  end
end

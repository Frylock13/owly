class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :check_session, :get_categories

  before_filter :add_allow_credentials_headers

  def add_allow_credentials_headers                                                                                                                                                                                                                                                        
    # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#section_5                                                                                                                                                                                                      
    #                                                                                                                                                                                                                                                                                       
    # Because we want our front-end to send cookies to allow the API to be authenticated                                                                                                                                                                                                   
    # (using 'withCredentials' in the XMLHttpRequest), we need to add some headers so                                                                                                                                                                                                      
    # the browser will not reject the response                                                                                                                                                                                                                                             
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'                                                                                                                                                                                                     
    response.headers['Access-Control-Allow-Credentials'] = 'true'                                                                                                                                                                                                                          
  end 

  def options                                                                                                                                                                                                                                                                              
    head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'                                                                                                                                                                                                         
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

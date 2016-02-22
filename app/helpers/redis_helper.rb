module RedisHelper

  # Define all methods for uniq ids for redis database.
  # For example: favorites_longguestid0129302198 in redis will store all of its favorites products.
  components = %w( cart favorites )
  
  components.each do |component|
    define_method "get_#{component}_id" do
      "#{component}_#{session[:guest_id]}"
    end
  end

end

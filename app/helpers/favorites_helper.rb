module FavoritesHelper
  def get_favorites_id
    "favorites_#{session[:guest_id]}"
  end

  def get_favorites_count
    $redis.smembers get_favorites_id
  end
end
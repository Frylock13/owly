module FavoritesHelper

  def get_favorites_count
    $redis.smembers get_favorites_id
  end
  
end
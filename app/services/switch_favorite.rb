class SwitchFavorite

  def self.call(favorites_id, product_id)
    # If the product already in the set(favorites)
    if $redis.sismember(favorites_id, product_id)
      $redis.srem(favorites_id, product_id)
    else
      # If not in the set - add it
      $redis.sadd(favorites_id, product_id)
    end
  end

end
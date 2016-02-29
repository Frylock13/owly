class FavoritesService

  def initialize(favorites_id, product_id=nil)
    @favorites_id = favorites_id
    @product_id = product_id
  end

  def switch
    # If the product already in the set(favorites)
    if $redis.sismember(@favorites_id, @product_id)
      $redis.srem(@favorites_id, @product_id)
    else
      # If not in the set - add it
      $redis.sadd(@favorites_id, @product_id)
    end
  end

  def favorites_list
    favorites_ids = $redis.smembers(@favorites_id)
    Product.where(id: favorites_ids)
  end

end
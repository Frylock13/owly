module ProductsHelper

  def get_viewed_list
    $redis.smembers get_viewed_id
  end

end

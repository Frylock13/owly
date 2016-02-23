class RecentlyViewedUpdate

  def self.call(guest_id, product_id)
    $redis.sadd "viewed_#{guest_id}", product_id
  end

end
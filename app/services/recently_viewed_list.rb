class RecentlyViewedList

  def self.call(guest_id)
    viewed_ids = $redis.smembers "viewed_#{guest_id}"
    #byebug
    Product.where(id: viewed_ids)
  end

end
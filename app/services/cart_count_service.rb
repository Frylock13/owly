class CartCountService

  def initialize(cart)
    @cart = cart
    @cart_count_name = parse_cart_count_name

    # if the cart count set doesn't exist (< 1 product in the cart)
    unless $redis.get @cart_count_name
      $redis.set @cart_count_name, 0
    end
  end

  def reset
    total_count = 0

    ($redis.hgetall @cart).values.map do |count|
      total_count += count.to_i  
    end

    $redis.set @cart_count_name, total_count
  end

  private

  def parse_cart_count_name
    # split cart name: cart_MD5 => MD5 (session[:guest_id])
    splitted = @cart.split('_').last
    "count_#{splitted}"
  end

end

class CartProductsService

  def initialize(cart_id)
    @cart_id = cart_id
  end

  def products
    product_ids = ($redis.hgetall @cart_id).keys
    Product.where(id: product_ids)
  end

  def increment(product_id)
    $redis.hincrby(@cart_id, product_id, 1)
    CartCountService.new(@cart_id).increment
  end

  def decrement(product_id)
    $redis.hincrby(@cart_id, product_id, -1)
    CartCountService.new(@cart_id).decrement
  end

end
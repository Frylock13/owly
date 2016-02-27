class CartProductsService

  def initialize(cart_id, product_id=nil)
    @cart_id = cart_id
    @product_id = product_id
    @products = []
  end

  def products
    products = $redis.hgetall @cart_id

    products.map do |product_id, count|
      product = Product.find(product_id)
      product.define_singleton_method(:count) { count }
      @products << product
    end

    @products
  end

  def increment
    $redis.hincrby(@cart_id, @product_id, 1)
    make_cart_count :increment
  end

  def decrement
    if $redis.hget(@cart_id, @product_id).to_i == 1
      $redis.hdel(@cart_id, @product_id)
    else
      $redis.hincrby(@cart_id, @product_id, -1)
    end

    make_cart_count :decrement
  end

  def set_count(new_count)
    $redis.hset(@cart_id, @product_id, new_count)
  end

  def make_cart_count(action)
    CartCountService.new(@cart_id).send(action)
  end

end
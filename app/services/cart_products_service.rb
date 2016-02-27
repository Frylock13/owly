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
    reset_cart_count
  end

  def decrement
    if $redis.hget(@cart_id, @product_id).to_i == 1
      $redis.hdel(@cart_id, @product_id)
    else
      $redis.hincrby(@cart_id, @product_id, -1)
    end

    reset_cart_count
  end

  def delete
    $redis.hdel(@cart_id, @product_id)
    reset_cart_count
  end

  def set_count(new_count)
    $redis.hset(@cart_id, @product_id, new_count)
    reset_cart_count
  end


  private

  def reset_cart_count
    CartCountService.new(@cart_id).reset
  end

end
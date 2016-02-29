class CartProductsService

  def initialize(cart_id, product_id=nil)
    @cart_id = cart_id
    @product_id = product_id
  end

  def products(hash=product_list)
    products = Product.where(id: hash.keys)

    products.each do |product|
      count = hash[product.id.to_s]
      product.define_singleton_method(:count) { count }
    end

    products
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

  # Delete all products from cart
  def clean
    product_keys = $redis.hgetall(@cart_id).keys
    product_keys.each do |key|
      $redis.hdel(@cart_id, key)
    end

    reset_cart_count
  end

  private

  def product_list
    $redis.hgetall @cart_id
  end

  def reset_cart_count
    CartCountService.new(@cart_id).reset
  end

end
class CartProductsService

  def initialize(cart_id)
    @cart_id = cart_id
    @products = []
  end

  def products
    product_ids = ($redis.hgetall @cart_id)

    product_ids.map do |product_id, count|
      product = Product.find(product_id)
      product.define_singleton_method(:count) { count }
      @products << product
    end

    @products
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
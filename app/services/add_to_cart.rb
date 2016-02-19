class AddToCart

  def initialize(cart, product)
    @cart = cart
    @product = product
  end
  
  def call
    if product_added?
      # increment quantity of this product in the cart
      $redis.hincrby(@cart, @product, 1)
    else
      # create cart(hash) and put the one product
      $redis.hset(@cart, @product, 1)
    end

    increment_cart_count
  end



  private

  def product_added?
    # if a product already has been added in a cart 
    true if $redis.hexists(@cart, @product)
  end

  def increment_cart_count
    CartCountService.new(@cart).increment
  end

end
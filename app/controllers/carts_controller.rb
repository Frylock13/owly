class CartsController < ApplicationController
  def show
    cart_ids = $redis.smembers current_user_cart
    @products = Product.find(cart_ids)
  end
end

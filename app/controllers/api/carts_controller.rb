class Api::CartsController < ApplicationController

  def add
    if AddToCart.new(params[:cart_id], params[:product_id]).call
      render nothing: true, status: 200
    else
      render nothing: true, status: 404
    end
  end

  def remove
    $redis.srem cart_id, params[:product_id]
    redirect_to :back
  end

  def count
    # parse count name in redis
    cart_count_name = CartCountService.new(cart_id).send(:parse_cart_count_name)
    cart_count = $redis.get cart_count_name

    # get count if products in the cart > 0 or define 0
    count = (cart_count ? cart_count : 0)

    render text: count, status: 200
  end

  private

  def cart_id
    "cart_#{session[:guest_id]}"
  end

end

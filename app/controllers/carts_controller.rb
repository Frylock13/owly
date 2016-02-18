class CartsController < ApplicationController
  def show
    cart_ids = $redis.smembers current_user_cart
    @products = Product.find(cart_ids)
  end

  def add
    AddToCart.new(current_user_cart, params[:product_id]).call
    redirect_to :back
    #render json: cart_count, status: 200
  end

  def remove
    $redis.srem current_user_cart, params[:product_id]
    redirect_to :back
  end


  private

  def current_user_cart
    "cart_#{session[:guest_id]}"
  end
end
